#!/bin/bash

imageid=$1
dicomdir=/data/RAWDATA/$1
export SUBJECTS_DIR=/data/FS/

[[ $dicomdir != /data/RAWDATA/ && -d $dicomdir ]] || exit

nohup recon-all -subjid $1 -i $(find $dicomdir -type f | sort -n | head -n1) -all 2>&1 > $docdir/AutoFS.log &


