#!/bin/bash

#ls -1dt /mnt/dev/vg0/gluster/gv0/data/QUARANTINE/0/[Aa0]*/*/2* | sed -e 's#/mnt/dev/vg0/gluster/gv0##' | while read d
ls -1dt /mnt/gluster/gv0/data/QUARANTINE/0/[Aa0]*/*/2017* | sed -e 's#/mnt/gluster/gv0##' | while read d
do
	[ ${d##*/} -lt 20160801 ] && exit
	sql=$(printf 'select UploadID from Quarantine.Directories where DirectoryPath like \047%s%%\047 limit 1;' $d)
	res=$(mysql --batch --raw --silent Quarantine -e "$sql")
	[ ${#res} -gt 0 ] || echo $d 
	[ ${res:-0} -eq 0 -a ${#1} -gt 0 ] && repo_push_dir -u 0 -d $d
done

[ $1"x" == '-ax' ] || exit

ls -1dt /data/UPLOADS/*/image_file | sed -e 's#UPLOADS#QUARANTINE#' | while read d
do
	sql=$(printf 'select count(*) from Quarantine.Directories where DirectoryPath like \047%s%%\047;' $d)
	res=$(mysql --batch --raw --silent Quarantine -e "$sql")
	[ ${res:-0} -gt 0 ] || echo $d 
done | sort -t/ -k4 -n
