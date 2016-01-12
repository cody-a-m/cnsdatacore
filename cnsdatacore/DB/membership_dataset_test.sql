CREATE DATABASE  IF NOT EXISTS `membership` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `membership`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: cns5.med.ucla.edu    Database: membership
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
-- Table structure for table `dataset_test`
--

DROP TABLE IF EXISTS `dataset_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_test` (
  `dataset_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `network_site_id` mediumint(5) unsigned DEFAULT NULL,
  `application_id` mediumint(7) unsigned DEFAULT NULL,
  `scanner_id` smallint(4) unsigned DEFAULT NULL,
  `study_id` smallint(5) unsigned DEFAULT NULL COMMENT 'reference ImagingRepository.Studies.StudyID',
  `study_title` char(255) DEFAULT NULL,
  `study_url` char(255) DEFAULT NULL,
  `pi_first_name` char(30) DEFAULT NULL,
  `pi_last_name` char(80) DEFAULT NULL,
  `acknowledgment` text,
  `methods` enum('pending','received') DEFAULT 'pending',
  `authors` text,
  `funding` text,
  `sample_size` char(100) DEFAULT NULL,
  `publications` text,
  `data_type` enum('control','pain','both') DEFAULT NULL,
  `dataset_comments` char(255) DEFAULT NULL,
  `dataset_status` enum('invisible','visible','recalled') DEFAULT 'invisible',
  `status_change_date` date DEFAULT NULL,
  `irb_status` enum('pending','requested','received') DEFAULT 'pending',
  `irb_number` char(20) DEFAULT NULL,
  `irb_expiration_date` date DEFAULT NULL,
  `consent_status` enum('pending','requested','received') DEFAULT 'pending',
  `dataset_type` enum('archived','standardized') DEFAULT NULL,
  `membership_agreement_flag` enum('y','n') DEFAULT NULL COMMENT 'additional membership agreement required',
  `announcement` enum('pending','posted') DEFAULT 'pending' COMMENT 'announcement about new dataset available posted',
  `date_added` datetime DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_sharing_signature` varchar(45) DEFAULT NULL,
  `data_sharing_proxy` varchar(45) DEFAULT NULL,
  `our_study_title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dataset_id`),
  KEY `network_site_id` (`network_site_id`),
  KEY `application_id` (`application_id`),
  KEY `study_id` (`study_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 13:41:38
