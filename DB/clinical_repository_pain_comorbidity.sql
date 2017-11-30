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
-- Table structure for table `pain_comorbidity`
--

DROP TABLE IF EXISTS `pain_comorbidity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pain_comorbidity` (
  `pain_comorbidity_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(7) unsigned DEFAULT NULL,
  `dataset_id` mediumint(7) unsigned DEFAULT NULL,
  `DEM00101` date DEFAULT NULL,
  `DEM00102` char(20) DEFAULT NULL COMMENT 'subject_identifier as provided by site',
  `DI001001` smallint(3) unsigned DEFAULT NULL,
  `DI001002` smallint(3) unsigned DEFAULT NULL,
  `DI001003` smallint(3) unsigned DEFAULT NULL,
  `DI001004` smallint(3) unsigned DEFAULT NULL,
  `DI001005` smallint(3) unsigned DEFAULT NULL,
  `DI001006` smallint(3) unsigned DEFAULT NULL,
  `DI001007` smallint(3) unsigned DEFAULT NULL,
  `DI001008` smallint(3) unsigned DEFAULT NULL,
  `DI001009` smallint(3) unsigned DEFAULT NULL,
  `DI001010` smallint(3) unsigned DEFAULT NULL,
  `DI002001` smallint(3) unsigned DEFAULT NULL,
  `DI002002` smallint(3) unsigned DEFAULT NULL,
  `DI002003` smallint(3) unsigned DEFAULT NULL,
  `DI002004` smallint(3) unsigned DEFAULT NULL,
  `DI002005` smallint(3) unsigned DEFAULT NULL,
  `DI002006` smallint(3) unsigned DEFAULT NULL,
  `DI002007` smallint(3) unsigned DEFAULT NULL,
  `DI002008` smallint(3) unsigned DEFAULT NULL,
  `DI002009` smallint(3) unsigned DEFAULT NULL,
  `DI002010` smallint(3) unsigned DEFAULT NULL,
  `DI002011` smallint(3) unsigned DEFAULT NULL,
  `DI002012` smallint(3) unsigned DEFAULT NULL,
  `DI002013` smallint(3) unsigned DEFAULT NULL,
  `DI002014` smallint(3) unsigned DEFAULT NULL,
  `DI002015` smallint(3) unsigned DEFAULT NULL,
  `DI002016` smallint(3) unsigned DEFAULT NULL,
  `DI002017` smallint(3) unsigned DEFAULT NULL,
  `DI002018` smallint(3) unsigned DEFAULT NULL,
  `DI002019` smallint(3) unsigned DEFAULT NULL,
  `DI002020` smallint(3) unsigned DEFAULT NULL,
  `DI002021` smallint(3) unsigned DEFAULT NULL,
  `DI002022` smallint(3) unsigned DEFAULT NULL,
  `DI002023` smallint(3) unsigned DEFAULT NULL,
  `DI002024` smallint(3) unsigned DEFAULT NULL,
  `DI002025` smallint(3) unsigned DEFAULT NULL,
  `DI002026` smallint(3) unsigned DEFAULT NULL,
  `DI002027` smallint(3) unsigned DEFAULT NULL,
  `DI002028` smallint(3) unsigned DEFAULT NULL,
  `DI003001` smallint(3) unsigned DEFAULT NULL,
  `DI003002` smallint(3) unsigned DEFAULT NULL,
  `DI003003` smallint(3) unsigned DEFAULT NULL,
  `DI003004` smallint(3) unsigned DEFAULT NULL,
  `DI003005` smallint(3) unsigned DEFAULT NULL,
  `DI003006` smallint(3) unsigned DEFAULT NULL,
  `DI003007` smallint(3) unsigned DEFAULT NULL,
  `DI003008` smallint(3) unsigned DEFAULT NULL,
  `DI003009` smallint(3) unsigned DEFAULT NULL,
  `DI003010` smallint(3) unsigned DEFAULT NULL,
  `DI003011` smallint(3) unsigned DEFAULT NULL,
  `DI003012` smallint(3) unsigned DEFAULT NULL,
  `DI004001` smallint(3) unsigned DEFAULT NULL,
  `DI004002` smallint(3) unsigned DEFAULT NULL,
  `DI004003` smallint(3) unsigned DEFAULT NULL,
  `DI004004` smallint(3) unsigned DEFAULT NULL,
  `DI004005` smallint(3) unsigned DEFAULT NULL,
  `DI004006` smallint(3) unsigned DEFAULT NULL,
  `DI004007` smallint(3) unsigned DEFAULT NULL,
  `DI004008` smallint(3) unsigned DEFAULT NULL,
  `DI005001` smallint(3) unsigned DEFAULT NULL,
  `DI005002` smallint(3) unsigned DEFAULT NULL,
  `DI005003` smallint(3) unsigned DEFAULT NULL,
  `DI005004` smallint(3) unsigned DEFAULT NULL,
  `DI005005` smallint(3) unsigned DEFAULT NULL,
  `DI005006` smallint(3) unsigned DEFAULT NULL,
  `DI006001` smallint(3) unsigned DEFAULT NULL,
  `DI006002` smallint(3) unsigned DEFAULT NULL,
  `DI006003` smallint(3) unsigned DEFAULT NULL,
  `DI006004` smallint(3) unsigned DEFAULT NULL,
  `DI006005` smallint(3) unsigned DEFAULT NULL,
  `DI006006` smallint(3) unsigned DEFAULT NULL,
  `DI006007` smallint(3) unsigned DEFAULT NULL,
  `DI006008` smallint(3) unsigned DEFAULT NULL,
  `DI006009` smallint(3) unsigned DEFAULT NULL,
  `DI006010` smallint(3) unsigned DEFAULT NULL,
  `DI006011` smallint(3) unsigned DEFAULT NULL,
  `DI006012` smallint(3) unsigned DEFAULT NULL,
  `DI006013` smallint(3) unsigned DEFAULT NULL,
  `DI006014` smallint(3) unsigned DEFAULT NULL,
  `DI007001` smallint(3) unsigned DEFAULT NULL,
  `DI007002` smallint(3) unsigned DEFAULT NULL,
  `DI007003` smallint(3) unsigned DEFAULT NULL,
  `DI007004` smallint(3) unsigned DEFAULT NULL,
  `DI007005` smallint(3) unsigned DEFAULT NULL,
  `DI007006` smallint(3) unsigned DEFAULT NULL,
  `DI007007` smallint(3) unsigned DEFAULT NULL,
  `DI007008` smallint(3) unsigned DEFAULT NULL,
  `DI007009` smallint(3) unsigned DEFAULT NULL,
  `DI007010` smallint(3) unsigned DEFAULT NULL,
  `DI008001` smallint(3) unsigned DEFAULT NULL,
  `DI009001` smallint(3) unsigned DEFAULT NULL,
  `DI009002` smallint(3) unsigned DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pain_comorbidity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 15:18:25
