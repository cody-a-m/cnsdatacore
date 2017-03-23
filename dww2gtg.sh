sid=$1
fsd=$2
s=$(mysql -Brs ImagingRepositoryV6 -e "select concat_ws('_',SubjectName,replace(ScanDate,'-','')) from StudyImageInfo where StudyImageID=${sid};")

if [ -e /data/DWW/$sid/dww.log ]; then
	read sidagain fsd</data/DWW/$sid/dww.log
	[ $sid -ne $sidagain ] && echo mismatch && exit
	[ ${fsd:-0} -gt 0 ] || exit
elif [ ${fsd:-0} -ne 0 ]; then
	fsd=($(mysql -Brs ImagingRepositoryV6 -e "select StudyImageID from StudyImageInfo where ModalityID=2 and ScanSessionID=(select ScanSessionID from StudyImageInfo where StudyImageID=${sid});"))
fi

[ ${#fsd[@]} -gt 1 ] && echo "Multiple structural associated with $1" && exit
[ ! -f /data/FS/$fsd/stats/aseg.stats ] && echo "Missing Freesurfer stats for $1 $fsd" && exit
#[ ${#s} -eq 0 -a -e $d/count_0.txt ] && echo "$d bad" && continue
#[ -d  /data/GTG/metabolon/data/$s ] && exit
d=/data/GTG/DWW/data/$s/connectivity/AggFibersScript_1.OutputDirectory-1
mkdir -pv  $d
[ -L /data/GTG/DWW/data/$s/FSrecon ] || ln -sv /data/FS/$fsd /data/GTG/DWW/data/$s/FSrecon
[ -L $d/count_0.txt ] && exit
ln -sv /data/DWW/$sid/count_0.txt $d/count_0.txt
