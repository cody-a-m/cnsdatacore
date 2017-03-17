sid=$1
s=$(mysql -Brs ImagingRepositoryV6 -e "select concat_ws('_',SubjectName,replace(ScanDate,'-','')) from StudyImageInfo where StudyImageID=${sid};")
#[ ${#s} -eq 0 -a -e $d/count_0.txt ] && echo "$d bad" && continue
#[ -d  /data/GTG/metabolon/data/$s ] && exit
d=/data/GTG/DWW/data/$s/connectivity/AggFibersScript_1.OutputDirectory-1
[ -L $d/count_0.txt ] && exit
mkdir -pv  $d
ln -sv /data/DWW/$sid/count_0.txt $d/count_0.txt
