#!/bin/bash
set -e
trap exit_cleanup EXIT
trap err_cleanup ERR

#export debug=$4
function exit_cleanup() {
	[ $? -gt 0 ] || rm -r "$uploadDir" #&>> $REPOROOT/error_log_$(date +%Y%m%d)
	exit
}

function err_cleanup() {
	[ ${StudyImageID:-0} -gt 0 ] && echo "$origDICOM" >> $REPOROOT/PROBLEM_WITH_$StudyImageID
	[ ${StudyImageID:-0} -eq 0 ] && echo "$origDICOM $FileSetID" >> $REPOROOT/PROBLEM_WITH_0_RAWDICOM
	exit 1
}

export LC_ALL=C
export PATH=/mnt/data/imaging/dcmtk/bin:$PATH
export DCMDICTPATH=/mnt/data/imaging/dcmtk/share/dcmtk/dicom.dic:/mnt/data/imaging/dcmtk/share/dcmtk/private.dic
export REPOROOT=/mnt/gluster/gv0/data
export TEMPDIR=/dev/shm/upload

declare -a REMOVE_DICOM_FIELDS=(
	0010,0030
	0010,0040
	0010,1030
)

while getopts "i:n:s:d:" opt
do
 case $opt in
  i) export origStudyImageID=$OPTARG;;
  n) export newPatientID="$OPTARG"; export newStudySubjectName="$OPTARG";;
  s) export newStudyID=$OPTARG;;
  g) export DEBUG=$OPTARG;;
 esac
done

	uploadDir=$(mktemp --directory --tmpdir=$TEMPDIR)
	cp -p "/data/RAWDATA/$origStudyImageID/"* $uploadDir/

        sql=$(printf 'CALL forkStudyImage(%i,\047%s\047,%i);' $origStudyImageID $newStudySubjectName $newStudyID)
        StudyImageID=$(mysql --silent --silent --raw -uroot ImagingRepositoryV6 -e "$sql")
	
	if [[ ${StudyImageID:-X} =~ [^0-9] || ${StudyImageID} -le 0 ]]; then
		printf "0:%s:%s:NULL\n" $StudyImageID "$origStudyImageID"
		exit
	fi


	for uploadFile in $uploadDir/*
	do
		# Modification of PatientID & PatientName
		dcmodify -nb -m "(0010,0010)=$newPatientID" -m "(0010,0020)=$newPatientID"  $(for f in ${REMOVE_DICOM_FIELDS[@]}; do printf ' -e (%s) ' $f; done)  "$uploadFile"
		uploadMD5=($(md5sum $uploadFile))

#		if [ "$(dcm 8 70 $uploadFile)" == "Philips Medical Systems" ]; then
#			dcm2xml "$uploadFile" | xsltproc /mnt/data/DICOM/SCRIPTS/required_set.xsl - > "${uploadFile}.xml"
#		else
#			dcm2xml "$uploadFile" "${uploadFile}.xml"
#		fi

		SeriesNumber=$(dcm 20 11 "$uploadFile") && [ ${SeriesNumber:-0} -le 0 ] && echo "Invalid Series Number: $origDICOM" && err_cleanup
		AcquisitionNumber=$(dcm 20 12 "$uploadFile") && [ ${AcquisitionNumber:-0} -le 0 ] && echo "Invalid Acquisition Number ($AcquisitionNumber): $origDICOM" && err_cleanup
		InstanceNumber=$(dcm 20 13 "$uploadFile") && [ ${InstanceNumber:-0} -le 0 ] && echo "Invalid Instance Number: $origDICOM" && err_cleanup
	
		[ -d $REPOROOT/RAWDATA/$StudyImageID ] || mkdir -p $REPOROOT/RAWDATA/$StudyImageID
#		[ -d $REPOROOT/XML/$StudyImageID ] || mkdir -p $REPOROOT/{RAWDATA,XML}/$StudyImageID
		newDICOM=$REPOROOT/RAWDATA/$StudyImageID/$(printf "%s_ser%02d_acq%03d_img%05d.dcm" "$newPatientID" $SeriesNumber $AcquisitionNumber $InstanceNumber)
		cp -p "$uploadFile" "$newDICOM"
#		cp -p "${uploadFile}.xml" $REPOROOT/XML/$StudyImageID/$(printf "%05d".xml $InstanceNumber)

		newMD5=($(md5sum "$newDICOM"))
		[ ${newMD5:-foobar} != $uploadMD5 ] && printf "Error in file %s part of StudyImage %d\n" $origStudyImageID $StudyImageID && err_cleanup
		printf "%s:%s:%s:%s\n" ${ScanSessionID:-0} $StudyImageID "$origStudyImageID" "$newDICOM"
	done
