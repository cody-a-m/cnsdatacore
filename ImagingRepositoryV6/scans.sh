#!/bin/bash

subjid=$1
scandt=$2

sql=$(printf 'select StudyImageID, SequenceNumber from StudyImageInfo where ModalityID=2 and SubjectName=\047%s\047 and ScanDate=\047%d-%s-%s\047;' $subjid ${scandt:0:4} ${scandt:4:2} ${scandt:6:2})
res=($(mysql --batch --raw --silent ImagingRepositoryV6 -e "$sql"))

echo ${res[0]} ${res[1]}

