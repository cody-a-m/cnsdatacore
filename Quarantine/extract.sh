#!/bin/bash
shopt -s extglob
export PATH=/usr/local/bin:$PATH

[ -f /var/lock/etl_lock ] && echo "Another upload is currently extracting." && exit

declare -i UploadID
UploadID=$(mysql --batch --silent Quarantine -e "CALL pollUploads();")
[ $UploadID -ge 0 ] || exit
echo $UploadID > /var/lock/etl_lock

rsync --recursive --times --update --progress --whole-file --inplace --remove-source-files --chmod=u+rwx,g+rwx,o-rwx webserver::uploads/$UploadID/ /mnt/gluster/gv0/data/UPLOADS/$UploadID/

quarantine_dir=/dev/shm/upload/$UploadID
mkdir -pv $quarantine_dir

image_file_dir=$(ls -1d /mnt/gluster/gv0/data/UPLOADS/$UploadID/image_file*)
if [ -d ${image_file_dir:-foo} ]; then
	image_file="$(ls -1 $image_file_dir)"
	#[ ${#image_file} -gt 1 ] && exit
	quarantine_image_file="${quarantine_dir}/${image_file}_extracted" && mkdir -pv "$quarantine_image_file"
	case $(file --brief --mime-type --preserve-date $image_file_dir/$image_file) in
	        application/x-tar)        tar -C  "$quarantine_image_file" -xf "$image_file_dir/$image_file" ;;
	        application/zip)          unzip -q "$image_file_dir/$image_file" -d "$quarantine_image_file" ;;
	        application/x-gzip)       pigz -dc "$image_file_dir/$image_file" | tar -C "$quarantine_image_file" -xf - ;;
        	application/octet-stream) exit ;;
	esac
        rm /var/lock/etl_lock && echo "Finished extracting upload."
	chgrp -R 2000 $quarantine_image_file
	chmod -R 750 $quarantine_image_file
	network_id=$(mysql --batch --silent Quarantine -e "CALL getNetworkID($UploadID)");
	case $network_id in
	3)	[[ $image_file =~ ([0123456]{4})_?([0-9]{6}).* ]] || exit
		[ ${#BASH_REMATCH[1]} -eq 4 ] || exit
		[ ${#BASH_REMATCH[2]} -eq 6 ] || exit
		PatientID=${BASH_REMATCH[1]}${BASH_REMATCH[2]}
		;;
	4)	[[ $image_file =~ [0-9]{4}[A-Za-z] ]] || exit
		[ ${#BASH_REMATCH} -eq 5 ] || exit
                PatientID=${BASH_REMATCH}
                ;;
	7)	[[ $image_file =~ /W[BCHU][0-9]{2} ]] || exit
		[ ${#BASH_REMATCH} -eq 4 ] || exit
		PatientID=${BASH_REMATCH}
		;;
	9)	[[ $image_file =~ L[0-9]{2}-[0-9]{4} ]] || exit
		PatientID=${BASH_REMATCH}
		;;
	esac
	/root/code/cnsdatacore/Quarantine/repo_push_dir -u $UploadID -d "${quarantine_image_file}" -s $PatientID
fi

demographics_file_dir=$(ls -1d /mnt/gluster/gv0/data/UPLOADS/$UploadID/demographics_file* 2>/dev/null)
if [ $(ls -1 ${demographics_file_dir:-foo} 2>/dev/null | wc -l) -gt 0 ]; then
	cp --preserve=time --recursive --verbose $demographics_file_dir  $quarantine_dir/
fi
