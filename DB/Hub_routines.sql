CREATE DATABASE  IF NOT EXISTS `Hub` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Hub`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: cns5.med.ucla.edu    Database: Hub
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
-- Temporary view structure for view `study_people`
--

DROP TABLE IF EXISTS `study_people`;
/*!50001 DROP VIEW IF EXISTS `study_people`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `study_people` AS SELECT 
 1 AS `study_id`,
 1 AS `people_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `study_people`
--

/*!50001 DROP VIEW IF EXISTS `study_people`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `study_people` AS select `studies_people_notifications`.`study_id` AS `study_id`,`studies_people_notifications`.`people_id` AS `people_id` from `studies_people_notifications` group by `studies_people_notifications`.`study_id`,`studies_people_notifications`.`people_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'Hub'
--
/*!50003 DROP PROCEDURE IF EXISTS `getFailedQCToNotify` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getFailedQCToNotify`()
BEGIN

SELECT QCAnswerInfo.StudyUID, Studies.PeopleID, people.email, Studies.StudyName, QCAnswerInfo.SubjectName, QCAnswerInfo.ScanDate, QCAnswerInfo.ScanSessionID, Studies.StudyID
FROM
	ImagingRepositoryV6.QCAnswerInfo
	LEFT JOIN ImagingRepositoryV6.Studies ON QCAnswerInfo.StudyID = Studies.StudyID
	LEFT JOIN (SELECT StudyUID FROM Hub.Notifications WHERE NotificationTypeID = 3) AS Notifications ON QCAnswerInfo.StudyUID = Notifications.StudyUID
	LEFT JOIN membership.people ON Studies.PeopleID = people.people_id
WHERE
	QCAnswerInfo.OverallFlag = 1
	AND QCAnswerInfo.AlertFlag = 1
	AND Notifications.StudyUID IS NULL
	AND people.email IS NOT NULL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetItemsByNotification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GetItemsByNotification`(IN inNotificationID INT)
BEGIN

DECLARE varItemTypeID INT;
DECLARE varUploadID INT;

SELECT UploadID INTO varUploadID FROM Hub.Notifications WHERE NotificationID = inNotificationID;
SELECT ItemTypeID INTO varItemTypeID FROM Hub.Notifications LEFT JOIN NotificationTypes ON Notifications.NotificationTypeID = NotificationTypes.NotificationTypeID WHERE NotificationID = inNotificationID;

CASE ItemTypeID
	WHEN 1 THEN
		SELECT FileStatuses.FileStatus AS ItemID, FileStatusDescription AS 'Property', CONCAT(CAST(COUNT(FileID) AS CHAR), ' Files') AS 'Value'
		FROM Quarantine.Files 
			LEFT JOIN Quarantine.FileStatuses ON Quarantine.Files.FileStatus = Quarantine.FileStatuses.FileStatus 
			LEFT JOIN Quarantine.Directories ON Quarantine.Files.DirectoryID = Quarantine.Directories.DirectoryID
			LEFT JOIN Hub.Notifications ON Quarantine.Directories.UploadID = Hub.Notifications.UploadID
		WHERE Hub.Notifications.NotificationID = inNotificationID
			AND FileStatuses.FileStatus < 0
		GROUP BY Quarantine.Directories.UploadID, Quarantine.FileStatuses.FileStatus;
	WHEN 2 THEN
		SELECT ParameterID AS ItemID, KeyDisplay AS 'Property', DataValue AS 'Value'
		FROM Quarantine.Parameters
			LEFT JOIN Quarantine.DataKeys ON Quarantine.Parameters.DataKey = Quarantine.DataKeys.DataKey
		WHERE NotificationID = inNotificationID;
	WHEN 3 THEN
		SELECT QCAnswerID AS ItemID, QCQuestionName AS 'Property', QCChoiceName AS 'Value'
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
			LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
			LEFT JOIN QCSessions ON QCAnswers.QCSessionID = QCSessions.QCSessionID
			LEFT JOIN StudyImages ON QCSessions.StudyImageID = StudyImages.StudyImageID
			LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
			LEFT JOIN Hub.Notifications ON Images.SeriesUID = Notifications.SeriesUID
		WHERE Notifications.NotificationID = inNotificationID;
	ELSE
		SELECT NULL AS 'ItemID', NULL AS 'Property', NULL AS 'Value';
END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETNotificationsByPeopleType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETNotificationsByPeopleType`(IN inPeopleID INT, IN inNotificationType INT, IN inViewedFlag INT)
BEGIN

	IF inNotificationType = 3 THEN
		SELECT DISTINCT
			Notifications.NotificationID, 
			Notifications.QCSessionID, 
			QCSessionInfo.StudyName, 
			QCSessionInfo.SubjectName, 
			QCSessionInfo.ScanDate, 
			QCSessionInfo.StudyRoleName, 
			QCSessions.Token
		FROM 
			Hub.Notifications 
			LEFT JOIN ImagingRepositoryV6.QCSessionInfo ON Notifications.QCSessionID = QCSessionInfo.QCSessionID
			LEFT JOIN ImagingRepositoryV6.QCSessions ON Notifications.QCSessionID = QCSessions.QCSessionID
		WHERE 
			Notifications.PeopleID = inPeopleID
			AND Notifications.ViewedFlag = inViewedFlag;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `putNotification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `putNotification`(IN inPeopleID INT, IN inNotificationTypeID INT, IN inStudyUID VARCHAR(255), IN inViewToken VARCHAR(64))
BEGIN

INSERT INTO Hub.Notifications(PeopleID, NotificationTypeID, StudyUID, ViewToken) VALUES (inPeopleID, inNotificationTypeID, inStudyUID, inViewToken);
#SELECT 1 AS Variable;

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

-- Dump completed on 2016-01-12 15:18:19
