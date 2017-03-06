#!/bin/bash

ls -1dt /mnt/dev/vg0/gluster/gv0/data/QUARANTINE/0/[Aa0]*/*/2* | sed -e 's#/mnt/dev/vg0/gluster/gv0/data/QUARANTINE/0/##' | while read d
do
	[ ${d##*/} -lt 20160801 ] && exit
	sql=$(printf 'select count(*) from Quarantine.Directories where DirectoryPath like \047%%%s%%\047;' $d)
	res=$(mysql --batch --raw --silent Quarantine -e "$sql")
	[ $res -gt 0 ] || echo $d
done

[ $1"x" == '-ax' ] || exit

ls -1dt /data/UPLOADS/*/image_file | sed -e 's#UPLOADS#QUARANTINE#' | while read d
do
	sql=$(printf 'select count(*) from Quarantine.Directories where DirectoryPath like \047%s%%\047;' $d)
	res=$(mysql --batch --raw --silent Quarantine -e "$sql")
	[ $res -gt 0 ] || echo $d
done | sort -t/ -k4 -n
