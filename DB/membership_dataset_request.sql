CREATE DATABASE  IF NOT EXISTS `membership` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `membership`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
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
-- Table structure for table `dataset_request`
--

DROP TABLE IF EXISTS `dataset_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_request` (
  `dataset_request_id` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `people_id` int(7) unsigned DEFAULT NULL COMMENT 'Data requestor',
  `network_site_id` mediumint(5) unsigned DEFAULT NULL,
  `project_title` char(255) DEFAULT NULL,
  `requestor` char(100) DEFAULT NULL,
  `project_leader` char(100) DEFAULT NULL,
  `mentors` char(200) DEFAULT 'N/A',
  `other_participants` char(255) DEFAULT 'N/A',
  `institutions` text,
  `project_description` text,
  `request` text COMMENT 'Description of the information being requested',
  `request_date` date DEFAULT NULL,
  `project_start_date` date DEFAULT NULL,
  `project_end_date` date DEFAULT NULL,
  `requestor_email` char(80) DEFAULT NULL,
  `agreement_flag` enum('y','n') DEFAULT NULL COMMENT 'Requestor agrees with the temrs of the repository',
  `request_type` enum('archived','standardized','both') DEFAULT NULL,
  `approval_flag` enum('y','n','pending') DEFAULT 'pending',
  `approval_date` date DEFAULT NULL COMMENT 'Date when the request was approved',
  `request_completion_date` date DEFAULT NULL COMMENT 'Date when the request was fulfilled',
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dataset_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 15:18:26
