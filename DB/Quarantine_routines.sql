CREATE DATABASE  IF NOT EXISTS `Quarantine` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Quarantine`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: cns5.med.ucla.edu    Database: Quarantine
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `UploadInfo`
--

DROP TABLE IF EXISTS `UploadInfo`;
/*!50001 DROP VIEW IF EXISTS `UploadInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `UploadInfo` AS SELECT 
 1 AS `UploadID`,
 1 AS `SiteID`,
 1 AS `site_acronym`,
 1 AS `StudyID`,
 1 AS `StudyName`,
 1 AS `UploadTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `StudyImageUploads`
--

DROP TABLE IF EXISTS `StudyImageUploads`;
/*!50001 DROP VIEW IF EXISTS `StudyImageUploads`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `StudyImageUploads` AS SELECT 
 1 AS `StudyImageID`,
 1 AS `UploadID`,
 1 AS `UploadTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `UploadInfo`
--

/*!50001 DROP VIEW IF EXISTS `UploadInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `UploadInfo` AS select `Quarantine`.`Uploads`.`UploadID` AS `UploadID`,`Quarantine`.`Uploads`.`SiteID` AS `SiteID`,`membership`.`site`.`site_acronym` AS `site_acronym`,`Quarantine`.`Uploads`.`StudyID` AS `StudyID`,`ImagingRepositoryV6`.`Studies`.`StudyName` AS `StudyName`,`Quarantine`.`Uploads`.`UploadTime` AS `UploadTime` from ((`Quarantine`.`Uploads` left join `membership`.`site` on((`Quarantine`.`Uploads`.`SiteID` = `membership`.`site`.`site_id`))) left join `ImagingRepositoryV6`.`Studies` on((`Quarantine`.`Uploads`.`StudyID` = `ImagingRepositoryV6`.`Studies`.`StudyID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StudyImageUploads`
--

/*!50001 DROP VIEW IF EXISTS `StudyImageUploads`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `StudyImageUploads` AS select `Files`.`StudyImageID` AS `StudyImageID`,`Uploads`.`UploadID` AS `UploadID`,`Uploads`.`UploadTime` AS `UploadTime` from ((`Files` join `Directories` on((`Files`.`DirectoryID` = `Directories`.`DirectoryID`))) join `Uploads` on((`Directories`.`UploadID` = `Uploads`.`UploadID`))) where (`Files`.`StudyImageID` > 0) group by `Files`.`StudyImageID`,`Uploads`.`UploadID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'Quarantine'
--
/*!50003 DROP FUNCTION IF EXISTS `getUploadIDHeuristic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` FUNCTION `getUploadIDHeuristic`(protocol_name_in VARCHAR(255)) RETURNS int(11)
BEGIN

DECLARE upload_id_out INT(11);

	SELECT U.UploadID INTO upload_id_out
	FROM ImagingRepositoryV6.StudyImages AS SI
		INNER JOIN ImagingRepositoryV6.Images AS I ON SI.ImageID = I.ImageID
		INNER JOIN ImagingRepositoryV6.ScanSessions  AS Sess ON I.ScanSessionID = Sess.ScanSessionID
		INNER JOIN ImagingRepositoryV6.Protocols AS P ON  Sess.ProtocolID = P.ProtocolID
		INNER JOIN ImagingRepositoryV6.StudySubjects as StSu ON SI.StudySubjectID = StSu.StudySubjectID 
		INNER JOIN ImagingRepositoryV6.Studies as St ON StSu.StudyID = St.StudyID
		INNER JOIN Quarantine.Uploads as U on St.StudyID = U.StudyID
	WHERE ProtocolName = protocol_name_in 
	GROUP BY St.StudyID, P.ProtocolName
	ORDER BY COUNT(*) DESC
	LIMIT 1;

	IF upload_id_out IS NULL THEN
		RETURN -1;
	ELSE
		RETURN upload_id_out;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `OBSOLETE_GETUploadID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` FUNCTION `OBSOLETE_GETUploadID`(network_name varchar(255), site_acronym varchar(255), study_name varchar(255), IN_uploaded_at datetime) RETURNS int(11)
BEGIN
	DECLARE IN_network_id, IN_site_id, IN_study_id, OUT_upload_id INT;

	SET IN_network_id:=ImagingRepositoryV6.GETNetworkID(network_name);
	SET IN_site_id:=ImagingRepositoryV6.GETSiteID(site_acronym);
	SET IN_study_id:=ImagingRepositoryV6.GETStudyID(study_name, IN_network_id);

	SELECT upload_id INTO OUT_upload_id FROM Quarantine.Uploads WHERE network_id=IN_network_id AND site_id=IN_site_id AND study_id=IN_study_id;

	IF OUT_upload_id IS NULL THEN
		INSERT INTO Quarantine.Uploads (network_id, site_id, study_id, uploaded_at) VALUES (IN_network_id, IN_site_id, IN_study_id, IN_uploaded_at);
		SELECT LAST_INSERT_ID() INTO OUT_upload_id;
	END IF;

RETURN OUT_upload_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `OBSOLETE_PUSHUploadToRepository` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `OBSOLETE_PUSHUploadToRepository`(
	varFilePath VARCHAR(1000), 
	varMD5Sum VARCHAR(255), 
	varImageType VARCHAR(255), 				#0008,0008
	varScanningSequence VARCHAR(255), 		#0018,0020
	varSequenceVariant VARCHAR(255), 		#0018,0021
	varScanOptions VARCHAR(255), 			#0018,0022
	varSOPInstanceUID VARCHAR(255), 		#0008,0018
	varSeriesInstanceUID VARCHAR(255), 		#0020,000e
	varSeriesDescription VARCHAR(255), 		#0008,103e
	varSeriesNumber VARCHAR(255), 			#0020,0011
	varStudyInstanceUID VARCHAR(255), 		#0020,000d
	varStudyDescription VARCHAR(255), 		#0008,1030
	varStudyDate VARCHAR(255), 				#0008,0020
	varPatientID VARCHAR(255), 				#0010,0020
	varMagneticFieldStrength VARCHAR(255), 	#0018,0087
	varSpaceBetweenSlices VARCHAR(255), 	#0018,0088
	varSliceThickness VARCHAR(255), 		#0018,0050
	varPixelSpacing VARCHAR(255), 			#0028,0030
	varRows VARCHAR(255), 					#0028,0010
	varColumns VARCHAR(255), 				#0028,0011
	varAcquisitionMatrix VARCHAR(255), 		#0019,1310
	varRepetitionTime VARCHAR(255), 		#0018,0080
	varEchoTime VARCHAR(255), 				#0018,0081
	varFlipAngle VARCHAR(255), 				#0018,1314
	varInterpolationType VARCHAR(255), 		#0052,0039
	varUploadID INT
) RETURNS int(11)
BEGIN
	DECLARE varFileName VARCHAR(255);
	DECLARE varFileDir VARCHAR(255);
	DECLARE varDirectoryID INT;
	DECLARE varFileID INT;
	DECLARE varFileStatus INT;
	DECLARE varPeopleID INT;
	DECLARE varNotificationID INT;
	DECLARE varUNotificationID INT;
	DECLARE varNonCompliantFlag BOOL;
	DECLARE varAllCompliantFlag BOOL DEFAULT TRUE;
	DECLARE varSubjectRegex VARCHAR(255);
	DECLARE varParameterID INT;
	DECLARE varExistingValue VARCHAR(255);
	DECLARE varCorrectedValue VARCHAR(255);
	DECLARE varStudyID INT;
	DECLARE varNetworkID INT;
	DECLARE varSiteID INT;
	DECLARE varStudySubjectID INT;
	DECLARE varSubjectID INT;
	DECLARE varRecycleFlag BOOL;
	DECLARE varScanSessionID INT;
	DECLARE varImageID INT;
	DECLARE varStudyImageID INT;
	DECLARE varModalityID INT;
	DECLARE varQCSessionID INT;
	DECLARE varQCChoiceID INT;
	DECLARE varQCAnswerID INT;
	DECLARE varTextData VARCHAR(255);

	/*NOTE: "IF TRUE THEN" blocks used for collapsibility of code and thus improved readability and organization*/
	/*RETURN VALUES:
		-1 : File is a duplicate (either by MD5 or SOPUID)
		-2 : File is from a derived image
		-3 : File parameters need correction
		>0 : StudyImageID of file image
	/*STRATEGY: 
		1) GET/SET QuarantineDirectoryID, FileName. Determine the FileStatus of a given FullPath.
			IF NULL (New)		:
				IF Duplicate by MD5 or SOPUID
					INSERT Quarantine record (FileStatus = -1)
					RETURN -1
				IF Derived
					INSERT Quarantine record (FileStatus = -2)
					RETURN -2
				ELSE
					INSERT Quarantine record (FileStatus = 0)
					Get QuarantineID
			IF 0 (Default)		:
				Get QuarantineID
			IF -1 (Duplicate)	:
				RETURN -1
			IF -2 (Derived)		:
				RETURN -2
			IF -3 (Pending)		:
				Get QuarantineID
			IF 1 (Complete)		:
				IF StudyImageID NOT NULL
					RETURN StudyImageID
				ELSE
					UPDATE Quarantine record (FileStatus = 0)
			IF NOT RETURNED
				QuarantineID ISSET
				QuarantineDirectoryID ISSET
				FileName ISSET
		2) Get/Set Upload NotificationID. Check if derived or duplicate
			IF derived		: 
				UPDATE Quarantine record (FileStatus = -2)
				RETURN -2
			IF duplicate	:
				UPDATE Quarantine record (FileStatus = -1)
				RETURN -1
			IF NOT RETURNED
				NotificationID ISSET
		3) Determine Compliance of parameters. Replacing with Corrected Values if present
			IF any Non-compliance
				UPDATE Quarantine record (FileStatus = -3)
				RETURN -3
		4) Determine SubjectID
			IF conflict		:
				UPDATE PatientID QuarantineParameter (NonCompliant = TRUE)
				UPDATE Quarantine record (FileStatus = -3)
			IF NOT RETURNED
				SubjectID ISSET
				StudySubjectID ISSET
		5) Get/Set ScanSession, Image, StudyImage
			IF NOT RETURNED
				ScanSessionID ISSET
				ImageID ISSET
				StudyImageID ISSET
		6) Get/Set QCSession. INSERT QCAnswers
			IF Modality 2, 3, 4
				INSERT QCSession record
				INSERT QCAnswer records
			UPDATE Quarantine record (FileStatus = 1, StudyImageID = StudyImageID)
			RETURN StudyImageID
	*/

	IF TRUE THEN/*1) Look up QuarantineFile by UploadID, Directory and FileName (fullpath). If match, RETURN StudyImageID or existing Error-File-Status*/
		IF TRUE THEN/*Determine Directory and FileName from varFilePath*/
			SET varFileName = SUBSTRING_INDEX(varFilePath, '/', -1);
			SET varFileDir = TRIM(TRAILING varFileName FROM varFilePath);
			SET varDirectoryID = NULL;
			SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = varUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
			IF varDirectoryID IS NULL THEN/*If a Quarantine.Directories record does not exist, INSERT it, get ID*/
				INSERT INTO Quarantine.Directories (UploadID, DirectoryPath) VALUES (varUploadID, varFileDir);
				SELECT LAST_INSERT_ID() INTO varDirectoryID;
			END IF;
		END IF;
		IF TRUE THEN/*Search for a pre-existing record in Quarantine.Files by UploadID, Directory and FileName (fullpath)*/
			SET varFileStatus = NULL;
			SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
			IF varFileStatus IS NULL THEN/*If no existing record, this is a new file. INSERT it, get ID*/
				INSERT INTO Quarantine.Files (DirectoryID, FileName, MD5Sum, SeriesUID, SOPUID, FileStatus) VALUES (varDirectoryID, varFileName, varMD5Sum, varSeriesInstanceUID, varSOPInstanceUID, 0);
				SELECT LAST_INSERT_ID() INTO varFileID;
			ELSE/*If a record exists, SWITCH based on FileStatus*/
				CASE varFileStatus
					WHEN 0 THEN/*Default Status, get QuarantineID*/
						SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					WHEN -1 THEN/*Previously determined duplicate, RETURN -1*/
						RETURN -1;
					WHEN -2 THEN/*Previously determined derived file, RETURN -2*/
						RETURN -2;
					WHEN -3 THEN/*File from a pending Series, get QuarantineID, we will be doing all of the same checks for Parameter compliance */
						SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					WHEN 1 THEN/*Previously completed file, get StudyImageID*/
						SELECT StudyImageID INTO varStudyImageID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
						IF varStudyImageID = 0 THEN/*If no StudyImageID set, reset the FileStatus to 0 and treat as a 0-FileStatus file*/
							UPDATE Quarantine.Files SET FileStatus = 0 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
							SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
						ELSE/*If StudyImageID set, RETURN it*/
							RETURN varStudyImageID;
						END IF;
				END CASE;
			END IF;
		END IF;
	END IF;
	
	IF TRUE THEN/*2) Get/Set Upload NotificationID, Check if derived. If so, RETURN -2. Check if duplicate by SOPUID. If so, RETURN -1*/
		IF TRUE THEN/*Get/Set the Upload NotificationID for this StudyUID (ScanSession)*/
			SET varUNotificationID = NULL;
			SELECT NotificationID INTO varUNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE Hub.Notifications.UploadID = varUploadID AND Hub.NotificationTypes.ItemTypeID = 1;
			IF varUNotificationID IS NULL THEN/*If no existing record for Upload Notification, INSERT it, getID*/
				INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID) VALUES (5, 1, varUploadID);
				SELECT LAST_INSERT_ID() INTO varUNotificationID;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is of derived type*/
			IF SUBSTRING_INDEX(varImageType, '\\', 1) = 'DERIVED' THEN/*If derived, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				RETURN -2;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is a duplicate by SOPUID.*/
			SET varFileStatus = NULL;
			SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE FileID <> varFileID AND SOPUID = varSOPInstanceUID AND FileStatus = 0 LIMIT 1;
			IF varFileStatus IS NOT NULL THEN/*If duplicate by SOPUID, UPDATE record (FileStatus = -1). RETURN -1*/
				UPDATE Quarantine.Files SET FileStatus = -1 WHERE FileID = varFileID;
				RETURN -1;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*3) Determine Compliance of input Parameters, INSERT INTO Quarantine.Parameters if Non-Compliant. If any Non-Compliance, RETURN -2*/
		IF TRUE THEN/*Get StudyID, SubjectRegex, PeopleID*/
			SET varStudyID = NULL;
			SELECT StudyID INTO varStudyID FROM Quarantine.Uploads WHERE UploadID = varUploadID;
			SET varSubjectRegex = NULL;
			SELECT SubjectRegex INTO varSubjectRegex FROM ImagingRepositoryV6.Studies WHERE StudyID = varStudyID;
			SET varPeopleID = NULL;
			SELECT ImagingRepositoryV6.Studies.PeopleID INTO varPeopleID FROM ImagingRepositoryV6.Studies WHERE ImagingRepositoryV6.Studies.StudyID = varStudyID;
			IF varPeopleID IS NULL THEN/*If no match, set it to an Admin ID (Mher)*/
				SET varPeopleID = 115;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of PatientID*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
			IF varSubjectRegex IS NULL OR varPatientID NOT REGEXP varSubjectRegex THEN/*If non-compliant by SubjectRegex Check*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notification.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = varUploadID AND StudyUID = varStudyUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, varUploadID, varStudyInstanceUID);
							SELECT LAST_INSERT_ID() INTO varNotificationID;
						END IF;
					END IF;
					INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (varUploadID, varStudyInstanceUID, '00100020', SHA2(varPatientID, 224), varNotificationID);
				END IF;
			ELSE/*If compliant by SubjectRegex Check*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varPatientID THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varPatientID WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingRecord = varPatientID OR varCorrectedValue <> varPatientID THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of ScanDate*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00080020';
			IF varStudyDate + INTERVAL 0 DAY IS NULL THEN/*If non-compliant format*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notification.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = varUploadID AND StudyUID = varStudyUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, varUploadID, varStudyInstanceUID);
							SELECT LAST_INSERT_ID() INTO varNotificationID;
						END IF;
					END IF;
					INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (varUploadID, varStudyInstanceUID, '00080020', varScanDate, varNotificationID);
				END IF;
			ELSE/*If compliant format*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						UPDATE Quarantine.Parameters SET CorrectedValue = varScanDate WHERE ParameterID = varParameterID;
					ELSEIF varCorrectedValue <> varScanDate THEN/*If the previous corrected value does not match the current compliant value, mark the current value as non-compliant*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of StudyDescription (ProtocolName)*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00081030';
			IF ImagingRepositoryV6.GETProtocol(varStudyDescription) = 0 THEN/*If no existing record with ProtocolName = StudyDescription*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notification.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = varUploadID AND StudyUID = varStudyUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, varUploadID, varStudyInstanceUID);
							SELECT LAST_INSERT_ID() INTO varNotificationID;
						END IF;
					END IF;
					INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (varUploadID, varStudyInstanceUID, '00081030', varStudyDescription, varNotificationID);
				END IF;
			ELSE/*If Protocol record exists*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varStudyDescription THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varStudyDescription WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingRecord = varStudyDescription OR varCorrectedValue <> varStudyDescription THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of SeriesDescription (SequenceName)*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '0008103e';
			IF ImagingRepositoryV6.GETSequence(varSeriesDescription) = 0 THEN/*If no existing record with SequenceName = SeriesDescription*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notification.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = varUploadID AND StudyUID = varStudyUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, varUploadID, varStudyInstanceUID);
							SELECT LAST_INSERT_ID() INTO varNotificationID;
						END IF;
					END IF;
					INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (varUploadID, varStudyInstanceUID, '0008103e', varSeriesDescription, varNotificationID);
				END IF;
			ELSE/*If Sequence record exists*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varSeriesDescription THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varSeriesDescription WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingRecord = varSeriesDescription OR varCorrectedValue <> varSeriesDescription THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of SeriesNumber (SequenceNumber)*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00200011';
			IF CAST(varSeriesNumber AS UNSIGNED) = 0 THEN/*If SeriesNumber does not resolve to a strictly positive integer*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notification.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = varUploadID AND StudyUID = varStudyUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, varUploadID, varStudyInstanceUID);
							SELECT LAST_INSERT_ID() INTO varNotificationID;
						END IF;
					END IF;
					INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (varUploadID, varStudyInstanceUID, '00200011', varSeriesNumber, varNotificationID);
				END IF;
			ELSE/*If SeriesNumber is an unsigned int*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						UPDATE Quarantine.Parameters SET CorrectedValue = varSeriesNumber WHERE ParameterID = varParameterID;
					ELSEIF varCorrectedValue <> varSeriesNumber THEN/*If the previous corrected value does not match the current compliant value, mark the current value as non-compliant*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*If any NonCompliant fields, change status of QuarantineFile to Pending (-3); RETURN -3*/
			IF NOT varAllCompliantFlag THEN
				UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
				RETURN -3;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*4) Determine SubjectID. INSERT if needed. If conflict, RETURN -3*/
		IF TRUE THEN/*Determine StudyID, NetworkID, SiteID*/
			SELECT NetworkID INTO varNetworkID FROM ImagingRepositoryV6.Studies WHERE StudyID = varStudyID;
			SELECT SiteID INTO varSiteID FROM Quarantine.Uploads WHERE UploadID = varUploadID;
		END IF;
		IF TRUE THEN/*Determine if conflict for Study+SubjectName+Site. If so, RETURN -3*/
			SET varStudySubjectID = NULL;
			SELECT StudySubjectID INTO varStudySubjectID
				FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID <> varSiteID;
			IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Study for a subject with a different Site, mark as NonCompliant, RETURN -3*/
				UPDATE Quarantine.Parameters SET NonCompliantFlag = TRUE WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
				UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
				UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
				RETURN -3;
			END IF;
		END IF;
		IF TRUE THEN/*Determine SubjectID, if no match, INSERT it. If conflict for Network(w/o recycling)+SubjectName+Site, RETURN -3*/
			SET varStudySubjectID = NULL;
			SELECT StudySubjectID INTO varStudySubjectID
				FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
			IF varStudySubjectID IS NULL THEN/*If no match by Study+SubjectName+Site, try to match by Network+SubjectName+Site (if recycle flag is off)*/
				SET varRecycleFlag = NULL;
				SELECT recycle_flag INTO varRecycleFlag FROM membership.network WHERE network_id = varNetworkID;
				IF varRecycleFlag THEN/*If recycling is on, then consider this a new Subject, INSERT it*/
					INSERT INTO ImagingRepositoryV6.Subjects (SiteID) VALUES (varSiteID);
					SELECT LAST_INSERT_ID() INTO varSubjectID;
					INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
					SELECT LAST_INSERT_ID() INTO varStudySubjectID;
				ELSE/*If recycling is off, then try to match by Network+SubjectName+Site*/
					SET varStudySubjectID = NULL;
					SELECT StudySubjectID INTO varStudySubjectID
						FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Studies ON ImagingRepositoryV6.StudySubjects.StudyID = ImagingRepositoryV6.Studies.StudyID LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
						WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID <> varSiteID;
					IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Network (without recycling) for a subject with a different Site, mark it as NonCompliant, RETURN -3*/
						UPDATE Quarantine.Parameters SET NonCompliantFlag = TRUE WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
						UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
						UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
						RETURN -3;
					END IF;
					SET varStudySubjectID = NULL;
					SELECT StudySubjectID INTO varStudySubjectID
						FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Studies ON ImagingRepositoryV6.StudySubjects.StudyID = ImagingRepositoryV6.Studies.StudyID LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
						WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID = varSiteID;
					IF varStudySubjectID IS NULL THEN/*If no match by Network(without recycling)+SubjectName+Site, then consider this a new Subject, INSERT it*/
						INSERT INTO ImagingRepositoryV6.Subjects (SiteID) VALUES (varSiteID);
						SELECT LAST_INSERT_ID() INTO varSubjectID;
						INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
						SELECT LAST_INSERT_ID() INTO varStudySubjectID;
					ELSE/*Get the SubjectID of the match by Network(without recycling)+SubjectName+Site*/
						SELECT SubjectID INTO varSubjectID FROM ImagingRepositoryV6.StudySubjects WHERE StudySubjectID = varStudySubjectID;
					END IF;
				END IF;
			ELSE/*Get the SubjectID of the match by Study+SubjectName+Site*/
				SELECT SubjectID INTO varSubjectID FROM ImagingRepositoryV6.StudySubjects WHERE StudySubjectID = varStudySubjectID;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*5) INSERT into ScanSessions, Images, and StudyImages*/
		SET varScanSessionID = NULL;
		SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
		IF varScanSessionID IS NULL THEN/*If no match for ScanSession, INSERT it*/
			INSERT INTO ImagingRepositoryV6.ScanSessions (ProtocolID, SubjectID, ScanDate, StudyUID) VALUES ( ImagingRepositoryV6.GETProtocol(varStudyDescription), varSubjectID, varStudyDate, varStudyInstanceUID);
			SELECT LAST_INSERT_ID() INTO varScanSessionID;
		END IF;
		SET varImageID = NULL;
		SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
		IF varImageID IS NULL THEN/*If no match for Image, INSERT it*/
			INSERT INTO ImagingRepositoryV6.Images (ScanSessionID, SequenceID, SeriesUID, SequenceNumber) VALUES (varScanSessionID,  /*ImagingRepositoryV6.GETSequence(varSeriesDescription)*/6, varSeriesInstanceUID, CAST(varSeriesNumber AS UNSIGNED));
			SELECT LAST_INSERT_ID() INTO varImageID;
		END IF;
		SET varStudyImageID = NULL;
		SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
		IF varStudyImageID IS NULL THEN/*If no match for StudyImage, INSERT it*/
			INSERT INTO ImagingRepositoryV6.StudyImages (StudySubjectID, ImageID) VALUES (varStudySubjectID, varImageID);
			SELECT LAST_INSERT_ID() INTO varStudyImageID;
		END IF;
	END IF;

	IF TRUE THEN/*6) If Anatomical/Functional/Diffusion, INSERT Into QCSessions and DICOM Parameter QCAnswers. RETURN StudyImageID*/
		IF TRUE THEN/*Determine Modality, INSERT QCSession*/
			UPDATE Quarantine.Files SET FileStatus = 1, StudyImageID = varStudyImageID WHERE FileID = varFileID;
			SET varModalityID = NULL;
			SELECT ModalityID INTO varModalityID FROM ImagingRepositoryV6.Sequences WHERE SequenceID =  /*ImagingRepositoryV6.GETSequence(varSeriesDescription)*/6;
			IF varModalityID <> 2 AND varModalityID <> 3 AND varModalityID <> 4 THEN
				RETURN varStudyImageID;
			END IF;
			SET varQCSessionID = NULL;
			SELECT QCSessionID INTO varQCSessionID FROM ImagingRepositoryV6.QCSessions WHERE StudyImageID = varStudyImageID;
			IF varQCSessionID IS NULL THEN/*If no match for QCSession, INSERT it*/
				INSERT INTO ImagingRepositoryV6.QCSessions (StudyImageID) VALUES (varStudyImageID);
				SELECT LAST_INSERT_ID() INTO varQCSessionID;
			END IF;
		END IF;
		IF TRUE THEN/*INSERT MagneticFieldStrength*/
			SET varQCChoiceID = varModalityID + 195;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varMagneticFieldStrength = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varMagneticFieldStrength;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT SpaceBetweenSlices*/
			SET varQCChoiceID = varModalityID + 198;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varSpaceBetweenSlices = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varSpaceBetweenSlices;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT SliceThickness*/
			SET varQCChoiceID = varModalityID + 201;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varSliceThickness = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varSliceThickness;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT PixelSpacing*/
			SET varQCChoiceID = varModalityID + 204;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varPixelSpacing = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varPixelSpacing;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT Rows*/
			SET varQCChoiceID = varModalityID + 207;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varRows = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varRows;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT Columns*/
			SET varQCChoiceID = varModalityID + 210;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varColumns = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varColumns;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT AcquisitionMatrix*/
			SET varQCChoiceID = varModalityID + 213;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varAcquisitionMatrix = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varAcquisitionMatrix;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT RepetitionTime*/
			SET varQCChoiceID = varModalityID + 216;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varRepetitionTime = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varRepetitionTime;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT EchoTime*/
			SET varQCChoiceID = varModalityID + 219;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varEchoTime = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varEchoTime;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT FlipAngle*/
			SET varQCChoiceID = varModalityID + 222;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varFlipAngle = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varFlipAngle;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT InterpolationType*/
			SET varQCChoiceID = varModalityID + 225;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varInterpolationType = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varInterpolationType;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT ScanningSequence*/
			SET varQCChoiceID = varModalityID + 228;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varScanningSequence = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varScanningSequence;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT SequenceVariant*/
			SET varQCChoiceID = varModalityID + 231;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varSequenceVariant = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varSequenceVariant;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT ScanOptions*/
			SET varQCChoiceID = varModalityID + 234;
			SET varQCAnswerID = NULL;
			SELECT QCAnswerID INTO varQCAnswerID FROM ImagingRepositoryV6.QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varScanOptions = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varScanOptions;
				END IF;
				INSERT INTO ImagingRepositoryV6.QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		RETURN varStudyImageID;
	END IF;

RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `OBSOLETE_pushXMLUploadToRepository` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `OBSOLETE_pushXMLUploadToRepository`(
	inFilePath VARCHAR(1000), 
	inMD5Sum VARCHAR(255), 
	inXMLPath VARCHAR(255), 
	inUploadID INT
) RETURNS int(11)
BEGIN
	DECLARE varLock INT;
	DECLARE varFileName VARCHAR(255);
	DECLARE varFileDir VARCHAR(255);
	DECLARE varDirectoryID INT;
	DECLARE varFileID INT;
	DECLARE varFileStatus INT;
	DECLARE varXML TEXT;
	DECLARE varTagCount INT;
	DECLARE varImageType VARCHAR(255);
	DECLARE varSOPInstanceUID VARCHAR(255);
	DECLARE varSeriesInstanceUID VARCHAR(255);
	DECLARE varSeriesDescription VARCHAR(255);
	DECLARE varSeriesNumber VARCHAR(255);
	DECLARE varStudyInstanceUID VARCHAR(255);
	DECLARE varStudyDescription VARCHAR(255);
	DECLARE varStudyDate VARCHAR(255);
	DECLARE varPatientID VARCHAR(255);
	DECLARE varPeopleID INT;
	DECLARE varNotificationID INT;
	DECLARE varUNotificationID INT;
	DECLARE varAllCompliantFlag BOOL DEFAULT TRUE;
	DECLARE varSubjectRegex VARCHAR(255);
	DECLARE varParameterID INT;
	DECLARE varExistingValue VARCHAR(255);
	DECLARE varCorrectedValue VARCHAR(255);
	DECLARE varStudyID INT;
	DECLARE varNetworkID INT;
	DECLARE varSiteID INT;
	DECLARE varStudySubjectID INT;
	DECLARE varSubjectID INT;
	DECLARE varRecycleFlag BOOL;
	DECLARE varUIDRoot VARCHAR(255);
	DECLARE varScannerID INT;
	DECLARE varInstitutionName VARCHAR(255);
	DECLARE varStationName VARCHAR(255);
	DECLARE varManufacturer VARCHAR(255);
	DECLARE varModelName VARCHAR(255);
	DECLARE varScanSessionID INT;
	DECLARE varImageID INT;
	DECLARE varStudyImageID INT;
	DECLARE varModalityID INT;
	DECLARE varQCSessionID INT;
	DECLARE varQCChoiceID INT;

	/*NOTE: "IF TRUE THEN" blocks used for collapsibility of code and thus improved readability and organization*/
	/*RETURN VALUES:
		0  : XML Error, required tag does not exist
		-1 : File is a duplicate (either by SOPUID)
		-2 : File is from a derived image
		-3 : File parameters need correction
		>0 : StudyImageID of file image
	/*STRATEGY: 
		1) GET/SET QuarantineDirectoryID, FileName. Determine the FileStatus of a given FullPath.
			IF NULL (New)		:
				IF Duplicate by MD5 or SOPUID
					INSERT Quarantine record (FileStatus = -1)
					RETURN -1
				IF Derived
					INSERT Quarantine record (FileStatus = -2)
					RETURN -2
				ELSE
					INSERT Quarantine record (FileStatus = 0)
					Get QuarantineID
			IF 0 (Default)		:
				Get QuarantineID
			IF -1 (Duplicate)	:
				RETURN -1
			IF -2 (Derived)		:
				RETURN -2
			IF -3 (Pending)		:
				Get QuarantineID
			IF 1 (Complete)		:
				IF StudyImageID NOT NULL
					RETURN StudyImageID
				ELSE
					UPDATE Quarantine record (FileStatus = 0)
			IF NOT RETURNED
				QuarantineID ISSET
				QuarantineDirectoryID ISSET
				FileName ISSET
		2) Get/Set Upload NotificationID. Check if derived or duplicate
			IF derived		: 
				UPDATE Quarantine record (FileStatus = -2)
				RETURN -2
			IF duplicate	:
				UPDATE Quarantine record (FileStatus = -1)
				RETURN -1
			IF NOT RETURNED
				NotificationID ISSET
		3) Determine Compliance of parameters. Replacing with Corrected Values if present
			IF any Non-compliance
				UPDATE Quarantine record (FileStatus = -3)
				RETURN -3
		4) Determine SubjectID
			IF conflict		:
				UPDATE PatientID QuarantineParameter (NonCompliant = TRUE)
				UPDATE Quarantine record (FileStatus = -3)
			IF NOT RETURNED
				SubjectID ISSET
				StudySubjectID ISSET
		5) Get/Set ScanSession, Image, StudyImage
			IF NOT RETURNED
				ScanSessionID ISSET
				ImageID ISSET
				StudyImageID ISSET
		6) Get/Set QCSession. INSERT QCAnswers
			IF Modality 2, 3, 4
				INSERT QCSession record
				INSERT QCAnswer records
			UPDATE Quarantine record (FileStatus = 1, StudyImageID = StudyImageID)
			RETURN StudyImageID
	*/

	IF TRUE THEN/*Get XML fields*/
		SET varXML = LOAD_FILE(inXMLPath);
		IF varXML IS NULL THEN
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0018"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0018"]') INTO varSOPInstanceUID;
		ELSE
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,000e"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,000e"]') INTO varSeriesInstanceUID;
		ELSE
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,103e"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,103e"]') INTO varSeriesDescription;
		ELSE
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,0011"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,0011"]') INTO varSeriesNumber;
		ELSE
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,000d"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,000d"]') INTO varStudyInstanceUID;
		ELSE
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,1030"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,1030"]') INTO varStudyDescription;
		ELSE
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0020"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0020"]') INTO varStudyDate;
		ELSE
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0010,0020"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0010,0020"]') INTO varPatientID;
		ELSE
			RETURN 0;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0008"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0008"]') INTO varImageType;
		ELSE
			RETURN 0;
		END IF;
	END IF;

	IF TRUE THEN/*1) Look up QuarantineFile by UploadID, Directory and FileName (fullpath). If match, RETURN StudyImageID or existing Error-File-Status*/
		IF TRUE THEN/*Determine Directory and FileName from inFilePath*/
			SET varFileName = SUBSTRING_INDEX(inFilePath, '/', -1);
			SET varFileDir = TRIM(TRAILING varFileName FROM inFilePath);
			SET varDirectoryID = NULL;
			SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
			IF varDirectoryID IS NULL THEN/*If a Quarantine.Directories record does not exist, INSERT it, get ID*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir0), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
					IF varDirectoryID IS NULL THEN
						INSERT INTO Quarantine.Directories (UploadID, DirectoryPath) VALUES (inUploadID, varFileDir);
						SELECT LAST_INSERT_ID() INTO varDirectoryID;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir)) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir)) INTO varLock;
					END WHILE LockLoop;
					SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Search for a pre-existing record in Quarantine.Files by UploadID, Directory and FileName (fullpath). Load XML if code hasn't RETURNed*/
			SET varFileStatus = NULL;
			SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
			IF varFileStatus IS NULL THEN/*If no existing record, this is a new file. INSERT it, get ID*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('Files:', varDirectoryID, varFileName0), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					IF varFileStatus IS NULL THEN
						INSERT INTO Quarantine.Files (DirectoryID, FileName, MD5Sum, SeriesUID, SOPUID, FileStatus) VALUES (varDirectoryID, varFileName, inMD5Sum, varSeriesInstanceUID, varSOPInstanceUID, 0);
						SELECT LAST_INSERT_ID() INTO varFileID;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('Files:', varDirectoryID, varFileName)) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('Files:', varDirectoryID, varFileName)) INTO varLock;
					END WHILE LockLoop;
					SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				END IF;
			ELSE/*If a record exists, SWITCH based on FileStatus*/
				CASE varFileStatus
					WHEN 0 THEN/*Default Status, get QuarantineID*/
						SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					WHEN -1 THEN/*Previously determined duplicate, RETURN -1*/
						RETURN -1;
					WHEN -2 THEN/*Previously determined derived file, RETURN -2*/
						RETURN -2;
					WHEN -3 THEN/*File from a pending Series, get QuarantineID, we will be doing all of the same checks for Parameter compliance */
						SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					WHEN 1 THEN/*Previously completed file, get StudyImageID*/
						SELECT StudyImageID INTO varStudyImageID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
						IF varStudyImageID = 0 THEN/*If no StudyImageID set, reset the FileStatus to 0 and treat as a 0-FileStatus file*/
							UPDATE Quarantine.Files SET FileStatus = 0 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
							SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
						ELSE/*If StudyImageID set, RETURN it*/
							RETURN varStudyImageID;
						END IF;
				END CASE;
			END IF;
		END IF;
	END IF;
	IF TRUE THEN/*2) Get/Set Upload NotificationID, Check if derived. If so, RETURN -2. Check if duplicate by SOPUID. If so, RETURN -1*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 3');
		IF TRUE THEN/*Get/Set the Upload NotificationID for this StudyUID (ScanSession)*/
			SET varUNotificationID = NULL;
			#SELECT NotificationID INTO varUNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE Hub.Notifications.UploadID = inUploadID AND Hub.NotificationTypes.ItemTypeID = 1;
			IF varUNotificationID IS NULL THEN/*If no existing record for Upload Notification, INSERT it, getID*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';1'), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT NotificationID INTO varUNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE Hub.Notifications.UploadID = inUploadID AND Hub.NotificationTypes.ItemTypeID = 1;
					IF varUNotificationID IS NULL THEN
						INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID) VALUES (5, 1, inUploadID);
						SELECT LAST_INSERT_ID() INTO varUNotificationID;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';1')) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';1')) INTO varLock;
					END WHILE LockLoop;
					SELECT NotificationID INTO varUNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE Hub.Notifications.UploadID = inUploadID AND Hub.NotificationTypes.ItemTypeID = 1;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is of derived type*/
			SELECT ModalityID INTO varModalityID FROM ImagingRepositoryV6.Sequences WHERE SequenceName = varSeriesDescription;
			IF varModalityID = 1 THEN/*If derived, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				RETURN -2;
			END IF;
			IF SUBSTRING_INDEX(varImageType, '\\', 1) = 'DERIVED' THEN/*If derived, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				RETURN -2;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is a duplicate by SOPUID.*/
			SET varFileStatus = NULL;
			SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE FileID <> varFileID AND SOPUID = varSOPInstanceUID AND FileStatus <> -1 LIMIT 1;
			IF varFileStatus IS NOT NULL THEN/*If duplicate by SOPUID, UPDATE record (FileStatus = -1). RETURN -1*/
				UPDATE Quarantine.Files SET FileStatus = -1 WHERE FileID = varFileID;
				RETURN -1;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*3) Determine Compliance of input Parameters, INSERT INTO Quarantine.Parameters if Non-Compliant. If any Non-Compliance, RETURN -2*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4');
		IF TRUE THEN/*Get StudyID, SubjectRegex, PeopleID*/
			SET varStudyID = NULL;
			SELECT StudyID INTO varStudyID FROM Quarantine.Uploads WHERE UploadID = inUploadID;
			SET varSubjectRegex = NULL;
			SELECT SubjectRegex INTO varSubjectRegex FROM ImagingRepositoryV6.Studies WHERE StudyID = varStudyID;
			SET varPeopleID = NULL;
			SELECT ImagingRepositoryV6.Studies.PeopleID INTO varPeopleID FROM ImagingRepositoryV6.Studies WHERE ImagingRepositoryV6.Studies.StudyID = varStudyID;
			IF varPeopleID IS NULL THEN/*If no match, set it to an Admin ID (Mher)*/
				SET varPeopleID = 115;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of PatientID*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
			IF varSubjectRegex IS NULL OR varPatientID NOT REGEXP varSubjectRegex THEN/*If non-compliant by SubjectRegex Check*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							SET varLock = NULL; SELECT GET_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2'), 1) INTO varLock;
							IF varLock = 1 THEN
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
								IF varNotificationID IS NULL THEN
									INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, inUploadID, varStudyInstanceUID);
									SELECT LAST_INSERT_ID() INTO varNotificationID;
								END IF;
								SELECT RELEASE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
							ELSE
								LockLoop : WHILE varLock <> 1 DO
									SELECT IS_FREE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
								END WHILE LockLoop;
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
							END IF;
						END IF;
					END IF;
					SET varLock = NULL; SELECT GET_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';00100020'), 1) INTO varLock;
					IF varLock = 1 THEN
						SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
						IF varParameterID IS NULL THEN
							INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (inUploadID, varStudyInstanceUID, '00100020', SHA2(varPatientID, 224), varNotificationID);
						END IF;
						SELECT RELEASE_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';00100020')) INTO varLock;
					END IF;
				END IF;
			ELSE/*If compliant by SubjectRegex Check*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varPatientID THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varPatientID WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingRecord = varPatientID OR varCorrectedValue <> varPatientID THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of ScanDate*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00080020';
			IF varStudyDate + INTERVAL 0 DAY IS NULL THEN/*If non-compliant format*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							SET varLock = NULL; SELECT GET_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2'), 1) INTO varLock;
							IF varLock = 1 THEN
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
								IF varNotificationID IS NULL THEN
									INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, inUploadID, varStudyInstanceUID);
									SELECT LAST_INSERT_ID() INTO varNotificationID;
								END IF;
								SELECT RELEASE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
							ELSE
								LockLoop : WHILE varLock <> 1 DO
									SELECT IS_FREE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
								END WHILE LockLoop;
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
							END IF;
						END IF;
					END IF;
					SET varLock = NULL; SELECT GET_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';00080020'), 1) INTO varLock;
					IF varLock = 1 THEN
						SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00080020';
						IF varParameterID IS NULL THEN
							INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (inUploadID, varStudyInstanceUID, '00080020', varScanDate, varNotificationID);
						END IF;
						SELECT RELEASE_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';00080020')) INTO varLock;
					END IF;
				END IF;
			ELSE/*If compliant format*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						UPDATE Quarantine.Parameters SET CorrectedValue = varScanDate WHERE ParameterID = varParameterID;
					ELSEIF varCorrectedValue <> varScanDate THEN/*If the previous corrected value does not match the current compliant value, mark the current value as non-compliant*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of StudyDescription (ProtocolName)*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00081030';
			IF ImagingRepositoryV6.GETProtocol(varStudyDescription) = 0 THEN/*If no existing record with ProtocolName = StudyDescription*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							SET varLock = NULL; SELECT GET_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2'), 1) INTO varLock;
							IF varLock = 1 THEN
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
								IF varNotificationID IS NULL THEN
									INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, inUploadID, varStudyInstanceUID);
									SELECT LAST_INSERT_ID() INTO varNotificationID;
								END IF;
								SELECT RELEASE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
							ELSE
								LockLoop : WHILE varLock <> 1 DO
									SELECT IS_FREE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
								END WHILE LockLoop;
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
							END IF;
						END IF;
					END IF;
					SET varLock = NULL; SELECT GET_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';00081030'), 1) INTO varLock;
					IF varLock = 1 THEN
						SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00081030';
						IF varParameterID IS NULL THEN
							INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (inUploadID, varStudyInstanceUID, '00081030', varStudyDescription, varNotificationID);
						END IF;
						SELECT RELEASE_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';00081030')) INTO varLock;
					END IF;
				END IF;
			ELSE/*If Protocol record exists*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varStudyDescription THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varStudyDescription WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingRecord = varStudyDescription OR varCorrectedValue <> varStudyDescription THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of SeriesDescription (SequenceName)*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '0008103e';
			IF ImagingRepositoryV6.GETSequence(varSeriesDescription) = 0 THEN/*If no existing record with SequenceName = SeriesDescription*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							SET varLock = NULL; SELECT GET_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2'), 1) INTO varLock;
							IF varLock = 1 THEN
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
								IF varNotificationID IS NULL THEN
									INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, inUploadID, varStudyInstanceUID);
									SELECT LAST_INSERT_ID() INTO varNotificationID;
								END IF;
								SELECT RELEASE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
							ELSE
								LockLoop : WHILE varLock <> 1 DO
									SELECT IS_FREE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
								END WHILE LockLoop;
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
							END IF;
						END IF;
					END IF;
					SET varLock = NULL; SELECT GET_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';0008103e'), 1) INTO varLock;
					IF varLock = 1 THEN
						SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '0008103e';
						IF varParameterID IS NULL THEN
							INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (inUploadID, varStudyInstanceUID, '0008103e', varSeriesDescription, varNotificationID);
						END IF;
						SELECT RELEASE_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';0008103e')) INTO varLock;
					END IF;
				END IF;
			ELSE/*If Sequence record exists*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varSeriesDescription THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varSeriesDescription WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingRecord = varSeriesDescription OR varCorrectedValue <> varSeriesDescription THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of SeriesNumber (SequenceNumber)*/
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00200011';
			IF CAST(varSeriesNumber AS UNSIGNED) = 0 THEN/*If SeriesNumber does not resolve to a strictly positive integer*/
				SET varAllCompliantFlag = FALSE;
				IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
					IF varNotificationID IS NULL THEN/*If a NotificationID has not been already gotten, get it*/
						SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
						IF varNotificationID IS NULL THEN/*If a Notification record does not exist, INSERT it, get ID*/
							SET varLock = NULL; SELECT GET_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2'), 1) INTO varLock;
							IF varLock = 1 THEN
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
								IF varNotificationID IS NULL THEN
									INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID, UploadID, StudyUID) VALUES (varPeopleID, 2, inUploadID, varStudyInstanceUID);
									SELECT LAST_INSERT_ID() INTO varNotificationID;
								END IF;
								SELECT RELEASE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
							ELSE
								LockLoop : WHILE varLock <> 1 DO
									SELECT IS_FREE_LOCK(CONCAT('Notifications:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';2')) INTO varLock;
								END WHILE LockLoop;
								SELECT NotificationID INTO varNotificationID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND Hub.NotificationTypes.ItemTypeID = 2;
							END IF;
						END IF;
					END IF;
					SET varLock = NULL; SELECT GET_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';00200011'), 1) INTO varLock;
					IF varLock = 1 THEN
						SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00200011';
						IF varParameterID IS NULL THEN
							INSERT INTO Quarantine.Parameters (UploadID, StudyUID, DataKey, DataValue, NotificationID) VALUES (inUploadID, varStudyInstanceUID, '00200011', varSeriesNumber, varNotificationID);
						END IF;
						SELECT RELEASE_LOCK(CONCAT('Parameters:', CAST(inUploadID AS CHAR), ';', varStudyInstanceUID, ';00200011')) INTO varLock;
					END IF;
				END IF;
			ELSE/*If SeriesNumber is an unsigned int*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						UPDATE Quarantine.Parameters SET CorrectedValue = varSeriesNumber WHERE ParameterID = varParameterID;
					ELSEIF varCorrectedValue <> varSeriesNumber THEN/*If the previous corrected value does not match the current compliant value, mark the current value as non-compliant*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*If any NonCompliant fields, change status of QuarantineFile to Pending (-3); RETURN -3*/
			IF NOT varAllCompliantFlag THEN
				UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
				RETURN -3;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*4) Determine SubjectID. INSERT if needed. If conflict, RETURN -3*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5');
		IF TRUE THEN/*Determine StudyID, NetworkID, SiteID*/
			SELECT NetworkID INTO varNetworkID FROM ImagingRepositoryV6.Studies WHERE StudyID = varStudyID;
			SELECT SiteID INTO varSiteID FROM Quarantine.Uploads WHERE UploadID = inUploadID;
		END IF;
		IF TRUE THEN/*Determine if conflict for Study+SubjectName+Site. If so, RETURN -3*/
			SET varStudySubjectID = NULL;
			SELECT StudySubjectID INTO varStudySubjectID
				FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID <> varSiteID;
			IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Study for a subject with a different Site, mark as NonCompliant, RETURN -3*/
				UPDATE Quarantine.Parameters SET NonCompliantFlag = TRUE WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
				UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
				UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
				RETURN -3;
			END IF;
		END IF;
		IF TRUE THEN/*Determine SubjectID, if no match, INSERT it. If conflict for Network(w/o recycling)+SubjectName+Site, RETURN -3*/
			SET varStudySubjectID = NULL;
			SELECT StudySubjectID INTO varStudySubjectID
				FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
			IF varStudySubjectID IS NULL THEN/*If no match by Study+SubjectName+Site, try to match by Network+SubjectName+Site (if recycle flag is off)*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR)), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT StudySubjectID INTO varStudySubjectID
						FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
						WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
					IF varStudySubjectID IS NULL THEN
						SET varRecycleFlag = NULL;
						SELECT recycle_flag INTO varRecycleFlag FROM membership.network WHERE network_id = varNetworkID;
						IF varRecycleFlag THEN/*If recycling is on, then consider this a new Subject, INSERT it*/
							INSERT INTO ImagingRepositoryV6.Subjects (SiteID) VALUES (varSiteID);
							SELECT LAST_INSERT_ID() INTO varSubjectID;
							INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
							SELECT LAST_INSERT_ID() INTO varStudySubjectID;
						ELSE/*If recycling is off, then try to match by Network+SubjectName+Site*/
							SET varStudySubjectID = NULL;
							SELECT StudySubjectID INTO varStudySubjectID
								FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Studies ON ImagingRepositoryV6.StudySubjects.StudyID = ImagingRepositoryV6.Studies.StudyID LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
								WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID <> varSiteID;
							IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Network (without recycling) for a subject with a different Site, mark it as NonCompliant, RETURN -3*/
								UPDATE Quarantine.Parameters SET NonCompliantFlag = TRUE WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
								UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
								UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
								RETURN -3;
							END IF;
							SET varStudySubjectID = NULL;
							SELECT StudySubjectID INTO varStudySubjectID
								FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Studies ON ImagingRepositoryV6.StudySubjects.StudyID = ImagingRepositoryV6.Studies.StudyID LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
								WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID = varSiteID;
							IF varStudySubjectID IS NULL THEN/*If no match by Network(without recycling)+SubjectName+Site, then consider this a new Subject, INSERT it*/
								INSERT INTO ImagingRepositoryV6.Subjects (SiteID) VALUES (varSiteID);
								SELECT LAST_INSERT_ID() INTO varSubjectID;
								INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
								SELECT LAST_INSERT_ID() INTO varStudySubjectID;
							ELSE/*Get the SubjectID of the match by Network(without recycling)+SubjectName+Site*/
								SELECT SubjectID INTO varSubjectID FROM ImagingRepositoryV6.StudySubjects WHERE StudySubjectID = varStudySubjectID;
							END IF;
						END IF;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR))) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR))) INTO varLock;
					END WHILE LockLoop;
					SELECT StudySubjectID INTO varStudySubjectID
						FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
						WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
				END IF;
			ELSE/*Get the SubjectID of the match by Study+SubjectName+Site*/
				SELECT SubjectID INTO varSubjectID FROM ImagingRepositoryV6.StudySubjects WHERE StudySubjectID = varStudySubjectID;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*5) INSERT into ScanSessions, Images, and StudyImages*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 6');
		SET varUIDRoot = SUBSTRING_INDEX(varSOPInstanceUID, '.', 9);
		SET varScannerID = NULL;
		SELECT ScannerID INTO varScannerID FROM ImagingRepositoryV6.Scanners WHERE UIDRoot = varUIDRoot;
		IF varScannerID IS NULL THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0080"]') INTO varInstitutionName;
			SELECT ExtractValue(varXML, '//element[@tag="0008,1010"]') INTO varStationName;
			SELECT ExtractValue(varXML, '//element[@tag="0008,0070"]') INTO varManufacturer;
			SELECT ExtractValue(varXML, '//element[@tag="0008,1090"]') INTO varModelName;
			INSERT INTO ImagingRepositoryV6.Scanners (UIDRoot, InstitutionName, StationName, Manufacturer, ModelName) VALUES (varUIDRoot, varInstitutionName, varStationName, varManufacturer, varModelname);
			SELECT LAST_INSERT_ID() INTO varScannerID;
		END IF;
		SET varScanSessionID = NULL;
		SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
		IF varScanSessionID IS NULL THEN/*If no match for ScanSession, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID0), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
				IF varScanSessionID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.ScanSessions (ProtocolID, SubjectID, ScanDate, StudyUID, ScannerID) VALUES ( ImagingRepositoryV6.GETProtocol(varStudyDescription), varSubjectID, varStudyDate, varStudyInstanceUID, varScannerID);
					SELECT LAST_INSERT_ID() INTO varScanSessionID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID)) INTO varLock;
			ELSE
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID)) INTO varLock;
				END WHILE LockLoop;
				SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
			END IF;
		END IF;
		SET varImageID = NULL;
		SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
		IF varImageID IS NULL THEN/*If no match for Image, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('Images:', varSeriesInstanceUID0), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
				IF varImageID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.Images (ScanSessionID, SequenceID, SeriesUID, SequenceNumber) VALUES (varScanSessionID,  ImagingRepositoryV6.GETSequence(varSeriesDescription), varSeriesInstanceUID, CAST(varSeriesNumber AS UNSIGNED));
					SELECT LAST_INSERT_ID() INTO varImageID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('Images:', varSeriesInstanceUID)) INTO varLock;
			ELSE
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('Images:', varSeriesInstanceUID)) INTO varLock;
				END WHILE LockLoop;
				SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
			END IF;
		END IF;
		SET varStudyImageID = NULL;
		SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
		IF varStudyImageID IS NULL THEN/*If no match for StudyImage, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR)), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
				IF varStudyImageID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.StudyImages (StudySubjectID, ImageID) VALUES (varStudySubjectID, varImageID);
					SELECT LAST_INSERT_ID() INTO varStudyImageID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR))) INTO varLock;
			ELSE	
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR))) INTO varLock;
				END WHILE LockLoop;
				SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
			END IF;
		END IF;
		UPDATE Quarantine.Files SET FileStatus = 1, StudyImageID = varStudyImageID WHERE FileID = varFileID;
	END IF;

	IF TRUE THEN/*6) If Anatomical/Functional/Diffusion/SpinLabel, INSERT Into QCSessions, call putQCAnswersFromXML. RETURN StudyImageID*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 7');
		IF TRUE THEN/*Determine Modality, INSERT QCSession*/
			SET varModalityID = NULL;
			SELECT ModalityID INTO varModalityID FROM ImagingRepositoryV6.Sequences WHERE SequenceID = ImagingRepositoryV6.GETSequence(varSeriesDescription);
			IF varModalityID < 2 OR varModalityID > 5 THEN
				RETURN varStudyImageID;
			END IF;
			SET varQCSessionID = NULL;
			SELECT QCSessionID INTO varQCSessionID FROM ImagingRepositoryV6.QCSessions WHERE StudyImageID = varStudyImageID;
			IF varQCSessionID IS NULL THEN/*If no match for QCSession, INSERT it*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('QCSessions:', CAST(varStudyImageID AS CHAR)), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT QCSessionID INTO varQCSessionID FROM ImagingRepositoryV6.QCSessions WHERE StudyImageID = varStudyImageID;
					IF varQCSessionID IS NULL THEN
						INSERT INTO ImagingRepositoryV6.QCSessions (StudyImageID) VALUES (varStudyImageID);
						SELECT LAST_INSERT_ID() INTO varQCSessionID;
						SELECT ImagingRepositoryV6.putQCAnswersFromXML(varStudyImageID, inXMLPath) INTO varQCChoiceID;
					END IF;
				END IF;
			END IF;
		END IF;
		RETURN varStudyImageID;
	END IF;

RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `putParameter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `putParameter`(inUploadID INT, inSeriesUID VARCHAR(255), inStudyUID VARCHAR(255), inDataKey VARCHAR(8), inDataValue VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE varParameterID INT;
	DECLARE varLock BOOL;
	DECLARE varIdentifier VARCHAR(1000);

	IF inSeriesUID IS NULL THEN
		SET varIdentifier = CONCAT(CAST(inUploadID AS CHAR), ';', inStudyUID);
	ELSE
		SET varIdentifier = CONCAT(CAST(inUploadID AS CHAR), ';', inStudyUID, ';', inSeriesUID);
	END IF;

	IF DataKey = '00100020' THEN
		SET inDataValue = SHA2(inDataValue, 224);
	END IF;

	SELECT ParameterID INTO varParameterID 
	FROM Quarantine.Parameters 
	WHERE
		UploadID = inUploadID
		AND SeriesUID = inSeriesUID
		AND StudyUID = inStudyUID
		AND DataKey = inDataKey;

	IF varParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
		SET varLock = NULL; 
		SELECT GET_LOCK(CONCAT('Parameters:', varIdentifier, ';', inDataKey), 1) INTO varLock;
		IF varLock = 1 THEN
			SELECT ParameterID INTO varParameterID 
			FROM Quarantine.Parameters 
			WHERE
				UploadID = inUploadID
				AND SeriesUID = inSeriesUID
				AND StudyUID = inStudyUID
				AND DataKey = inDataKey;
			IF varParameterID IS NULL THEN
				INSERT INTO Quarantine.Parameters (UploadID, SeriesUID, StudyUID, DataKey, DataValue) VALUES (inUploadID, inSeriesUID, inStudyUID, inDataKey, inDataValue);
				SELECT LAST_INSERT_ID() INTO varParameterID;
			END IF;
			SELECT RELEASE_LOCK(CONCAT('Parameters:', varIdentifier, ';', inDataKey)) INTO varLock;
		ELSE
			LockLoop : WHILE varLock <> 1 DO
				SELECT IS_FREE_LOCK(CONCAT('Parameters:', varIdentifier, ';', inDataKey)) INTO varLock;
			END WHILE LockLoop;
			SELECT ParameterID INTO varParameterID 
			FROM Quarantine.Parameters 
			WHERE
				UploadID = inUploadID
				AND SeriesUID = inSeriesUID
				AND StudyUID = inStudyUID
				AND DataKey = inDataKey;
		END IF;
	END IF;

	RETURN varParameterID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TEST_testXML` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` FUNCTION `TEST_testXML`(inXMLPath VARCHAR(255)) RETURNS char(8) CHARSET latin1
BEGIN
	DECLARE xml TEXT;
	DECLARE outStudyDate CHAR(8);
	DECLARE varElement VARCHAR(50);

	SET varElement = "StudyDate";
	SET @xml = LOAD_FILE(inXMLPath);
	SELECT ExtractValue(@xml,CONCAT('//element[@name="StudyDate"]/node()')) INTO outStudyDate;
	RETURN outStudyDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNetworkID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` PROCEDURE `getNetworkID`(inUploadID INT(11))
Main : BEGIN

DECLARE outNetworkID INT;

	SELECT NetworkID into outNetworkID FROM Uploads WHERE UploadID = inUploadID;
    
    IF outNetworkID IS NULL THEN
		SELECT -1; LEAVE Main;
	ELSE
		SELECT outNetworkID; LEAVE Main;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNewSequences` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getNewSequences`()
BEGIN

SELECT DISTINCT Directories.UploadID, DirectoryPath, DataKey, DataValue, PendingValue
FROM 
	Quarantine.Files
	LEFT JOIN Quarantine.Directories ON Files.DirectoryID = Directories.DirectoryID
	INNER JOIN Quarantine.Parameters ON Files.SeriesUID = Parameters.SeriesUID AND Directories.UploadID = Parameters.UploadID
WHERE Parameters.DataKey = '0008103e' AND Files.FileStatus = -3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSubjectRewrites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getSubjectRewrites`()
BEGIN

SELECT Directories.UploadID, DirectoryPath, FileName, DataKey, DataValue
FROM 
	Quarantine.Files
	LEFT JOIN Quarantine.Directories ON Files.DirectoryID = Directories.DirectoryID
	INNER JOIN Quarantine.Parameters ON Files.StudyUID = Parameters.StudyUID AND Directories.UploadID = Parameters.UploadID
WHERE Parameters.DataKey = '00100020' AND Files.FileStatus = -3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pollUploads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` PROCEDURE `pollUploads`()
BEGIN
DECLARE outUploadID INT;

	SELECT Uploads.UploadID INTO outUploadID
    FROM Quarantine.Uploads 
    WHERE UploadID > 164
		AND NOT EXISTS (SELECT Directories.DirectoryID FROM Quarantine.Directories WHERE Directories.UploadID = Uploads.UploadID LIMIT 1)
	ORDER BY Uploads.UploadID ASC
	LIMIT 1;

	IF outUploadID IS NULL THEN
		SELECT -1;
	ELSE
		SELECT outUploadID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_load` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` PROCEDURE `proc_load`(
	IN inFilePath VARCHAR(1000), 
	IN inMD5Sum VARCHAR(255), 
	IN inXMLPath VARCHAR(255), 
	IN inUploadID INT
)
Main : BEGIN
	DECLARE varLock INT;
	DECLARE varFileName VARCHAR(255);
	DECLARE varFileDir VARCHAR(255);
	DECLARE varDirectoryID INT;
	DECLARE varFileID INT;
	DECLARE varFileStatus INT;
	DECLARE varXML LONGTEXT;
	DECLARE varTagCount INT;
	DECLARE varImageType VARCHAR(255);
	DECLARE varSOPInstanceUID VARCHAR(255);
	DECLARE varSeriesInstanceUID VARCHAR(255);
	DECLARE varSeriesDescription VARCHAR(255);
	DECLARE varSeriesNumber VARCHAR(255);
	DECLARE varStudyInstanceUID VARCHAR(255);
	DECLARE varStudyDescription VARCHAR(255);
	DECLARE varStudyDate VARCHAR(255);
	DECLARE varPatientID VARCHAR(255);
	DECLARE varPatientName VARCHAR(255);
	DECLARE varPeopleID INT;
	DECLARE varAllCompliantFlag BOOL DEFAULT TRUE;
	DECLARE varSubjectRegex VARCHAR(255);
	DECLARE varParameterID INT;
	DECLARE varExistingValue VARCHAR(255);
	DECLARE varCorrectedValue VARCHAR(255);
	DECLARE varStudyID INT;
	DECLARE varNetworkID INT;
	DECLARE varSiteID INT;
	DECLARE varStudySubjectID INT;
	DECLARE varSubjectID INT;
	DECLARE varRecycleFlag BOOL;
	DECLARE varUIDRoot VARCHAR(255);
	DECLARE varScannerID INT;
	DECLARE varInstitutionName VARCHAR(255);
	DECLARE varStationName VARCHAR(255);
	DECLARE varManufacturer VARCHAR(255);
	DECLARE varModelName VARCHAR(255);
	DECLARE varScanSessionID INT;
	DECLARE varImageID INT;
	DECLARE varStudyImageID INT;
	DECLARE varModalityID INT;
	DECLARE varQCSessionID INT;
	DECLARE varQCChoiceID INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
SELECT @full_error;
END;

	/*NOTE: "IF TRUE THEN" blocks used for collapsibility of code and thus improved readability and organization*/
	/*RETURN VALUES:
		0  : XML Error, required tag does not exist
		-1 : File is a duplicate (either by SOPUID)
		-2 : File is from a derived image
		-3 : File parameters need correction
		>0 : StudyImageID of file image
	/*STRATEGY: 
		1) GET/SET QuarantineDirectoryID, FileName. Determine the FileStatus of a given FullPath.
			IF NULL (New)		:
				IF Duplicate by MD5 or SOPUID
					INSERT Quarantine record (FileStatus = -1)
					RETURN -1
				IF Derived
					INSERT Quarantine record (FileStatus = -2)
					RETURN -2
				ELSE
					INSERT Quarantine record (FileStatus = 0)
					Get QuarantineID
			IF 0 (Default)		:
				Get QuarantineID
			IF -1 (Duplicate)	:
				RETURN -1
			IF -2 (Derived)		:
				RETURN -2
			IF -3 (Pending)		:
				Get QuarantineID
			IF 1 (Complete)		:
				IF StudyImageID NOT NULL
					RETURN StudyImageID
				ELSE
					UPDATE Quarantine record (FileStatus = 0)
			IF NOT RETURNED
				QuarantineID ISSET
				QuarantineDirectoryID ISSET
				FileName ISSET
		2) Get/Set Upload NotificationID. Check if derived or duplicate
			IF derived		: 
				UPDATE Quarantine record (FileStatus = -2)
				RETURN -2
			IF duplicate	:
				UPDATE Quarantine record (FileStatus = -1)
				RETURN -1
			IF NOT RETURNED
				NotificationID ISSET
		3) Determine Compliance of parameters. Replacing with Corrected Values if present
			IF any Non-compliance
				UPDATE Quarantine record (FileStatus = -3)
				RETURN -3
		4) Determine SubjectID
			IF conflict		:
				UPDATE PatientID QuarantineParameter (NonCompliant = TRUE)
				UPDATE Quarantine record (FileStatus = -3)
			IF NOT RETURNED
				SubjectID ISSET
				StudySubjectID ISSET
		5) Get/Set ScanSession, Image, StudyImage
			IF NOT RETURNED
				ScanSessionID ISSET
				ImageID ISSET
				StudyImageID ISSET
		6) Get/Set QCSession. INSERT QCAnswers
			IF Modality 2, 3, 4
				INSERT QCSession record
				INSERT QCAnswer records
			UPDATE Quarantine record (FileStatus = 1, StudyImageID = StudyImageID)
			RETURN StudyImageID
	*/

	IF TRUE THEN/*Get XML fields*/
		SET varXML = LOAD_FILE(inXMLPath);
		IF varXML IS NULL THEN
			SELECT 0; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0018"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0018"]') INTO varSOPInstanceUID;
		ELSE
			SELECT -10; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,000e"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,000e"]') INTO varSeriesInstanceUID;
		ELSE
			SELECT -20; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,103e"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,103e"]') INTO varSeriesDescription;
		ELSE
			SELECT -30; LEAVE Main;
		END IF;
		SET varTagCount = NULL;
		SELECT COUNT(ParameterID) INTO varTagCount
		FROM Quarantine.Parameters
		WHERE
			SeriesUID = varSeriesInstanceUID
			AND UploadID = inUploadID
			AND DataKey = '0008103e'
			AND PendingValue IS NOT NULL;
		IF varTagCount = 1 THEN
			SELECT PendingValue INTO varStudyDate
			FROM Quarantine.Parameters
			WHERE
				SeriesUID = varSeriesInstanceUID
				AND UploadID = inUploadID
				AND DataKey = '0008103e'
				AND PendingValue IS NOT NULL;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,0011"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,0011"]') INTO varSeriesNumber;
		ELSE
			SELECT -40; LEAVE Main;
		END IF;
		SET varTagCount = NULL;
		SELECT COUNT(ParameterID) INTO varTagCount
		FROM Quarantine.Parameters
		WHERE
			SeriesUID = varSeriesInstanceUID
			AND UploadID = inUploadID
			AND DataKey = '00200011'
			AND PendingValue IS NOT NULL;
		IF varTagCount = 1 THEN
			SELECT PendingValue INTO varStudyDate
			FROM Quarantine.Parameters
			WHERE
				SeriesUID = varSeriesInstanceUID
				AND UploadID = inUploadID
				AND DataKey = '00200011'
				AND PendingValue IS NOT NULL;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,000d"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,000d"]') INTO varStudyInstanceUID;
		ELSE
			SELECT -50; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,1030"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,1030"]') INTO varStudyDescription;
		ELSE
			SELECT ExtractValue(varXML, 'count(//element[@tag="0018,1030"])') INTO varTagCount;
			IF varTagCount = 1 THEN
				SELECT ExtractValue(varXML, '//element[@tag="0018,1030"]') INTO varStudyDescription;
			ELSE
				SELECT -60; LEAVE Main;
			END IF;
		END IF;
		SET varTagCount = NULL;
		SELECT COUNT(ParameterID) INTO varTagCount
		FROM Quarantine.Parameters
		WHERE
			StudyUID = varStudyInstanceUID
			AND UploadID = inUploadID
			AND DataKey = '00081030'
			AND PendingValue IS NOT NULL;
		IF varTagCount = 1 THEN
			SELECT PendingValue INTO varStudyDate
			FROM Quarantine.Parameters
			WHERE
				StudyUID = varStudyInstanceUID
				AND UploadID = inUploadID
				AND DataKey = '00081030'
				AND PendingValue IS NOT NULL;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0020"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0020"]') INTO varStudyDate;
		ELSE
			SELECT -70; LEAVE Main;
		END IF;
		SET varTagCount = NULL;
		SELECT COUNT(ParameterID) INTO varTagCount
		FROM Quarantine.Parameters
		WHERE
			StudyUID = varStudyInstanceUID
			AND UploadID = inUploadID
			AND DataKey = '00080020'
			AND PendingValue IS NOT NULL;
		IF varTagCount = 1 THEN
			SELECT PendingValue INTO varStudyDate
			FROM Quarantine.Parameters
			WHERE
				StudyUID = varStudyInstanceUID
				AND UploadID = inUploadID
				AND DataKey = '00080020'
				AND PendingValue IS NOT NULL;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0010,0010"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0010,0010"]') INTO varPatientName;
		ELSE
			SELECT -80; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0010,0020"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0010,0020"]') INTO varPatientID;
		ELSE
			SELECT -80; LEAVE Main;
		END IF;
		IF varPatientName != varPatientID THEN
			SELECT -85; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0008"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0008"]') INTO varImageType;
		ELSE
			SELECT -90; LEAVE Main;
		END IF;
	END IF;

	IF TRUE THEN/*1) Look up QuarantineFile by UploadID, Directory and FileName (fullpath). If match, RETURN StudyImageID or existing Error-File-Status*/
		IF TRUE THEN/*Determine Directory and FileName from inFilePath*/
			SET varFileName = SUBSTRING_INDEX(inFilePath, '/', -1);
			SET varFileDir = TRIM(TRAILING varFileName FROM inFilePath);
			SET varDirectoryID = NULL;
			SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
			IF varDirectoryID IS NULL THEN/*If a Quarantine.Directories record does not exist, INSERT it, get ID*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
					IF varDirectoryID IS NULL THEN
						INSERT INTO Quarantine.Directories (UploadID, DirectoryPath) VALUES (inUploadID, varFileDir);
						SELECT LAST_INSERT_ID() INTO varDirectoryID;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir)) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir)) INTO varLock;
					END WHILE LockLoop;
					SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Search for a pre-existing record in Quarantine.Files by UploadID, Directory and FileName (fullpath). Load XML if code hasn't RETURNed*/
			SET varFileStatus = NULL;
			SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
			IF varFileStatus IS NULL THEN/*If no existing record, this is a new file. INSERT it, get ID*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('Files:', varDirectoryID, varFileName), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					IF varFileStatus IS NULL THEN
						INSERT INTO Quarantine.Files (DirectoryID, FileName, MD5Sum, StudyUID, SeriesUID, SOPUID, FileStatus) VALUES (varDirectoryID, varFileName, inMD5Sum, varStudyInstanceUID, varSeriesInstanceUID, varSOPInstanceUID, 0);
						SELECT LAST_INSERT_ID() INTO varFileID;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('Files:', varDirectoryID, varFileName)) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('Files:', varDirectoryID, varFileName)) INTO varLock;
					END WHILE LockLoop;
					SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				END IF;
			ELSE/*If a record exists, SWITCH based on FileStatus*/
				CASE varFileStatus
					WHEN 0 THEN/*Default Status, get QuarantineID*/
						SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					WHEN -1 THEN/*Previously determined duplicate, RETURN -1*/
						INSERT INTO Quarantine.DebugLog (Message) VALUES (CONCAT('Error 1: ', CAST(varDirectoryID AS CHAR), ';', varFileName));
						SELECT -1; LEAVE Main;
					WHEN -2 THEN/*Previously determined derived file, RETURN -2*/
						INSERT INTO Quarantine.DebugLog (Message) VALUES ('Error 2');
						SELECT -1; LEAVE Main;
					WHEN -3 THEN/*File from a pending Series, get QuarantineID, we will be doing all of the same checks for Parameter compliance */
						SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					WHEN 1 THEN/*Previously completed file, get StudyImageID*/
						SELECT StudyImageID INTO varStudyImageID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
						IF varStudyImageID = 0 THEN/*If no StudyImageID set, reset the FileStatus to 0 and treat as a 0-FileStatus file*/
							UPDATE Quarantine.Files SET FileStatus = 0 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
							SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
						ELSE/*If StudyImageID set, RETURN it*/
							SELECT varStudyImageID; LEAVE Main;
						END IF;
				END CASE;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*2) Check if derived. If so, RETURN -2. Check if duplicate by SOPUID. If so, RETURN -1*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 3');
		IF TRUE THEN/*Determine if the file is of derived type*/
			SELECT ModalityID INTO varModalityID FROM ImagingRepositoryV6.Sequences WHERE SequenceName = varSeriesDescription;
			IF varModalityID = 1 THEN/*If derived, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				SELECT -2; LEAVE Main;
			END IF;
			ELSE IF varModalityID = 6 THEN/*If other, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				SELECT -2; LEAVE Main;
			END IF;
			IF SUBSTRING_INDEX(varImageType, '\\', 1) = 'DERIVED' THEN/*If derived, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				SELECT -2; LEAVE Main;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is a duplicate by SOPUID.*/
			SET varFileStatus = NULL;
			SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE FileID <> varFileID AND SOPUID = varSOPInstanceUID AND FileStatus <> -1 LIMIT 1;
			IF varFileStatus IS NOT NULL THEN/*If duplicate by SOPUID, UPDATE record (FileStatus = -1). RETURN -1*/
				UPDATE Quarantine.Files SET FileStatus = -1 WHERE FileID = varFileID;
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Error 3');
				SELECT -1; LEAVE Main;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*3) Determine Compliance of input Parameters, INSERT INTO Quarantine.Parameters if Non-Compliant. If any Non-Compliance, RETURN -2*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4');
		IF TRUE THEN/*Get StudyID, SubjectRegex, PeopleID*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.1');
			SET varStudyID = NULL;
			SELECT StudyID INTO varStudyID FROM Quarantine.Uploads WHERE UploadID = inUploadID;
			SET varSubjectRegex = NULL;
			SELECT SubjectRegex INTO varSubjectRegex FROM ImagingRepositoryV6.Studies WHERE StudyID = varStudyID;
			SET varPeopleID = NULL;
			SELECT ImagingRepositoryV6.Studies.PeopleID INTO varPeopleID FROM ImagingRepositoryV6.Studies WHERE ImagingRepositoryV6.Studies.StudyID = varStudyID;
			IF varPeopleID IS NULL THEN/*If no match, set it to an Admin ID (Mher)*/
				SET varPeopleID = 115;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of PatientID*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2');
			SET varParameterID = NULL;
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.1');
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.2');
			IF varSubjectRegex IS NULL OR varPatientID NOT REGEXP BINARY varSubjectRegex THEN/*If non-compliant by SubjectRegex Check*/
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.3');
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, NULL, varStudyInstanceUID, '00100020', varPatientID, varParameterID);
			ELSE/*If compliant by SubjectRegex Check*/
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.4');
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.5');
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varPatientID THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varPatientID WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingValue = varPatientID OR varCorrectedValue <> varPatientID THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse logic in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
					#Alternatively:
					#ELSEIF varCorrectedValue = varPatientID AND varExistingValue <> varPatientID THEN DO NOTHING!
					#ELSE SET varAllCompliantFlag = FALSE;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of ScanDate*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.3');
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00080020';
			IF varStudyDate + INTERVAL 0 DAY IS NULL THEN/*If non-compliant format*/
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, NULL, varStudyInstanceUID, '00080020', varScanDate, varParameterID);
			ELSE/*If compliant format*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						UPDATE Quarantine.Parameters SET CorrectedValue = varScanDate WHERE ParameterID = varParameterID;
					ELSEIF varCorrectedValue <> varScanDate THEN/*If the previous corrected value does not match the current compliant value, mark the current value as non-compliant*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of StudyDescription (ProtocolName)*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.4');
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00081030';
			IF ImagingRepositoryV6.GETProtocol(varStudyDescription) = 0 THEN/*If no existing record with ProtocolName = StudyDescription*/
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, NULL, varStudyInstanceUID, '00081030', varStudyDescription, varParameterID);
			ELSE/*If Protocol record exists*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varStudyDescription THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varStudyDescription WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingValue = varStudyDescription OR varCorrectedValue <> varStudyDescription THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of SeriesDescription (SequenceName)*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.5');
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID = varSeriesInstanceUID AND DataKey = '0008103e';
			IF ImagingRepositoryV6.GETSequence(varSeriesDescription) = 0 THEN/*If no existing record with SequenceName = SeriesDescription*/
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, varSeriesInstanceUID, varStudyInstanceUID, '0008103e', varSeriesDescription, varParameterID);
			ELSE/*If Sequence record exists*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varSeriesDescription THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varSeriesDescription WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingValue = varSeriesDescription OR varCorrectedValue <> varSeriesDescription THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of SeriesNumber (SequenceNumber)*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.6');
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID = varSeriesInstanceUID AND DataKey = '00200011';
			IF CAST(varSeriesNumber AS UNSIGNED) = 0 THEN/*If SeriesNumber does not resolve to a strictly positive integer*/
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, varSeriesInstanceUID, varStudyInstanceUID, '00200011', varSeriesNumber, varParameterID);
			ELSE/*If SeriesNumber is an unsigned int*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						UPDATE Quarantine.Parameters SET CorrectedValue = varSeriesNumber WHERE ParameterID = varParameterID;
					ELSEIF varCorrectedValue <> varSeriesNumber THEN/*If the previous corrected value does not match the current compliant value, mark the current value as non-compliant*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*If any NonCompliant fields, change status of QuarantineFile to Pending (-3); RETURN -3*/
			IF NOT varAllCompliantFlag THEN
				UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
				SELECT -3; LEAVE Main;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*4) Determine SubjectID. INSERT if needed. If conflict, RETURN -3*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5');
		IF TRUE THEN/*Determine StudyID, NetworkID, SiteID*/
			SELECT NetworkID INTO varNetworkID FROM ImagingRepositoryV6.Studies WHERE StudyID = varStudyID;
			SELECT SiteID INTO varSiteID FROM Quarantine.Uploads WHERE UploadID = inUploadID;
		END IF;
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.1');
		IF TRUE THEN/*Determine if conflict for Study+SubjectName+Site. If so, RETURN -3*/
			SET varStudySubjectID = NULL;
			SELECT StudySubjectID INTO varStudySubjectID
				FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID <> varSiteID;
			IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Study for a subject with a different Site, mark as NonCompliant, RETURN -3*/
				#UPDATE Quarantine.Parameters SET NonCompliantFlag = TRUE WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
				#UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
				CALL putParameter(inUploadID, NULL, varStudyInstanceUID, 'gg100020', varPatientID, varParameterID);
				UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
				SELECT -3; LEAVE Main;
			END IF;
		END IF;
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2');        
		IF TRUE THEN/*Determine SubjectID, if no match, INSERT it. If conflict for Network(w/o recycling)+SubjectName+Site, RETURN -3*/
			SET varStudySubjectID = NULL;
			SELECT StudySubjectID INTO varStudySubjectID
				FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.1');
			IF varStudySubjectID IS NULL THEN/*If no match by Study+SubjectName+Site, try to match by Network+SubjectName+Site (if recycle flag is off)*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR)), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT StudySubjectID INTO varStudySubjectID
						FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
						WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.2');
					IF varStudySubjectID IS NULL THEN
						SET varRecycleFlag = NULL;
						SELECT recycle_flag INTO varRecycleFlag FROM membership.network WHERE network_id = varNetworkID;
						IF varRecycleFlag THEN/*If recycling is on, then consider this a new Subject, INSERT it*/
							INSERT INTO ImagingRepositoryV6.Subjects (SiteID) VALUES (varSiteID);
							SELECT LAST_INSERT_ID() INTO varSubjectID;
							INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
							SELECT LAST_INSERT_ID() INTO varStudySubjectID;
						ELSE/*If recycling is off, then try to match by Network+SubjectName+Site*/
							SET varStudySubjectID = NULL;
							SELECT StudySubjectID INTO varStudySubjectID
								FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Studies ON ImagingRepositoryV6.StudySubjects.StudyID = ImagingRepositoryV6.Studies.StudyID LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
								WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID <> varSiteID;
						INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.3');
							IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Network (without recycling) for a subject with a different Site, mark it as NonCompliant, RETURN -3*/
								#UPDATE Quarantine.Parameters SET NonCompliantFlag = TRUE WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
								#UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
								CALL putParameter(inUploadID, NULL, varStudyInstanceUID, 'gg100020', varPatientID, varParameterID);
								UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
								SELECT -3; LEAVE Main;
							END IF;
                            INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.4');
							SET varStudySubjectID = NULL;
							SELECT StudySubjectID INTO varStudySubjectID
								FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Studies ON ImagingRepositoryV6.StudySubjects.StudyID = ImagingRepositoryV6.Studies.StudyID LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
								WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID = varSiteID LIMIT 1;
							INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.5');
							IF varStudySubjectID IS NULL THEN/*If no match by Network(without recycling)+SubjectName+Site, then consider this a new Subject, INSERT it*/
								INSERT INTO ImagingRepositoryV6.Subjects (SiteID) VALUES (varSiteID);
								SELECT LAST_INSERT_ID() INTO varSubjectID;
								INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
								SELECT LAST_INSERT_ID() INTO varStudySubjectID;
							ELSE/*Get the SubjectID of the match by Network(without recycling)+SubjectName+Site*/
								SELECT SubjectID INTO varSubjectID FROM ImagingRepositoryV6.StudySubjects WHERE StudySubjectID = varStudySubjectID;
                                INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.6');
								INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
								SELECT LAST_INSERT_ID() INTO varStudySubjectID;
							END IF;
						END IF;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR))) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR))) INTO varLock;
					END WHILE LockLoop;
					SELECT StudySubjectID INTO varStudySubjectID
						FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
						WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
					INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.7');
				END IF;
			ELSE/*Get the SubjectID of the match by Study+SubjectName+Site*/
				SELECT SubjectID INTO varSubjectID FROM ImagingRepositoryV6.StudySubjects WHERE StudySubjectID = varStudySubjectID;
                INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.8');
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*5) INSERT into ScanSessions, Images, and StudyImages*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 6');
		SELECT ExtractValue(varXML, '//element[@tag="0008,0070"]') INTO varManufacturer;
		IF varManufacturer = 'GE MEDICAL SYSTEMS' THEN
			SET varUIDRoot = SUBSTRING_INDEX(varSOPInstanceUID, '.', 8);
		ELSEIF varManufacturer = 'Philips Medical Systems' THEN
			SET varUIDRoot = SUBSTRING_INDEX(varSOPInstanceUID, '.', 7);
		ELSE
			SET varUIDRoot = SUBSTRING_INDEX(varSOPInstanceUID, '.', 9);
		END IF;
		SET varScannerID = NULL;
		SELECT ScannerID INTO varScannerID FROM ImagingRepositoryV6.Scanners WHERE UIDRoot = varUIDRoot;
		IF varScannerID IS NULL THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0080"]') INTO varInstitutionName;
			SELECT ExtractValue(varXML, '//element[@tag="0008,1010"]') INTO varStationName;
			SELECT ExtractValue(varXML, '//element[@tag="0008,1090"]') INTO varModelName;
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('Scanners:', varUIDRoot), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT ScannerID INTO varScannerID FROM ImagingRepositoryV6.Scanners WHERE UIDRoot = varUIDRoot;
				IF varScannerID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.Scanners (UIDRoot, InstitutionName, StationName, Manufacturer, ModelName) VALUES (varUIDRoot, varInstitutionName, varStationName, varManufacturer, varModelname);
					SELECT LAST_INSERT_ID() INTO varScannerID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('Scanners:', varUIDRoot)) INTO varLock;
			ELSE
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('Scanners:', varUIDRoot)) INTO varLock;
				END WHILE LockLoop;
				SELECT ScannerID INTO varScannerID FROM ImagingRepositoryV6.Scanners WHERE UIDRoot = varUIDRoot;
			END IF;
		END IF;
		SET varScanSessionID = NULL;
		SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
		IF varScanSessionID IS NULL THEN/*If no match for ScanSession, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
				IF varScanSessionID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.ScanSessions (ProtocolID, SubjectID, ScanDate, StudyUID, ScannerID) VALUES ( ImagingRepositoryV6.GETProtocol(varStudyDescription), varSubjectID, varStudyDate, varStudyInstanceUID, varScannerID);
					SELECT LAST_INSERT_ID() INTO varScanSessionID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID)) INTO varLock;
			ELSE
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID)) INTO varLock;
				END WHILE LockLoop;
				SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
			END IF;
		END IF;
		SET varImageID = NULL;
		SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
		IF varImageID IS NULL THEN/*If no match for Image, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('Images:', varSeriesInstanceUID), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
				IF varImageID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.Images (ScanSessionID, SequenceID, SeriesUID, SequenceNumber) VALUES (varScanSessionID,  ImagingRepositoryV6.GETSequence(varSeriesDescription), varSeriesInstanceUID, CAST(varSeriesNumber AS UNSIGNED));
					SELECT LAST_INSERT_ID() INTO varImageID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('Images:', varSeriesInstanceUID)) INTO varLock;
			ELSE
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('Images:', varSeriesInstanceUID)) INTO varLock;
				END WHILE LockLoop;
				SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
			END IF;
		END IF;
		SET varStudyImageID = NULL;
		SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
		IF varStudyImageID IS NULL THEN/*If no match for StudyImage, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR)), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
				IF varStudyImageID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.StudyImages (StudySubjectID, ImageID) VALUES (varStudySubjectID, varImageID);
					SELECT LAST_INSERT_ID() INTO varStudyImageID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR))) INTO varLock;
			ELSE	
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR))) INTO varLock;
				END WHILE LockLoop;
				SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
			END IF;
		END IF;
		UPDATE Quarantine.Files SET FileStatus = 1, StudyImageID = varStudyImageID WHERE FileID = varFileID;
	END IF;

	#SELECT varStudyImageID; LEAVE Main;

	IF TRUE THEN/*6) If Anatomical/Functional/Diffusion/SpinLabel, INSERT Into QCSessions, call putQCAnswersFromXML. RETURN StudyImageID*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 7');
		IF TRUE THEN/*Determine Modality, INSERT QCSession*/
			SET varModalityID = NULL;
			#SELECT ModalityID INTO varModalityID FROM ImagingRepositoryV6.Sequences WHERE SequenceID = ImagingRepositoryV6.GETSequence(varSeriesDescription);
			#IF varModalityID < 2 OR varModalityID > 5 THEN
			#	SELECT varStudyImageID; LEAVE Main;
			#END IF;
			SET varQCSessionID = NULL;
			SELECT QCSessionID INTO varQCSessionID FROM ImagingRepositoryV6.QCSessions WHERE StudyImageID = varStudyImageID;
			IF varQCSessionID IS NULL THEN/*If no match for QCSession, INSERT it*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('QCSessions:', CAST(varStudyImageID AS CHAR)), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT QCSessionID INTO varQCSessionID FROM ImagingRepositoryV6.QCSessions WHERE StudyImageID = varStudyImageID;
					IF varQCSessionID IS NULL THEN
						INSERT INTO ImagingRepositoryV6.QCSessions (StudyImageID) VALUES (varStudyImageID);
						SELECT LAST_INSERT_ID() INTO varQCSessionID;
					END IF;
					CALL ImagingRepositoryV6.putQCAnswersFromXML(varStudyImageID, inXMLPath); #INTO varQCChoiceID;
				END IF;
			END IF;
		END IF;
		SELECT varStudyImageID, varScanSessionID; LEAVE Main;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pushXMLUploadToRepository` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `pushXMLUploadToRepository`(
	IN inFilePath VARCHAR(1000), 
	IN inMD5Sum VARCHAR(255), 
	IN inXMLPath VARCHAR(255), 
	IN inUploadID INT
)
Main : BEGIN
	DECLARE varLock INT;
	DECLARE varFileName VARCHAR(255);
	DECLARE varFileDir VARCHAR(255);
	DECLARE varDirectoryID INT;
	DECLARE varFileID INT;
	DECLARE varFileStatus INT;
	DECLARE varXML LONGTEXT;
	DECLARE varTagCount INT;
	DECLARE varImageType VARCHAR(255);
	DECLARE varSOPInstanceUID VARCHAR(255);
	DECLARE varSeriesInstanceUID VARCHAR(255);
	DECLARE varSeriesDescription VARCHAR(255);
	DECLARE varSeriesNumber VARCHAR(255);
	DECLARE varStudyInstanceUID VARCHAR(255);
	DECLARE varStudyDescription VARCHAR(255);
	DECLARE varStudyDate VARCHAR(255);
	DECLARE varPatientID VARCHAR(255);
	DECLARE varPeopleID INT;
	DECLARE varAllCompliantFlag BOOL DEFAULT TRUE;
	DECLARE varSubjectRegex VARCHAR(255);
	DECLARE varParameterID INT;
	DECLARE varExistingValue VARCHAR(255);
	DECLARE varCorrectedValue VARCHAR(255);
	DECLARE varStudyID INT;
	DECLARE varNetworkID INT;
	DECLARE varSiteID INT;
	DECLARE varStudySubjectID INT;
	DECLARE varSubjectID INT;
	DECLARE varRecycleFlag BOOL;
	DECLARE varUIDRoot VARCHAR(255);
	DECLARE varScannerID INT;
	DECLARE varInstitutionName VARCHAR(255);
	DECLARE varStationName VARCHAR(255);
	DECLARE varManufacturer VARCHAR(255);
	DECLARE varModelName VARCHAR(255);
	DECLARE varScanSessionID INT;
	DECLARE varImageID INT;
	DECLARE varStudyImageID INT;
	DECLARE varModalityID INT;
	DECLARE varQCSessionID INT;
	DECLARE varQCChoiceID INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
SELECT @full_error;
END;

	/*NOTE: "IF TRUE THEN" blocks used for collapsibility of code and thus improved readability and organization*/
	/*RETURN VALUES:
		0  : XML Error, required tag does not exist
		-1 : File is a duplicate (either by SOPUID)
		-2 : File is from a derived image
		-3 : File parameters need correction
		>0 : StudyImageID of file image
	/*STRATEGY: 
		1) GET/SET QuarantineDirectoryID, FileName. Determine the FileStatus of a given FullPath.
			IF NULL (New)		:
				IF Duplicate by MD5 or SOPUID
					INSERT Quarantine record (FileStatus = -1)
					RETURN -1
				IF Derived
					INSERT Quarantine record (FileStatus = -2)
					RETURN -2
				ELSE
					INSERT Quarantine record (FileStatus = 0)
					Get QuarantineID
			IF 0 (Default)		:
				Get QuarantineID
			IF -1 (Duplicate)	:
				RETURN -1
			IF -2 (Derived)		:
				RETURN -2
			IF -3 (Pending)		:
				Get QuarantineID
			IF 1 (Complete)		:
				IF StudyImageID NOT NULL
					RETURN StudyImageID
				ELSE
					UPDATE Quarantine record (FileStatus = 0)
			IF NOT RETURNED
				QuarantineID ISSET
				QuarantineDirectoryID ISSET
				FileName ISSET
		2) Get/Set Upload NotificationID. Check if derived or duplicate
			IF derived		: 
				UPDATE Quarantine record (FileStatus = -2)
				RETURN -2
			IF duplicate	:
				UPDATE Quarantine record (FileStatus = -1)
				RETURN -1
			IF NOT RETURNED
				NotificationID ISSET
		3) Determine Compliance of parameters. Replacing with Corrected Values if present
			IF any Non-compliance
				UPDATE Quarantine record (FileStatus = -3)
				RETURN -3
		4) Determine SubjectID
			IF conflict		:
				UPDATE PatientID QuarantineParameter (NonCompliant = TRUE)
				UPDATE Quarantine record (FileStatus = -3)
			IF NOT RETURNED
				SubjectID ISSET
				StudySubjectID ISSET
		5) Get/Set ScanSession, Image, StudyImage
			IF NOT RETURNED
				ScanSessionID ISSET
				ImageID ISSET
				StudyImageID ISSET
		6) Get/Set QCSession. INSERT QCAnswers
			IF Modality 2, 3, 4
				INSERT QCSession record
				INSERT QCAnswer records
			UPDATE Quarantine record (FileStatus = 1, StudyImageID = StudyImageID)
			RETURN StudyImageID
	*/

	IF TRUE THEN/*Get XML fields*/
		SET varXML = LOAD_FILE(inXMLPath);
		IF varXML IS NULL THEN
			SELECT 0; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0018"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0018"]') INTO varSOPInstanceUID;
		ELSE
			SELECT -10; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,000e"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,000e"]') INTO varSeriesInstanceUID;
		ELSE
			SELECT -20; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,103e"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,103e"]') INTO varSeriesDescription;
		ELSE
			SELECT -30; LEAVE Main;
		END IF;
		SET varTagCount = NULL;
		SELECT COUNT(ParameterID) INTO varTagCount
		FROM Quarantine.Parameters
		WHERE
			SeriesUID = varSeriesInstanceUID
			AND UploadID = inUploadID
			AND DataKey = '0008103e'
			AND PendingValue IS NOT NULL;
		IF varTagCount = 1 THEN
			SELECT PendingValue INTO varStudyDate
			FROM Quarantine.Parameters
			WHERE
				SeriesUID = varSeriesInstanceUID
				AND UploadID = inUploadID
				AND DataKey = '0008103e'
				AND PendingValue IS NOT NULL;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,0011"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,0011"]') INTO varSeriesNumber;
		ELSE
			SELECT -40; LEAVE Main;
		END IF;
		SET varTagCount = NULL;
		SELECT COUNT(ParameterID) INTO varTagCount
		FROM Quarantine.Parameters
		WHERE
			SeriesUID = varSeriesInstanceUID
			AND UploadID = inUploadID
			AND DataKey = '00200011'
			AND PendingValue IS NOT NULL;
		IF varTagCount = 1 THEN
			SELECT PendingValue INTO varStudyDate
			FROM Quarantine.Parameters
			WHERE
				SeriesUID = varSeriesInstanceUID
				AND UploadID = inUploadID
				AND DataKey = '00200011'
				AND PendingValue IS NOT NULL;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0020,000d"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0020,000d"]') INTO varStudyInstanceUID;
		ELSE
			SELECT -50; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,1030"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,1030"]') INTO varStudyDescription;
		ELSE
			SELECT ExtractValue(varXML, 'count(//element[@tag="0018,1030"])') INTO varTagCount;
			IF varTagCount = 1 THEN
				SELECT ExtractValue(varXML, '//element[@tag="0018,1030"]') INTO varStudyDescription;
			ELSE
				SELECT -60; LEAVE Main;
			END IF;
		END IF;
		SET varTagCount = NULL;
		SELECT COUNT(ParameterID) INTO varTagCount
		FROM Quarantine.Parameters
		WHERE
			StudyUID = varStudyInstanceUID
			AND UploadID = inUploadID
			AND DataKey = '00081030'
			AND PendingValue IS NOT NULL;
		IF varTagCount = 1 THEN
			SELECT PendingValue INTO varStudyDate
			FROM Quarantine.Parameters
			WHERE
				StudyUID = varStudyInstanceUID
				AND UploadID = inUploadID
				AND DataKey = '00081030'
				AND PendingValue IS NOT NULL;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0020"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0020"]') INTO varStudyDate;
		ELSE
			SELECT -70; LEAVE Main;
		END IF;
		SET varTagCount = NULL;
		SELECT COUNT(ParameterID) INTO varTagCount
		FROM Quarantine.Parameters
		WHERE
			StudyUID = varStudyInstanceUID
			AND UploadID = inUploadID
			AND DataKey = '00080020'
			AND PendingValue IS NOT NULL;
		IF varTagCount = 1 THEN
			SELECT PendingValue INTO varStudyDate
			FROM Quarantine.Parameters
			WHERE
				StudyUID = varStudyInstanceUID
				AND UploadID = inUploadID
				AND DataKey = '00080020'
				AND PendingValue IS NOT NULL;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0010,0020"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0010,0020"]') INTO varPatientID;
		ELSE
			SELECT -80; LEAVE Main;
		END IF;
		SELECT ExtractValue(varXML, 'count(//element[@tag="0008,0008"])') INTO varTagCount;
		IF varTagCount = 1 THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0008"]') INTO varImageType;
		ELSE
			SELECT -90; LEAVE Main;
		END IF;
	END IF;

	IF TRUE THEN/*1) Look up QuarantineFile by UploadID, Directory and FileName (fullpath). If match, RETURN StudyImageID or existing Error-File-Status*/
		IF TRUE THEN/*Determine Directory and FileName from inFilePath*/
			SET varFileName = SUBSTRING_INDEX(inFilePath, '/', -1);
			SET varFileDir = TRIM(TRAILING varFileName FROM inFilePath);
			SET varDirectoryID = NULL;
			SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
			IF varDirectoryID IS NULL THEN/*If a Quarantine.Directories record does not exist, INSERT it, get ID*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
					IF varDirectoryID IS NULL THEN
						INSERT INTO Quarantine.Directories (UploadID, DirectoryPath) VALUES (inUploadID, varFileDir);
						SELECT LAST_INSERT_ID() INTO varDirectoryID;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir)) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('Directories:', CAST(inUploadID AS CHAR), ';', varFileDir)) INTO varLock;
					END WHILE LockLoop;
					SELECT DirectoryID INTO varDirectoryID FROM Quarantine.Directories WHERE Quarantine.Directories.UploadID = inUploadID AND Quarantine.Directories.DirectoryPath = varFileDir;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Search for a pre-existing record in Quarantine.Files by UploadID, Directory and FileName (fullpath). Load XML if code hasn't RETURNed*/
			SET varFileStatus = NULL;
			SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
			IF varFileStatus IS NULL THEN/*If no existing record, this is a new file. INSERT it, get ID*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('Files:', varDirectoryID, varFileName), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					IF varFileStatus IS NULL THEN
						INSERT INTO Quarantine.Files (DirectoryID, FileName, MD5Sum, StudyUID, SeriesUID, SOPUID, FileStatus) VALUES (varDirectoryID, varFileName, inMD5Sum, varStudyInstanceUID, varSeriesInstanceUID, varSOPInstanceUID, 0);
						SELECT LAST_INSERT_ID() INTO varFileID;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('Files:', varDirectoryID, varFileName)) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('Files:', varDirectoryID, varFileName)) INTO varLock;
					END WHILE LockLoop;
					SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				END IF;
			ELSE/*If a record exists, SWITCH based on FileStatus*/
				CASE varFileStatus
					WHEN 0 THEN/*Default Status, get QuarantineID*/
						SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					WHEN -1 THEN/*Previously determined duplicate, RETURN -1*/
						INSERT INTO Quarantine.DebugLog (Message) VALUES (CONCAT('Error 1: ', CAST(varDirectoryID AS CHAR), ';', varFileName));
						SELECT -1; LEAVE Main;
					WHEN -2 THEN/*Previously determined derived file, RETURN -2*/
						INSERT INTO Quarantine.DebugLog (Message) VALUES ('Error 2');
						SELECT -1; LEAVE Main;
					WHEN -3 THEN/*File from a pending Series, get QuarantineID, we will be doing all of the same checks for Parameter compliance */
						SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
					WHEN 1 THEN/*Previously completed file, get StudyImageID*/
						SELECT StudyImageID INTO varStudyImageID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
						IF varStudyImageID = 0 THEN/*If no StudyImageID set, reset the FileStatus to 0 and treat as a 0-FileStatus file*/
							UPDATE Quarantine.Files SET FileStatus = 0 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
							SELECT FileID INTO varFileID FROM Quarantine.Files WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
						ELSE/*If StudyImageID set, RETURN it*/
							SELECT varStudyImageID; LEAVE Main;
						END IF;
				END CASE;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*2) Check if derived. If so, RETURN -2. Check if duplicate by SOPUID. If so, RETURN -1*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 3');
		IF TRUE THEN/*Determine if the file is of derived type*/
			SELECT ModalityID INTO varModalityID FROM ImagingRepositoryV6.Sequences WHERE SequenceName = varSeriesDescription;
			IF varModalityID = 1 THEN/*If derived, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				SELECT -2; LEAVE Main;
			END IF;
			ELSE IF varModalityID = 6 THEN/*If other, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				SELECT -2; LEAVE Main;
			END IF;
			IF SUBSTRING_INDEX(varImageType, '\\', 1) = 'DERIVED' THEN/*If derived, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE Quarantine.Files SET FileStatus = -2 WHERE DirectoryID = varDirectoryID AND FileName = varFileName;
				SELECT -2; LEAVE Main;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is a duplicate by SOPUID.*/
			SET varFileStatus = NULL;
			SELECT FileStatus INTO varFileStatus FROM Quarantine.Files WHERE FileID <> varFileID AND SOPUID = varSOPInstanceUID AND FileStatus <> -1 LIMIT 1;
			IF varFileStatus IS NOT NULL THEN/*If duplicate by SOPUID, UPDATE record (FileStatus = -1). RETURN -1*/
				UPDATE Quarantine.Files SET FileStatus = -1 WHERE FileID = varFileID;
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Error 3');
				SELECT -1; LEAVE Main;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*3) Determine Compliance of input Parameters, INSERT INTO Quarantine.Parameters if Non-Compliant. If any Non-Compliance, RETURN -2*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4');
		IF TRUE THEN/*Get StudyID, SubjectRegex, PeopleID*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.1');
			SET varStudyID = NULL;
			SELECT StudyID INTO varStudyID FROM Quarantine.Uploads WHERE UploadID = inUploadID;
			SET varSubjectRegex = NULL;
			SELECT SubjectRegex INTO varSubjectRegex FROM ImagingRepositoryV6.Studies WHERE StudyID = varStudyID;
			SET varPeopleID = NULL;
			SELECT ImagingRepositoryV6.Studies.PeopleID INTO varPeopleID FROM ImagingRepositoryV6.Studies WHERE ImagingRepositoryV6.Studies.StudyID = varStudyID;
			IF varPeopleID IS NULL THEN/*If no match, set it to an Admin ID (Mher)*/
				SET varPeopleID = 115;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of PatientID*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2');
			SET varParameterID = NULL;
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.1');
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.2');
			IF varSubjectRegex IS NULL OR varPatientID NOT REGEXP BINARY varSubjectRegex THEN/*If non-compliant by SubjectRegex Check*/
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.3');
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, NULL, varStudyInstanceUID, '00100020', varPatientID, varParameterID);
			ELSE/*If compliant by SubjectRegex Check*/
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.4');
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.2.5');
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varPatientID THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varPatientID WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingValue = varPatientID OR varCorrectedValue <> varPatientID THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse logic in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
					#Alternatively:
					#ELSEIF varCorrectedValue = varPatientID AND varExistingValue <> varPatientID THEN DO NOTHING!
					#ELSE SET varAllCompliantFlag = FALSE;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of ScanDate*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.3');
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00080020';
			IF varStudyDate + INTERVAL 0 DAY IS NULL THEN/*If non-compliant format*/
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, NULL, varStudyInstanceUID, '00080020', varScanDate, varParameterID);
			ELSE/*If compliant format*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						UPDATE Quarantine.Parameters SET CorrectedValue = varScanDate WHERE ParameterID = varParameterID;
					ELSEIF varCorrectedValue <> varScanDate THEN/*If the previous corrected value does not match the current compliant value, mark the current value as non-compliant*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of StudyDescription (ProtocolName)*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.4');
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00081030';
			IF ImagingRepositoryV6.GETProtocol(varStudyDescription) = 0 THEN/*If no existing record with ProtocolName = StudyDescription*/
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, NULL, varStudyInstanceUID, '00081030', varStudyDescription, varParameterID);
			ELSE/*If Protocol record exists*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varStudyDescription THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varStudyDescription WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingValue = varStudyDescription OR varCorrectedValue <> varStudyDescription THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of SeriesDescription (SequenceName)*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.5');
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID = varSeriesInstanceUID AND DataKey = '0008103e';
			IF ImagingRepositoryV6.GETSequence(varSeriesDescription) = 0 THEN/*If no existing record with SequenceName = SeriesDescription*/
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, varSeriesInstanceUID, varStudyInstanceUID, '0008103e', varSeriesDescription, varParameterID);
			ELSE/*If Sequence record exists*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varExistingValue = NULL;
					SELECT DataValue INTO varExistingValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						IF varExistingValue = varSeriesDescription THEN/*If a previously entered Parameter record is now considered compliant, DELETE the existing record*/
							DELETE FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
						ELSE/*If not a match, then the current value is a correction, UPDATE the Parameter record as a correction*/
							UPDATE Quarantine.Parameters SET CorrectedValue = varSeriesDescription WHERE ParameterID = varParameterID;
						END IF;
					ELSEIF varExistingValue = varSeriesDescription OR varCorrectedValue <> varSeriesDescription THEN/*If correction exists, ONLY treat current value as compliant if it matches the correction and NOT the original. Mark all other cases as non-compliant. (Reverse login in this line)*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*Check the compliance of SeriesNumber (SequenceNumber)*/
			INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 4.6');
			SET varParameterID = NULL;
			SELECT ParameterID INTO varParameterID FROM Quarantine.Parameters WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID = varSeriesInstanceUID AND DataKey = '00200011';
			IF CAST(varSeriesNumber AS UNSIGNED) = 0 THEN/*If SeriesNumber does not resolve to a strictly positive integer*/
				SET varAllCompliantFlag = FALSE;
				CALL putParameter(inUploadID, varSeriesInstanceUID, varStudyInstanceUID, '00200011', varSeriesNumber, varParameterID);
			ELSE/*If SeriesNumber is an unsigned int*/
				IF varParameterID IS NOT NULL THEN/*If an existing record for Parameter does exist, check if it matches the previous CorrectedValue*/
					SET varCorrectedValue = NULL;
					SELECT CorrectedValue INTO varCorrectedValue FROM Quarantine.Parameters WHERE ParameterID = varParameterID;
					IF varCorrectedValue IS NULL THEN/*If the Parameter record has not been corrected yet, update it with the current value as the correction*/
						UPDATE Quarantine.Parameters SET CorrectedValue = varSeriesNumber WHERE ParameterID = varParameterID;
					ELSEIF varCorrectedValue <> varSeriesNumber THEN/*If the previous corrected value does not match the current compliant value, mark the current value as non-compliant*/
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*If any NonCompliant fields, change status of QuarantineFile to Pending (-3); RETURN -3*/
			IF NOT varAllCompliantFlag THEN
				UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
				SELECT -3; LEAVE Main;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*4) Determine SubjectID. INSERT if needed. If conflict, RETURN -3*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5');
		IF TRUE THEN/*Determine StudyID, NetworkID, SiteID*/
			SELECT NetworkID INTO varNetworkID FROM ImagingRepositoryV6.Studies WHERE StudyID = varStudyID;
			SELECT SiteID INTO varSiteID FROM Quarantine.Uploads WHERE UploadID = inUploadID;
		END IF;
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.1');
		IF TRUE THEN/*Determine if conflict for Study+SubjectName+Site. If so, RETURN -3*/
			SET varStudySubjectID = NULL;
			SELECT StudySubjectID INTO varStudySubjectID
				FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID <> varSiteID;
			IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Study for a subject with a different Site, mark as NonCompliant, RETURN -3*/
				#UPDATE Quarantine.Parameters SET NonCompliantFlag = TRUE WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
				#UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
				CALL putParameter(inUploadID, NULL, varStudyInstanceUID, 'gg100020', varPatientID, varParameterID);
				UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
				SELECT -3; LEAVE Main;
			END IF;
		END IF;
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2');        
		IF TRUE THEN/*Determine SubjectID, if no match, INSERT it. If conflict for Network(w/o recycling)+SubjectName+Site, RETURN -3*/
			SET varStudySubjectID = NULL;
			SELECT StudySubjectID INTO varStudySubjectID
				FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.1');
			IF varStudySubjectID IS NULL THEN/*If no match by Study+SubjectName+Site, try to match by Network+SubjectName+Site (if recycle flag is off)*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR)), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT StudySubjectID INTO varStudySubjectID
						FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
						WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
				INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.2');
					IF varStudySubjectID IS NULL THEN
						SET varRecycleFlag = NULL;
						SELECT recycle_flag INTO varRecycleFlag FROM membership.network WHERE network_id = varNetworkID;
						IF varRecycleFlag THEN/*If recycling is on, then consider this a new Subject, INSERT it*/
							INSERT INTO ImagingRepositoryV6.Subjects (SiteID) VALUES (varSiteID);
							SELECT LAST_INSERT_ID() INTO varSubjectID;
							INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
							SELECT LAST_INSERT_ID() INTO varStudySubjectID;
						ELSE/*If recycling is off, then try to match by Network+SubjectName+Site*/
							SET varStudySubjectID = NULL;
							SELECT StudySubjectID INTO varStudySubjectID
								FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Studies ON ImagingRepositoryV6.StudySubjects.StudyID = ImagingRepositoryV6.Studies.StudyID LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
								WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID <> varSiteID;
						INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.3');
							IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Network (without recycling) for a subject with a different Site, mark it as NonCompliant, RETURN -3*/
								#UPDATE Quarantine.Parameters SET NonCompliantFlag = TRUE WHERE UploadID = inUploadID AND StudyUID = varStudyInstanceUID AND DataKey = '00100020';
								#UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
								CALL putParameter(inUploadID, NULL, varStudyInstanceUID, 'gg100020', varPatientID, varParameterID);
								UPDATE Quarantine.Files SET FileStatus = -3 WHERE FileID = varFileID;
								SELECT -3; LEAVE Main;
							END IF;
                            INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.4');
							SET varStudySubjectID = NULL;
							SELECT StudySubjectID INTO varStudySubjectID
								FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Studies ON ImagingRepositoryV6.StudySubjects.StudyID = ImagingRepositoryV6.Studies.StudyID LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
								WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID = varSiteID LIMIT 1;
							INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.5');
							IF varStudySubjectID IS NULL THEN/*If no match by Network(without recycling)+SubjectName+Site, then consider this a new Subject, INSERT it*/
								INSERT INTO ImagingRepositoryV6.Subjects (SiteID) VALUES (varSiteID);
								SELECT LAST_INSERT_ID() INTO varSubjectID;
								INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
								SELECT LAST_INSERT_ID() INTO varStudySubjectID;
							ELSE/*Get the SubjectID of the match by Network(without recycling)+SubjectName+Site*/
								SELECT SubjectID INTO varSubjectID FROM ImagingRepositoryV6.StudySubjects WHERE StudySubjectID = varStudySubjectID;
                                INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.6');
								INSERT INTO ImagingRepositoryV6.StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
								SELECT LAST_INSERT_ID() INTO varStudySubjectID;
							END IF;
						END IF;
					END IF;
					SELECT RELEASE_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR))) INTO varLock;
				ELSE
					LockLoop : WHILE varLock <> 1 DO
						SELECT IS_FREE_LOCK(CONCAT('StudySubjects:', CAST(varStudyID AS CHAR), ';', varPatientID, ';', CAST(varSiteID AS CHAR))) INTO varLock;
					END WHILE LockLoop;
					SELECT StudySubjectID INTO varStudySubjectID
						FROM ImagingRepositoryV6.StudySubjects LEFT JOIN ImagingRepositoryV6.Subjects ON ImagingRepositoryV6.StudySubjects.SubjectID = ImagingRepositoryV6.Subjects.SubjectID
						WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
					INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.7');
				END IF;
			ELSE/*Get the SubjectID of the match by Study+SubjectName+Site*/
				SELECT SubjectID INTO varSubjectID FROM ImagingRepositoryV6.StudySubjects WHERE StudySubjectID = varStudySubjectID;
                INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 5.2.8');
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*5) INSERT into ScanSessions, Images, and StudyImages*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 6');
		SELECT ExtractValue(varXML, '//element[@tag="0008,0070"]') INTO varManufacturer;
		IF varManufacturer = 'GE MEDICAL SYSTEMS' THEN
			SET varUIDRoot = SUBSTRING_INDEX(varSOPInstanceUID, '.', 8);
		ELSEIF varManufacturer = 'Philips Medical Systems' THEN
			SET varUIDRoot = SUBSTRING_INDEX(varSOPInstanceUID, '.', 7);
		ELSE
			SET varUIDRoot = SUBSTRING_INDEX(varSOPInstanceUID, '.', 9);
		END IF;
		SET varScannerID = NULL;
		SELECT ScannerID INTO varScannerID FROM ImagingRepositoryV6.Scanners WHERE UIDRoot = varUIDRoot;
		IF varScannerID IS NULL THEN
			SELECT ExtractValue(varXML, '//element[@tag="0008,0080"]') INTO varInstitutionName;
			SELECT ExtractValue(varXML, '//element[@tag="0008,1010"]') INTO varStationName;
			SELECT ExtractValue(varXML, '//element[@tag="0008,1090"]') INTO varModelName;
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('Scanners:', varUIDRoot), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT ScannerID INTO varScannerID FROM ImagingRepositoryV6.Scanners WHERE UIDRoot = varUIDRoot;
				IF varScannerID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.Scanners (UIDRoot, InstitutionName, StationName, Manufacturer, ModelName) VALUES (varUIDRoot, varInstitutionName, varStationName, varManufacturer, varModelname);
					SELECT LAST_INSERT_ID() INTO varScannerID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('Scanners:', varUIDRoot)) INTO varLock;
			ELSE
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('Scanners:', varUIDRoot)) INTO varLock;
				END WHILE LockLoop;
				SELECT ScannerID INTO varScannerID FROM ImagingRepositoryV6.Scanners WHERE UIDRoot = varUIDRoot;
			END IF;
		END IF;
		SET varScanSessionID = NULL;
		SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
		IF varScanSessionID IS NULL THEN/*If no match for ScanSession, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
				IF varScanSessionID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.ScanSessions (ProtocolID, SubjectID, ScanDate, StudyUID, ScannerID) VALUES ( ImagingRepositoryV6.GETProtocol(varStudyDescription), varSubjectID, varStudyDate, varStudyInstanceUID, varScannerID);
					SELECT LAST_INSERT_ID() INTO varScanSessionID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID)) INTO varLock;
			ELSE
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('ScanSessions:', varStudyInstanceUID)) INTO varLock;
				END WHILE LockLoop;
				SELECT ScanSessionID INTO varScanSessionID FROM ImagingRepositoryV6.ScanSessions WHERE StudyUID = varStudyInstanceUID;
			END IF;
		END IF;
		SET varImageID = NULL;
		SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
		IF varImageID IS NULL THEN/*If no match for Image, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('Images:', varSeriesInstanceUID), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
				IF varImageID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.Images (ScanSessionID, SequenceID, SeriesUID, SequenceNumber) VALUES (varScanSessionID,  ImagingRepositoryV6.GETSequence(varSeriesDescription), varSeriesInstanceUID, CAST(varSeriesNumber AS UNSIGNED));
					SELECT LAST_INSERT_ID() INTO varImageID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('Images:', varSeriesInstanceUID)) INTO varLock;
			ELSE
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('Images:', varSeriesInstanceUID)) INTO varLock;
				END WHILE LockLoop;
				SELECT ImageID INTO varImageID FROM ImagingRepositoryV6.Images WHERE SeriesUID = varSeriesInstanceUID;
			END IF;
		END IF;
		SET varStudyImageID = NULL;
		SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
		IF varStudyImageID IS NULL THEN/*If no match for StudyImage, INSERT it*/
			SET varLock = NULL; SELECT GET_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR)), 1) INTO varLock;
			IF varLock = 1 THEN
				SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
				IF varStudyImageID IS NULL THEN
					INSERT INTO ImagingRepositoryV6.StudyImages (StudySubjectID, ImageID) VALUES (varStudySubjectID, varImageID);
					SELECT LAST_INSERT_ID() INTO varStudyImageID;
				END IF;
				SELECT RELEASE_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR))) INTO varLock;
			ELSE	
				LockLoop : WHILE varLock <> 1 DO
					SELECT IS_FREE_LOCK(CONCAT('StudyImages:', CAST(varStudySubjectID AS CHAR), ';', CAST(varImageID AS CHAR))) INTO varLock;
				END WHILE LockLoop;
				SELECT StudyImageID INTO varStudyImageID FROM ImagingRepositoryV6.StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
			END IF;
		END IF;
		UPDATE Quarantine.Files SET FileStatus = 1, StudyImageID = varStudyImageID WHERE FileID = varFileID;
	END IF;

	#SELECT varStudyImageID; LEAVE Main;

	IF TRUE THEN/*6) If Anatomical/Functional/Diffusion/SpinLabel, INSERT Into QCSessions, call putQCAnswersFromXML. RETURN StudyImageID*/
		INSERT INTO Quarantine.DebugLog (Message) VALUES ('Part 7');
		IF TRUE THEN/*Determine Modality, INSERT QCSession*/
			SET varModalityID = NULL;
			#SELECT ModalityID INTO varModalityID FROM ImagingRepositoryV6.Sequences WHERE SequenceID = ImagingRepositoryV6.GETSequence(varSeriesDescription);
			#IF varModalityID < 2 OR varModalityID > 5 THEN
			#	SELECT varStudyImageID; LEAVE Main;
			#END IF;
			SET varQCSessionID = NULL;
			SELECT QCSessionID INTO varQCSessionID FROM ImagingRepositoryV6.QCSessions WHERE StudyImageID = varStudyImageID;
			IF varQCSessionID IS NULL THEN/*If no match for QCSession, INSERT it*/
				SET varLock = NULL; SELECT GET_LOCK(CONCAT('QCSessions:', CAST(varStudyImageID AS CHAR)), 1) INTO varLock;
				IF varLock = 1 THEN
					SELECT QCSessionID INTO varQCSessionID FROM ImagingRepositoryV6.QCSessions WHERE StudyImageID = varStudyImageID;
					IF varQCSessionID IS NULL THEN
						INSERT INTO ImagingRepositoryV6.QCSessions (StudyImageID) VALUES (varStudyImageID);
						SELECT LAST_INSERT_ID() INTO varQCSessionID;
					END IF;
					CALL ImagingRepositoryV6.putQCAnswersFromXML(varStudyImageID, inXMLPath); #INTO varQCChoiceID;
				END IF;
			END IF;
		END IF;
		SELECT varStudyImageID; LEAVE Main;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `putParameter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `putParameter`(IN inUploadID INT, IN inSeriesUID VARCHAR(255), IN inStudyUID VARCHAR(255), IN inDataKey VARCHAR(8), IN inDataValue VARCHAR(255), OUT outParameterID INT(11))
Main : BEGIN

	DECLARE varLock BOOL;
	DECLARE varIdentifier VARCHAR(1000);
	#DECLARE CONTINUE HANDLER FOR 1172
	#	INSERT INTO DebugLog(Message) VALUES (CONCAT(CAST(inUploadID AS CHAR), ';', inSeriesUID, ';', inStudyUID, ';', inDataKey, ';', inDataValue));

	#SET outParameterID = 0;
	INSERT INTO DebugLog(Message) VALUES ('1');
	IF inSeriesUID IS NULL THEN
		SET varIdentifier = CONCAT(CAST(inUploadID AS CHAR), ';', inStudyUID);
		SELECT ParameterID INTO outParameterID 
		FROM Quarantine.Parameters 
		WHERE
			UploadID = inUploadID
			AND StudyUID = inStudyUID
			AND DataKey = inDataKey;
	ELSE
		SET varIdentifier = CONCAT(CAST(inUploadID AS CHAR), ';', inStudyUID, ';', inSeriesUID);
		SELECT ParameterID INTO outParameterID 
		FROM Quarantine.Parameters 
		WHERE
			UploadID = inUploadID
			AND SeriesUID = inSeriesUID
			AND StudyUID = inStudyUID
			AND DataKey = inDataKey;
	END IF;

	IF inDataKey = '00100020' THEN
		SET inDataValue = SHA2(inDataValue, 224);
	END IF;

	INSERT INTO DebugLog(Message) VALUES ('2');

	INSERT INTO DebugLog(Message) VALUES ('3');
	IF outParameterID IS NULL THEN/*If an existing record for Parameter did not exist, INSERT it*/
		INSERT INTO DebugLog(Message) VALUES ('4');
		SET varLock = NULL; 
		SELECT GET_LOCK(CONCAT('Parameters:', varIdentifier, ';', inDataKey), 1) INTO varLock;
		IF varLock = 1 THEN
			IF inSeriesUID IS NULL THEN
				SELECT ParameterID INTO outParameterID 
				FROM Quarantine.Parameters 
				WHERE
					UploadID = inUploadID
					AND StudyUID = inStudyUID
					AND DataKey = inDataKey;
			ELSE
				SELECT ParameterID INTO outParameterID 
				FROM Quarantine.Parameters 
				WHERE
					UploadID = inUploadID
					AND SeriesUID = inSeriesUID
					AND StudyUID = inStudyUID
					AND DataKey = inDataKey;
			END IF;
			IF outParameterID IS NULL THEN
				INSERT INTO Quarantine.Parameters (UploadID, SeriesUID, StudyUID, DataKey, DataValue) VALUES (inUploadID, inSeriesUID, inStudyUID, inDataKey, inDataValue);
				SELECT LAST_INSERT_ID() INTO outParameterID;
			END IF;
			SELECT RELEASE_LOCK(CONCAT('Parameters:', varIdentifier, ';', inDataKey)) INTO varLock;
		ELSE
			INSERT INTO DebugLog(Message) VALUES ('8');
			LockLoop : WHILE varLock <> 1 DO
				SELECT IS_FREE_LOCK(CONCAT('Parameters:', varIdentifier, ';', inDataKey)) INTO varLock;
			END WHILE LockLoop;
			IF inSeriesUID IS NULL THEN
				SELECT ParameterID INTO outParameterID 
				FROM Quarantine.Parameters 
				WHERE
					UploadID = inUploadID
					AND StudyUID = inStudyUID
					AND DataKey = inDataKey;
			ELSE
				SELECT ParameterID INTO outParameterID 
				FROM Quarantine.Parameters 
				WHERE
					UploadID = inUploadID
					AND SeriesUID = inSeriesUID
					AND StudyUID = inStudyUID
					AND DataKey = inDataKey;
			END IF;
		END IF;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 15:18:22
