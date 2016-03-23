#!/bin/bash
shopt -s extglob
export PATH=/usr/local/bin:$PATH


UploadID=$(mysql --batch --silent Quarantine -e "CALL pollUploads();")
[ $UploadID -le 0 ] && exit

rsync --recursive --times --update --progress --chmod=u+rwx,g+rwx,o-rwx --rsh="ssh -p2222 -lBoFH" webserver:/srv/www/upload/pain/$UploadID/ /data/UPLOADS/$UploadID/

UploadDir=$(ls -1d /data/UPLOADS/$UploadID/image_file*)
[ -d $UploadDir ] || exit

UploadFile=( $(ls -1 $UploadDir) )
[ ${#UploadFile[@]} -gt 1 ] && exit
UploadFileType=$(file --brief --mime-type --preserve-date $UploadDir/$UploadFile)

QuarantineDir=${UploadDir/UPLOADS/QUARANTINE}/${UploadFile}_extracted
[ -d $QuarantineDir ] || mkdir -pv $QuarantineDir

case $UploadFileType in 
	application/x-tar) tar -C  $QuarantineDir -xvf $UploadDir/$UploadFile ;;
	application/zip) unzip $UploadDir/$UploadFile -d $QuarantineDir ;;
	application/x-gzip) tar -C $QuarantineDir -xzvf $UploadDir/$UploadFile ;;
	application/octet-stream) exit ;;
esac
chgrp -R 2000 $QuarantineDir
chmod -R 750 $QuarantineDir


NetworkID=$(mysql --batch --silent Quarantine -e "CALL getNetworkID($UploadID)");
case $NetworkID in
	3)	[[ $UploadFile =~ ([0123456]{4})_?([0-9]{6}).* ]] || exit
		[ ${#BASH_REMATCH[1]} -eq 4 ] || exit
		[ ${#BASH_REMATCH[2]} -eq 6 ] || exit
		PatientID=${BASH_REMATCH[1]}${BASH_REMATCH[2]}
		#find $QuarantineDir -type f | parallel --no-notice --jobs /tmp/procfile ~/cnsdatacore/Quarantine/push+fix.sh $UploadID {} $PatientID
		repo_push_dir -u $UploadID -d "$QuarantineDir" -s $PatientID
		;;
	4)	[[ $UploadFile =~ [0-9]{4}[A-Za-z] ]] || exit
		[ ${#BASH_REMATCH} -eq 5 ] || exit
		PatientID=${BASH_REMATCH}
		repo_push_dir -u $UploadID -d "$QuarantineDir" -s $PatientID
		;;
esac
