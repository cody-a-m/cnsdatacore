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
-- Table structure for table `people_test`
--

DROP TABLE IF EXISTS `people_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_test` (
  `people_id` int(7) unsigned NOT NULL AUTO_INCREMENT COMMENT 'wp people id',
  `site_id` mediumint(5) unsigned DEFAULT NULL,
  `user_type_id` tinyint(2) unsigned DEFAULT NULL,
  `first_name` char(50) DEFAULT NULL,
  `last_name` char(50) DEFAULT NULL,
  `degree_id` tinyint(2) unsigned DEFAULT NULL,
  `academic_title` char(200) DEFAULT NULL,
  `institution` char(200) DEFAULT NULL,
  `laboratory` char(255) DEFAULT NULL,
  `country_number` smallint(3) unsigned DEFAULT NULL,
  `username` char(30) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `reason` text,
  `active_flag` enum('new','active','inactive') DEFAULT 'new',
  `notes` text,
  `date_added` datetime DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `standardized_membership` varchar(45) DEFAULT NULL,
  `archived_membership` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`people_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 15:18:30
