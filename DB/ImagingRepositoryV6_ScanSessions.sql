CREATE DATABASE  IF NOT EXISTS `ImagingRepositoryV6` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ImagingRepositoryV6`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: cns5.med.ucla.edu    Database: ImagingRepositoryV6
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
-- Table structure for table `ScanSessions`
--

DROP TABLE IF EXISTS `ScanSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScanSessions` (
  `ScanSessionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProtocolID` int(11) unsigned NOT NULL,
  `SubjectID` int(11) unsigned NOT NULL,
  `ScanDate` date NOT NULL,
  `StudyUID` varchar(255) NOT NULL,
  `ScannerID` int(11) unsigned NOT NULL,
  `VisitID` int(10) unsigned DEFAULT NULL,
  `TimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `Token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ScanSessionID`),
  UNIQUE KEY `StudyUID_UNIQUE` (`StudyUID`),
  KEY `fk-ScanSessions-Subjects_idx` (`SubjectID`),
  KEY `fk-ScanSessions-Protocols_idx` (`ProtocolID`),
  KEY `fk-ScanSessions-Scanners_idx` (`ScannerID`),
  CONSTRAINT `fk-ScanSessions-Protocols` FOREIGN KEY (`ProtocolID`) REFERENCES `Protocols` (`ProtocolID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-ScanSessions-Scanners` FOREIGN KEY (`ScannerID`) REFERENCES `Scanners` (`ScannerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-ScanSessions-Subjects` FOREIGN KEY (`SubjectID`) REFERENCES `Subjects` (`SubjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mher`@`%`*/ /*!50003 TRIGGER `ScanSessions_BINS` BEFORE INSERT ON `ScanSessions` FOR EACH ROW
BEGIN
	SET New.Token = SHA2(CONCAT(UNIX_TIMESTAMP(), New.StudyUID), 224);
END */;;
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

-- Dump completed on 2016-01-12 15:18:10
