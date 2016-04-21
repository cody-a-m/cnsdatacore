#!/bin/bash


repo_root=/mnt/gluster/gv0/data

while getopts "f" opt
do
 case $opt in
  f) full_scan=1;;
 esac
done


mysql --batch --raw --silent -h172.16.10.80 -ucody -p4cody2c ImagingRepositoryV6 -e "call getStudyPaths('-nt -s -d -sq +n');" | sed -e 's#__#_#g' -e 's#,##g' -e 's#\t#\ #' | sort -R | while read -a t
do
	id=${t[0]}
	sess=${t[1]}
	path=${t[2]}
	[ ${id:-0} -gt 0 ] || continue
	[ -d $repo_root/NIFTI/$id ] || continue
	qc_dir=$repo_root/QC/$path/NIFTI
	if [ -d $qc_dir ]; then
		[ ${full_scan:-0} -gt 0 ] && cp --link --preserve=all --update --verbose $repo_root/NIFTI/$id/* $qc_dir/
	else
		mkdir -pv $qc_dir
		cp --link --preserve=all --update $repo_root/NIFTI/$id/* $qc_dir/
	fi
	if [ -d $repo_root/TRK/$id ]; then
		if [ ! -e $qc_dir/dti.trk ]; then
			ln $repo_root/TRK/$id/dti.trk $qc_dir/dti.trk
		fi
	fi
done
