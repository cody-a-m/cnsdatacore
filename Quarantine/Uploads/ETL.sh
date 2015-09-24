#!/bin/bash

shopt -s extglob


UploadID=$(mysql "CALL pollUploads();")

[ $UploadID -le 0 ] && exit

UploadFile=$(ls -1 /data/UPLOADS/$UploadID/image_file)

QuarantineDir=/data/QUARANTINE/$UploadID/image_file/${UploadFile}_extracted
[ -d $QuarantineDir ] && exit

mkdir -pv $QuarantineDir
pushd $QuarantineDir
FileType=$(file $UploadFile)


NetworkID=$(mysql "getNetworkID()");
case $NetworkID in
	2) find $QuarantineDir -type f | push+fix 0 {};;
esac
