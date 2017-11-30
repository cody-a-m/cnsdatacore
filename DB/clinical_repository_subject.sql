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
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subject_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint(5) unsigned DEFAULT NULL,
  `dataset_id` mediumint(7) unsigned DEFAULT NULL,
  `pain_subject_id` char(10) DEFAULT NULL COMMENT 'pain subject id assigned to subject',
  `imaging_subject_id` int(7) unsigned DEFAULT NULL COMMENT 'References ImagingRepository.StudySubjects.SubjectID',
  `exam_date` date DEFAULT NULL,
  `subject_identifier` char(20) DEFAULT NULL COMMENT 'subject id as provided by site',
  `subject_type` smallint(3) unsigned DEFAULT NULL COMMENT '1 = control, 2 = pain, 999 = unknown',
  `country_number` smallint(3) unsigned DEFAULT NULL COMMENT 'References membership.country.country_number',
  `sex` smallint(3) unsigned DEFAULT NULL COMMENT '1 = male, 2 = female, 888 = not collected, 999= unknown',
  `age` float DEFAULT NULL COMMENT 'age at baseline',
  `handedness` smallint(3) unsigned DEFAULT NULL COMMENT '1 = right, 2 = left, 3 = ambidextrous, 888 = not collected, 999 = unknown',
  `education` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `bmi` float DEFAULT NULL COMMENT 'body mass index',
  `race_id` smallint(3) unsigned DEFAULT NULL COMMENT '1= African, 2= Asian, 3= Pacific Islander, 4= White, 5= Other, 777= refused, 888= not collected, 999= unknown',
  `race_other` char(30) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `update_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8;
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
