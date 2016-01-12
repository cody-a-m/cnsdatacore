CREATE DATABASE  IF NOT EXISTS `ImagingRepositoryV6` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ImagingRepositoryV6`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
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
-- Table structure for table `QCAnswers`
--

DROP TABLE IF EXISTS `QCAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QCAnswers` (
  `QCAnswerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `QCSessionID` int(10) unsigned NOT NULL,
  `NumericData` decimal(15,5) DEFAULT NULL,
  `TextData` varchar(255) DEFAULT NULL,
  `QCChoiceID` int(10) unsigned NOT NULL,
  `BrainRegionID` smallint(5) unsigned DEFAULT NULL,
  `Laterality` tinyint(4) DEFAULT '0' COMMENT '-1:left; 0:both; 1:right',
  `BrainRegionDirection` tinyint(4) DEFAULT '0' COMMENT '-3: posterior; -2: inferior; -1: medial; 0:all; 1: lateral; 2; superior; 3:anterior',
  `VolumeNumber` int(10) unsigned NOT NULL DEFAULT '0',
  `XCoord` smallint(4) NOT NULL DEFAULT '0',
  `YCoord` smallint(4) NOT NULL DEFAULT '0',
  `ZCoord` smallint(4) NOT NULL DEFAULT '0',
  `DBSyncID` int(10) unsigned NOT NULL DEFAULT '0',
  `Comments` varchar(250) DEFAULT '',
  `TimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`QCAnswerID`),
  KEY `QCSessionID` (`QCSessionID`),
  KEY `DBSyncID` (`DBSyncID`),
  KEY `QCChoiceID` (`QCChoiceID`),
  KEY `fk-QCAnswers-BrainRegions_idx` (`BrainRegionID`),
  CONSTRAINT `fk-QCAnswers-QCChoices` FOREIGN KEY (`QCChoiceID`) REFERENCES `QCChoices` (`QCChoiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-QCAnswers-QCSessions` FOREIGN KEY (`QCSessionID`) REFERENCES `QCSessions` (`QCSessionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=221089 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 13:41:32
