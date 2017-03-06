#!/bin/bash

upload_id=$(mysql --batch --raw --silent Quarantine -e "INSERT INTO Quarantine.Uploads(NetworkID,SiteID,StudyID,UploadTime,PeopleID,Completed) VALUES(3,12,95,NOW(),0,1); SELECT LAST_INSERT_ID();")
[ ${upload_id:-ERROR} =~ [A-Za-z]  ] && echo 0 && exit
echo ${upload_id:-0}
