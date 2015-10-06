#!/bin/bash

shopt -s extglob


UploadID=$(mysql --batch --silent Quarantine -e "CALL pollUploads();")
[ $UploadID -le 0 ] && exit

rsync --recursive --times --update --progress --chmod=u+rwx,g+rwx,o-rwx webserver::uploads/$UploadID/image_file /data/UPLOADS/$UploadID/

UploadDir=/data/UPLOADS/$UploadID/image_file
[ -d $UploadDir ] || exit

UploadFile=( $(ls -1 $UploadDir) )
[ ${#UploadFile[@]} -gt 1 ] && exit
UploadFileType=$(file --brief --mime-type --preserve-date $UploadDir/$UploadFile)

QuarantineDir=${UploadDir/UPLOADS/QUARANTINE}/${UploadFile}_extracted
[ -d $QuarantineDir ] && exit

mkdir -pv $QuarantineDir

case $UploadFileType in 
	application/zip) unzip $UploadDir/$UploadFile -d $QuarantineDir ;;
	application/x-gzip) tar -C $QuarantineDir -xzvf $UploadDir/$UploadFile ;;
	application/octet-stream) exit ;;
esac


NetworkID=$(mysql --batch --silent Quarantine -e "CALL getNetworkID($UploadID)");
case $NetworkID in
	3)	[[ $UploadFile =~ ([0123456]{4})_?([0-9]{6}).* ]] || exit
		[ ${#BASH_REMATCH[1]} -eq 4 ] || exit
		[ ${#BASH_REMATCH[2]} -eq 6 ] || exit
		PatientID=${BASH_REMATCH[1]}${BASH_REMATCH[2]}
		find $QuarantineDir -type f | push+fix $UploadID {} $PatientID
		;;
esac
