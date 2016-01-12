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
-- Temporary table structure for view `user_datasets`
--

DROP TABLE IF EXISTS `user_datasets`;
/*!50001 DROP VIEW IF EXISTS `user_datasets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user_datasets` (
  `wp_id` tinyint NOT NULL,
  `people_id` tinyint NOT NULL,
  `site_id` tinyint NOT NULL,
  `network_site_id` tinyint NOT NULL,
  `dataset_id` tinyint NOT NULL,
  `dataset_type` tinyint NOT NULL,
  `our_study_title` tinyint NOT NULL,
  `study_title` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `archived_dataset_requests`
--

DROP TABLE IF EXISTS `archived_dataset_requests`;
/*!50001 DROP VIEW IF EXISTS `archived_dataset_requests`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `archived_dataset_requests` (
  `dataset_request_id` tinyint NOT NULL,
  `requestor` tinyint NOT NULL,
  `dataset_list` tinyint NOT NULL,
  `request_date` tinyint NOT NULL,
  `approval` tinyint NOT NULL,
  `approval_date` tinyint NOT NULL,
  `dataset_links` tinyint NOT NULL,
  `wp_id` tinyint NOT NULL,
  `network_site_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_site`
--

DROP TABLE IF EXISTS `user_site`;
/*!50001 DROP VIEW IF EXISTS `user_site`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user_site` (
  `people_id` tinyint NOT NULL,
  `site_id` tinyint NOT NULL,
  `wp_id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `site_code` tinyint NOT NULL,
  `lab` tinyint NOT NULL,
  `institution` tinyint NOT NULL,
  `site_acronym` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `dataset_assessment_list`
--

DROP TABLE IF EXISTS `dataset_assessment_list`;
/*!50001 DROP VIEW IF EXISTS `dataset_assessment_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dataset_assessment_list` (
  `dataset_id` tinyint NOT NULL,
  `our_study_title` tinyint NOT NULL,
  `assessment_list` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `archived_datasets`
--

DROP TABLE IF EXISTS `archived_datasets`;
/*!50001 DROP VIEW IF EXISTS `archived_datasets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `archived_datasets` (
  `dataset_id` tinyint NOT NULL,
  `our_study_title` tinyint NOT NULL,
  `irb_number` tinyint NOT NULL,
  `study_title` tinyint NOT NULL,
  `network_site_id` tinyint NOT NULL,
  `date_added` tinyint NOT NULL,
  `site` tinyint NOT NULL,
  `sample_size` tinyint NOT NULL,
  `field_strength` tinyint NOT NULL,
  `pi_name` tinyint NOT NULL,
  `authors` tinyint NOT NULL,
  `funding` tinyint NOT NULL,
  `publications` tinyint NOT NULL,
  `study_url` tinyint NOT NULL,
  `dataset_comments` tinyint NOT NULL,
  `scanner_name` tinyint NOT NULL,
  `acknowledgment` tinyint NOT NULL,
  `modalities_list` tinyint NOT NULL,
  `evoked_study_flag` tinyint NOT NULL,
  `visibility` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `standardized_datasets`
--

DROP TABLE IF EXISTS `standardized_datasets`;
/*!50001 DROP VIEW IF EXISTS `standardized_datasets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `standardized_datasets` (
  `dataset_id` tinyint NOT NULL,
  `our_study_title` tinyint NOT NULL,
  `irb_number` tinyint NOT NULL,
  `study_title` tinyint NOT NULL,
  `network_site_id` tinyint NOT NULL,
  `date_added` tinyint NOT NULL,
  `site` tinyint NOT NULL,
  `sample_size` tinyint NOT NULL,
  `field_strength` tinyint NOT NULL,
  `pi_name` tinyint NOT NULL,
  `authors` tinyint NOT NULL,
  `funding` tinyint NOT NULL,
  `publications` tinyint NOT NULL,
  `study_url` tinyint NOT NULL,
  `dataset_comments` tinyint NOT NULL,
  `scanner_name` tinyint NOT NULL,
  `acknowledgment` tinyint NOT NULL,
  `modalities_list` tinyint NOT NULL,
  `evoked_study_flag` tinyint NOT NULL,
  `visibility` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `dataset_requested_links`
--

DROP TABLE IF EXISTS `dataset_requested_links`;
/*!50001 DROP VIEW IF EXISTS `dataset_requested_links`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dataset_requested_links` (
  `dataset_request_id` tinyint NOT NULL,
  `dataset_list` tinyint NOT NULL,
  `dataset_links` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `dataset_modality_list`
--

DROP TABLE IF EXISTS `dataset_modality_list`;
/*!50001 DROP VIEW IF EXISTS `dataset_modality_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dataset_modality_list` (
  `dataset_id` tinyint NOT NULL,
  `our_study_title` tinyint NOT NULL,
  `modalities_list` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `dataset_requested_list`
--

DROP TABLE IF EXISTS `dataset_requested_list`;
/*!50001 DROP VIEW IF EXISTS `dataset_requested_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `dataset_requested_list` (
  `dataset_request_id` tinyint NOT NULL,
  `dataset_list` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `user_datasets`
--

/*!50001 DROP TABLE IF EXISTS `user_datasets`*/;
/*!50001 DROP VIEW IF EXISTS `user_datasets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `user_datasets` AS select `people`.`wp_id` AS `wp_id`,`people`.`people_id` AS `people_id`,`people`.`site_id` AS `site_id`,`network_site`.`network_site_id` AS `network_site_id`,`dataset`.`dataset_id` AS `dataset_id`,`dataset`.`dataset_type` AS `dataset_type`,`dataset`.`our_study_title` AS `our_study_title`,`dataset`.`study_title` AS `study_title` from (`people` left join (`network_site` left join `dataset` on((`network_site`.`network_site_id` = `dataset`.`network_site_id`))) on((`people`.`site_id` = `network_site`.`site_id`))) where (`dataset`.`dataset_id` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `archived_dataset_requests`
--

/*!50001 DROP TABLE IF EXISTS `archived_dataset_requests`*/;
/*!50001 DROP VIEW IF EXISTS `archived_dataset_requests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `archived_dataset_requests` AS select `dataset_request`.`dataset_request_id` AS `dataset_request_id`,concat(`people`.`last_name`,', ',`people`.`first_name`) AS `requestor`,`dataset_requested_list`.`dataset_list` AS `dataset_list`,`dataset_request`.`request_date` AS `request_date`,`dataset_request`.`approval_flag` AS `approval`,`dataset_request`.`approval_date` AS `approval_date`,`dataset_requested_links`.`dataset_links` AS `dataset_links`,`people`.`wp_id` AS `wp_id`,`dataset_request`.`network_site_id` AS `network_site_id` from (((`dataset_request` join `people` on((`people`.`people_id` = `dataset_request`.`people_id`))) join `dataset_requested_list` on((`dataset_request`.`dataset_request_id` = `dataset_requested_list`.`dataset_request_id`))) join `dataset_requested_links` on((`dataset_request`.`dataset_request_id` = `dataset_requested_links`.`dataset_request_id`))) where (`dataset_request`.`request_type` = 'archived') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_site`
--

/*!50001 DROP TABLE IF EXISTS `user_site`*/;
/*!50001 DROP VIEW IF EXISTS `user_site`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `user_site` AS select `people`.`people_id` AS `people_id`,`people`.`site_id` AS `site_id`,`people`.`wp_id` AS `wp_id`,`people`.`username` AS `username`,`people`.`email` AS `email`,`people`.`first_name` AS `first_name`,`people`.`last_name` AS `last_name`,`site`.`site_code` AS `site_code`,`site`.`lab` AS `lab`,`site`.`institution` AS `institution`,`site`.`site_acronym` AS `site_acronym` from (`people` left join `site` on((`people`.`site_id` = `site`.`site_id`))) where (`people`.`wp_id` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dataset_assessment_list`
--

/*!50001 DROP TABLE IF EXISTS `dataset_assessment_list`*/;
/*!50001 DROP VIEW IF EXISTS `dataset_assessment_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `dataset_assessment_list` AS select distinct `membership`.`dataset`.`dataset_id` AS `dataset_id`,`membership`.`dataset`.`our_study_title` AS `our_study_title`,group_concat(distinct `clinical_repository`.`assessment`.`assessment_name` order by `clinical_repository`.`assessment`.`assessment_name` ASC separator ', ') AS `assessment_list` from ((`membership`.`dataset` join `clinical_repository`.`assessment`) join `clinical_repository`.`dataset_assessment`) where ((`clinical_repository`.`dataset_assessment`.`assessment_id` = `clinical_repository`.`assessment`.`assessment_id`) and (`clinical_repository`.`dataset_assessment`.`dataset_id` = `membership`.`dataset`.`dataset_id`)) group by `membership`.`dataset`.`dataset_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `archived_datasets`
--

/*!50001 DROP TABLE IF EXISTS `archived_datasets`*/;
/*!50001 DROP VIEW IF EXISTS `archived_datasets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `archived_datasets` AS select `membership`.`dataset`.`dataset_id` AS `dataset_id`,`membership`.`dataset`.`our_study_title` AS `our_study_title`,`membership`.`dataset`.`irb_number` AS `irb_number`,`membership`.`dataset`.`study_title` AS `study_title`,`membership`.`dataset`.`network_site_id` AS `network_site_id`,`membership`.`dataset`.`date_added` AS `date_added`,concat(`membership`.`site`.`lab`,', ',`membership`.`site`.`institution`) AS `site`,`membership`.`dataset`.`sample_size` AS `sample_size`,`clinical_repository`.`scanner`.`field_strength` AS `field_strength`,concat(`membership`.`dataset`.`pi_last_name`,', ',`membership`.`dataset`.`pi_first_name`) AS `pi_name`,`membership`.`dataset`.`authors` AS `authors`,`membership`.`dataset`.`funding` AS `funding`,`membership`.`dataset`.`publications` AS `publications`,`membership`.`dataset`.`study_url` AS `study_url`,`membership`.`dataset`.`dataset_comments` AS `dataset_comments`,`clinical_repository`.`scanner`.`scanner_name` AS `scanner_name`,`membership`.`dataset`.`acknowledgment` AS `acknowledgment`,`dataset_modality_list`.`modalities_list` AS `modalities_list`,`membership`.`dataset`.`evoked_study_flag` AS `evoked_study_flag`,`membership`.`dataset`.`dataset_visibility` AS `visibility` from ((((`membership`.`dataset` join `clinical_repository`.`scanner` on((`membership`.`dataset`.`scanner_id` = `clinical_repository`.`scanner`.`scanner_id`))) join `membership`.`network_site` on((`membership`.`dataset`.`network_site_id` = `membership`.`network_site`.`network_site_id`))) join `membership`.`site` on((`membership`.`network_site`.`site_id` = `membership`.`site`.`site_id`))) join `membership`.`dataset_modality_list` on((`membership`.`dataset`.`dataset_id` = `dataset_modality_list`.`dataset_id`))) where ((`membership`.`dataset`.`dataset_type` = 'archived') and (`membership`.`dataset`.`dataset_visibility` = 'visible')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `standardized_datasets`
--

/*!50001 DROP TABLE IF EXISTS `standardized_datasets`*/;
/*!50001 DROP VIEW IF EXISTS `standardized_datasets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `standardized_datasets` AS select `membership`.`dataset`.`dataset_id` AS `dataset_id`,`membership`.`dataset`.`our_study_title` AS `our_study_title`,`membership`.`dataset`.`irb_number` AS `irb_number`,`membership`.`dataset`.`study_title` AS `study_title`,`membership`.`dataset`.`network_site_id` AS `network_site_id`,`membership`.`dataset`.`date_added` AS `date_added`,concat(`membership`.`site`.`lab`,', ',`membership`.`site`.`institution`) AS `site`,`membership`.`dataset`.`sample_size` AS `sample_size`,`clinical_repository`.`scanner`.`field_strength` AS `field_strength`,concat(`membership`.`dataset`.`pi_last_name`,', ',`membership`.`dataset`.`pi_first_name`) AS `pi_name`,`membership`.`dataset`.`authors` AS `authors`,`membership`.`dataset`.`funding` AS `funding`,`membership`.`dataset`.`publications` AS `publications`,`membership`.`dataset`.`study_url` AS `study_url`,`membership`.`dataset`.`dataset_comments` AS `dataset_comments`,`clinical_repository`.`scanner`.`scanner_name` AS `scanner_name`,`membership`.`dataset`.`acknowledgment` AS `acknowledgment`,`dataset_modality_list`.`modalities_list` AS `modalities_list`,`membership`.`dataset`.`evoked_study_flag` AS `evoked_study_flag`,`membership`.`dataset`.`dataset_visibility` AS `visibility` from ((((`membership`.`dataset` join `clinical_repository`.`scanner` on((`membership`.`dataset`.`scanner_id` = `clinical_repository`.`scanner`.`scanner_id`))) join `membership`.`network_site` on((`membership`.`dataset`.`network_site_id` = `membership`.`network_site`.`network_site_id`))) join `membership`.`site` on((`membership`.`network_site`.`site_id` = `membership`.`site`.`site_id`))) join `membership`.`dataset_modality_list` on((`membership`.`dataset`.`dataset_id` = `dataset_modality_list`.`dataset_id`))) where ((`membership`.`dataset`.`dataset_type` = 'standardized') and (`membership`.`dataset`.`dataset_visibility` = 'visible')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dataset_requested_links`
--

/*!50001 DROP TABLE IF EXISTS `dataset_requested_links`*/;
/*!50001 DROP VIEW IF EXISTS `dataset_requested_links`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `dataset_requested_links` AS select distinct `dataset_request`.`dataset_request_id` AS `dataset_request_id`,group_concat(distinct `dataset`.`our_study_title` order by `dataset`.`our_study_title` ASC separator ', ') AS `dataset_list`,if((`dataset_request`.`approval_flag` = 'pending'),'',if((curdate() > (`dataset_request`.`request_completion_date` + interval 30 day)),'Expired',group_concat(distinct `dataset_package`.`package_link` order by `dataset_package`.`package_link` ASC separator ', '))) AS `dataset_links` from (((`dataset_request` join `requested_dataset`) join `dataset`) join `dataset_package`) where ((`dataset`.`dataset_id` = `requested_dataset`.`dataset_id`) and (`requested_dataset`.`dataset_request_id` = `dataset_request`.`dataset_request_id`) and (`dataset_package`.`dataset_id` = `dataset`.`dataset_id`) and (`dataset_package`.`active_flag` = 'y')) group by `dataset_request`.`dataset_request_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dataset_modality_list`
--

/*!50001 DROP TABLE IF EXISTS `dataset_modality_list`*/;
/*!50001 DROP VIEW IF EXISTS `dataset_modality_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `dataset_modality_list` AS select distinct `membership`.`dataset`.`dataset_id` AS `dataset_id`,`membership`.`dataset`.`our_study_title` AS `our_study_title`,group_concat(distinct `clinical_repository`.`modality`.`modality_code` order by `clinical_repository`.`modality`.`modality_code` ASC separator ', ') AS `modalities_list` from ((`membership`.`dataset` join `clinical_repository`.`modality`) join `membership`.`dataset_modality`) where ((`membership`.`dataset_modality`.`modality_id` = `clinical_repository`.`modality`.`modality_id`) and (`membership`.`dataset_modality`.`dataset_id` = `membership`.`dataset`.`dataset_id`) and (`membership`.`dataset_modality`.`verified` = 'y')) group by `membership`.`dataset`.`dataset_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dataset_requested_list`
--

/*!50001 DROP TABLE IF EXISTS `dataset_requested_list`*/;
/*!50001 DROP VIEW IF EXISTS `dataset_requested_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `dataset_requested_list` AS select distinct `dataset_request`.`dataset_request_id` AS `dataset_request_id`,group_concat(distinct `dataset`.`our_study_title` order by `dataset`.`our_study_title` ASC separator ', ') AS `dataset_list` from ((`dataset_request` join `requested_dataset`) join `dataset`) where ((`dataset`.`dataset_id` = `requested_dataset`.`dataset_id`) and (`requested_dataset`.`dataset_request_id` = `dataset_request`.`dataset_request_id`)) group by `dataset_request`.`dataset_request_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'membership'
--
/*!50003 DROP PROCEDURE IF EXISTS `approximate_mod_subj_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ivani`@`%` PROCEDURE `approximate_mod_subj_count`(IN in_modality_code char(10))
    COMMENT 'Shows approximate subject counts per diagnosis and modality'
BEGIN

set @var_modality = in_modality_code;

select sum(dataset_sample.number_of_subjects) as approximate_subject_count, 
dataset_type, diagnosis_name as diagnosis, modality_code as modality
from membership.dataset, membership.dataset_sample, membership.dataset_modality, 
clinical_repository.diagnosis,
clinical_repository.modality
where dataset.dataset_id = dataset_sample.dataset_id
and dataset.dataset_id = dataset_modality.dataset_id
and dataset_sample.dataset_id = dataset_modality.dataset_id
and diagnosis.diagnosis_id = dataset_sample.diagnosis_id
and modality.modality_id = dataset_modality.modality_id
and modality_code = @var_modality
group by dataset_sample.diagnosis_id, dataset_modality.modality_id, dataset_type
order by dataset_type, diagnosis.diagnosis_name;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-12 13:41:40
