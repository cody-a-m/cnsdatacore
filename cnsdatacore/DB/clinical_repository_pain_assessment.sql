CREATE DATABASE  IF NOT EXISTS `clinical_repository` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `clinical_repository`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: cns5.med.ucla.edu    Database: clinical_repository
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
-- Table structure for table `pain_assessment`
--

DROP TABLE IF EXISTS `pain_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pain_assessment` (
  `pain_assessment_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(7) unsigned DEFAULT NULL,
  `dataset_id` mediumint(7) unsigned DEFAULT NULL,
  `DEM00114` tinyint(2) unsigned DEFAULT NULL COMMENT 'visit number',
  `DEM00101` date DEFAULT NULL COMMENT 'exam date',
  `DEM00102` char(20) DEFAULT NULL COMMENT 'subject_identifier as provided by site',
  `HAD00115` smallint(3) unsigned DEFAULT NULL COMMENT 'total depression',
  `HAD00116` smallint(3) unsigned DEFAULT NULL COMMENT 'total anxiety',
  `CSQC0600` smallint(3) unsigned DEFAULT NULL,
  `IPIN0601` smallint(3) unsigned DEFAULT NULL COMMENT 'total neuroticism',
  `IPIN0602` smallint(3) unsigned DEFAULT NULL COMMENT 'total extravension',
  `ETIS0601` smallint(3) unsigned DEFAULT NULL COMMENT 'total general',
  `ETIS0602` smallint(3) unsigned DEFAULT NULL COMMENT 'total physical',
  `ETIS0603` smallint(3) unsigned DEFAULT NULL COMMENT 'total emotional',
  `ETIS0604` smallint(3) unsigned DEFAULT NULL COMMENT 'total sexual',
  `PAN00121` smallint(3) unsigned DEFAULT NULL COMMENT 'total positive',
  `PAN00122` smallint(3) unsigned DEFAULT NULL COMMENT 'total negative',
  `MSS01001` smallint(3) unsigned DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pain_assessment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 13:41:36
