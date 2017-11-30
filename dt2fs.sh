#!/bin/bash
#set -x
set -e

shopt -s extglob

export PATH=/data/DWW/camino-code/bin:$PATH

while getopts "i:f:" opt
do
 case $opt in
  i) sid="$OPTARG";;
  f) fsd="$OPTARG";;
 esac
done

if [ ${fsd:-0} -eq 0 -o ${#fsd} -eq 0 ]; then
	fsd=($(mysql -Brs -h172.16.10.80 -ucody -p4cody2c ImagingRepositoryV6 -e "select StudyImageID from StudyImageInfo where ModalityID=2 and ScanSessionID=(select ScanSessionID from StudyImageInfo where StudyImageID=${sid});"))
	[ ${#fsd[@]} -gt 1 ] && echo "Multiple structural associated with this scan" && exit
fi

echo $fsd
