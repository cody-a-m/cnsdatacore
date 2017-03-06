#!/bin/bash
set -e
trap exit_cleanup EXIT
trap err_cleanup ERR

function exit_cleanup() {
	rm -r "$uploadDir"
	exit
}

function err_cleanup() {
	[ ${StudyImageID:-0} -gt 0 ] && echo "$origDICOM" >> $REPOROOT/PROBLEM_WITH_$StudyImageID
	[ ${StudyImageID:-0} -eq 0 ] && echo "$origDICOM $FileSetID" >> $REPOROOT/PROBLEM_WITH_0_RAWDICOM
	exit_cleanup
}

export LC_ALL=C
export PATH=/mnt/data/imaging/dcmtk/bin:$PATH
export DCMDICTPATH=/mnt/data/imaging/dcmtk/share/dcmtk/dicom.dic:/mnt/data/imaging/dcmtk/share/dcmtk/private.dic
export REPOROOT=/mnt/data/new
export TEMPDIR=/dev/shm/upload

	uploadID=$1
	origDICOM="$2"
	newPatientID="$3"
	institution="$4"
	seriesDesc="$5"
	studyDesc="$6"
	protocolName="$7"
	studyInstanceUID="$8"

	uploadDir=$(mktemp --directory --tmpdir=$TEMPDIR)

	[ $uploadID -ge 0 ] && [[ $(file -b "$origDICOM") =~ DICOM\ medical\ imaging\ data ]] || exit
	FileSetID=$(dcm 4 1130 "$origDICOM" 2>&1) && [ "${FileSetID:-X}" != X ] && err_cleanup

	cp --dereference -p "$origDICOM" $uploadDir/
	uploadFile=$uploadDir/${origDICOM##*/}

	# Modification of PatientID & PatientName
	dcmodify -nb 	-m "(0008,0080)=$institution" \
			-m "(0008,1030)=$studyDesc" \
			-m "(0008,103e)=$seriesDesc" \
			-m "(0010,0010)=$newPatientID" \
		     	-m "(0010,0020)=$newPatientID" \
		  	-m "(0018,1030)=$protocolName" \
		  	-m "(0020,000d)=$studyInstanceUID" \
			"$uploadFile"
	uploadMD5=($(md5sum $uploadFile))

	dcm2xml "$uploadFile" "${uploadFile}.xml"

	chmod -R 777 $uploadDir

	if [ ${uploadID:-0} -eq 0 ]; then
		sql=$(printf 'SELECT getUploadIDHeuristic(\047%s\047);' "$(dcm 8 1030 $uploadFile)")
		uploadID=$(mysql --silent --silent --raw -uroot  Quarantine -e "$sql")
		[ $uploadID -le 0 ] && exit
	fi

	sql=$(printf 'CALL pushXMLUploadToRepository(\047%s\047,\047%s\047,\047%s\047,%d);' "${origDICOM}" $uploadMD5 "${uploadFile}.xml" $uploadID)

	StudyImageID=$(mysql  --silent --silent --max_allowed_packet=2G --raw -uroot  Quarantine -e "$sql")

	if [[ ${StudyImageID:-X} =~ [^0-9] || ${StudyImageID} -le 0 ]]; then
		printf "%s: %s \n" "$origDICOM" $StudyImageID
		exit
	fi

	InstanceNumber=$(dcm 20 13 "$uploadFile")
	[ $InstanceNumber -le 0 ] && echo "$origDICOM has invalid InstanceNumber" && err_cleanup

	[ -d $REPOROOT/RAWDATA/$StudyImageID ] || mkdir -pv $REPOROOT/{RAWDATA,XML}/$StudyImageID
	[ -d $REPOROOT/XML/$StudyImageID ] || mkdir -pv $REPOROOT/{RAWDATA,XML}/$StudyImageID
	mv  "$uploadFile" $REPOROOT/RAWDATA/$StudyImageID/
	mv "${uploadFile}.xml" $REPOROOT/XML/$StudyImageID/$(printf "%05d".xml $InstanceNumber)

	newRAW="$REPOROOT/RAWDATA/$StudyImageID/${uploadFile##*/}"
	touch -m --reference="$origDICOM" "$newRAW"
	newMD5=($(md5sum "$newRAW"))
	[ ${newMD5:-foobar} != $uploadMD5 ] && printf "Error in file %s part of StudyImage %d\n" "$origDICOM" $StudyImageID && err_cleanup

