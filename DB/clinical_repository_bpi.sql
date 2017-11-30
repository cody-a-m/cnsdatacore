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
-- Table structure for table `bpi`
--

DROP TABLE IF EXISTS `bpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpi` (
  `bpi_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(7) unsigned DEFAULT NULL,
  `dataset_id` mediumint(7) unsigned DEFAULT NULL,
  `DEM00114` tinyint(3) unsigned DEFAULT NULL COMMENT 'visit number',
  `DEM00101` date DEFAULT NULL COMMENT 'exam date',
  `DEM00102` char(20) NOT NULL COMMENT 'subject_identifier as provided by site',
  `BPIS0101` smallint(3) unsigned DEFAULT NULL,
  `BPIS0201` smallint(3) unsigned DEFAULT NULL,
  `BPIS0202` smallint(3) unsigned DEFAULT NULL,
  `BPIS0203` smallint(3) unsigned DEFAULT NULL,
  `BPIS0204` smallint(3) unsigned DEFAULT NULL,
  `BPIS0205` smallint(3) unsigned DEFAULT NULL,
  `BPIS0206` smallint(3) unsigned DEFAULT NULL,
  `BPIS0207` smallint(3) unsigned DEFAULT NULL,
  `BPIS0208` smallint(3) unsigned DEFAULT NULL,
  `BPIS0209` smallint(3) unsigned DEFAULT NULL,
  `BPIS0210` smallint(3) unsigned DEFAULT NULL,
  `BPIS0211` smallint(3) unsigned DEFAULT NULL,
  `BPIS0212` smallint(3) unsigned DEFAULT NULL,
  `BPIS0213` smallint(3) unsigned DEFAULT NULL,
  `BPIS0214` smallint(3) unsigned DEFAULT NULL,
  `BPIS0215` smallint(3) unsigned DEFAULT NULL,
  `BPIS0216` smallint(3) unsigned DEFAULT NULL,
  `BPIS0217` smallint(3) unsigned DEFAULT NULL,
  `BPIS0218` smallint(3) unsigned DEFAULT NULL,
  `BPIS0219` smallint(3) unsigned DEFAULT NULL,
  `BPIS0220` smallint(3) unsigned DEFAULT NULL,
  `BPIS0221` smallint(3) unsigned DEFAULT NULL,
  `BPIS0222` smallint(3) unsigned DEFAULT NULL,
  `BPIS0223` smallint(3) unsigned DEFAULT NULL,
  `BPIS0224` smallint(3) unsigned DEFAULT NULL,
  `BPIS0225` smallint(3) unsigned DEFAULT NULL,
  `BPIS0226` smallint(3) unsigned DEFAULT NULL,
  `BPIS0227` smallint(3) unsigned DEFAULT NULL,
  `BPIS0228` smallint(3) unsigned DEFAULT NULL,
  `BPIS0229` smallint(3) unsigned DEFAULT NULL,
  `BPIS0230` smallint(3) unsigned DEFAULT NULL,
  `BPIS0231` smallint(3) unsigned DEFAULT NULL,
  `BPIS0232` smallint(3) unsigned DEFAULT NULL,
  `BPIS0233` smallint(3) unsigned DEFAULT NULL,
  `BPIS0234` smallint(3) unsigned DEFAULT NULL,
  `BPIS0235` smallint(3) unsigned DEFAULT NULL,
  `BPIS0236` smallint(3) unsigned DEFAULT NULL,
  `BPIS0237` smallint(3) unsigned DEFAULT NULL,
  `BPIS0238` smallint(3) unsigned DEFAULT NULL,
  `BPIS0239` smallint(3) unsigned DEFAULT NULL,
  `BPIS0240` smallint(3) unsigned DEFAULT NULL,
  `BPIS0241` smallint(3) unsigned DEFAULT NULL,
  `BPIS0242` smallint(3) unsigned DEFAULT NULL,
  `BPIS0243` smallint(3) unsigned DEFAULT NULL,
  `BPIS0244` smallint(3) unsigned DEFAULT NULL,
  `BPIS0245` smallint(3) unsigned DEFAULT NULL,
  `BPIS0246` smallint(3) unsigned DEFAULT NULL,
  `BPIS0301` smallint(3) unsigned DEFAULT NULL,
  `BPIS0401` smallint(3) unsigned DEFAULT NULL,
  `BPIS0501` smallint(3) unsigned DEFAULT NULL,
  `BPIS0601` smallint(3) unsigned DEFAULT NULL,
  `BPIS0701` text,
  `BPIS0801` char(4) DEFAULT NULL,
  `BPIS0901` smallint(3) unsigned DEFAULT NULL,
  `BPIS0902` smallint(3) unsigned DEFAULT NULL,
  `BPIS0903` smallint(3) unsigned DEFAULT NULL,
  `BPIS0904` smallint(3) unsigned DEFAULT NULL,
  `BPIS0905` smallint(3) unsigned DEFAULT NULL,
  `BPIS0906` smallint(3) unsigned DEFAULT NULL,
  `BPIS0907` smallint(3) unsigned DEFAULT NULL,
  `BPIS1001` float DEFAULT NULL COMMENT 'Total pain severity score',
  `BPIS1002` float DEFAULT NULL COMMENT 'Total pain interference score',
  `date_added` date DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bpi_id`)
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

-- Dump completed on 2016-01-12 15:18:24
