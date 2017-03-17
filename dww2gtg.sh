sid=$1
s=$(mysql -Brs ImagingRepositoryV6 -e "select concat_ws('_',SubjectName,replace(ScanDate,'-','')) from StudyImageInfo where StudyImageID=${sid};")
#[ ${#s} -eq 0 -a -e $d/count_0.txt ] && echo "$d bad" && continue
#[ -d  /data/GTG/metabolon/data/$s ] && exit
mkdir -pv  /data/GTG/DWW/data/$s/connectivity/AggFibersScript_1.OutputDirectory-1
[ -L /data/GTG/DWW/data/$s/connectivity/AggFibersScript_1.OutputDirectory-1/count_0.txt ] && exit
ln -sv /data/DWW/$sid/count_0.txt /data/GTG/DWW/data/$s/connectivity/AggFibersScript_1.OutputDirectory-1/
