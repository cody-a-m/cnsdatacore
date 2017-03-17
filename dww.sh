#!/bin/bash
set -x
set -e

shopt -s extglob

export PATH=/data/DWW/camino-code/bin:$PATH
export CAMINO_HEAP_SIZE=2000
export FSLOUTPUTTYPE=NIFTI_GZ

while getopts "i:f:vm" opt
do
 case $opt in
  i) sid="$OPTARG";;
  f) fsd="$OPTARG";;
  v) export VIEWER=1;;
  m) export IN_MEMORY=1;;
 esac
done

if [ ${fsd:-0} -eq 0 -o ${#fsd} -eq 0 ]; then
	fsd=($(mysql -Brs -h172.16.10.80 -ucody -p4cody2c ImagingRepositoryV6 -e "select StudyImageID from StudyImageInfo where ModalityID=2 and ScanSessionID=(select ScanSessionID from StudyImageInfo where StudyImageID=${sid});"))
	[ ${#fsd[@]} -gt 1 ] && echo "Multiple structural associated with this scan" && exit
fi

[ -f /data/DWW/$sid/count_0.txt ] && echo "$sid already processed" && exit
[ ! -d /data/FS/$fsd ] && echo "Freesurfer parcellation missing" && exit

if [ ${IN_MEMORY:-0} -eq 1 ]; then
	d=/dev/shm/DWW/$sid
	mkdir -pv $d /data/DWW/$sid
else
	d=/data/DWW/$sid
	mkdir -pv $d 
fi

echo $sid $fsd >> $d/dww.log
echo "Including wdtfit" >> $d/dww.log

[ -f $d/rawdwi.nii.gz        ] || dcm2niix -z y -f rawdwi -o $d /data/RAWDATA/$sid
[ -f $d/rawdwi.nii.gz        ] || exit
[ -f $d/dwi.eddy.nii.gz      ] || eddy_correct $d/rawdwi $d/dwi.eddy 0 &


[ -f $d/aparc.2009.nii.gz      ] || mri_convert /data/FS/$fsd/mri/aparc.a2009s+aseg.mgz $d/aparc.2009.nii.gz &


[ -f $d/brain.nii.gz         ] || mri_convert /data/FS/$fsd/mri/brain.mgz $d/brain.nii.gz
[ -f $d/brain.nii.gz         ] || exit
[ -f $d/mprage_fs_seg_2.nii.gz ] || fast -n 3 -t 1 -g -b -B -o $d/mprage_fs $d/brain &

[ -f $d/A.scheme            ] || fsl2scheme -bvecfile $d/rawdwi.bvec -bvalfile $d/rawdwi.bval > $d/A.scheme
[ -f $d/A.scheme            ] || exit

[ -f $d/rawdwi_bet.nii.gz      ] || bet $d/rawdwi.nii.gz $d/rawdwi_bet -m -f 0.1
[ -f $d/rawdwi_bet.nii.gz      ] || exit

[ -f $d/dwi_seg_1.nii.gz    ] || fast -n 3 -t 2 -g -b -B -o $d/dwi $d/rawdwi_bet &

[ -f $d/pre_dwi.Bfloat      ] || image2voxel -4dimage $d/rawdwi.nii.gz -outputfile $d/pre_dwi.Bfloat
[ -f $d/pre_dwi.Bfloat      ] || exit

[ -f $d/pre_dt.Bdouble      ] || modelfit -inputfile $d/pre_dwi.Bfloat  -schemefile $d/A.scheme -model ldt -bgmask  $d/rawdwi_bet.nii.gz -outputfile  $d/pre_dt.Bdouble
[ -f $d/pre_dt.Bdouble      ] || exit

#dteig function used to create the eigensystem of the tensors
[ -f $d/pre_dteig.Bdouble   ] || dteig <$d/pre_dt.Bdouble > $d/pre_dteig.Bdouble 
[ -f $d/pre_dteig.Bdouble   ] || exit

[ -f $d/pre_ecc_fa.nii.gz      ] || fa    <$d/pre_dt.Bdouble | voxel2image -outputroot $d/pre_ecc_fa -header $d/rawdwi.nii.gz
[ -f $d/pre_ecc_fa.nii.gz      ] || exit

[ ${VIEWER:-0} -eq 1        ] && pdview -inputfile $d/pre_dteig.Bdouble -scalarfile $d/pre_ecc_fa.nii.gz -schemefile $d/A.scheme && echo "scheme qc'd" >> $d/dww.log

wait
[ -f $d/dwi.eddy.nii.gz      ] || exit
[ -f $d/mprage_fs_seg_2.nii.gz ] || exit
[ -f $d/dwi_seg_1.nii.gz    ] || exit
[ -f $d/aparc.2009.nii.gz      ] || exit


[ -f $d/dwi2mprage_fs.mat   ] || flirt -in $d/dwi_seg_1  -ref $d/mprage_fs_seg_2 -out $d/dwi_seg1.reg -dof 6 -omat $d/dwi2mprage_fs.mat &

[ -f $d/dwi.bet_mask.nii.gz    ] || bet $d/dwi.eddy $d/dwi.bet_mask -m -f 0.1
[ -f $d/dwi.bet_mask.nii.gz    ] || exit

[ -f $d/dwi.Bfloat          ] || image2voxel -4dimage $d/dwi.eddy.nii.gz -outputfile  $d/dwi.Bfloat
[ -f $d/dwi.Bfloat          ] || exit

[ -f $d/dt.Bdouble          ] || modelfit -inputfile $d/dwi.Bfloat -schemefile $d/A.scheme  -model ldt -bgmask $d/dwi.bet_mask.nii.gz -outputfile $d/dt.Bdouble
[ -f $d/dt.Bdouble          ] || exit

[ -f $d/camino_wdt.nii.gz      ] || wdtfit $d/dwi.eddy.nii.gz $d/A.scheme -brainmask $d/dwi.bet_mask.nii.gz -outputfile $d/camino_wdt.nii.gz
[ -f $d/camino_wdt.nii.gz      ] || exit

[ -f $d/allTracts.Bfloat    ] || track -inputfile $d/camino_wdt.nii.gz -inputmodel dt -seedfile $d/dwi.bet_mask.nii.gz -curvethresh 76 -tracker euler -stepsize 0.5 -brainmask $d/dwi.bet_mask.nii.gz -outputfile $d/allTracts.Bfloat
[ -f $d/allTracts.Bfloat    ] || exit

#[ -f $d/allTracts.Bfloat  ] || track -inputfile $d/dt.Bdouble -inputmodel dt -seedfile $d/dwi.bet_mask.nii -curvethresh 75 -tracker euler -stepsize 0.5 -brainmask $d/dwi.bet_mask.nii -outputfile $d/allTracts.Bfloat

wait
[ -f $d/dwi2mprage_fs.mat   ] || exit

[ -f $d/mprage_fs2dwi.mat   ] || convert_xfm  -omat $d/mprage_fs2dwi.mat -inverse $d/dwi2mprage_fs.mat
[ -f $d/mprage_fs2dwi.mat   ] || exit

[ -f $d/aparc2009_undersampled.nii.gz ] || flirt -in $d/aparc.2009 -ref $d/rawdwi_bet -out $d/aparc2009_undersampled -init $d/mprage_fs2dwi.mat -interp nearestneighbour -applyxfm
[ -f $d/aparc2009_undersampled.nii.gz ] || exit

[ -f $d/aparc2009_simp.nii.gz  ] || 3dcalc -a $d/aparc2009_undersampled.nii.gz -expr 'a*(equals(a,8)+equals(a,10)+equals(a,11)+equals(a,12)+equals(a,13)+'\
'equals(a,16)+equals(a,17)+equals(a,18)+equals(a,26)+equals(a,47)+equals(a,49)+equals(a,50)+equals(a,51)+equals(a,52)+equals(a,53)+equals(a,54)+equals(a,58)+equals(a,11101)+equals(a,11102)+'\
'equals(a,11103)+equals(a,11104)+equals(a,11105)+equals(a,11106)+equals(a,11107)+equals(a,11108)+equals(a,11109)+equals(a,11110)+equals(a,11111)+equals(a,11112)+equals(a,11113)+equals(a,11114)+equals(a,11115)+equals(a,11116)+equals(a,11117)+'\
'equals(a,11118)+equals(a,11119)+equals(a,11120)+equals(a,11121)+equals(a,11122)+equals(a,11123)+equals(a,11124)+equals(a,11125)+equals(a,11126)+equals(a,11127)+equals(a,11128)+equals(a,11129)+equals(a,11130)+equals(a,11131)+equals(a,11132)+'\
'equals(a,11133)+equals(a,11134)+equals(a,11135)+equals(a,11136)+equals(a,11137)+equals(a,11138)+equals(a,11139)+equals(a,11140)+equals(a,11141)+equals(a,11143)+equals(a,11144)+equals(a,11145)+equals(a,11146)+equals(a,11147)+equals(a,11148)+'\
'equals(a,11149)+equals(a,11150)+equals(a,11151)+equals(a,11152)+equals(a,11153)+equals(a,11154)+equals(a,11155)+equals(a,11156)+equals(a,11157)+equals(a,11158)+equals(a,11159)+equals(a,11160)+equals(a,11161)+equals(a,11162)+equals(a,11163)+'\
'equals(a,11164)+equals(a,11165)+equals(a,11166)+equals(a,11167)+equals(a,11168)+equals(a,11169)+equals(a,11170)+equals(a,11171)+equals(a,11172)+equals(a,11173)+equals(a,11174)+equals(a,11175)+equals(a,12101)+equals(a,12102)+equals(a,12103)+'\
'equals(a,12104)+equals(a,12105)+equals(a,12106)+equals(a,12107)+equals(a,12108)+equals(a,12109)+equals(a,12110)+equals(a,12111)+equals(a,12112)+equals(a,12113)+equals(a,12114)+equals(a,12115)+equals(a,12116)+equals(a,12117)+equals(a,12118)+'\
'equals(a,12119)+equals(a,12120)+equals(a,12121)+equals(a,12122)+equals(a,12123)+equals(a,12124)+equals(a,12125)+equals(a,12126)+equals(a,12127)+equals(a,12128)+equals(a,12129)+equals(a,12130)+equals(a,12131)+equals(a,12132)+equals(a,12133)+'\
'equals(a,12134)+equals(a,12135)+equals(a,12136)+equals(a,12137)+equals(a,12138)+equals(a,12139)+equals(a,12140)+equals(a,12141)+equals(a,12143)+equals(a,12144)+equals(a,12145)+equals(a,12146)+equals(a,12147)+equals(a,12148)+equals(a,12149)+'\
'equals(a,12150)+equals(a,12151)+equals(a,12152)+equals(a,12153)+equals(a,12154)+equals(a,12155)+equals(a,12156)+equals(a,12157)+equals(a,12158)+equals(a,12159)+equals(a,12160)+equals(a,12161)+equals(a,12162)+equals(a,12163)+equals(a,12164)+'\
'equals(a,12165)+equals(a,12166)+equals(a,12167)+equals(a,12168)+equals(a,12169)+equals(a,12170)+equals(a,12171)+equals(a,12172)+equals(a,12173)+equals(a,12174)+equals(a,12175))' -prefix $d/aparc2009_simp.nii.gz
[ -f $d/aparc2009_simp.nii.gz  ] || exit

[ -f $d/conmat_matrix_aparc2009sc.csv        ] || conmat -inputfile $d/allTracts.Bfloat -targetfile $d/aparc2009_simp.nii.gz -outputroot $d/conmat_matrix_aparc2009
[ -f $d/conmat_matrix_aparc2009sc.csv        ] || exit

[ -f $d/fa.nii.gz                               ] || <$d/dt.Bdouble fa | voxel2image -outputroot $d/fa -header $d/rawdwi.nii.gz
[ -f $d/fa.nii.gz                               ] || exit

[ -f $d/conmat_matrix_aparc2009_fasc.csv         ] || conmat -inputfile $d/allTracts.Bfloat -targetfile $d/aparc2009_simp.nii.gz -scalarfile $d/fa.nii.gz -tractstat mean -outputroot $d/conmat_matrix_aparc2009_fa
[ -f $d/conmat_matrix_aparc2009_fasc.csv         ] || exit

[ -f $d/md.nii.gz                               ] || <$d/dt.Bdouble md | voxel2image -outputroot $d/md -header $d/rawdwi.nii.gz
[ -f $d/md.nii.gz                               ] || exit

[ -f $d/conmat_matrix_aparc2009_mdsc.csv     ] || conmat -inputfile $d/allTracts.Bfloat -targetfile $d/aparc2009_simp.nii.gz -scalarfile $d/md.nii.gz -tractstat mean -outputroot $d/conmat_matrix_aparc2009_md
[ -f $d/conmat_matrix_aparc2009_mdsc.csv     ] || exit

[ -f $d/conmat_matrix_aparc2009_lengthsc.csv ] || conmat -inputfile $d/allTracts.Bfloat -targetfile $d/aparc2009_simp.nii.gz -tractstat length -outputroot $d/conmat_matrix_aparc2009_length
[ -f $d/conmat_matrix_aparc2009_lengthsc.csv ] || exit


[ -f $d/count_0.txt         ] || sed -e '1 s#Label_[0]*##g' $d/conmat_matrix_aparc2009sc.csv | paste -d, /data/DWW/DestrieuxIndices.txt - > $d/count_0.txt

if [[ $d =~ shm ]]; then
	mv --update $d/* /data/DWW/$sid/
	rmdir -v $d
fi
