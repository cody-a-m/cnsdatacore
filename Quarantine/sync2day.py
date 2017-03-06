#!/usr/bin/python

import pexpect
import sys
import time

logfile = '/dev/shm/albmc_sync_' + time.strftime("%Y%m%d-%H%M%S")
rsync_cmd='rsync --recursive --times --chmod=u+rwx,g+rx,o+rx --update --log-file=' + logfile + ' --log-file-format="%n" --out-format="%n" --rsh="ssh -T" dns0.bmap.ucla.edu:/Volumes/BMC9/dicom6/MAYERGROUP/ /mnt/gluster/gv0/data/QUARANTINE/0/'
sync2day = pexpect.spawn(rsync_cmd)
sync2day.expect('Password:')
sync2day.sendline('tuxisbetter')
sync2day.expect('\n')
sync2day.expect(pexpect.EOF,timeout=None)
output = sync2day.before
for line in output.split('\n'):
	print line
