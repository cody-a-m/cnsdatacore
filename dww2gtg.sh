sid=$1
s=$(mysql -Brs ImagingRepositoryV6 -e "select concat_ws('_',SubjectName,replace(ScanDate,'-','')) from StudyImageInfo where StudyImageID=${sid};")
fsd=($(mysql -Brs ImagingRepositoryV6 -e "select StudyImageID from StudyImageInfo where ModalityID=2 and ScanSessionID=(select ScanSessionID from StudyImageInfo where StudyImageID=${sid});"))
[ ${#fsd[@]} -gt 1 ] && echo "Multiple structural associated with this scan" && exit
[ ! -f /data/FS/$fsd/stats/aseg.stats ] && echo "Missing Freesurfer stats" && exit
#[ ${#s} -eq 0 -a -e $d/count_0.txt ] && echo "$d bad" && continue
#[ -d  /data/GTG/metabolon/data/$s ] && exit
d=/data/GTG/DWW/data/$s/connectivity/AggFibersScript_1.OutputDirectory-1
mkdir -pv  $d
[ -L /data/GTG/DWW/data/$s/FSrecon ] || ln -sv /data/FS/$fsd /data/GTG/DWW/data/$s/FSrecon
[ -L $d/count_0.txt ] && exit
ln -sv /data/DWW/$sid/count_0.txt $d/count_0.txt
