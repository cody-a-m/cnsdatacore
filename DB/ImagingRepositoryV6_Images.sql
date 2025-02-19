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
-- Table structure for table `Images`
--

DROP TABLE IF EXISTS `Images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Images` (
  `ImageID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ScanSessionID` int(11) unsigned NOT NULL,
  `SequenceID` int(11) unsigned NOT NULL,
  `SeriesUID` varchar(255) NOT NULL,
  `SequenceNumber` int(11) NOT NULL,
  `DirectoryPath` varchar(255) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ImageID`),
  UNIQUE KEY `SeriesUID_UNIQUE` (`SeriesUID`),
  UNIQUE KEY `uq-ScanSessionID-SequenceNumber` (`SequenceNumber`,`ScanSessionID`),
  KEY `fk-Images-Sequences_idx` (`SequenceID`),
  KEY `fk-Images-ScanSessions_idx` (`ScanSessionID`),
  CONSTRAINT `fk-Images-ScanSessions` FOREIGN KEY (`ScanSessionID`) REFERENCES `ScanSessions` (`ScanSessionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-Images-Sequences` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10294 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 15:18:16
