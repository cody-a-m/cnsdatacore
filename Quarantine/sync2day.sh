#!/bin/bash

/root/code/cnsdatacore/Quarantine/sync2day.expect # | tr -d '\"\015' | parallel --no-notice --jobs /tmp/procfile repo_push_file -u 0 -f /data/QUARANTINE/0/{}
/root/code/cnsdatacore/Quarantine/sync_mrs.expect


/root/code/cnsdatacore/Quarantine/inQ.sh | while read d; do repo_push_dir -u 0 -d $d; done
