# CNS Data Core
## Code & Procedures

### Upload polling
1. Webserver code inserts tuple into Quarantine.Uploads, receiving an UploadID in return.
2. A new directory under $REPO_TEMP/Uploads/ is created with the UploadID as the directory name.
3. Data are stored in the the directory.
4. Upon completion of the data transfer, the new row in Quarantine.Uploads is updated with the Completed flag set to TRUE.
5. Linux system code polling at one minute intervals on a stored procedure querying for for new uploads:

```sql
SELECT Quarantine.Uploads.UploadID INTO NewUploadID 
FROM Quarantine.Uploads LEFT OUTER JOIN Quarantine.Directories ON Quarantine.Uploads.UploadID = Quarantine.Directories.UploadID 
WHERE Quarantine.Directories.UploadID IS NULL ORDER BY Quarantine.Uploads.UploadID ASC LIMIT 1;
```

IF NewUploadID IS NULL THEN
  SELECT -1;
ELSE
  SELECT NewUploadID;
END IF;

- [x] Add Completed field to Quarantine.Uploads;
- [ ] Add upload code to UPDATE Completed field to 1 (TRUE) upon completion.


