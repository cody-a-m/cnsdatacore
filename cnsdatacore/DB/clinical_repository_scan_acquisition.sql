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
-- Table structure for table `scan_acquisition`
--

DROP TABLE IF EXISTS `scan_acquisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scan_acquisition` (
  `scan_acquisition_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(7) unsigned DEFAULT NULL,
  `dataset_id` mediumint(7) unsigned DEFAULT NULL,
  `DEM00114` tinyint(2) unsigned DEFAULT NULL COMMENT 'visit number',
  `DEM00101` date DEFAULT NULL COMMENT 'exam date',
  `DEM00102` char(20) DEFAULT NULL COMMENT 'subject id as provided by site',
  `awake_flag` smallint(3) unsigned DEFAULT NULL COMMENT 'Did the subject remain awake during acquisition? 1= yes 2=no, 3= uncertain, 888 = not collected',
  `alcohol` smallint(3) unsigned DEFAULT NULL COMMENT 'alcohol intake up to 24 hs prior to scan session',
  `alcohol_amount` smallint(3) unsigned DEFAULT NULL,
  `tobacco` smallint(3) unsigned DEFAULT NULL COMMENT 'tobacco smoke up to 24 hs prior to scan session',
  `tobacco_amount` smallint(3) unsigned DEFAULT NULL,
  `caffeine` smallint(3) unsigned DEFAULT NULL COMMENT 'caffeine intake up to 24 hs prior to scan session',
  `caffeine_amount` smallint(3) unsigned DEFAULT NULL,
  `bpi_6` smallint(3) unsigned DEFAULT NULL COMMENT 'bpi item # 6 -How much pain you have right now?- at acquisition time',
  `date_added` date DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`scan_acquisition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 13:41:37
