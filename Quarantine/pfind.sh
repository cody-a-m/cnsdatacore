#!/bin/bash

brick=$1
shift
spath=$1
shift

lookup=$(while (( $# )); do
	f=$1
	printf " -samefile %s/.glusterfs/%s/%s/%s " $brick ${f:0:2} ${f:2:2} $f
	[ $# -gt 1 ] && echo -n " -or "
	shift
done)

#find $brick/[A-Za-z0-9]* -type f \( $lookup \)
find $spath -type f \( $lookup \)
