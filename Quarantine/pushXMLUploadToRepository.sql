-- MySQL dump 10.13  Distrib 5.6.26, for Linux (x86_64)
--
-- Host: localhost    Database: Quarantine
-- ------------------------------------------------------
-- Server version	5.6.26
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'Quarantine'
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-21 14:22:11
