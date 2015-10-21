#!/bin/bash

export LC_ALL=C
export PATH=/mnt/data/imaging/dcmtk/bin:$PATH
export DCMDICTPATH=/mnt/data/imaging/dcmtk/share/dcmtk/dicom.dic:/mnt/data/imaging/dcmtk/share/dcmtk/private.dic

	replDICOM=$1
	replPatientID=$2


	origDICOM=$3

#dcm00080033=$(dcm  8   33 $origDICOM) # content time -- most specific timestamp
#dcm00080008=$(dcm  8    8 $origDICOM) # image type
#dcm00080018=$(dcm  8   18 $origDICOM) # sop instance uid
#dcm00080020=$(dcm  8   20 $origDICOM) # study date
#dcm00080070=$(dcm  8   70 $origDICOM) # manufacturer
dcm00080080=$(dcm  8   80 $origDICOM) # institution
#dcm00081010=$(dcm  8 1010 $origDICOM) # station name
dcm00081030=$(dcm  8 1030 $origDICOM) # study description
dcm0008103e=$(dcm  8 103e $origDICOM) # series description
#dcm00081090=$(dcm  8 1090 $origDICOM) # model name
dcm00100010=$(dcm 10   10 $origDICOM) # patient name
dcm00100020=$(dcm 10   20 $origDICOM) # patient id
dcm00181030=$(dcm 18 1030 $origDICOM) # protocol name
#dcm0020000d=$(dcm 20    d $origDICOM) # study instance uid
#dcm0020000e=$(dcm 20    e $origDICOM) # series instance uid
#dcm00200011=$(dcm 20   11 $origDICOM) # series number

#printf "%s\t%s\t%s\t%s\t%s\n" ${dcm00080080:-A} ${dcm00081090:-B} ${dcm00100010:-C} ${dcm00100020:-D} $dcm00200011

#if [ ${#dcm00080033} -eq 0 ]; then echo  content time -- most specific timestamp; fi
#if [ ${#dcm00080008} -eq 0 ]; then echo  image type; fi
#if [ ${#dcm00080018} -eq 0 ]; then echo  sop instance uid; fi
#if [ ${#dcm00080020} -eq 0 ]; then echo  study date; fi
#if [ ${#dcm00080070} -eq 0 ]; then echo  manufacturer; fi
#if [ ${#dcm00080080} -eq 0 ]; then echo  institution; fi
#if [ ${#dcm00081010} -eq 0 ]; then echo  station name; fi
#if [ ${#dcm00081030} -eq 0 ]; then echo  study description; fi
#if [ ${#dcm0008103e} -eq 0 ]; then echo  series description; fi
#if [ ${#dcm00081090} -eq 0 ]; then echo  model name; fi
#if [ ${#dcm00100020} -eq 0 ]; then echo  patient id; fi
#if [ ${#dcm00181030} -eq 0 ]; then echo  protocol name; fi
#if [ ${#dcm0020000d} -eq 0 ]; then echo  study instance uid; fi
#if [ ${#dcm0020000e} -eq 0 ]; then echo  series instance uid; fi
#if [ ${#dcm00200011} -eq 0 ]; then echo  series number; fi
#
#institution
#station name
#study description
#series description
#protocol name
