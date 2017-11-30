#!/bin/bash

studyid=$1
datadir="/data"
datadirs="/mnt/dev/vg0/gluster*/gv0/data"

if [ ${#studyid} -gt 0 ]; then
	sd="#sd=$studyid"
fi

function make_path () {
	mkdir -pv /data/studies/$1
	chgrp 1000 /data/studies/$1
	chmod g+rwx /data/studies/$1
}

mysql -Brs ImagingRepositoryV6 -e "call getStudyPaths('-sd -s -d -sq +n $sd');"  | sed -e 's#__#_#g' -e 's#,##' -e 's#\t#\ #' | sort -R  | while read id sess path
do

	[ -d $datadir/NIFTI/$id     -a ! -L $datadirs/studies/$path/NIFTI    ] && make_path $path && ln -sv /data/NIFTI/$id     /data/studies/$path/NIFTI

	[ -d $datadir/TRK/$id       -a ! -L $datadirs/studies/$path/TRK      ] && make_path $path && ln -sv /data/TRK/$id       /data/studies/$path/TRK

	[ -d $datadir/FS/$id        -a ! -L $datadirs/studies/$path/FS       ] && make_path $path && ln -sv /data/FS/$id        /data/studies/$path/FS

	[ -d $datadir/JVH/$id       -a ! -L $datadirs/studies/$path/JVH      ] && make_path $path && ln -sv /data/JVH/$id       /data/studies/$path/JVH

	[ -d $datadir/RAWDATA/$id   -a ! -L $datadirs/studies/$path/DICOM    ] && make_path $path && ln -sv /data/RAWDATA/$id   /data/studies/$path/DICOM

	[ -d $datadir/FSL/FIRST/$id -a ! -L $datadirs/studies/$path/FSLFIRST ] && make_path $path && ln -sv /data/FSL/FIRST/$id /data/studies/$path/FSLFIRST

	[ -d $datadir/CONN/$id      -a ! -L $datadirs/studies/$path/CONN     ] && make_path $path && ln -sv /data/CONN/$id      /data/studies/$path/CONN

	[ -d $datadir/DWW/$id       -a ! -L $datadirs/studies/$path/CAMINO   ] && make_path $path && ln -sv /data/DWW/$id       /data/studies/$path/CAMINO
done
