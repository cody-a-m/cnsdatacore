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
-- Table structure for table `ParameterStandards`
--

DROP TABLE IF EXISTS `ParameterStandards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParameterStandards` (
  `ParameterStandardID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SequenceID` int(10) unsigned NOT NULL,
  `QCQuestionID` smallint(5) unsigned NOT NULL,
  `ValueRegex` varchar(255) DEFAULT NULL,
  `ValueMin` decimal(10,3) DEFAULT NULL,
  `ValueMax` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`ParameterStandardID`),
  UNIQUE KEY `ParameterStandardID_UNIQUE` (`ParameterStandardID`),
  UNIQUE KEY `uq-ParameterStandards-QCQuestion-Sequence` (`SequenceID`,`QCQuestionID`),
  KEY `fk-ParameterStandards-Sequences_idx` (`SequenceID`),
  KEY `fk-ParameterStandards-QCQuestions_idx` (`QCQuestionID`),
  CONSTRAINT `fk-ParameterStandards-QCQuestions` FOREIGN KEY (`QCQuestionID`) REFERENCES `QCQuestions` (`QCQuestionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-ParameterStandards-Sequences` FOREIGN KEY (`SequenceID`) REFERENCES `Sequences` (`SequenceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 13:41:33
