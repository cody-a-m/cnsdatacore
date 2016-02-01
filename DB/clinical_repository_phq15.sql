CREATE DATABASE  IF NOT EXISTS `clinical_repository` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `clinical_repository`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
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
-- Table structure for table `phq15`
--

DROP TABLE IF EXISTS `phq15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phq15` (
  `phq15_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(7) unsigned DEFAULT NULL,
  `dataset_id` mediumint(7) unsigned DEFAULT NULL,
  `DEM00114` tinyint(2) unsigned DEFAULT NULL COMMENT 'visit number',
  `DEM00101` date DEFAULT NULL COMMENT 'exam date',
  `DEM00102` char(20) DEFAULT NULL COMMENT 'subject identifier as provided by site',
  `PHQ15101` smallint(3) unsigned DEFAULT NULL,
  `PHQ15102` smallint(3) unsigned DEFAULT NULL,
  `PHQ15103` smallint(3) unsigned DEFAULT NULL,
  `PHQ15104` smallint(3) unsigned DEFAULT NULL,
  `PHQ15105` smallint(3) unsigned DEFAULT NULL,
  `PHQ15106` smallint(3) unsigned DEFAULT NULL,
  `PHQ15107` smallint(3) unsigned DEFAULT NULL,
  `PHQ15108` smallint(3) unsigned DEFAULT NULL,
  `PHQ15109` smallint(3) unsigned DEFAULT NULL,
  `PHQ15110` smallint(3) unsigned DEFAULT NULL,
  `PHQ15111` smallint(3) unsigned DEFAULT NULL,
  `PHQ15112` smallint(3) unsigned DEFAULT NULL,
  `PHQ15113` smallint(3) unsigned DEFAULT NULL,
  `PHQ15114` smallint(3) unsigned DEFAULT NULL,
  `PHQ15115` smallint(3) unsigned DEFAULT NULL,
  `PHQ15116` smallint(3) unsigned DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`phq15_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 15:18:23
