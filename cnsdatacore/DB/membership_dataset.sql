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
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset` (
  `dataset_id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `network_site_id` mediumint(5) unsigned DEFAULT NULL,
  `application_id` mediumint(7) unsigned DEFAULT NULL,
  `scanner_id` smallint(4) unsigned DEFAULT NULL,
  `image_type_id` tinyint(2) unsigned DEFAULT NULL,
  `study_id` smallint(5) unsigned DEFAULT NULL COMMENT 'reference ImagingRepository.Studies.StudyID',
  `study_title` char(255) DEFAULT NULL COMMENT 'provided by collaborator',
  `our_study_title` char(100) DEFAULT NULL COMMENT 'defined by our center',
  `study_url` char(255) DEFAULT NULL,
  `pi_first_name` char(30) DEFAULT NULL,
  `pi_last_name` char(80) DEFAULT NULL,
  `acknowledgment` text,
  `methods` enum('pending','received','not available') DEFAULT 'pending',
  `authors` text,
  `funding` text,
  `sample_size` char(200) DEFAULT NULL,
  `publications` text,
  `data_type` enum('control','pain','both') DEFAULT NULL,
  `evoked_study_flag` enum('evoked','non-evoked') DEFAULT 'non-evoked',
  `longitudinal_flag` enum('y,','n') DEFAULT 'n' COMMENT 'Is this a longitudinal study?',
  `dataset_comments` char(255) DEFAULT NULL,
  `dataset_visibility` enum('invisible','visible','recalled') DEFAULT 'invisible',
  `visibility_change_date` date DEFAULT NULL,
  `irb_status` enum('pending','requested','received') DEFAULT 'pending',
  `irb_number` char(20) DEFAULT NULL,
  `irb_date` date DEFAULT NULL,
  `consent_status` enum('pending','requested','received') DEFAULT 'pending',
  `data_sharing_agreement` enum('pending','received','not applicable') DEFAULT 'pending',
  `data_sharing_signature` enum('principal investigator','proxy') DEFAULT NULL,
  `data_sharing_proxy` char(100) DEFAULT NULL COMMENT 'name of the person authorized to sign the data sharing agreement if not the PI',
  `dataset_qc_status` enum('passed','failed','pending_review') DEFAULT 'pending_review',
  `dataset_qc_notes` char(255) DEFAULT NULL,
  `dataset_qc_date` date DEFAULT NULL,
  `dataset_type` enum('archived','standardized') DEFAULT NULL,
  `announcement` enum('pending','posted') DEFAULT 'pending' COMMENT 'announcement about new dataset available posted',
  `packaged_dataset` enum('y','n') DEFAULT 'n' COMMENT 'Has the dataset been prepared for distribution?',
  `date_added` date DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dataset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
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
