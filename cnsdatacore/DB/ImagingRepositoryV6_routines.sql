CREATE DATABASE  IF NOT EXISTS `ImagingRepositoryV6` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ImagingRepositoryV6`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: cns5.med.ucla.edu    Database: ImagingRepositoryV6
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
-- Temporary table structure for view `MAPP2SubReport`
--

DROP TABLE IF EXISTS `MAPP2SubReport`;
/*!50001 DROP VIEW IF EXISTS `MAPP2SubReport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MAPP2SubReport` (
  `UploadID` tinyint NOT NULL,
  `UploadTime` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `Note` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `QCSessionInfo`
--

DROP TABLE IF EXISTS `QCSessionInfo`;
/*!50001 DROP VIEW IF EXISTS `QCSessionInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `QCSessionInfo` (
  `QCSessionID` tinyint NOT NULL,
  `QCDate` tinyint NOT NULL,
  `Finalized` tinyint NOT NULL,
  `DBSyncID` tinyint NOT NULL,
  `FinalizedDate` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL,
  `StudyRoleID` tinyint NOT NULL,
  `StudyRoleName` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `NetworkName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SubjectRolesCrossStudyInfo`
--

DROP TABLE IF EXISTS `SubjectRolesCrossStudyInfo`;
/*!50001 DROP VIEW IF EXISTS `SubjectRolesCrossStudyInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SubjectRolesCrossStudyInfo` (
  `StudyRoleID` tinyint NOT NULL,
  `StudyRoleName` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `NetworkName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SubjectRolesCrossStudyToQCAnswers`
--

DROP TABLE IF EXISTS `SubjectRolesCrossStudyToQCAnswers`;
/*!50001 DROP VIEW IF EXISTS `SubjectRolesCrossStudyToQCAnswers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SubjectRolesCrossStudyToQCAnswers` (
  `StudyRoleID` tinyint NOT NULL,
  `StudyRoleName` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `NetworkName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL,
  `QCSessionID` tinyint NOT NULL,
  `QCDate` tinyint NOT NULL,
  `FinalizedDate` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL,
  `QCAnswerID` tinyint NOT NULL,
  `NumericData` tinyint NOT NULL,
  `TextData` tinyint NOT NULL,
  `Laterality` tinyint NOT NULL,
  `BrainRegionDirection` tinyint NOT NULL,
  `VolumeNumber` tinyint NOT NULL,
  `XCoord` tinyint NOT NULL,
  `YCoord` tinyint NOT NULL,
  `ZCoord` tinyint NOT NULL,
  `DBSyncID` tinyint NOT NULL,
  `Comments` tinyint NOT NULL,
  `TimeStamp` tinyint NOT NULL,
  `QCChoiceID` tinyint NOT NULL,
  `QCChoiceOrder` tinyint NOT NULL,
  `QCChoiceName` tinyint NOT NULL,
  `AlertFlag` tinyint NOT NULL,
  `QCQuestionID` tinyint NOT NULL,
  `QCQuestionName` tinyint NOT NULL,
  `QCQuestionDescription` tinyint NOT NULL,
  `QCLevel` tinyint NOT NULL,
  `RequiredFlag` tinyint NOT NULL,
  `UniqueFlag` tinyint NOT NULL,
  `HumanFlag` tinyint NOT NULL,
  `OverallFlag` tinyint NOT NULL,
  `NumericFlag` tinyint NOT NULL,
  `TextFlag` tinyint NOT NULL,
  `DICOMTag` tinyint NOT NULL,
  `QCReportID` tinyint NOT NULL,
  `QCReportName` tinyint NOT NULL,
  `BrainRegionID` tinyint NOT NULL,
  `BrainRegionName` tinyint NOT NULL,
  `NativeID` tinyint NOT NULL,
  `ParentID` tinyint NOT NULL,
  `AtlasID` tinyint NOT NULL,
  `AtlasName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `StudyInfo`
--

DROP TABLE IF EXISTS `StudyInfo`;
/*!50001 DROP VIEW IF EXISTS `StudyInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StudyInfo` (
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `NetworkName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LURNSubReport`
--

DROP TABLE IF EXISTS `LURNSubReport`;
/*!50001 DROP VIEW IF EXISTS `LURNSubReport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LURNSubReport` (
  `UploadID` tinyint NOT NULL,
  `UploadTime` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `Note` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CrossProjectInfoToImages`
--

DROP TABLE IF EXISTS `CrossProjectInfoToImages`;
/*!50001 DROP VIEW IF EXISTS `CrossProjectInfoToImages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CrossProjectInfoToImages` (
  `ProjectRowID` tinyint NOT NULL,
  `ProjectID` tinyint NOT NULL,
  `ProjectRowName` tinyint NOT NULL,
  `ProjectColumnID` tinyint NOT NULL,
  `ProjectColumnName` tinyint NOT NULL,
  `AssignmentID` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `TimeStamp` tinyint NOT NULL,
  `QCSessionID` tinyint NOT NULL,
  `QCDate` tinyint NOT NULL,
  `FinalizedDate` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `StudyRoleID` tinyint NOT NULL,
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SubjectRolesCrossStudyToQCSessions`
--

DROP TABLE IF EXISTS `SubjectRolesCrossStudyToQCSessions`;
/*!50001 DROP VIEW IF EXISTS `SubjectRolesCrossStudyToQCSessions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SubjectRolesCrossStudyToQCSessions` (
  `StudyRoleID` tinyint NOT NULL,
  `StudyRoleName` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `NetworkName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL,
  `QCSessionID` tinyint NOT NULL,
  `QCDate` tinyint NOT NULL,
  `FinalizedDate` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `V4toV6SeriesUIDMatch`
--

DROP TABLE IF EXISTS `V4toV6SeriesUIDMatch`;
/*!50001 DROP VIEW IF EXISTS `V4toV6SeriesUIDMatch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `V4toV6SeriesUIDMatch` (
  `ImageScanID` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `MAPP2Counts2`
--

DROP TABLE IF EXISTS `MAPP2Counts2`;
/*!50001 DROP VIEW IF EXISTS `MAPP2Counts2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MAPP2Counts2` (
  `michigan_count` tinyint NOT NULL,
  `ucla_count` tinyint NOT NULL,
  `northwestern_count` tinyint NOT NULL,
  `washington_count` tinyint NOT NULL,
  `stlouis_count` tinyint NOT NULL,
  `iowa_count` tinyint NOT NULL,
  `total_count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ScanSessionInfo`
--

DROP TABLE IF EXISTS `ScanSessionInfo`;
/*!50001 DROP VIEW IF EXISTS `ScanSessionInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ScanSessionInfo` (
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `QCSessionInfoImages`
--

DROP TABLE IF EXISTS `QCSessionInfoImages`;
/*!50001 DROP VIEW IF EXISTS `QCSessionInfoImages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `QCSessionInfoImages` (
  `QCSessionID` tinyint NOT NULL,
  `QCDate` tinyint NOT NULL,
  `FinalizedDate` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `StudyRoleID` tinyint NOT NULL,
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `StudyRoleInfo`
--

DROP TABLE IF EXISTS `StudyRoleInfo`;
/*!50001 DROP VIEW IF EXISTS `StudyRoleInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StudyRoleInfo` (
  `StudyRoleID` tinyint NOT NULL,
  `StudyRoleName` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `NetworkName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `MAPP2Report`
--

DROP TABLE IF EXISTS `MAPP2Report`;
/*!50001 DROP VIEW IF EXISTS `MAPP2Report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MAPP2Report` (
  `UploadID` tinyint NOT NULL,
  `UploadTime` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `Note` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `site_nickname` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `Token` tinyint NOT NULL,
  `Anatomical` tinyint NOT NULL,
  `Diffusion` tinyint NOT NULL,
  `RestingState1` tinyint NOT NULL,
  `RestingState2` tinyint NOT NULL,
  `OtherScans` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `StudyImageInfo`
--

DROP TABLE IF EXISTS `StudyImageInfo`;
/*!50001 DROP VIEW IF EXISTS `StudyImageInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StudyImageInfo` (
  `StudyImageID` tinyint NOT NULL,
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL,
  `StudyRoleID` tinyint NOT NULL,
  `StudyRoleName` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `NetworkName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `StudyPeopleInfo`
--

DROP TABLE IF EXISTS `StudyPeopleInfo`;
/*!50001 DROP VIEW IF EXISTS `StudyPeopleInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StudyPeopleInfo` (
  `StudyPeopleID` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `PeopleID` tinyint NOT NULL,
  `PeopleRoleID` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `SubjectRegex` tinyint NOT NULL,
  `InactiveFlag` tinyint NOT NULL,
  `Token` tinyint NOT NULL,
  `wp_id` tinyint NOT NULL,
  `site_id` tinyint NOT NULL,
  `user_type_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `degree_id` tinyint NOT NULL,
  `academic_title` tinyint NOT NULL,
  `institution` tinyint NOT NULL,
  `laboratory` tinyint NOT NULL,
  `country_number` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `cns_web_hash` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `reason` tinyint NOT NULL,
  `archived_membership` tinyint NOT NULL,
  `standardized_membership` tinyint NOT NULL,
  `active_flag` tinyint NOT NULL,
  `ec_member` tinyint NOT NULL,
  `notes` tinyint NOT NULL,
  `date_added` tinyint NOT NULL,
  `update_stamp` tinyint NOT NULL,
  `PeopleRoleName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CrossProjectInfo`
--

DROP TABLE IF EXISTS `CrossProjectInfo`;
/*!50001 DROP VIEW IF EXISTS `CrossProjectInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CrossProjectInfo` (
  `ProjectRowID` tinyint NOT NULL,
  `ProjectID` tinyint NOT NULL,
  `ProjectRowName` tinyint NOT NULL,
  `ProjectColumnID` tinyint NOT NULL,
  `ProjectColumnName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `MAPP2Counts`
--

DROP TABLE IF EXISTS `MAPP2Counts`;
/*!50001 DROP VIEW IF EXISTS `MAPP2Counts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MAPP2Counts` (
  `scan_count` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `site_nickname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `BrainRegionInfo`
--

DROP TABLE IF EXISTS `BrainRegionInfo`;
/*!50001 DROP VIEW IF EXISTS `BrainRegionInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `BrainRegionInfo` (
  `BrainRegionID` tinyint NOT NULL,
  `BrainRegionName` tinyint NOT NULL,
  `NativeID` tinyint NOT NULL,
  `ParentID` tinyint NOT NULL,
  `AtlasID` tinyint NOT NULL,
  `AtlasName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `StudySubjectInfo`
--

DROP TABLE IF EXISTS `StudySubjectInfo`;
/*!50001 DROP VIEW IF EXISTS `StudySubjectInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `StudySubjectInfo` (
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `NetworkName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ProjectStudyImageInfo`
--

DROP TABLE IF EXISTS `ProjectStudyImageInfo`;
/*!50001 DROP VIEW IF EXISTS `ProjectStudyImageInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ProjectStudyImageInfo` (
  `AssignmentID` tinyint NOT NULL,
  `ProjectRowID` tinyint NOT NULL,
  `ProjectColumnID` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `TimeStamp` tinyint NOT NULL,
  `QCSessionID` tinyint NOT NULL,
  `QCDate` tinyint NOT NULL,
  `FinalizedDate` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `StudyRoleID` tinyint NOT NULL,
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LURNReport`
--

DROP TABLE IF EXISTS `LURNReport`;
/*!50001 DROP VIEW IF EXISTS `LURNReport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LURNReport` (
  `UploadID` tinyint NOT NULL,
  `UploadTime` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `Note` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `site_nickname` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `Token` tinyint NOT NULL,
  `Anatomical` tinyint NOT NULL,
  `Diffusion` tinyint NOT NULL,
  `RestingState1` tinyint NOT NULL,
  `RestingState2` tinyint NOT NULL,
  `OtherScans` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `OverallQCInfo`
--

DROP TABLE IF EXISTS `OverallQCInfo`;
/*!50001 DROP VIEW IF EXISTS `OverallQCInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `OverallQCInfo` (
  `QCAnswerID` tinyint NOT NULL,
  `QCSessionID` tinyint NOT NULL,
  `NumericData` tinyint NOT NULL,
  `TextData` tinyint NOT NULL,
  `Laterality` tinyint NOT NULL,
  `BrainRegionDirection` tinyint NOT NULL,
  `VolumeNumber` tinyint NOT NULL,
  `XCoord` tinyint NOT NULL,
  `YCoord` tinyint NOT NULL,
  `ZCoord` tinyint NOT NULL,
  `DBSyncID` tinyint NOT NULL,
  `Comments` tinyint NOT NULL,
  `TimeStamp` tinyint NOT NULL,
  `QCChoiceID` tinyint NOT NULL,
  `QCChoiceOrder` tinyint NOT NULL,
  `QCChoiceName` tinyint NOT NULL,
  `AlertFlag` tinyint NOT NULL,
  `QCQuestionID` tinyint NOT NULL,
  `QCQuestionName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `QCQuestionDescription` tinyint NOT NULL,
  `QCLevel` tinyint NOT NULL,
  `RequiredFlag` tinyint NOT NULL,
  `UniqueFlag` tinyint NOT NULL,
  `HumanFlag` tinyint NOT NULL,
  `OverallFlag` tinyint NOT NULL,
  `NumericFlag` tinyint NOT NULL,
  `TextFlag` tinyint NOT NULL,
  `DICOMTag` tinyint NOT NULL,
  `QCReportID` tinyint NOT NULL,
  `QCReportName` tinyint NOT NULL,
  `BrainRegionID` tinyint NOT NULL,
  `BrainRegionName` tinyint NOT NULL,
  `NativeID` tinyint NOT NULL,
  `ParentID` tinyint NOT NULL,
  `AtlasID` tinyint NOT NULL,
  `AtlasName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `QCAnswerInfo`
--

DROP TABLE IF EXISTS `QCAnswerInfo`;
/*!50001 DROP VIEW IF EXISTS `QCAnswerInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `QCAnswerInfo` (
  `QCAnswerID` tinyint NOT NULL,
  `NumericData` tinyint NOT NULL,
  `TextData` tinyint NOT NULL,
  `Laterality` tinyint NOT NULL,
  `BrainRegionDirection` tinyint NOT NULL,
  `VolumeNumber` tinyint NOT NULL,
  `XCoord` tinyint NOT NULL,
  `YCoord` tinyint NOT NULL,
  `ZCoord` tinyint NOT NULL,
  `Comments` tinyint NOT NULL,
  `BrainRegionID` tinyint NOT NULL,
  `BrainRegionName` tinyint NOT NULL,
  `NativeID` tinyint NOT NULL,
  `ParentID` tinyint NOT NULL,
  `AtlasID` tinyint NOT NULL,
  `AtlasName` tinyint NOT NULL,
  `QCChoiceID` tinyint NOT NULL,
  `QCChoiceOrder` tinyint NOT NULL,
  `QCChoiceName` tinyint NOT NULL,
  `AlertFlag` tinyint NOT NULL,
  `QCQuestionID` tinyint NOT NULL,
  `QCQuestionName` tinyint NOT NULL,
  `QCQuestionDescription` tinyint NOT NULL,
  `QCLevel` tinyint NOT NULL,
  `RequiredFlag` tinyint NOT NULL,
  `UniqueFlag` tinyint NOT NULL,
  `HumanFlag` tinyint NOT NULL,
  `OverallFlag` tinyint NOT NULL,
  `NumericFlag` tinyint NOT NULL,
  `TextFlag` tinyint NOT NULL,
  `DICOMTag` tinyint NOT NULL,
  `QCReportID` tinyint NOT NULL,
  `QCReportName` tinyint NOT NULL,
  `QCSessionID` tinyint NOT NULL,
  `QCDate` tinyint NOT NULL,
  `Finalized` tinyint NOT NULL,
  `FinalizedDate` tinyint NOT NULL,
  `StudyImageID` tinyint NOT NULL,
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL,
  `StudyRoleID` tinyint NOT NULL,
  `StudyRoleName` tinyint NOT NULL,
  `StudySubjectID` tinyint NOT NULL,
  `SubjectName` tinyint NOT NULL,
  `StudyID` tinyint NOT NULL,
  `StudyName` tinyint NOT NULL,
  `StudyNickName` tinyint NOT NULL,
  `NetworkID` tinyint NOT NULL,
  `NetworkCode` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `QCQuestionInfo`
--

DROP TABLE IF EXISTS `QCQuestionInfo`;
/*!50001 DROP VIEW IF EXISTS `QCQuestionInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `QCQuestionInfo` (
  `QCQuestionID` tinyint NOT NULL,
  `QCQuestionName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `QCQuestionDescription` tinyint NOT NULL,
  `QCLevel` tinyint NOT NULL,
  `RequiredFlag` tinyint NOT NULL,
  `UniqueFlag` tinyint NOT NULL,
  `HumanFlag` tinyint NOT NULL,
  `OverallFlag` tinyint NOT NULL,
  `NumericFlag` tinyint NOT NULL,
  `TextFlag` tinyint NOT NULL,
  `DICOMTag` tinyint NOT NULL,
  `QCReportID` tinyint NOT NULL,
  `QCReportName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SequenceInfo`
--

DROP TABLE IF EXISTS `SequenceInfo`;
/*!50001 DROP VIEW IF EXISTS `SequenceInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SequenceInfo` (
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ImageInfo`
--

DROP TABLE IF EXISTS `ImageInfo`;
/*!50001 DROP VIEW IF EXISTS `ImageInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ImageInfo` (
  `ImageID` tinyint NOT NULL,
  `SeriesUID` tinyint NOT NULL,
  `SequenceNumber` tinyint NOT NULL,
  `ScanSessionID` tinyint NOT NULL,
  `ScanDate` tinyint NOT NULL,
  `StudyUID` tinyint NOT NULL,
  `ProtocolID` tinyint NOT NULL,
  `ProtocolName` tinyint NOT NULL,
  `ScannerID` tinyint NOT NULL,
  `UIDRoot` tinyint NOT NULL,
  `StationName` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `ModelName` tinyint NOT NULL,
  `VisitID` tinyint NOT NULL,
  `VisitName` tinyint NOT NULL,
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL,
  `SequenceID` tinyint NOT NULL,
  `SequenceName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `ModalityName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SubjectInfo`
--

DROP TABLE IF EXISTS `SubjectInfo`;
/*!50001 DROP VIEW IF EXISTS `SubjectInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SubjectInfo` (
  `SubjectID` tinyint NOT NULL,
  `SiteID` tinyint NOT NULL,
  `SiteCode` tinyint NOT NULL,
  `SiteAcronym` tinyint NOT NULL,
  `Lab` tinyint NOT NULL,
  `Institution` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `CountryNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `QCAnswerInfoQCChoicesBrainRegions`
--

DROP TABLE IF EXISTS `QCAnswerInfoQCChoicesBrainRegions`;
/*!50001 DROP VIEW IF EXISTS `QCAnswerInfoQCChoicesBrainRegions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `QCAnswerInfoQCChoicesBrainRegions` (
  `QCAnswerID` tinyint NOT NULL,
  `QCSessionID` tinyint NOT NULL,
  `NumericData` tinyint NOT NULL,
  `TextData` tinyint NOT NULL,
  `Laterality` tinyint NOT NULL,
  `BrainRegionDirection` tinyint NOT NULL,
  `VolumeNumber` tinyint NOT NULL,
  `XCoord` tinyint NOT NULL,
  `YCoord` tinyint NOT NULL,
  `ZCoord` tinyint NOT NULL,
  `DBSyncID` tinyint NOT NULL,
  `Comments` tinyint NOT NULL,
  `TimeStamp` tinyint NOT NULL,
  `QCChoiceID` tinyint NOT NULL,
  `QCChoiceOrder` tinyint NOT NULL,
  `QCChoiceName` tinyint NOT NULL,
  `AlertFlag` tinyint NOT NULL,
  `QCQuestionID` tinyint NOT NULL,
  `QCQuestionName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `QCQuestionDescription` tinyint NOT NULL,
  `QCLevel` tinyint NOT NULL,
  `RequiredFlag` tinyint NOT NULL,
  `UniqueFlag` tinyint NOT NULL,
  `HumanFlag` tinyint NOT NULL,
  `OverallFlag` tinyint NOT NULL,
  `NumericFlag` tinyint NOT NULL,
  `TextFlag` tinyint NOT NULL,
  `DICOMTag` tinyint NOT NULL,
  `QCReportID` tinyint NOT NULL,
  `QCReportName` tinyint NOT NULL,
  `BrainRegionID` tinyint NOT NULL,
  `BrainRegionName` tinyint NOT NULL,
  `NativeID` tinyint NOT NULL,
  `ParentID` tinyint NOT NULL,
  `AtlasID` tinyint NOT NULL,
  `AtlasName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `QCChoiceInfo`
--

DROP TABLE IF EXISTS `QCChoiceInfo`;
/*!50001 DROP VIEW IF EXISTS `QCChoiceInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `QCChoiceInfo` (
  `QCChoiceID` tinyint NOT NULL,
  `QCChoiceOrder` tinyint NOT NULL,
  `QCChoiceName` tinyint NOT NULL,
  `AlertFlag` tinyint NOT NULL,
  `QCQuestionID` tinyint NOT NULL,
  `QCQuestionName` tinyint NOT NULL,
  `ModalityID` tinyint NOT NULL,
  `QCQuestionDescription` tinyint NOT NULL,
  `QCLevel` tinyint NOT NULL,
  `RequiredFlag` tinyint NOT NULL,
  `UniqueFlag` tinyint NOT NULL,
  `HumanFlag` tinyint NOT NULL,
  `OverallFlag` tinyint NOT NULL,
  `NumericFlag` tinyint NOT NULL,
  `TextFlag` tinyint NOT NULL,
  `DICOMTag` tinyint NOT NULL,
  `QCReportID` tinyint NOT NULL,
  `QCReportName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `MAPP2SubReport`
--

/*!50001 DROP TABLE IF EXISTS `MAPP2SubReport`*/;
/*!50001 DROP VIEW IF EXISTS `MAPP2SubReport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `MAPP2SubReport` AS select distinct `Quarantine`.`Uploads`.`UploadID` AS `UploadID`,`Quarantine`.`Uploads`.`UploadTime` AS `UploadTime`,`Quarantine`.`Files`.`StudyImageID` AS `StudyImageID`,`Quarantine`.`Uploads`.`SiteID` AS `SiteID`,`Quarantine`.`Uploads`.`NetworkID` AS `NetworkID`,`Quarantine`.`Uploads`.`Note` AS `Note` from ((`Quarantine`.`Files` left join (`Quarantine`.`Directories` left join `Quarantine`.`Uploads` on((`Quarantine`.`Uploads`.`UploadID` = `Quarantine`.`Directories`.`UploadID`))) on((`Quarantine`.`Directories`.`DirectoryID` = `Quarantine`.`Files`.`DirectoryID`))) join `ImagingRepositoryV6`.`StudyImages` on((`Quarantine`.`Files`.`StudyImageID` = `ImagingRepositoryV6`.`StudyImages`.`StudyImageID`))) where (`Quarantine`.`Uploads`.`StudyID` = 95) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `QCSessionInfo`
--

/*!50001 DROP TABLE IF EXISTS `QCSessionInfo`*/;
/*!50001 DROP VIEW IF EXISTS `QCSessionInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `QCSessionInfo` AS select `ImagingRepositoryV6`.`QCSessions`.`QCSessionID` AS `QCSessionID`,`ImagingRepositoryV6`.`QCSessions`.`QCDate` AS `QCDate`,`ImagingRepositoryV6`.`QCSessions`.`Finalized` AS `Finalized`,`ImagingRepositoryV6`.`QCSessions`.`DBSyncID` AS `DBSyncID`,`ImagingRepositoryV6`.`QCSessions`.`FinalizedDate` AS `FinalizedDate`,`StudyImageInfo`.`StudyImageID` AS `StudyImageID`,`StudyImageInfo`.`ImageID` AS `ImageID`,`StudyImageInfo`.`SeriesUID` AS `SeriesUID`,`StudyImageInfo`.`SequenceNumber` AS `SequenceNumber`,`StudyImageInfo`.`ScanSessionID` AS `ScanSessionID`,`StudyImageInfo`.`ScanDate` AS `ScanDate`,`StudyImageInfo`.`StudyUID` AS `StudyUID`,`StudyImageInfo`.`ProtocolID` AS `ProtocolID`,`StudyImageInfo`.`ProtocolName` AS `ProtocolName`,`StudyImageInfo`.`ScannerID` AS `ScannerID`,`StudyImageInfo`.`UIDRoot` AS `UIDRoot`,`StudyImageInfo`.`StationName` AS `StationName`,`StudyImageInfo`.`Manufacturer` AS `Manufacturer`,`StudyImageInfo`.`ModelName` AS `ModelName`,`StudyImageInfo`.`VisitID` AS `VisitID`,`StudyImageInfo`.`VisitName` AS `VisitName`,`StudyImageInfo`.`SequenceID` AS `SequenceID`,`StudyImageInfo`.`SequenceName` AS `SequenceName`,`StudyImageInfo`.`ModalityID` AS `ModalityID`,`StudyImageInfo`.`ModalityName` AS `ModalityName`,`StudyImageInfo`.`StudyRoleID` AS `StudyRoleID`,`StudyImageInfo`.`StudyRoleName` AS `StudyRoleName`,`StudyImageInfo`.`StudySubjectID` AS `StudySubjectID`,`StudyImageInfo`.`SubjectName` AS `SubjectName`,`StudyImageInfo`.`StudyID` AS `StudyID`,`StudyImageInfo`.`StudyName` AS `StudyName`,`StudyImageInfo`.`StudyNickName` AS `StudyNickName`,`StudyImageInfo`.`NetworkID` AS `NetworkID`,`StudyImageInfo`.`NetworkCode` AS `NetworkCode`,`StudyImageInfo`.`NetworkName` AS `NetworkName`,`StudyImageInfo`.`SubjectID` AS `SubjectID`,`StudyImageInfo`.`SiteID` AS `SiteID`,`StudyImageInfo`.`SiteCode` AS `SiteCode`,`StudyImageInfo`.`SiteAcronym` AS `SiteAcronym`,`StudyImageInfo`.`Lab` AS `Lab`,`StudyImageInfo`.`Institution` AS `Institution`,`StudyImageInfo`.`Website` AS `Website`,`StudyImageInfo`.`CountryNumber` AS `CountryNumber` from (`ImagingRepositoryV6`.`QCSessions` left join `ImagingRepositoryV6`.`StudyImageInfo` on((`ImagingRepositoryV6`.`QCSessions`.`StudyImageID` = `StudyImageInfo`.`StudyImageID`))) where (`ImagingRepositoryV6`.`QCSessions`.`TrainingFlag` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SubjectRolesCrossStudyInfo`
--

/*!50001 DROP TABLE IF EXISTS `SubjectRolesCrossStudyInfo`*/;
/*!50001 DROP VIEW IF EXISTS `SubjectRolesCrossStudyInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SubjectRolesCrossStudyInfo` AS (select `StudyRoleInfo`.`StudyRoleID` AS `StudyRoleID`,`StudyRoleInfo`.`StudyRoleName` AS `StudyRoleName`,`StudySubjectInfo`.`StudySubjectID` AS `StudySubjectID`,`StudySubjectInfo`.`SubjectName` AS `SubjectName`,`StudySubjectInfo`.`StudyID` AS `StudyID`,`StudySubjectInfo`.`StudyName` AS `StudyName`,`StudySubjectInfo`.`StudyNickName` AS `StudyNickName`,`StudySubjectInfo`.`NetworkID` AS `NetworkID`,`StudySubjectInfo`.`NetworkCode` AS `NetworkCode`,`StudySubjectInfo`.`NetworkName` AS `NetworkName`,`StudySubjectInfo`.`SubjectID` AS `SubjectID`,`StudySubjectInfo`.`SiteID` AS `SiteID`,`StudySubjectInfo`.`SiteCode` AS `SiteCode`,`StudySubjectInfo`.`SiteAcronym` AS `SiteAcronym`,`StudySubjectInfo`.`Lab` AS `Lab`,`StudySubjectInfo`.`Institution` AS `Institution`,`StudySubjectInfo`.`Website` AS `Website`,`StudySubjectInfo`.`CountryNumber` AS `CountryNumber` from (`ImagingRepositoryV6`.`StudySubjectInfo` join `ImagingRepositoryV6`.`StudyRoleInfo` on((`StudySubjectInfo`.`StudyID` = `StudyRoleInfo`.`StudyID`)))) union (select 0 AS `StudyRoleID`,'No Study Schema' AS `StudyRoleName`,`StudySubjectInfo`.`StudySubjectID` AS `StudySubjectID`,`StudySubjectInfo`.`SubjectName` AS `SubjectName`,`StudySubjectInfo`.`StudyID` AS `StudyID`,`StudySubjectInfo`.`StudyName` AS `StudyName`,`StudySubjectInfo`.`StudyNickName` AS `StudyNickName`,`StudySubjectInfo`.`NetworkID` AS `NetworkID`,`StudySubjectInfo`.`NetworkCode` AS `NetworkCode`,`StudySubjectInfo`.`NetworkName` AS `NetworkName`,`StudySubjectInfo`.`SubjectID` AS `SubjectID`,`StudySubjectInfo`.`SiteID` AS `SiteID`,`StudySubjectInfo`.`SiteCode` AS `SiteCode`,`StudySubjectInfo`.`SiteAcronym` AS `SiteAcronym`,`StudySubjectInfo`.`Lab` AS `Lab`,`StudySubjectInfo`.`Institution` AS `Institution`,`StudySubjectInfo`.`Website` AS `Website`,`StudySubjectInfo`.`CountryNumber` AS `CountryNumber` from (`ImagingRepositoryV6`.`StudySubjectInfo` left join `ImagingRepositoryV6`.`StudyRoleInfo` on((`StudySubjectInfo`.`StudyID` = `StudyRoleInfo`.`StudyID`))) where isnull(`StudyRoleInfo`.`StudyID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SubjectRolesCrossStudyToQCAnswers`
--

/*!50001 DROP TABLE IF EXISTS `SubjectRolesCrossStudyToQCAnswers`*/;
/*!50001 DROP VIEW IF EXISTS `SubjectRolesCrossStudyToQCAnswers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SubjectRolesCrossStudyToQCAnswers` AS select `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` AS `StudyRoleID`,`SubjectRolesCrossStudyToQCSessions`.`StudyRoleName` AS `StudyRoleName`,`SubjectRolesCrossStudyToQCSessions`.`StudySubjectID` AS `StudySubjectID`,`SubjectRolesCrossStudyToQCSessions`.`SubjectName` AS `SubjectName`,`SubjectRolesCrossStudyToQCSessions`.`StudyID` AS `StudyID`,`SubjectRolesCrossStudyToQCSessions`.`StudyName` AS `StudyName`,`SubjectRolesCrossStudyToQCSessions`.`StudyNickName` AS `StudyNickName`,`SubjectRolesCrossStudyToQCSessions`.`NetworkID` AS `NetworkID`,`SubjectRolesCrossStudyToQCSessions`.`NetworkCode` AS `NetworkCode`,`SubjectRolesCrossStudyToQCSessions`.`NetworkName` AS `NetworkName`,`SubjectRolesCrossStudyToQCSessions`.`SubjectID` AS `SubjectID`,`SubjectRolesCrossStudyToQCSessions`.`SiteID` AS `SiteID`,`SubjectRolesCrossStudyToQCSessions`.`SiteCode` AS `SiteCode`,`SubjectRolesCrossStudyToQCSessions`.`SiteAcronym` AS `SiteAcronym`,`SubjectRolesCrossStudyToQCSessions`.`Lab` AS `Lab`,`SubjectRolesCrossStudyToQCSessions`.`Institution` AS `Institution`,`SubjectRolesCrossStudyToQCSessions`.`Website` AS `Website`,`SubjectRolesCrossStudyToQCSessions`.`CountryNumber` AS `CountryNumber`,`SubjectRolesCrossStudyToQCSessions`.`QCSessionID` AS `QCSessionID`,`SubjectRolesCrossStudyToQCSessions`.`QCDate` AS `QCDate`,`SubjectRolesCrossStudyToQCSessions`.`FinalizedDate` AS `FinalizedDate`,`SubjectRolesCrossStudyToQCSessions`.`StudyImageID` AS `StudyImageID`,`SubjectRolesCrossStudyToQCSessions`.`ImageID` AS `ImageID`,`SubjectRolesCrossStudyToQCSessions`.`SeriesUID` AS `SeriesUID`,`SubjectRolesCrossStudyToQCSessions`.`SequenceNumber` AS `SequenceNumber`,`SubjectRolesCrossStudyToQCSessions`.`ScanSessionID` AS `ScanSessionID`,`SubjectRolesCrossStudyToQCSessions`.`ScanDate` AS `ScanDate`,`SubjectRolesCrossStudyToQCSessions`.`StudyUID` AS `StudyUID`,`SubjectRolesCrossStudyToQCSessions`.`ProtocolID` AS `ProtocolID`,`SubjectRolesCrossStudyToQCSessions`.`ProtocolName` AS `ProtocolName`,`SubjectRolesCrossStudyToQCSessions`.`ScannerID` AS `ScannerID`,`SubjectRolesCrossStudyToQCSessions`.`UIDRoot` AS `UIDRoot`,`SubjectRolesCrossStudyToQCSessions`.`StationName` AS `StationName`,`SubjectRolesCrossStudyToQCSessions`.`Manufacturer` AS `Manufacturer`,`SubjectRolesCrossStudyToQCSessions`.`ModelName` AS `ModelName`,`SubjectRolesCrossStudyToQCSessions`.`VisitID` AS `VisitID`,`SubjectRolesCrossStudyToQCSessions`.`VisitName` AS `VisitName`,`SubjectRolesCrossStudyToQCSessions`.`SequenceID` AS `SequenceID`,`SubjectRolesCrossStudyToQCSessions`.`SequenceName` AS `SequenceName`,`SubjectRolesCrossStudyToQCSessions`.`ModalityID` AS `ModalityID`,`SubjectRolesCrossStudyToQCSessions`.`ModalityName` AS `ModalityName`,`QCAnswerInfoQCChoicesBrainRegions`.`QCAnswerID` AS `QCAnswerID`,`QCAnswerInfoQCChoicesBrainRegions`.`NumericData` AS `NumericData`,`QCAnswerInfoQCChoicesBrainRegions`.`TextData` AS `TextData`,`QCAnswerInfoQCChoicesBrainRegions`.`Laterality` AS `Laterality`,`QCAnswerInfoQCChoicesBrainRegions`.`BrainRegionDirection` AS `BrainRegionDirection`,`QCAnswerInfoQCChoicesBrainRegions`.`VolumeNumber` AS `VolumeNumber`,`QCAnswerInfoQCChoicesBrainRegions`.`XCoord` AS `XCoord`,`QCAnswerInfoQCChoicesBrainRegions`.`YCoord` AS `YCoord`,`QCAnswerInfoQCChoicesBrainRegions`.`ZCoord` AS `ZCoord`,`QCAnswerInfoQCChoicesBrainRegions`.`DBSyncID` AS `DBSyncID`,`QCAnswerInfoQCChoicesBrainRegions`.`Comments` AS `Comments`,`QCAnswerInfoQCChoicesBrainRegions`.`TimeStamp` AS `TimeStamp`,`QCAnswerInfoQCChoicesBrainRegions`.`QCChoiceID` AS `QCChoiceID`,`QCAnswerInfoQCChoicesBrainRegions`.`QCChoiceOrder` AS `QCChoiceOrder`,`QCAnswerInfoQCChoicesBrainRegions`.`QCChoiceName` AS `QCChoiceName`,`QCAnswerInfoQCChoicesBrainRegions`.`AlertFlag` AS `AlertFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`QCQuestionID` AS `QCQuestionID`,`QCAnswerInfoQCChoicesBrainRegions`.`QCQuestionName` AS `QCQuestionName`,`QCAnswerInfoQCChoicesBrainRegions`.`QCQuestionDescription` AS `QCQuestionDescription`,`QCAnswerInfoQCChoicesBrainRegions`.`QCLevel` AS `QCLevel`,`QCAnswerInfoQCChoicesBrainRegions`.`RequiredFlag` AS `RequiredFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`UniqueFlag` AS `UniqueFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`HumanFlag` AS `HumanFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`OverallFlag` AS `OverallFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`NumericFlag` AS `NumericFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`TextFlag` AS `TextFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`DICOMTag` AS `DICOMTag`,`QCAnswerInfoQCChoicesBrainRegions`.`QCReportID` AS `QCReportID`,`QCAnswerInfoQCChoicesBrainRegions`.`QCReportName` AS `QCReportName`,`QCAnswerInfoQCChoicesBrainRegions`.`BrainRegionID` AS `BrainRegionID`,`QCAnswerInfoQCChoicesBrainRegions`.`BrainRegionName` AS `BrainRegionName`,`QCAnswerInfoQCChoicesBrainRegions`.`NativeID` AS `NativeID`,`QCAnswerInfoQCChoicesBrainRegions`.`ParentID` AS `ParentID`,`QCAnswerInfoQCChoicesBrainRegions`.`AtlasID` AS `AtlasID`,`QCAnswerInfoQCChoicesBrainRegions`.`AtlasName` AS `AtlasName` from (`ImagingRepositoryV6`.`SubjectRolesCrossStudyToQCSessions` left join `ImagingRepositoryV6`.`QCAnswerInfoQCChoicesBrainRegions` on((`SubjectRolesCrossStudyToQCSessions`.`QCSessionID` = `QCAnswerInfoQCChoicesBrainRegions`.`QCSessionID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StudyInfo`
--

/*!50001 DROP TABLE IF EXISTS `StudyInfo`*/;
/*!50001 DROP VIEW IF EXISTS `StudyInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `StudyInfo` AS select `ImagingRepositoryV6`.`Studies`.`StudyID` AS `StudyID`,`ImagingRepositoryV6`.`Studies`.`StudyName` AS `StudyName`,`ImagingRepositoryV6`.`Studies`.`StudyNickName` AS `StudyNickName`,`membership`.`network`.`network_id` AS `NetworkID`,`membership`.`network`.`network_code` AS `NetworkCode`,`membership`.`network`.`network_name` AS `NetworkName` from (`ImagingRepositoryV6`.`Studies` left join `membership`.`network` on((`ImagingRepositoryV6`.`Studies`.`NetworkID` = `membership`.`network`.`network_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LURNSubReport`
--

/*!50001 DROP TABLE IF EXISTS `LURNSubReport`*/;
/*!50001 DROP VIEW IF EXISTS `LURNSubReport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `LURNSubReport` AS select distinct `Quarantine`.`Uploads`.`UploadID` AS `UploadID`,`Quarantine`.`Uploads`.`UploadTime` AS `UploadTime`,`Quarantine`.`Files`.`StudyImageID` AS `StudyImageID`,`Quarantine`.`Uploads`.`SiteID` AS `SiteID`,`Quarantine`.`Uploads`.`NetworkID` AS `NetworkID`,`Quarantine`.`Uploads`.`Note` AS `Note` from ((`Quarantine`.`Files` left join (`Quarantine`.`Directories` left join `Quarantine`.`Uploads` on((`Quarantine`.`Uploads`.`UploadID` = `Quarantine`.`Directories`.`UploadID`))) on((`Quarantine`.`Directories`.`DirectoryID` = `Quarantine`.`Files`.`DirectoryID`))) join `ImagingRepositoryV6`.`StudyImages` on((`Quarantine`.`Files`.`StudyImageID` = `ImagingRepositoryV6`.`StudyImages`.`StudyImageID`))) where (`Quarantine`.`Uploads`.`StudyID` = 148) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CrossProjectInfoToImages`
--

/*!50001 DROP TABLE IF EXISTS `CrossProjectInfoToImages`*/;
/*!50001 DROP VIEW IF EXISTS `CrossProjectInfoToImages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CrossProjectInfoToImages` AS select `CrossProjectInfo`.`ProjectRowID` AS `ProjectRowID`,`CrossProjectInfo`.`ProjectID` AS `ProjectID`,`CrossProjectInfo`.`ProjectRowName` AS `ProjectRowName`,`CrossProjectInfo`.`ProjectColumnID` AS `ProjectColumnID`,`CrossProjectInfo`.`ProjectColumnName` AS `ProjectColumnName`,`ProjectStudyImageInfo`.`AssignmentID` AS `AssignmentID`,`ProjectStudyImageInfo`.`StudyImageID` AS `StudyImageID`,`ProjectStudyImageInfo`.`TimeStamp` AS `TimeStamp`,`ProjectStudyImageInfo`.`QCSessionID` AS `QCSessionID`,`ProjectStudyImageInfo`.`QCDate` AS `QCDate`,`ProjectStudyImageInfo`.`FinalizedDate` AS `FinalizedDate`,`ProjectStudyImageInfo`.`StudySubjectID` AS `StudySubjectID`,`ProjectStudyImageInfo`.`StudyRoleID` AS `StudyRoleID`,`ProjectStudyImageInfo`.`ImageID` AS `ImageID`,`ProjectStudyImageInfo`.`SeriesUID` AS `SeriesUID`,`ProjectStudyImageInfo`.`SequenceNumber` AS `SequenceNumber`,`ProjectStudyImageInfo`.`ScanSessionID` AS `ScanSessionID`,`ProjectStudyImageInfo`.`ScanDate` AS `ScanDate`,`ProjectStudyImageInfo`.`StudyUID` AS `StudyUID`,`ProjectStudyImageInfo`.`ProtocolID` AS `ProtocolID`,`ProjectStudyImageInfo`.`ProtocolName` AS `ProtocolName`,`ProjectStudyImageInfo`.`ScannerID` AS `ScannerID`,`ProjectStudyImageInfo`.`UIDRoot` AS `UIDRoot`,`ProjectStudyImageInfo`.`StationName` AS `StationName`,`ProjectStudyImageInfo`.`Manufacturer` AS `Manufacturer`,`ProjectStudyImageInfo`.`ModelName` AS `ModelName`,`ProjectStudyImageInfo`.`VisitID` AS `VisitID`,`ProjectStudyImageInfo`.`VisitName` AS `VisitName`,`ProjectStudyImageInfo`.`SubjectID` AS `SubjectID`,`ProjectStudyImageInfo`.`SiteID` AS `SiteID`,`ProjectStudyImageInfo`.`SiteCode` AS `SiteCode`,`ProjectStudyImageInfo`.`SiteAcronym` AS `SiteAcronym`,`ProjectStudyImageInfo`.`Lab` AS `Lab`,`ProjectStudyImageInfo`.`Institution` AS `Institution`,`ProjectStudyImageInfo`.`Website` AS `Website`,`ProjectStudyImageInfo`.`CountryNumber` AS `CountryNumber`,`ProjectStudyImageInfo`.`SequenceID` AS `SequenceID`,`ProjectStudyImageInfo`.`SequenceName` AS `SequenceName`,`ProjectStudyImageInfo`.`ModalityID` AS `ModalityID`,`ProjectStudyImageInfo`.`ModalityName` AS `ModalityName` from (`ImagingRepositoryV6`.`CrossProjectInfo` left join `ImagingRepositoryV6`.`ProjectStudyImageInfo` on(((`CrossProjectInfo`.`ProjectRowID` = `ProjectStudyImageInfo`.`ProjectRowID`) and (`CrossProjectInfo`.`ProjectColumnID` = `ProjectStudyImageInfo`.`ProjectColumnID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SubjectRolesCrossStudyToQCSessions`
--

/*!50001 DROP TABLE IF EXISTS `SubjectRolesCrossStudyToQCSessions`*/;
/*!50001 DROP VIEW IF EXISTS `SubjectRolesCrossStudyToQCSessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SubjectRolesCrossStudyToQCSessions` AS select `SubjectRolesCrossStudyInfo`.`StudyRoleID` AS `StudyRoleID`,`SubjectRolesCrossStudyInfo`.`StudyRoleName` AS `StudyRoleName`,`SubjectRolesCrossStudyInfo`.`StudySubjectID` AS `StudySubjectID`,`SubjectRolesCrossStudyInfo`.`SubjectName` AS `SubjectName`,`SubjectRolesCrossStudyInfo`.`StudyID` AS `StudyID`,`SubjectRolesCrossStudyInfo`.`StudyName` AS `StudyName`,`SubjectRolesCrossStudyInfo`.`StudyNickName` AS `StudyNickName`,`SubjectRolesCrossStudyInfo`.`NetworkID` AS `NetworkID`,`SubjectRolesCrossStudyInfo`.`NetworkCode` AS `NetworkCode`,`SubjectRolesCrossStudyInfo`.`NetworkName` AS `NetworkName`,`SubjectRolesCrossStudyInfo`.`SubjectID` AS `SubjectID`,`SubjectRolesCrossStudyInfo`.`SiteID` AS `SiteID`,`SubjectRolesCrossStudyInfo`.`SiteCode` AS `SiteCode`,`SubjectRolesCrossStudyInfo`.`SiteAcronym` AS `SiteAcronym`,`SubjectRolesCrossStudyInfo`.`Lab` AS `Lab`,`SubjectRolesCrossStudyInfo`.`Institution` AS `Institution`,`SubjectRolesCrossStudyInfo`.`Website` AS `Website`,`SubjectRolesCrossStudyInfo`.`CountryNumber` AS `CountryNumber`,`QCSessionInfoImages`.`QCSessionID` AS `QCSessionID`,`QCSessionInfoImages`.`QCDate` AS `QCDate`,`QCSessionInfoImages`.`FinalizedDate` AS `FinalizedDate`,`QCSessionInfoImages`.`StudyImageID` AS `StudyImageID`,`QCSessionInfoImages`.`ImageID` AS `ImageID`,`QCSessionInfoImages`.`SeriesUID` AS `SeriesUID`,`QCSessionInfoImages`.`SequenceNumber` AS `SequenceNumber`,`QCSessionInfoImages`.`ScanSessionID` AS `ScanSessionID`,`QCSessionInfoImages`.`ScanDate` AS `ScanDate`,`QCSessionInfoImages`.`StudyUID` AS `StudyUID`,`QCSessionInfoImages`.`ProtocolID` AS `ProtocolID`,`QCSessionInfoImages`.`ProtocolName` AS `ProtocolName`,`QCSessionInfoImages`.`ScannerID` AS `ScannerID`,`QCSessionInfoImages`.`UIDRoot` AS `UIDRoot`,`QCSessionInfoImages`.`StationName` AS `StationName`,`QCSessionInfoImages`.`Manufacturer` AS `Manufacturer`,`QCSessionInfoImages`.`ModelName` AS `ModelName`,`QCSessionInfoImages`.`VisitID` AS `VisitID`,`QCSessionInfoImages`.`VisitName` AS `VisitName`,`QCSessionInfoImages`.`SequenceID` AS `SequenceID`,`QCSessionInfoImages`.`SequenceName` AS `SequenceName`,`QCSessionInfoImages`.`ModalityID` AS `ModalityID`,`QCSessionInfoImages`.`ModalityName` AS `ModalityName` from (`ImagingRepositoryV6`.`SubjectRolesCrossStudyInfo` left join `ImagingRepositoryV6`.`QCSessionInfoImages` on(((`SubjectRolesCrossStudyInfo`.`StudySubjectID` = `QCSessionInfoImages`.`StudySubjectID`) and (`SubjectRolesCrossStudyInfo`.`StudyRoleID` = `QCSessionInfoImages`.`StudyRoleID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V4toV6SeriesUIDMatch`
--

/*!50001 DROP TABLE IF EXISTS `V4toV6SeriesUIDMatch`*/;
/*!50001 DROP VIEW IF EXISTS `V4toV6SeriesUIDMatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `V4toV6SeriesUIDMatch` AS select `ImagingRepositoryV4`.`ImageScans`.`ImageScanID` AS `ImageScanID`,`StudyImageInfo`.`StudyImageID` AS `StudyImageID` from (`ImagingRepositoryV4`.`ImageScans` left join `ImagingRepositoryV6`.`StudyImageInfo` on((`ImagingRepositoryV4`.`ImageScans`.`SeriesUID` = `StudyImageInfo`.`SeriesUID`))) limit 10000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MAPP2Counts2`
--

/*!50001 DROP TABLE IF EXISTS `MAPP2Counts2`*/;
/*!50001 DROP VIEW IF EXISTS `MAPP2Counts2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `MAPP2Counts2` AS select sum((case when (`MAPP2Counts`.`SiteID` = 11) then `MAPP2Counts`.`scan_count` else 0 end)) AS `michigan_count`,sum((case when (`MAPP2Counts`.`SiteID` = 12) then `MAPP2Counts`.`scan_count` else 0 end)) AS `ucla_count`,sum((case when (`MAPP2Counts`.`SiteID` = 62) then `MAPP2Counts`.`scan_count` else 0 end)) AS `northwestern_count`,sum((case when (`MAPP2Counts`.`SiteID` = 23) then `MAPP2Counts`.`scan_count` else 0 end)) AS `washington_count`,sum((case when (`MAPP2Counts`.`SiteID` = 41) then `MAPP2Counts`.`scan_count` else 0 end)) AS `stlouis_count`,sum((case when (`MAPP2Counts`.`SiteID` = 43) then `MAPP2Counts`.`scan_count` else 0 end)) AS `iowa_count`,sum((case when `MAPP2Counts`.`SiteID` then `MAPP2Counts`.`scan_count` else 0 end)) AS `total_count` from `ImagingRepositoryV6`.`MAPP2Counts` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ScanSessionInfo`
--

/*!50001 DROP TABLE IF EXISTS `ScanSessionInfo`*/;
/*!50001 DROP VIEW IF EXISTS `ScanSessionInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ScanSessionInfo` AS select `ImagingRepositoryV6`.`ScanSessions`.`ScanSessionID` AS `ScanSessionID`,`ImagingRepositoryV6`.`ScanSessions`.`ScanDate` AS `ScanDate`,`ImagingRepositoryV6`.`ScanSessions`.`StudyUID` AS `StudyUID`,`ImagingRepositoryV6`.`Protocols`.`ProtocolID` AS `ProtocolID`,`ImagingRepositoryV6`.`Protocols`.`ProtocolName` AS `ProtocolName`,`ImagingRepositoryV6`.`Scanners`.`ScannerID` AS `ScannerID`,`ImagingRepositoryV6`.`Scanners`.`UIDRoot` AS `UIDRoot`,`ImagingRepositoryV6`.`Scanners`.`StationName` AS `StationName`,`ImagingRepositoryV6`.`Scanners`.`Manufacturer` AS `Manufacturer`,`ImagingRepositoryV6`.`Scanners`.`ModelName` AS `ModelName`,`ImagingRepositoryV6`.`Visits`.`VisitID` AS `VisitID`,`ImagingRepositoryV6`.`Visits`.`VisitName` AS `VisitName`,`SubjectInfo`.`SubjectID` AS `SubjectID`,`SubjectInfo`.`SiteID` AS `SiteID`,`SubjectInfo`.`SiteCode` AS `SiteCode`,`SubjectInfo`.`SiteAcronym` AS `SiteAcronym`,`SubjectInfo`.`Lab` AS `Lab`,`SubjectInfo`.`Institution` AS `Institution`,`SubjectInfo`.`Website` AS `Website`,`SubjectInfo`.`CountryNumber` AS `CountryNumber` from ((((`ImagingRepositoryV6`.`ScanSessions` left join `ImagingRepositoryV6`.`Scanners` on((`ImagingRepositoryV6`.`ScanSessions`.`ScannerID` = `ImagingRepositoryV6`.`Scanners`.`ScannerID`))) left join `ImagingRepositoryV6`.`Visits` on((`ImagingRepositoryV6`.`ScanSessions`.`VisitID` = `ImagingRepositoryV6`.`Visits`.`VisitID`))) left join `ImagingRepositoryV6`.`Protocols` on((`ImagingRepositoryV6`.`ScanSessions`.`ProtocolID` = `ImagingRepositoryV6`.`Protocols`.`ProtocolID`))) left join `ImagingRepositoryV6`.`SubjectInfo` on((`ImagingRepositoryV6`.`ScanSessions`.`SubjectID` = `SubjectInfo`.`SubjectID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `QCSessionInfoImages`
--

/*!50001 DROP TABLE IF EXISTS `QCSessionInfoImages`*/;
/*!50001 DROP VIEW IF EXISTS `QCSessionInfoImages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `QCSessionInfoImages` AS select `ImagingRepositoryV6`.`QCSessions`.`QCSessionID` AS `QCSessionID`,`ImagingRepositoryV6`.`QCSessions`.`QCDate` AS `QCDate`,`ImagingRepositoryV6`.`QCSessions`.`FinalizedDate` AS `FinalizedDate`,`ImagingRepositoryV6`.`StudyImages`.`StudyImageID` AS `StudyImageID`,`ImagingRepositoryV6`.`StudyImages`.`StudySubjectID` AS `StudySubjectID`,`ImagingRepositoryV6`.`StudyImages`.`StudyRoleID` AS `StudyRoleID`,`ImageInfo`.`ImageID` AS `ImageID`,`ImageInfo`.`SeriesUID` AS `SeriesUID`,`ImageInfo`.`SequenceNumber` AS `SequenceNumber`,`ImageInfo`.`ScanSessionID` AS `ScanSessionID`,`ImageInfo`.`ScanDate` AS `ScanDate`,`ImageInfo`.`StudyUID` AS `StudyUID`,`ImageInfo`.`ProtocolID` AS `ProtocolID`,`ImageInfo`.`ProtocolName` AS `ProtocolName`,`ImageInfo`.`ScannerID` AS `ScannerID`,`ImageInfo`.`UIDRoot` AS `UIDRoot`,`ImageInfo`.`StationName` AS `StationName`,`ImageInfo`.`Manufacturer` AS `Manufacturer`,`ImageInfo`.`ModelName` AS `ModelName`,`ImageInfo`.`VisitID` AS `VisitID`,`ImageInfo`.`VisitName` AS `VisitName`,`ImageInfo`.`SubjectID` AS `SubjectID`,`ImageInfo`.`SiteID` AS `SiteID`,`ImageInfo`.`SiteCode` AS `SiteCode`,`ImageInfo`.`SiteAcronym` AS `SiteAcronym`,`ImageInfo`.`Lab` AS `Lab`,`ImageInfo`.`Institution` AS `Institution`,`ImageInfo`.`Website` AS `Website`,`ImageInfo`.`CountryNumber` AS `CountryNumber`,`ImageInfo`.`SequenceID` AS `SequenceID`,`ImageInfo`.`SequenceName` AS `SequenceName`,`ImageInfo`.`ModalityID` AS `ModalityID`,`ImageInfo`.`ModalityName` AS `ModalityName` from ((`ImagingRepositoryV6`.`QCSessions` left join `ImagingRepositoryV6`.`StudyImages` on((`ImagingRepositoryV6`.`QCSessions`.`StudyImageID` = `ImagingRepositoryV6`.`StudyImages`.`StudyImageID`))) left join `ImagingRepositoryV6`.`ImageInfo` on((`ImagingRepositoryV6`.`StudyImages`.`ImageID` = `ImageInfo`.`ImageID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StudyRoleInfo`
--

/*!50001 DROP TABLE IF EXISTS `StudyRoleInfo`*/;
/*!50001 DROP VIEW IF EXISTS `StudyRoleInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `StudyRoleInfo` AS select `ImagingRepositoryV6`.`StudyRoles`.`StudyRoleID` AS `StudyRoleID`,`ImagingRepositoryV6`.`StudyRoles`.`StudyRoleName` AS `StudyRoleName`,`StudyInfo`.`StudyID` AS `StudyID`,`StudyInfo`.`StudyName` AS `StudyName`,`StudyInfo`.`StudyNickName` AS `StudyNickName`,`StudyInfo`.`NetworkID` AS `NetworkID`,`StudyInfo`.`NetworkCode` AS `NetworkCode`,`StudyInfo`.`NetworkName` AS `NetworkName` from (`ImagingRepositoryV6`.`StudyRoles` left join `ImagingRepositoryV6`.`StudyInfo` on((`ImagingRepositoryV6`.`StudyRoles`.`StudyID` = `StudyInfo`.`StudyID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MAPP2Report`
--

/*!50001 DROP TABLE IF EXISTS `MAPP2Report`*/;
/*!50001 DROP VIEW IF EXISTS `MAPP2Report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `MAPP2Report` AS select `MAPP2SubReport`.`UploadID` AS `UploadID`,cast(`MAPP2SubReport`.`UploadTime` as date) AS `UploadTime`,`MAPP2SubReport`.`SiteID` AS `SiteID`,`MAPP2SubReport`.`Note` AS `Note`,`membership`.`site`.`site_acronym` AS `SiteAcronym`,`membership`.`network_site`.`site_nickname` AS `site_nickname`,`StudyImageInfo`.`ScanSessionID` AS `ScanSessionID`,`StudyImageInfo`.`ScanDate` AS `ScanDate`,`StudyImageInfo`.`StudySubjectID` AS `StudySubjectID`,`StudyImageInfo`.`SubjectName` AS `SubjectName`,`ImagingRepositoryV6`.`ScanSessions`.`Token` AS `Token`,group_concat((case `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` when 43 then if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),NULL,if(isnull(`OverallQCInfo`.`QCAnswerID`),'No QC',if((`OverallQCInfo`.`QCChoiceName` = 'Double-Check'),'Under QC',if((`OverallQCInfo`.`QCChoiceName` = 'Fail'),'Flagged',`OverallQCInfo`.`QCChoiceName`)))) else NULL end) separator ',') AS `Anatomical`,group_concat((case `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` when 44 then if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),NULL,if(isnull(`OverallQCInfo`.`QCAnswerID`),'No QC',if((`OverallQCInfo`.`QCChoiceName` = 'Double-Check'),'Under QC',if((`OverallQCInfo`.`QCChoiceName` = 'Fail'),'Flagged',`OverallQCInfo`.`QCChoiceName`)))) else NULL end) separator ',') AS `Diffusion`,group_concat((case `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` when 45 then if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),NULL,if(isnull(`OverallQCInfo`.`QCAnswerID`),'No QC',if((`OverallQCInfo`.`QCChoiceName` = 'Double-Check'),'Under QC',if((`OverallQCInfo`.`QCChoiceName` = 'Fail'),'Flagged',`OverallQCInfo`.`QCChoiceName`)))) else NULL end) separator ',') AS `RestingState1`,group_concat((case `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` when 46 then if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),NULL,if(isnull(`OverallQCInfo`.`QCAnswerID`),'No QC',if((`OverallQCInfo`.`QCChoiceName` = 'Double-Check'),'Under QC',if((`OverallQCInfo`.`QCChoiceName` = 'Fail'),'Flagged',`OverallQCInfo`.`QCChoiceName`)))) else NULL end) separator ',') AS `RestingState2`,sum(if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),if((`StudyImageInfo`.`StudyImageID` is not null),1,0),0)) AS `OtherScans` from ((((((`ImagingRepositoryV6`.`MAPP2SubReport` left join `ImagingRepositoryV6`.`SubjectRolesCrossStudyToQCSessions` on((`MAPP2SubReport`.`StudyImageID` = `SubjectRolesCrossStudyToQCSessions`.`StudyImageID`))) left join `ImagingRepositoryV6`.`ScanSessions` on((`SubjectRolesCrossStudyToQCSessions`.`ScanSessionID` = `ImagingRepositoryV6`.`ScanSessions`.`ScanSessionID`))) left join `ImagingRepositoryV6`.`OverallQCInfo` on((`SubjectRolesCrossStudyToQCSessions`.`QCSessionID` = `OverallQCInfo`.`QCSessionID`))) left join `membership`.`site` on((`MAPP2SubReport`.`SiteID` = `membership`.`site`.`site_id`))) left join `membership`.`network_site` on(((`MAPP2SubReport`.`SiteID` = `membership`.`network_site`.`site_id`) and (`MAPP2SubReport`.`NetworkID` = `membership`.`network_site`.`network_id`)))) left join `ImagingRepositoryV6`.`StudyImageInfo` on((`MAPP2SubReport`.`StudyImageID` = `StudyImageInfo`.`StudyImageID`))) group by `MAPP2SubReport`.`UploadID`,`StudyImageInfo`.`ScanSessionID`,`StudyImageInfo`.`StudySubjectID` order by `MAPP2SubReport`.`UploadTime` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StudyImageInfo`
--

/*!50001 DROP TABLE IF EXISTS `StudyImageInfo`*/;
/*!50001 DROP VIEW IF EXISTS `StudyImageInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `StudyImageInfo` AS select `ImagingRepositoryV6`.`StudyImages`.`StudyImageID` AS `StudyImageID`,`ImageInfo`.`ImageID` AS `ImageID`,`ImageInfo`.`SeriesUID` AS `SeriesUID`,`ImageInfo`.`SequenceNumber` AS `SequenceNumber`,`ImageInfo`.`ScanSessionID` AS `ScanSessionID`,`ImageInfo`.`ScanDate` AS `ScanDate`,`ImageInfo`.`StudyUID` AS `StudyUID`,`ImageInfo`.`ProtocolID` AS `ProtocolID`,`ImageInfo`.`ProtocolName` AS `ProtocolName`,`ImageInfo`.`ScannerID` AS `ScannerID`,`ImageInfo`.`UIDRoot` AS `UIDRoot`,`ImageInfo`.`StationName` AS `StationName`,`ImageInfo`.`Manufacturer` AS `Manufacturer`,`ImageInfo`.`ModelName` AS `ModelName`,`ImageInfo`.`VisitID` AS `VisitID`,`ImageInfo`.`VisitName` AS `VisitName`,`ImageInfo`.`SequenceID` AS `SequenceID`,`ImageInfo`.`SequenceName` AS `SequenceName`,`ImageInfo`.`ModalityID` AS `ModalityID`,`ImageInfo`.`ModalityName` AS `ModalityName`,`ImagingRepositoryV6`.`StudyRoles`.`StudyRoleID` AS `StudyRoleID`,`ImagingRepositoryV6`.`StudyRoles`.`StudyRoleName` AS `StudyRoleName`,`StudySubjectInfo`.`StudySubjectID` AS `StudySubjectID`,`StudySubjectInfo`.`SubjectName` AS `SubjectName`,`StudySubjectInfo`.`StudyID` AS `StudyID`,`StudySubjectInfo`.`StudyName` AS `StudyName`,`StudySubjectInfo`.`StudyNickName` AS `StudyNickName`,`StudySubjectInfo`.`NetworkID` AS `NetworkID`,`StudySubjectInfo`.`NetworkCode` AS `NetworkCode`,`StudySubjectInfo`.`NetworkName` AS `NetworkName`,`StudySubjectInfo`.`SubjectID` AS `SubjectID`,`StudySubjectInfo`.`SiteID` AS `SiteID`,`StudySubjectInfo`.`SiteCode` AS `SiteCode`,`StudySubjectInfo`.`SiteAcronym` AS `SiteAcronym`,`StudySubjectInfo`.`Lab` AS `Lab`,`StudySubjectInfo`.`Institution` AS `Institution`,`StudySubjectInfo`.`Website` AS `Website`,`StudySubjectInfo`.`CountryNumber` AS `CountryNumber` from (((`ImagingRepositoryV6`.`StudyImages` left join `ImagingRepositoryV6`.`ImageInfo` on((`ImagingRepositoryV6`.`StudyImages`.`ImageID` = `ImageInfo`.`ImageID`))) left join `ImagingRepositoryV6`.`StudyRoles` on((`ImagingRepositoryV6`.`StudyImages`.`StudyRoleID` = `ImagingRepositoryV6`.`StudyRoles`.`StudyRoleID`))) left join `ImagingRepositoryV6`.`StudySubjectInfo` on((`ImagingRepositoryV6`.`StudyImages`.`StudySubjectID` = `StudySubjectInfo`.`StudySubjectID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StudyPeopleInfo`
--

/*!50001 DROP TABLE IF EXISTS `StudyPeopleInfo`*/;
/*!50001 DROP VIEW IF EXISTS `StudyPeopleInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cody`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `StudyPeopleInfo` AS select `ImagingRepositoryV6`.`StudyPeople`.`StudyPeopleID` AS `StudyPeopleID`,`ImagingRepositoryV6`.`StudyPeople`.`StudyID` AS `StudyID`,`ImagingRepositoryV6`.`StudyPeople`.`PeopleID` AS `PeopleID`,`ImagingRepositoryV6`.`StudyPeople`.`PeopleRoleID` AS `PeopleRoleID`,`ImagingRepositoryV6`.`Studies`.`NetworkID` AS `NetworkID`,`ImagingRepositoryV6`.`Studies`.`StudyName` AS `StudyName`,`ImagingRepositoryV6`.`Studies`.`StudyNickName` AS `StudyNickName`,`ImagingRepositoryV6`.`Studies`.`SubjectRegex` AS `SubjectRegex`,`ImagingRepositoryV6`.`Studies`.`InactiveFlag` AS `InactiveFlag`,`ImagingRepositoryV6`.`Studies`.`Token` AS `Token`,`membership`.`people`.`wp_id` AS `wp_id`,`membership`.`people`.`site_id` AS `site_id`,`membership`.`people`.`user_type_id` AS `user_type_id`,`membership`.`people`.`first_name` AS `first_name`,`membership`.`people`.`last_name` AS `last_name`,`membership`.`people`.`degree_id` AS `degree_id`,`membership`.`people`.`academic_title` AS `academic_title`,`membership`.`people`.`institution` AS `institution`,`membership`.`people`.`laboratory` AS `laboratory`,`membership`.`people`.`country_number` AS `country_number`,`membership`.`people`.`username` AS `username`,`membership`.`people`.`cns_web_hash` AS `cns_web_hash`,`membership`.`people`.`email` AS `email`,`membership`.`people`.`reason` AS `reason`,`membership`.`people`.`archived_membership` AS `archived_membership`,`membership`.`people`.`standardized_membership` AS `standardized_membership`,`membership`.`people`.`active_flag` AS `active_flag`,`membership`.`people`.`ec_member` AS `ec_member`,`membership`.`people`.`notes` AS `notes`,`membership`.`people`.`date_added` AS `date_added`,`membership`.`people`.`update_stamp` AS `update_stamp`,`ImagingRepositoryV6`.`PeopleRoles`.`PeopleRoleName` AS `PeopleRoleName` from (((`ImagingRepositoryV6`.`StudyPeople` left join `ImagingRepositoryV6`.`Studies` on((`ImagingRepositoryV6`.`StudyPeople`.`StudyID` = `ImagingRepositoryV6`.`Studies`.`StudyID`))) left join `membership`.`people` on((`ImagingRepositoryV6`.`StudyPeople`.`PeopleID` = `membership`.`people`.`people_id`))) left join `ImagingRepositoryV6`.`PeopleRoles` on((`ImagingRepositoryV6`.`StudyPeople`.`PeopleRoleID` = `ImagingRepositoryV6`.`PeopleRoles`.`PeopleRoleID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CrossProjectInfo`
--

/*!50001 DROP TABLE IF EXISTS `CrossProjectInfo`*/;
/*!50001 DROP VIEW IF EXISTS `CrossProjectInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CrossProjectInfo` AS select `ProjectRows`.`ProjectRowID` AS `ProjectRowID`,`ProjectRows`.`ProjectID` AS `ProjectID`,`ProjectRows`.`ProjectRowName` AS `ProjectRowName`,`ProjectColumns`.`ProjectColumnID` AS `ProjectColumnID`,`ProjectColumns`.`ProjectColumnName` AS `ProjectColumnName` from (`ProjectRows` join `ProjectColumns` on((`ProjectRows`.`ProjectID` = `ProjectColumns`.`ProjectID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MAPP2Counts`
--

/*!50001 DROP TABLE IF EXISTS `MAPP2Counts`*/;
/*!50001 DROP VIEW IF EXISTS `MAPP2Counts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cathy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `MAPP2Counts` AS select count(distinct `MAPP2Report`.`ScanSessionID`) AS `scan_count`,`MAPP2Report`.`SiteID` AS `SiteID`,`MAPP2Report`.`site_nickname` AS `site_nickname` from `ImagingRepositoryV6`.`MAPP2Report` group by `MAPP2Report`.`SiteID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `BrainRegionInfo`
--

/*!50001 DROP TABLE IF EXISTS `BrainRegionInfo`*/;
/*!50001 DROP VIEW IF EXISTS `BrainRegionInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `BrainRegionInfo` AS select `BrainRegions`.`BrainRegionID` AS `BrainRegionID`,`BrainRegions`.`BrainRegionName` AS `BrainRegionName`,`BrainRegions`.`NativeID` AS `NativeID`,`BrainRegions`.`ParentID` AS `ParentID`,`Atlases`.`AtlasID` AS `AtlasID`,`Atlases`.`AtlasName` AS `AtlasName` from (`BrainRegions` left join `Atlases` on((`BrainRegions`.`AtlasID` = `Atlases`.`AtlasID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StudySubjectInfo`
--

/*!50001 DROP TABLE IF EXISTS `StudySubjectInfo`*/;
/*!50001 DROP VIEW IF EXISTS `StudySubjectInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `StudySubjectInfo` AS select `ImagingRepositoryV6`.`StudySubjects`.`StudySubjectID` AS `StudySubjectID`,`ImagingRepositoryV6`.`StudySubjects`.`SubjectName` AS `SubjectName`,`StudyInfo`.`StudyID` AS `StudyID`,`StudyInfo`.`StudyName` AS `StudyName`,`StudyInfo`.`StudyNickName` AS `StudyNickName`,`StudyInfo`.`NetworkID` AS `NetworkID`,`StudyInfo`.`NetworkCode` AS `NetworkCode`,`StudyInfo`.`NetworkName` AS `NetworkName`,`SubjectInfo`.`SubjectID` AS `SubjectID`,`SubjectInfo`.`SiteID` AS `SiteID`,`SubjectInfo`.`SiteCode` AS `SiteCode`,`SubjectInfo`.`SiteAcronym` AS `SiteAcronym`,`SubjectInfo`.`Lab` AS `Lab`,`SubjectInfo`.`Institution` AS `Institution`,`SubjectInfo`.`Website` AS `Website`,`SubjectInfo`.`CountryNumber` AS `CountryNumber` from ((`ImagingRepositoryV6`.`StudySubjects` left join `ImagingRepositoryV6`.`StudyInfo` on((`ImagingRepositoryV6`.`StudySubjects`.`StudyID` = `StudyInfo`.`StudyID`))) left join `ImagingRepositoryV6`.`SubjectInfo` on((`ImagingRepositoryV6`.`StudySubjects`.`SubjectID` = `SubjectInfo`.`SubjectID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ProjectStudyImageInfo`
--

/*!50001 DROP TABLE IF EXISTS `ProjectStudyImageInfo`*/;
/*!50001 DROP VIEW IF EXISTS `ProjectStudyImageInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ProjectStudyImageInfo` AS select `ImagingRepositoryV6`.`ProjectImages`.`AssignmentID` AS `AssignmentID`,`ImagingRepositoryV6`.`ProjectImages`.`ProjectRowID` AS `ProjectRowID`,`ImagingRepositoryV6`.`ProjectImages`.`ProjectColumnID` AS `ProjectColumnID`,`ImagingRepositoryV6`.`ProjectImages`.`StudyImageID` AS `StudyImageID`,`ImagingRepositoryV6`.`ProjectImages`.`TimeStamp` AS `TimeStamp`,`QCSessionInfoImages`.`QCSessionID` AS `QCSessionID`,`QCSessionInfoImages`.`QCDate` AS `QCDate`,`QCSessionInfoImages`.`FinalizedDate` AS `FinalizedDate`,`QCSessionInfoImages`.`StudySubjectID` AS `StudySubjectID`,`QCSessionInfoImages`.`StudyRoleID` AS `StudyRoleID`,`QCSessionInfoImages`.`ImageID` AS `ImageID`,`QCSessionInfoImages`.`SeriesUID` AS `SeriesUID`,`QCSessionInfoImages`.`SequenceNumber` AS `SequenceNumber`,`QCSessionInfoImages`.`ScanSessionID` AS `ScanSessionID`,`QCSessionInfoImages`.`ScanDate` AS `ScanDate`,`QCSessionInfoImages`.`StudyUID` AS `StudyUID`,`QCSessionInfoImages`.`ProtocolID` AS `ProtocolID`,`QCSessionInfoImages`.`ProtocolName` AS `ProtocolName`,`QCSessionInfoImages`.`ScannerID` AS `ScannerID`,`QCSessionInfoImages`.`UIDRoot` AS `UIDRoot`,`QCSessionInfoImages`.`StationName` AS `StationName`,`QCSessionInfoImages`.`Manufacturer` AS `Manufacturer`,`QCSessionInfoImages`.`ModelName` AS `ModelName`,`QCSessionInfoImages`.`VisitID` AS `VisitID`,`QCSessionInfoImages`.`VisitName` AS `VisitName`,`QCSessionInfoImages`.`SubjectID` AS `SubjectID`,`QCSessionInfoImages`.`SiteID` AS `SiteID`,`QCSessionInfoImages`.`SiteCode` AS `SiteCode`,`QCSessionInfoImages`.`SiteAcronym` AS `SiteAcronym`,`QCSessionInfoImages`.`Lab` AS `Lab`,`QCSessionInfoImages`.`Institution` AS `Institution`,`QCSessionInfoImages`.`Website` AS `Website`,`QCSessionInfoImages`.`CountryNumber` AS `CountryNumber`,`QCSessionInfoImages`.`SequenceID` AS `SequenceID`,`QCSessionInfoImages`.`SequenceName` AS `SequenceName`,`QCSessionInfoImages`.`ModalityID` AS `ModalityID`,`QCSessionInfoImages`.`ModalityName` AS `ModalityName` from (`ImagingRepositoryV6`.`ProjectImages` left join `ImagingRepositoryV6`.`QCSessionInfoImages` on((`ImagingRepositoryV6`.`ProjectImages`.`StudyImageID` = `QCSessionInfoImages`.`StudyImageID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LURNReport`
--

/*!50001 DROP TABLE IF EXISTS `LURNReport`*/;
/*!50001 DROP VIEW IF EXISTS `LURNReport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `LURNReport` AS select `LURNSubReport`.`UploadID` AS `UploadID`,cast(`LURNSubReport`.`UploadTime` as date) AS `UploadTime`,`LURNSubReport`.`SiteID` AS `SiteID`,`LURNSubReport`.`Note` AS `Note`,`membership`.`site`.`site_acronym` AS `SiteAcronym`,`membership`.`network_site`.`site_nickname` AS `site_nickname`,`StudyImageInfo`.`ScanSessionID` AS `ScanSessionID`,`StudyImageInfo`.`ScanDate` AS `ScanDate`,`StudyImageInfo`.`StudySubjectID` AS `StudySubjectID`,`StudyImageInfo`.`SubjectName` AS `SubjectName`,`ImagingRepositoryV6`.`ScanSessions`.`Token` AS `Token`,group_concat((case `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` when 43 then if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),NULL,if(isnull(`OverallQCInfo`.`QCAnswerID`),'No QC',if((`OverallQCInfo`.`QCChoiceName` = 'Double-Check'),'Under QC',if((`OverallQCInfo`.`QCChoiceName` = 'Fail'),'Flagged',`OverallQCInfo`.`QCChoiceName`)))) else NULL end) separator ',') AS `Anatomical`,group_concat((case `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` when 44 then if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),NULL,if(isnull(`OverallQCInfo`.`QCAnswerID`),'No QC',if((`OverallQCInfo`.`QCChoiceName` = 'Double-Check'),'Under QC',if((`OverallQCInfo`.`QCChoiceName` = 'Fail'),'Flagged',`OverallQCInfo`.`QCChoiceName`)))) else NULL end) separator ',') AS `Diffusion`,group_concat((case `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` when 45 then if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),NULL,if(isnull(`OverallQCInfo`.`QCAnswerID`),'No QC',if((`OverallQCInfo`.`QCChoiceName` = 'Double-Check'),'Under QC',if((`OverallQCInfo`.`QCChoiceName` = 'Fail'),'Flagged',`OverallQCInfo`.`QCChoiceName`)))) else NULL end) separator ',') AS `RestingState1`,group_concat((case `SubjectRolesCrossStudyToQCSessions`.`StudyRoleID` when 46 then if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),NULL,if(isnull(`OverallQCInfo`.`QCAnswerID`),'No QC',if((`OverallQCInfo`.`QCChoiceName` = 'Double-Check'),'Under QC',if((`OverallQCInfo`.`QCChoiceName` = 'Fail'),'Flagged',`OverallQCInfo`.`QCChoiceName`)))) else NULL end) separator ',') AS `RestingState2`,sum(if(isnull(`SubjectRolesCrossStudyToQCSessions`.`StudyImageID`),if((`StudyImageInfo`.`StudyImageID` is not null),1,0),0)) AS `OtherScans` from ((((((`ImagingRepositoryV6`.`LURNSubReport` left join `ImagingRepositoryV6`.`SubjectRolesCrossStudyToQCSessions` on((`LURNSubReport`.`StudyImageID` = `SubjectRolesCrossStudyToQCSessions`.`StudyImageID`))) left join `ImagingRepositoryV6`.`ScanSessions` on((`SubjectRolesCrossStudyToQCSessions`.`ScanSessionID` = `ImagingRepositoryV6`.`ScanSessions`.`ScanSessionID`))) left join `ImagingRepositoryV6`.`OverallQCInfo` on((`SubjectRolesCrossStudyToQCSessions`.`QCSessionID` = `OverallQCInfo`.`QCSessionID`))) left join `membership`.`site` on((`LURNSubReport`.`SiteID` = `membership`.`site`.`site_id`))) left join `membership`.`network_site` on(((`LURNSubReport`.`SiteID` = `membership`.`network_site`.`site_id`) and (`LURNSubReport`.`NetworkID` = `membership`.`network_site`.`network_id`)))) left join `ImagingRepositoryV6`.`StudyImageInfo` on((`LURNSubReport`.`StudyImageID` = `StudyImageInfo`.`StudyImageID`))) group by `LURNSubReport`.`UploadID`,`StudyImageInfo`.`ScanSessionID`,`StudyImageInfo`.`StudySubjectID` order by `LURNSubReport`.`UploadTime` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OverallQCInfo`
--

/*!50001 DROP TABLE IF EXISTS `OverallQCInfo`*/;
/*!50001 DROP VIEW IF EXISTS `OverallQCInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `OverallQCInfo` AS select `QCAnswerInfoQCChoicesBrainRegions`.`QCAnswerID` AS `QCAnswerID`,`QCAnswerInfoQCChoicesBrainRegions`.`QCSessionID` AS `QCSessionID`,`QCAnswerInfoQCChoicesBrainRegions`.`NumericData` AS `NumericData`,`QCAnswerInfoQCChoicesBrainRegions`.`TextData` AS `TextData`,`QCAnswerInfoQCChoicesBrainRegions`.`Laterality` AS `Laterality`,`QCAnswerInfoQCChoicesBrainRegions`.`BrainRegionDirection` AS `BrainRegionDirection`,`QCAnswerInfoQCChoicesBrainRegions`.`VolumeNumber` AS `VolumeNumber`,`QCAnswerInfoQCChoicesBrainRegions`.`XCoord` AS `XCoord`,`QCAnswerInfoQCChoicesBrainRegions`.`YCoord` AS `YCoord`,`QCAnswerInfoQCChoicesBrainRegions`.`ZCoord` AS `ZCoord`,`QCAnswerInfoQCChoicesBrainRegions`.`DBSyncID` AS `DBSyncID`,`QCAnswerInfoQCChoicesBrainRegions`.`Comments` AS `Comments`,`QCAnswerInfoQCChoicesBrainRegions`.`TimeStamp` AS `TimeStamp`,`QCAnswerInfoQCChoicesBrainRegions`.`QCChoiceID` AS `QCChoiceID`,`QCAnswerInfoQCChoicesBrainRegions`.`QCChoiceOrder` AS `QCChoiceOrder`,`QCAnswerInfoQCChoicesBrainRegions`.`QCChoiceName` AS `QCChoiceName`,`QCAnswerInfoQCChoicesBrainRegions`.`AlertFlag` AS `AlertFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`QCQuestionID` AS `QCQuestionID`,`QCAnswerInfoQCChoicesBrainRegions`.`QCQuestionName` AS `QCQuestionName`,`QCAnswerInfoQCChoicesBrainRegions`.`ModalityID` AS `ModalityID`,`QCAnswerInfoQCChoicesBrainRegions`.`QCQuestionDescription` AS `QCQuestionDescription`,`QCAnswerInfoQCChoicesBrainRegions`.`QCLevel` AS `QCLevel`,`QCAnswerInfoQCChoicesBrainRegions`.`RequiredFlag` AS `RequiredFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`UniqueFlag` AS `UniqueFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`HumanFlag` AS `HumanFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`OverallFlag` AS `OverallFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`NumericFlag` AS `NumericFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`TextFlag` AS `TextFlag`,`QCAnswerInfoQCChoicesBrainRegions`.`DICOMTag` AS `DICOMTag`,`QCAnswerInfoQCChoicesBrainRegions`.`QCReportID` AS `QCReportID`,`QCAnswerInfoQCChoicesBrainRegions`.`QCReportName` AS `QCReportName`,`QCAnswerInfoQCChoicesBrainRegions`.`BrainRegionID` AS `BrainRegionID`,`QCAnswerInfoQCChoicesBrainRegions`.`BrainRegionName` AS `BrainRegionName`,`QCAnswerInfoQCChoicesBrainRegions`.`NativeID` AS `NativeID`,`QCAnswerInfoQCChoicesBrainRegions`.`ParentID` AS `ParentID`,`QCAnswerInfoQCChoicesBrainRegions`.`AtlasID` AS `AtlasID`,`QCAnswerInfoQCChoicesBrainRegions`.`AtlasName` AS `AtlasName` from `QCAnswerInfoQCChoicesBrainRegions` where (`QCAnswerInfoQCChoicesBrainRegions`.`OverallFlag` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `QCAnswerInfo`
--

/*!50001 DROP TABLE IF EXISTS `QCAnswerInfo`*/;
/*!50001 DROP VIEW IF EXISTS `QCAnswerInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `QCAnswerInfo` AS select `ImagingRepositoryV6`.`QCAnswers`.`QCAnswerID` AS `QCAnswerID`,`ImagingRepositoryV6`.`QCAnswers`.`NumericData` AS `NumericData`,`ImagingRepositoryV6`.`QCAnswers`.`TextData` AS `TextData`,`ImagingRepositoryV6`.`QCAnswers`.`Laterality` AS `Laterality`,`ImagingRepositoryV6`.`QCAnswers`.`BrainRegionDirection` AS `BrainRegionDirection`,`ImagingRepositoryV6`.`QCAnswers`.`VolumeNumber` AS `VolumeNumber`,`ImagingRepositoryV6`.`QCAnswers`.`XCoord` AS `XCoord`,`ImagingRepositoryV6`.`QCAnswers`.`YCoord` AS `YCoord`,`ImagingRepositoryV6`.`QCAnswers`.`ZCoord` AS `ZCoord`,`ImagingRepositoryV6`.`QCAnswers`.`Comments` AS `Comments`,`BrainRegionInfo`.`BrainRegionID` AS `BrainRegionID`,`BrainRegionInfo`.`BrainRegionName` AS `BrainRegionName`,`BrainRegionInfo`.`NativeID` AS `NativeID`,`BrainRegionInfo`.`ParentID` AS `ParentID`,`BrainRegionInfo`.`AtlasID` AS `AtlasID`,`BrainRegionInfo`.`AtlasName` AS `AtlasName`,`QCChoiceInfo`.`QCChoiceID` AS `QCChoiceID`,`QCChoiceInfo`.`QCChoiceOrder` AS `QCChoiceOrder`,`QCChoiceInfo`.`QCChoiceName` AS `QCChoiceName`,`QCChoiceInfo`.`AlertFlag` AS `AlertFlag`,`QCChoiceInfo`.`QCQuestionID` AS `QCQuestionID`,`QCChoiceInfo`.`QCQuestionName` AS `QCQuestionName`,`QCChoiceInfo`.`QCQuestionDescription` AS `QCQuestionDescription`,`QCChoiceInfo`.`QCLevel` AS `QCLevel`,`QCChoiceInfo`.`RequiredFlag` AS `RequiredFlag`,`QCChoiceInfo`.`UniqueFlag` AS `UniqueFlag`,`QCChoiceInfo`.`HumanFlag` AS `HumanFlag`,`QCChoiceInfo`.`OverallFlag` AS `OverallFlag`,`QCChoiceInfo`.`NumericFlag` AS `NumericFlag`,`QCChoiceInfo`.`TextFlag` AS `TextFlag`,`QCChoiceInfo`.`DICOMTag` AS `DICOMTag`,`QCChoiceInfo`.`QCReportID` AS `QCReportID`,`QCChoiceInfo`.`QCReportName` AS `QCReportName`,`QCSessionInfo`.`QCSessionID` AS `QCSessionID`,`QCSessionInfo`.`QCDate` AS `QCDate`,`QCSessionInfo`.`Finalized` AS `Finalized`,`QCSessionInfo`.`FinalizedDate` AS `FinalizedDate`,`QCSessionInfo`.`StudyImageID` AS `StudyImageID`,`QCSessionInfo`.`ImageID` AS `ImageID`,`QCSessionInfo`.`SeriesUID` AS `SeriesUID`,`QCSessionInfo`.`SequenceNumber` AS `SequenceNumber`,`QCSessionInfo`.`ScanSessionID` AS `ScanSessionID`,`QCSessionInfo`.`ScanDate` AS `ScanDate`,`QCSessionInfo`.`StudyUID` AS `StudyUID`,`QCSessionInfo`.`ProtocolID` AS `ProtocolID`,`QCSessionInfo`.`ProtocolName` AS `ProtocolName`,`QCSessionInfo`.`SequenceID` AS `SequenceID`,`QCSessionInfo`.`SequenceName` AS `SequenceName`,`QCSessionInfo`.`ModalityID` AS `ModalityID`,`QCSessionInfo`.`ModalityName` AS `ModalityName`,`QCSessionInfo`.`StudyRoleID` AS `StudyRoleID`,`QCSessionInfo`.`StudyRoleName` AS `StudyRoleName`,`QCSessionInfo`.`StudySubjectID` AS `StudySubjectID`,`QCSessionInfo`.`SubjectName` AS `SubjectName`,`QCSessionInfo`.`StudyID` AS `StudyID`,`QCSessionInfo`.`StudyName` AS `StudyName`,`QCSessionInfo`.`StudyNickName` AS `StudyNickName`,`QCSessionInfo`.`NetworkID` AS `NetworkID`,`QCSessionInfo`.`NetworkCode` AS `NetworkCode`,`QCSessionInfo`.`SubjectID` AS `SubjectID`,`QCSessionInfo`.`SiteID` AS `SiteID`,`QCSessionInfo`.`SiteCode` AS `SiteCode`,`QCSessionInfo`.`SiteAcronym` AS `SiteAcronym`,`QCSessionInfo`.`Lab` AS `Lab`,`QCSessionInfo`.`Institution` AS `Institution`,`QCSessionInfo`.`Website` AS `Website`,`QCSessionInfo`.`CountryNumber` AS `CountryNumber` from (((`ImagingRepositoryV6`.`QCAnswers` left join `ImagingRepositoryV6`.`BrainRegionInfo` on((`ImagingRepositoryV6`.`QCAnswers`.`BrainRegionID` = `BrainRegionInfo`.`BrainRegionID`))) left join `ImagingRepositoryV6`.`QCChoiceInfo` on((`ImagingRepositoryV6`.`QCAnswers`.`QCChoiceID` = `QCChoiceInfo`.`QCChoiceID`))) left join `ImagingRepositoryV6`.`QCSessionInfo` on((`ImagingRepositoryV6`.`QCAnswers`.`QCSessionID` = `QCSessionInfo`.`QCSessionID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `QCQuestionInfo`
--

/*!50001 DROP TABLE IF EXISTS `QCQuestionInfo`*/;
/*!50001 DROP VIEW IF EXISTS `QCQuestionInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `QCQuestionInfo` AS select `QCQuestions`.`QCQuestionID` AS `QCQuestionID`,`QCQuestions`.`QCQuestionName` AS `QCQuestionName`,`QCQuestions`.`ModalityID` AS `ModalityID`,`QCQuestions`.`QCQuestionDescription` AS `QCQuestionDescription`,`QCQuestions`.`QCLevel` AS `QCLevel`,`QCQuestions`.`RequiredFlag` AS `RequiredFlag`,`QCQuestions`.`UniqueFlag` AS `UniqueFlag`,`QCQuestions`.`HumanFlag` AS `HumanFlag`,`QCQuestions`.`OverallFlag` AS `OverallFlag`,`QCQuestions`.`NumericFlag` AS `NumericFlag`,`QCQuestions`.`TextFlag` AS `TextFlag`,`QCQuestions`.`DICOMTag` AS `DICOMTag`,`QCReports`.`QCReportID` AS `QCReportID`,`QCReports`.`QCReportName` AS `QCReportName` from (`QCQuestions` left join `QCReports` on((`QCQuestions`.`QCReportID` = `QCReports`.`QCReportID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SequenceInfo`
--

/*!50001 DROP TABLE IF EXISTS `SequenceInfo`*/;
/*!50001 DROP VIEW IF EXISTS `SequenceInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SequenceInfo` AS select `Sequences`.`SequenceID` AS `SequenceID`,`Sequences`.`SequenceName` AS `SequenceName`,`Modalities`.`ModalityID` AS `ModalityID`,`Modalities`.`ModalityName` AS `ModalityName` from (`Sequences` left join `Modalities` on((`Sequences`.`ModalityID` = `Modalities`.`ModalityID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ImageInfo`
--

/*!50001 DROP TABLE IF EXISTS `ImageInfo`*/;
/*!50001 DROP VIEW IF EXISTS `ImageInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ImageInfo` AS select `ImagingRepositoryV6`.`Images`.`ImageID` AS `ImageID`,`ImagingRepositoryV6`.`Images`.`SeriesUID` AS `SeriesUID`,`ImagingRepositoryV6`.`Images`.`SequenceNumber` AS `SequenceNumber`,`ScanSessionInfo`.`ScanSessionID` AS `ScanSessionID`,`ScanSessionInfo`.`ScanDate` AS `ScanDate`,`ScanSessionInfo`.`StudyUID` AS `StudyUID`,`ScanSessionInfo`.`ProtocolID` AS `ProtocolID`,`ScanSessionInfo`.`ProtocolName` AS `ProtocolName`,`ScanSessionInfo`.`ScannerID` AS `ScannerID`,`ScanSessionInfo`.`UIDRoot` AS `UIDRoot`,`ScanSessionInfo`.`StationName` AS `StationName`,`ScanSessionInfo`.`Manufacturer` AS `Manufacturer`,`ScanSessionInfo`.`ModelName` AS `ModelName`,`ScanSessionInfo`.`VisitID` AS `VisitID`,`ScanSessionInfo`.`VisitName` AS `VisitName`,`ScanSessionInfo`.`SubjectID` AS `SubjectID`,`ScanSessionInfo`.`SiteID` AS `SiteID`,`ScanSessionInfo`.`SiteCode` AS `SiteCode`,`ScanSessionInfo`.`SiteAcronym` AS `SiteAcronym`,`ScanSessionInfo`.`Lab` AS `Lab`,`ScanSessionInfo`.`Institution` AS `Institution`,`ScanSessionInfo`.`Website` AS `Website`,`ScanSessionInfo`.`CountryNumber` AS `CountryNumber`,`SequenceInfo`.`SequenceID` AS `SequenceID`,`SequenceInfo`.`SequenceName` AS `SequenceName`,`SequenceInfo`.`ModalityID` AS `ModalityID`,`SequenceInfo`.`ModalityName` AS `ModalityName` from ((`ImagingRepositoryV6`.`Images` left join `ImagingRepositoryV6`.`ScanSessionInfo` on((`ImagingRepositoryV6`.`Images`.`ScanSessionID` = `ScanSessionInfo`.`ScanSessionID`))) left join `ImagingRepositoryV6`.`SequenceInfo` on((`ImagingRepositoryV6`.`Images`.`SequenceID` = `SequenceInfo`.`SequenceID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SubjectInfo`
--

/*!50001 DROP TABLE IF EXISTS `SubjectInfo`*/;
/*!50001 DROP VIEW IF EXISTS `SubjectInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SubjectInfo` AS select `ImagingRepositoryV6`.`Subjects`.`SubjectID` AS `SubjectID`,`membership`.`site`.`site_id` AS `SiteID`,`membership`.`site`.`site_code` AS `SiteCode`,`membership`.`site`.`site_acronym` AS `SiteAcronym`,`membership`.`site`.`lab` AS `Lab`,`membership`.`site`.`institution` AS `Institution`,`membership`.`site`.`website` AS `Website`,`membership`.`site`.`country_number` AS `CountryNumber` from (`ImagingRepositoryV6`.`Subjects` left join `membership`.`site` on((`ImagingRepositoryV6`.`Subjects`.`SiteID` = `membership`.`site`.`site_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `QCAnswerInfoQCChoicesBrainRegions`
--

/*!50001 DROP TABLE IF EXISTS `QCAnswerInfoQCChoicesBrainRegions`*/;
/*!50001 DROP VIEW IF EXISTS `QCAnswerInfoQCChoicesBrainRegions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `QCAnswerInfoQCChoicesBrainRegions` AS select `QCAnswers`.`QCAnswerID` AS `QCAnswerID`,`QCAnswers`.`QCSessionID` AS `QCSessionID`,`QCAnswers`.`NumericData` AS `NumericData`,`QCAnswers`.`TextData` AS `TextData`,`QCAnswers`.`Laterality` AS `Laterality`,`QCAnswers`.`BrainRegionDirection` AS `BrainRegionDirection`,`QCAnswers`.`VolumeNumber` AS `VolumeNumber`,`QCAnswers`.`XCoord` AS `XCoord`,`QCAnswers`.`YCoord` AS `YCoord`,`QCAnswers`.`ZCoord` AS `ZCoord`,`QCAnswers`.`DBSyncID` AS `DBSyncID`,`QCAnswers`.`Comments` AS `Comments`,`QCAnswers`.`TimeStamp` AS `TimeStamp`,`QCChoiceInfo`.`QCChoiceID` AS `QCChoiceID`,`QCChoiceInfo`.`QCChoiceOrder` AS `QCChoiceOrder`,`QCChoiceInfo`.`QCChoiceName` AS `QCChoiceName`,`QCChoiceInfo`.`AlertFlag` AS `AlertFlag`,`QCChoiceInfo`.`QCQuestionID` AS `QCQuestionID`,`QCChoiceInfo`.`QCQuestionName` AS `QCQuestionName`,`QCChoiceInfo`.`ModalityID` AS `ModalityID`,`QCChoiceInfo`.`QCQuestionDescription` AS `QCQuestionDescription`,`QCChoiceInfo`.`QCLevel` AS `QCLevel`,`QCChoiceInfo`.`RequiredFlag` AS `RequiredFlag`,`QCChoiceInfo`.`UniqueFlag` AS `UniqueFlag`,`QCChoiceInfo`.`HumanFlag` AS `HumanFlag`,`QCChoiceInfo`.`OverallFlag` AS `OverallFlag`,`QCChoiceInfo`.`NumericFlag` AS `NumericFlag`,`QCChoiceInfo`.`TextFlag` AS `TextFlag`,`QCChoiceInfo`.`DICOMTag` AS `DICOMTag`,`QCChoiceInfo`.`QCReportID` AS `QCReportID`,`QCChoiceInfo`.`QCReportName` AS `QCReportName`,`BrainRegionInfo`.`BrainRegionID` AS `BrainRegionID`,`BrainRegionInfo`.`BrainRegionName` AS `BrainRegionName`,`BrainRegionInfo`.`NativeID` AS `NativeID`,`BrainRegionInfo`.`ParentID` AS `ParentID`,`BrainRegionInfo`.`AtlasID` AS `AtlasID`,`BrainRegionInfo`.`AtlasName` AS `AtlasName` from ((`QCAnswers` left join `QCChoiceInfo` on((`QCAnswers`.`QCChoiceID` = `QCChoiceInfo`.`QCChoiceID`))) left join `BrainRegionInfo` on((`QCAnswers`.`BrainRegionID` = `BrainRegionInfo`.`BrainRegionID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `QCChoiceInfo`
--

/*!50001 DROP TABLE IF EXISTS `QCChoiceInfo`*/;
/*!50001 DROP VIEW IF EXISTS `QCChoiceInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mher`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `QCChoiceInfo` AS select `QCChoices`.`QCChoiceID` AS `QCChoiceID`,`QCChoices`.`QCChoiceOrder` AS `QCChoiceOrder`,`QCChoices`.`QCChoiceName` AS `QCChoiceName`,`QCChoices`.`AlertFlag` AS `AlertFlag`,`QCQuestionInfo`.`QCQuestionID` AS `QCQuestionID`,`QCQuestionInfo`.`QCQuestionName` AS `QCQuestionName`,`QCQuestionInfo`.`ModalityID` AS `ModalityID`,`QCQuestionInfo`.`QCQuestionDescription` AS `QCQuestionDescription`,`QCQuestionInfo`.`QCLevel` AS `QCLevel`,`QCQuestionInfo`.`RequiredFlag` AS `RequiredFlag`,`QCQuestionInfo`.`UniqueFlag` AS `UniqueFlag`,`QCQuestionInfo`.`HumanFlag` AS `HumanFlag`,`QCQuestionInfo`.`OverallFlag` AS `OverallFlag`,`QCQuestionInfo`.`NumericFlag` AS `NumericFlag`,`QCQuestionInfo`.`TextFlag` AS `TextFlag`,`QCQuestionInfo`.`DICOMTag` AS `DICOMTag`,`QCQuestionInfo`.`QCReportID` AS `QCReportID`,`QCQuestionInfo`.`QCReportName` AS `QCReportName` from (`QCChoices` left join `QCQuestionInfo` on((`QCChoices`.`QCQuestionID` = `QCQuestionInfo`.`QCQuestionID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'ImagingRepositoryV6'
--
/*!50003 DROP FUNCTION IF EXISTS `CGETAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETAssignment`(
	project_row_name VARCHAR(255), 
	project_column_name VARCHAR(255), 
	project_name VARCHAR(255), 
	project_type_name VARCHAR(255), 
	series_uid VARCHAR(255), 
	sequence_number INT(11), 
	sequence_name VARCHAR(255), 
	modality_name VARCHAR(255), 
	study_uid VARCHAR(255), 
	protocol_name VARCHAR(255), 
	subject_name VARCHAR(255),
	study_name VARCHAR(255), 
	network_code_in VARCHAR(10), 
	site_acronym_in VARCHAR(8)) RETURNS int(11)
BEGIN

	DECLARE project_row_id INT(11);
	DECLARE project_column_id INT(11);
	DECLARE study_image_id INT(11);
	DECLARE assignment_id_alone INT(11);
	DECLARE assignment_id_together INT(11);

	SET project_row_id = CGETProjectRow(project_row_name, project_row_number, project_name, project_type_name);
	IF project_row_id < 1 THEN
		RETURN 0;
	END IF;

	SET project_column_id = CGETProjectColumn(project_name, project_number, project_type_name);
	IF project_column_id < 1 THEN
		RETURN -1;
	END IF;

	SET study_image_id = CGETStudyImage(series_uid, sequence_number, sequence_name, modality_name, study_uid, protocol_name, subject_name, network_code_in, site_acronym_in);
	IF study_image_id < 1 THEN
		RETURN -2;
	END IF;

	SET assignment_id_alone = GETAssignment(project_row_id, project_column_id);
	IF assignment_id_alone = 0 THEN
		RETURN -3;
	END IF;

	SELECT AssignmentID INTO assignment_id_together
		FROM Assignments
		WHERE ProjectRowID = project_row_id
			AND ProjectColumnID = project_column_id
			AND StudyImageID = study_image_id;
	IF assignment_id_together IS NULL THEN
		RETURN -4;
	ELSE
		RETURN assignment_id_together;
	END IF;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETImage`(
	series_uid VARCHAR(255), 
	sequence_number INT(11), 
	sequence_name VARCHAR(255), 
	modality_name VARCHAR(255), 
	study_uid VARCHAR(255), 
	protocol_name VARCHAR(255), 
	subject_name VARCHAR(255),
	study_name VARCHAR(255), 
	network_code_in VARCHAR(10), 
	site_acronym_in VARCHAR(8)) RETURNS int(11)
BEGIN

DECLARE sequence_id INT(11);
DECLARE scan_session_id INT(11);
DECLARE image_id_alone INT(11);
DECLARE image_id_together INT(11);

SET sequence_id = CGETSequence(sequence_name, modality_name);
IF sequence_id < 1 THEN
	RETURN 0;
END IF;

SET scan_session_id = CGETScanSession(study_uid, protocol_name, subject_name, study_name, network_code_in, site_acronym_in);
IF scan_session_id < 1 THEN
	RETURN -1;
END IF;

SET image_id_alone = GETImage(series_uid, 0, sequence_number);
IF image_id_alone = 0 THEN
	RETURN -2;
END IF;

SELECT ImageID INTO image_id_together
	FROM Images
		LEFT JOIN Sequences ON Images.SequenceID = Sequences.SequenceID
		LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
	WHERE Images.SeriesUID = series_uid
		AND Images.SequenceNumber = sequence_number
		AND Sequences.SequenceID = sequence_id
		AND ScanSessions.ScanSessionID = scan_session_id;
IF image_id_together IS NULL THEN
	RETURN -3;
ELSE
	RETURN image_id_together;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETProjectColumn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETProjectColumn`(
	project_column_name VARCHAR(255), 
	project_column_number INT(11), 
	project_type_name VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE project_type_id INT(11);
	DECLARE project_column_id INT(11);

	SET project_type_id = GETProjectType(project_type_name);
	IF project_type_id = 0 THEN
		RETURN 0;
	END IF;

	SET project_column_id = GETProjectColumn(project_type_id, project_column_name, project_column_number);
	IF project_column_id = 0 THEN
		RETURN -1;
	ELSE
		RETURN project_column_id;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETProjectRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETProjectRow`(
	project_row_name VARCHAR(255), 
	project_row_number INT(11), 
	project_name VARCHAR(255), 
	project_type_name VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE project_id INT(11);
	DECLARE project_row_id INT(11);

	SET project_id = CGETProject(project_name, project_type_name);
	IF project_id < 1 THEN
		RETURN 0;
	END IF;

	SET project_row_id = GETProjectRow(project_id, project_row_name, project_row_number);
	IF project_row_id = 0 THEN
		RETURN -1;
	ELSE
		RETURN project_row_id;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETProjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETProjects`(
	project_name VARCHAR(255), 
	project_type_name VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE project_type_id INT(11);
	DECLARE project_id_alone INT(11);
	DECLARE project_id_together INT(11);

	SET project_type_id = GETProjectType(project_type_name);
	IF project_type_id = 0 THEN
		RETURN 0;
	END IF;
	
	SET project_id_alone = GETProject(project_name);
	IF project_id_alone = 0 THEN
		RETURN -1;
	END IF;
	
	SELECT ProjectID INTO project_id_together
		FROM Projects
		WHERE ProjectName = project_name
			AND ProjectTypeID = project_type_id;
	IF project_id_together IS NULL THEN
		RETURN -2;
	ELSE
		RETURN project_id_together;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETQCSession`(
	series_uid VARCHAR(255), 
	sequence_number INT(11), 
	sequence_name VARCHAR(255), 
	modality_name VARCHAR(255), 
	study_uid VARCHAR(255), 
	protocol_name VARCHAR(255), 
	subject_name VARCHAR(255),
	study_name VARCHAR(255), 
	network_code_in VARCHAR(10), 
	site_acronym_in VARCHAR(8)) RETURNS int(11)
BEGIN

DECLARE study_image_id INT(11);
DECLARE qc_session_id INT(11);

SET study_image_id = CGETImage(series_uid, sequence_number, sequence_name, modality_name, study_uid, protocol_name, subject_name, study_name, network_code_in, site_acronym_in);
IF study_image_id < 1 THEN
	RETURN 0;
END IF;

SELECT QCSessionID INTO qc_session_id
	FROM QCSessions
	WHERE StudyImageID = study_image_id;
IF study_image_id IS NULL THEN
	RETURN -1;
ELSE
	RETURN study_image_id;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETScanSession`(
	study_uid VARCHAR(255), 
	protocol_name VARCHAR(255), 
	subject_name VARCHAR(255),
	study_name VARCHAR(255), 
	network_code_in VARCHAR(10), 
	site_acronym_in VARCHAR(8)) RETURNS int(11)
BEGIN

	DECLARE protocol_id INT(11);
	DECLARE study_subject_id INT(11);
	DECLARE scan_session_id_alone INT(11);
	DECLARE scan_session_id_together INT(11);

	SET protocol_id = GETProtocol(protocol_name);
	IF protocol_id < 1 THEN
		RETURN 0;
	END IF;

	SET study_subject_id = CGETStudySubject(subject_name, study_name, network_code_in, site_acronym_in);
	IF study_subject_id < 1 THEN
		RETURN -1;
	END IF;

	SET scan_session_id_alone = GETScanSession(study_uid);
	IF scan_session_id_alone = 0 THEN
		RETURN -2;
	END IF;

	SELECT ScanSessionID INTO scan_session_id_together
		FROM ScanSessions
			LEFT JOIN Protocols ON ScanSessions.ProtocolID = Protocols.ProtocolID
			LEFT JOIN StudySubjects ON ScanSessions.SubjectID = StudySubjects.SubjectID
		WHERE ScanSessions.StudyUID = study_uid
			AND Protocols.ProtocolID = protocol_id
			AND StudySubjects.StudySubjectID = study_subject_id;
	IF scan_session_id_together IS NULL THEN
		RETURN -3;
	ELSE
		RETURN scan_session_id_together;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETSequence`(
	sequence_name VARCHAR(255), 
	modality_name VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE modality_id INT(11);
	DECLARE sequence_id_alone INT(11);
	DECLARE sequence_id_together INT(11);

	SET modality_id = GETModality(modality_name);
	IF modality_id = 0 THEN
		RETURN 0;
	END IF;

	SET sequence_id_alone = GETSequence(sequence_name);
	IF sequence_id_alone = 0 THEN
		RETURN -1;
	END IF;

	SELECT SequenceID INTO sequence_id_together
		FROM Sequences
		WHERE SequenceName = sequence_name
			AND ModalityID = modality_id;
	IF sequence_id_together IS NULL THEN
		RETURN -2;
	ELSE
		RETURN sequence_id_together;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETStudy`(
	study_name VARCHAR(255), 
	network_code_in VARCHAR(10)) RETURNS int(11)
BEGIN
	DECLARE network_id_out INT(11);
	DECLARE study_id_alone INT(11);
	DECLARE study_id_together INT(11);

	SET network_id_out = GETNetwork(network_code_in);
	IF network_id_out = 0 THEN
		RETURN -2; #No network record with that network code
	END IF;

	SET study_id_alone = GETStudy(study_name);
	IF study_id_alone = 0 THEN
		RETURN -1; #No study record with that study name
	END IF;

	SELECT StudyID INTO study_id_together
		FROM Studies
			LEFT JOIN membership.network ON Studies.NetworkID = membership.network.network_id
		WHERE StudyName = study_name AND membership.network.network_id = network_id_out;
	IF study_id_together IS NULL THEN
		RETURN -21; #The study record with that study name does not belong to the network record with that network code
	ELSE
		RETURN study_id_together;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETStudyImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETStudyImage`(
	series_uid VARCHAR(255), 
	sequence_number INT(11), 
	sequence_name VARCHAR(255), 
	modality_name VARCHAR(255), 
	study_uid VARCHAR(255), 
	protocol_name VARCHAR(255), 
	subject_name VARCHAR(255),
	study_name VARCHAR(255), 
	network_code_in VARCHAR(10), 
	site_acronym_in VARCHAR(8)
	) RETURNS int(11)
BEGIN

	DECLARE image_id INT(11);
	DECLARE study_subject_id INT(11);
	DECLARE study_image_id_alone INT(11);
	DECLARE study_image_id_together INT(11);

	SET image_id = CGETImage(series_uid, sequence_number, sequence_name, modality_name, study_uid, protocol_name, subject_name, study_name, network_code_in, site_acronym_in);
	IF image_id < 1 THEN
		RETURN 0;
	END IF;

	SET study_subject_id = CGETStudySubject(subject_name, study_name, network_code_in, site_acronym_in);
	IF study_subject_id < 1 THEN
		RETURN -1;
	END IF;

	SET study_image_id_alone = GETStudyImage(image_id, study_subject_id, 0);
	IF study_image_id_alone = 0 THEN
		RETURN -2;
	END IF;

	SELECT StudyImageID INTO study_image_id_together
		FROM StudyImages
		WHERE ImageID = image_id
			AND StudySubjectID = study_subject_id;
	IF study_image_id_together IS NULL THEN	
		RETURN -3;
	ELSE
		RETURN study_image_id_together;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CGETStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `CGETStudySubject`(
	subject_name VARCHAR(255),
	study_name VARCHAR(255), 
	network_code_in VARCHAR(10), 
	site_acronym_in VARCHAR(8)) RETURNS int(11)
BEGIN
	DECLARE study_id INT(11);
	DECLARE site_id_out INT(11);
	DECLARE study_subject_id_alone INT(11);
	DECLARE study_subject_id_together INT(11);

	SET study_id = CGETStudy(study_name, network_code_in);
	IF study_id < 1 THEN
		CASE study_id
			WHEN -1 THEN RETURN -2;
			WHEN -2 THEN RETURN -3;
			ELSE RETURN -23; #Network and Study Records do not resolve
		END CASE;
	END IF;

	SET site_id_out = GETSite(site_acronym_in);
	IF site_id_out = 0 THEN
		RETURN -4; #No site record with that site acronym
	END IF;

	SET study_subject_id_alone = GETStudySubject(study_id, 0, subject_name);
	IF study_subject_id_alone = 0 THEN
		RETURN -21; #No study subject record with that study name and subject name
	END IF;
	
	SELECT StudySubjectID INTO study_subject_id_together
		FROM StudySubjects
			LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
		WHERE StudySubjects.StudyID = study_id 
			AND Subjects.SiteID = site_id_out;
	IF study_subject_id_together IS NULL THEN
		RETURN -24; #The subject record with that subject name and site acronym does not match the study with that study name and network code
	ELSE
		RETURN study_subject_id_together; 
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cutField` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` FUNCTION `cutField`(FieldValue VARCHAR(255), FieldDelimiter CHAR(1), FieldNumber INT(11) ) RETURNS varchar(255) CHARSET latin1
BEGIN

RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(FieldValue, FieldDelimiter, FieldNumber),
    LENGTH(SUBSTRING_INDEX(FieldValue, FieldDelimiter, FieldNumber -1)) + 1),
    FieldDelimiter, '');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DGETStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `DGETStudySubject`(
	subject_name VARCHAR(255), 
	site_acronym VARCHAR(8), 
	study_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE study_id INT(11);
	DECLARE site_id INT(11);
	DECLARE study_subject_id_alone INT(11);
	DECLARE study_subject_id_together INT(11);

	SET study_id = GETStudy(study_name);
	IF study_id = 0 THEN
		RETURN -3;
	END IF;

	SET site_id = GETSite(site_acronym);
	IF site_id = 0 THEN
		RETURN -2; #No site record with that site acronym
	END IF;

	SET study_subject_id_alone = GETStudySubject(study_id, 0, subject_name);
	IF study_subject_id_alone = 0 THEN
		RETURN -23; #No study subject record with that study name and subject name
	END IF;
	
	SELECT StudySubjectID INTO study_subject_id_together
		FROM StudySubjects
			LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
		WHERE StudySubjects.StudyID = study_id 
			AND Subjects.SiteID = site_id
			AND Subjects.SubjectName = subject_name;
	IF study_subject_id_together IS NULL THEN
		RETURN 0; #The subject record with that subject name and site acronym does not match the study with that study name and network code
	ELSE
		RETURN study_subject_id_together; 
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DPUTScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `DPUTScanSession`(
	scan_data DATE, 
	study_uid VARCHAR(255), 
	protocol_name VARCHAR(255), 
	subject_name VARCHAR(255), 
	study_name VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE protocol_id INT(11);
	DECLARE study_id INT(11);
	DECLARE study_subject_id INT(11);
	DECLARE subject_id INT(11);
	DECLARE new_scan_session_id INT(11);

	SET protocol_id = GETProtocol(protocol_name);
	IF protocol_id = 0 THEN
		RETURN -3;
	END IF;

	SET study_id = GETStudy(study_name);
	IF study_id = 0 THEN
		RETURN -5;
	END IF;

	SET study_subject_id = GETStudySubject(study_id, 0, subject_name);
	IF study_subject_id = 0 THEN
		RETURN -24;
	END IF;

	SELECT SubjectID INTO subject_id FROM StudySubjects WHERE StudyID = study_id AND SubjectName = subject_name;
	IF subject_id IS NULL THEN
		RETURN -40;
	END IF;

	SET new_scan_session_id = PUTScanSession(protocol_id, subject_id, scan_date, study_uid);
	IF new_scan_session_id < 1 THEN
		CASE new_scan_session_id
			WHEN -14 THEN RETURN -12;
			ELSE RETURN -40;
		END CASE;
	END IF;
	
	RETURN new_scan_session_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DPUTStudyImageANDImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `DPUTStudyImageANDImage`(
	scan_session_id INT(11), 
	sequence_name INT(11), 
	series_uid VARCHAR(255), 
	sequence_number INT(11), 
	study_subject_id INT(11)) RETURNS int(11)
BEGIN
	
	DECLARE sequence_id INT(11);
	DECLARE new_image_id INT(11);
	DECLARE new_study_image_id INT(11);

	SET sequence_id = GETSequence(sequence_name);
	IF sequence_id = 0 THEN
		RETURN -2;
	END IF;

	SET new_image_id = PUTImage(scan_session_id, sequence_id, series_uid, sequence_number);
	IF new_image_id < 1 THEN
		CASE new_image_id
			WHEN -1 THEN RETURN -1;
			WHEN -14 THEN RETURN -14;
			WHEN -13 THEN RETURN -13;
			ELSE RETURN -40;
		END CASE;
	END IF;

	SET new_study_image_id = PUTStudyImage(new_image_id, study_subject_id);
	IF new_study_image_id < 1 THEN
		DELETE FROM Images WHERE ImageID = new_image_id;
		CASE new_study_image_id
			WHEN -2 THEN RETURN -5;
			WHEN -11 THEN RETURN -15;
			WHEN -21 THEN RETURN -21;
			ELSE RETURN -40;
		END CASE;
	END IF;
	
	RETURN new_study_image_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DPUTStudySubjectANDSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `DPUTStudySubjectANDSubject`(
	subject_name VARCHAR(255), 
	site_acronym VARCHAR(8), 
	study_name VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE study_id INT(11);
	DECLARE site_id INT(11);
	DECLARE network_id_var INT(11);
	DECLARE recycle_flag_var BOOL;
	DECLARE existing_id INT;
	DECLARE subject_id INT(11);
	DECLARE new_subject_id INT;
	DECLARE new_study_subject_id INT(11);

	SET site_id = GETSite(site_acronym);
	IF site_id = 0 THEN
		RETURN -2;
	END IF;
	
	SET study_id = GETStudy(study_name);
	IF study_id = 1 THEN
		RETURN -3;
	END IF;

	SET existing_id = DGETStudySubject(subject_name, site_acronym, study_name);
	IF existing_id > 0 THEN
		RETURN -12;
	END IF;

	SET existing_id = GETStudySubject(study_id, 0, subject_name);
	IF existing_id > 0 THEN
		RETURN -13;
	END IF;

	SELECT NetworkID INTO network_id_var FROM Studies WHERE StudyID = study_id;

	SELECT recycle_flag INTO recycle_flag_var
		FROM membership.network
		WHERE membership.network.network_id = network_id_var;

	IF recycle_flag THEN
		SET new_subject_id = PUTSubject(site_id);
		IF new_subject_id < 1 THEN
			RETURN -40;
		END IF;
		SET new_study_subject_id = PUTStudySubject(study_id, new_subject_id, subject_name);
		IF new_study_subject_id < 1 THEN
			DELETE FROM Subjects WHERE SubjectID = new_subject_id;
			RETURN -40;
		ELSE
			RETURN new_study_subject_id;
		END IF;
	ELSE
		SELECT SubjectID INTO subject_id
			FROM StudySubjects
				LEFT JOIN Studies ON StudySubjects.StudyID = Studies.StudyID
			WHERE Studies.NetworkID = network_id_in AND SubjectName = subject_name AND NOT StudyID = study_id
			LIMIT 1;
		IF subject_id IS NULL THEN
			SET new_subject_id = PUTSubject(site_id);
			IF new_subject_id < 1 THEN
				RETURN -40;
			END IF;
			SET new_study_subject_id = PUTStudySubject(study_id, new_subject_id, subject_name);
			IF new_study_subject_id < 1 THEN
				DELETE FROM Subjects WHERE SubjectID = new_subject_id;
				RETURN -40;
			ELSE
				RETURN new_study_subject_id;
			END IF;
		ELSE
			SET existing_id = GETStudySubject(study_id, subject_id, '');
			IF existing_id > 0 THEN
				RETURN -21;
			END IF;
			SET new_study_subject_id = PUTStudySubject(study_id, subject_id, subject_name);
			IF new_study_subject_id < 1 THEN
				CASE new_study_subject_id
					WHEN -22 THEN RETURN -31;
					WHEN -23 THEN RETURN -31;
					ELSE RETURN -40;
				END CASE;
			ELSE
				RETURN new_study_subject_id;
			END IF;
		END IF;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DSPLITStudySubjectONStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `DSPLITStudySubjectONStudy`(
	subject_name VARCHAR(255), 
	existing_study_name VARCHAR(255), 
	new_subject_name VARCHAR(255), 
	new_study_name VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE existing_study_id INT(11);
	DECLARE existing_study_subject_id INT(11);
	DECLARE subject_id INT(11);
	DECLARE new_study_id INT(11);
	DECLARE new_study_subject_id INT(11);

	SET existing_study_id = GETStudy(existing_study_name);
	IF existing_study_id = 0 THEN
		RETURN 0;
	END IF;
	
	SET existing_study_subject_id = GETStudySubject(existing_study_id, 0, subject_name);
	IF existing_study_id = 0 THEN
		RETURN -1;
	END IF;

	SELECT SubjectID INTO subject_id FROM StudySubjects WHERE StudySubjectID = existing_study_subject_id;
	
	SET new_study_id = GETStudy(new_study_name);
	IF new_study_id = 0 THEN
		RETURN -2;
	END IF;

	SET new_study_subject_id = PUTStudySubject(new_study_id, subject_id, new_subject_name);
	IF new_study_subject_id < 1 THEN
		RETURN -3;
	END IF;
	RETURN new_study_subject_id;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DUPDATESequenceONModality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `DUPDATESequenceONModality`(
	sequence_name VARCHAR(255), 
	modality_name VARCHAR(255)) RETURNS int(11)
BEGIN

	DECLARE sequence_id INT(11);
	DECLARE modality_id INT(11);

	SET sequence_id = GETSequence(sequence_name);
	IF sequence_id = 0 THEN
		RETURN 0;
	END IF;

	SET modality_id = GETModality(modality_name);
	IF modality_id = 0 THEN
		RETURN -1;
	END IF;

	UPDATE Sequences SET ModalityID = modality_id WHERE SequenceID = sequence_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DUPDATEStudyONNetwork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `DUPDATEStudyONNetwork`(
	study_name INT(11), 
	network_code INT(11)) RETURNS int(11)
BEGIN

	DECLARE study_id INT(11);
	DECLARE network_id INT(11);

	SET study_id = GETStudy(study_name);
	IF study_id = 0 THEN
		RETURN 0;
	END IF;

	SET network_id = GETNetwork(network_code);
	IF network_id = 0 THEN
		RETURN -1;
	END IF;

	UPDATE Studies SET NetworkID = network_id WHERE StudyID = study_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DUPDATESubjectONSite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `DUPDATESubjectONSite`(
	subject_id INT(11), 
	site_acronym INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_subject BOOL;
	DECLARE site_id INT(11);

	SET is_subject = ISSubject(subject_id);
	IF NOT is_subject THEN
		RETURN 0;
	END IF;

	SET site_id = GETSite(site_acronym);
	IF site_id = 0 THEN
		RETURN -1;
	END IF;

	UPDATE Subjects SET SiteID = site_id WHERE SubjectID = subject_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETAssignment`(
	project_row_id INT(11), 
	project_column_id INT(11)) RETURNS int(11)
BEGIN
	DECLARE assignment_id INT(11);

	SELECT AssignmentID INTO assignment_id FROM Assignments WHERE ProjectRowID = project_row_id AND ProjectColumnID = project_column_id;
	IF assignment_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN assignment_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETBrainRegion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETBrainRegion`(
	brain_region_name VARCHAR(255), 
	atlas_id INT(11)) RETURNS int(11)
BEGIN
	DECLARE brain_region_id INT(11);

	SELECT BrainRegionID INTO brain_region_id FROM BrainRegions WHERE BrainRegionName = brain_region_name AND AtlasID = atlas_id;
	IF brain_region_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN brain_region_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETImage`(
	series_uid VARCHAR(255), 
	scan_session_id INT(11), 
	sequence_number INT(11)) RETURNS int(11)
BEGIN
	DECLARE image_id INT(11);

	IF series_uid = '' THEN
		SELECT ImageID INTO image_id FROM Images WHERE ScanSessionID = scan_session_id AND SequenceNumber = sequence_number;
		IF image_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN image_id;
		END IF;
	ELSEIF scan_session_id = 0 OR sequence_number = 0 THEN
		SELECT ImageID INTO image_id FROM Images WHERE SeriesUID = series_uid;
		IF image_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN image_id;
		END IF;
	ELSE
		SELECT ImageID INTO image_id FROM Images WHERE ScanSessionID = scan_session_id AND SequenceNumber = sequence_number AND SeriesUID = series_uid;
		IF image_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN image_id;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETModality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETModality`(
	modality_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE modality_id INT(11);

	SELECT ModalityID INTO modality_id FROM Modalities WHERE ModalityName = modality_name;
	IF modality_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN modality_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETNetwork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETNetwork`(
	network_code_in VARCHAR(10)) RETURNS int(11)
BEGIN

	DECLARE network_id_out INT(11);
	SELECT network_id INTO network_id_out FROM membership.network WHERE network_code = network_code_in;
	IF network_id_out IS NULL THEN
		RETURN 0;
	ELSE
		RETURN network_id_out;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETProject`(
	project_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE project_id INT(11);

	SELECT ProjectID INTO project_id FROM Projects WHERE ProjectName = project_name;
	IF project_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN project_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETProjectColumn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETProjectColumn`(
	project_type_id INT(11),
	project_column_name VARCHAR(255), 
	project_column_number INT(11)) RETURNS int(11)
BEGIN
	DECLARE project_column_id INT(11);

	IF project_column_number = 0 THEN
		SELECT ProjectColumnID INTO project_column_id FROM ProjectColumns WHERE ProjectTypeID = project_type_id AND ProjectColumnName = project_column_name;
		IF project_column_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN project_column_id;
		END IF;
	ELSEIF project_column_name = '' THEN
		SELECT ProjectColumnID INTO project_column_id FROM ProjectColumns WHERE ProjectTypeID = project_type_id AND ProjectColumnNumber = project_column_number;
		IF project_column_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN project_column_id;
		END IF;
	ELSE
		SELECT ProjectColumnID INTO project_column_id FROM ProjectColumns WHERE ProjectTypeID = project_type_id AND ProjectColumnNumber = project_column_number AND ProjectColumnName = project_column_name;
		IF project_column_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN project_column_id;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETProjectRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETProjectRow`(
	project_id INT(11),
	project_row_name VARCHAR(255), 
	project_row_number INT(11)) RETURNS int(11)
BEGIN
	DECLARE project_row_id INT(11);

	IF project_column_number = 0 THEN
		SELECT ProjectRowID INTO project_row_id FROM ProjectRows WHERE ProjectID = project_id AND ProjectRowName = project_row_name;
		IF project_row_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN project_row_id;
		END IF;
	ELSEIF project_row_name = '' THEN
		SELECT ProjectRowID INTO project_row_id FROM ProjectRows WHERE ProjectID = project_id AND ProjectRowNumber = project_row_number;
		IF project_row_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN project_row_id;
		END IF;
	ELSE
		SELECT ProjectRowID INTO project_row_id FROM ProjectRows WHERE ProjectID = project_id AND ProjectRowNumber = project_row_number AND ProjectRowName = project_row_name;
		IF project_row_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN project_row_id;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETProjectType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETProjectType`(
	project_type_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE project_type_id INT(11);

	SELECT ProjectTypeID INTO project_type_id FROM ProjectTypes WHERE ProjectTypeName = project_type_name;
	IF project_type_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN project_type_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETProtocol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETProtocol`(
	protocol_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE protocol_id INT(11);

	SELECT ProtocolID INTO protocol_id FROM Protocols WHERE ProtocolName = protocol_name;
	IF protocol_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN protocol_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETQCChoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETQCChoice`(
	qc_question_id INT(11),
	qc_choice_name VARCHAR(255), 
	qc_choice_order INT(11)) RETURNS int(11)
BEGIN
	DECLARE qc_choice_id INT(11);

	IF qc_choice_order < 0 THEN
		SELECT QCChoiceID INTO qc_choice_id FROM QCChoices WHERE QCQuestionID = qc_question_id AND QCChoiceName = qc_choice_name;
		IF qc_choice_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN qc_choice_id;
		END IF;
	ELSEIF project_column_name = '' THEN
		SELECT QCChoiceID INTO qc_choice_id FROM QCChoices WHERE QCQuestionID = qc_question_id AND QCChoiceOrder = qc_choice_order;
		IF qc_choice_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN qc_choice_id;
		END IF;
	ELSE
		SELECT QCChoiceID INTO qc_choice_id FROM QCChoices WHERE QCQuestionID = qc_question_id AND QCChoiceName = qc_choice_name AND QCChoiceOrder = qc_choice_order;
		IF qc_choice_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN qc_choice_id;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETQCSession`(
	study_image_id INT(11)) RETURNS int(11)
BEGIN

DECLARE qc_session_id INT(11);

SELECT QCSessionID INTO qc_session_id
	FROM QCSessions
	WHERE StudyImageID = study_image_id;

IF qc_session_id IS NULL THEN
	RETURN 0;
ELSE
	RETURN qc_session_id;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETScanSession`(
	study_uid VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE scan_session_id INT(11);

	SELECT ScanSessionID INTO scan_session_id FROM ScanSessions WHERE StudyUID = study_uid;
	IF scan_session_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN scan_session_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETSequence`(
	sequence_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE sequence_id INT(11);

	SELECT SequenceID INTO sequence_id FROM Sequences WHERE SequenceName = sequence_name;
	IF sequence_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN sequence_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETSite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETSite`(
	site_acronym_in VARCHAR(8)) RETURNS int(11)
BEGIN

	DECLARE site_id_out INT(11);
	SELECT site_id INTO site_id_out FROM membership.site WHERE site_acronym = site_acronym_in;
	IF site_id_out IS NULL THEN
		RETURN 0;
	ELSE
		RETURN site_id_out;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETStudy`(
	study_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE study_id INT(11);

	SELECT StudyID INTO study_id FROM Studies WHERE StudyName = study_name;
	IF study_id IS NULL THEN
		RETURN 0;
	ELSE
		RETURN study_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETStudyImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETStudyImage`(
	image_id INT(11),
	study_subject_id INT(11), 
	study_id INT(11)) RETURNS int(11)
BEGIN
	DECLARE study_image_id INT(11);

	IF study_id = 0 THEN
		SELECT StudyImageID INTO study_image_id FROM StudyImages WHERE ImageID = image_id AND StudySubjectID = study_subject_id;
		IF study_image_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN study_subject_id;
		END IF;
	ELSEIF study_subject_id = 0 THEN
		SELECT StudyImages.StudyImageID INTO study_image_id 
			FROM StudyImages
				LEFT JOIN StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
			WHERE StudyImages.ImageID = image_id AND StudySubjects.StudyID = study_id;
		IF study_image_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN study_image_id;
		END IF;
	ELSE
		SELECT StudyImages.StudyImageID INTO study_image_id 
			FROM StudyImages
				LEFT JOIN StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
			WHERE StudyImages.ImageID = image_id AND StudyImages.StudySubjectID = study_subject_id AND StudySubjects.StudyID = study_id;
		IF study_image_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN study_image_id;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GETStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `GETStudySubject`(
	study_id INT(11),
	subject_id INT(11), 
	subject_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE study_subject_id INT(11);

	IF subject_id = 0 THEN
		SELECT StudySubjectID INTO study_subject_id FROM StudySubjects WHERE StudyID = study_id AND SubjectName = subject_name;
		IF study_subject_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN study_subject_id;
		END IF;
	ELSEIF subject_name = '' THEN
		SELECT StudySubjectID INTO study_subject_id FROM StudySubjects WHERE StudyID = study_id AND SubjectID = subject_id;
		IF study_subject_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN study_subject_id;
		END IF;
	ELSE
		SELECT StudySubjectID INTO study_subject_id FROM StudySubjects WHERE StudyID = study_id AND SubjectID = subject_id AND SubjectName = subject_name;
		IF study_subject_id IS NULL THEN
			RETURN 0;
		ELSE
			RETURN study_subject_id;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISAssignment`(
	assignment_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT AssignmentID INTO existing_id FROM Assignments WHERE AssignmentID = assignment_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISBrainRegion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISBrainRegion`(
	brain_region_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT(11);
	
	SELECT BrainRegionID INTO existing_id FROM BrainRegions WHERE BrainRegionID = brain_region_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISDBSync` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISDBSync`(
	db_sync_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT DBSyncID INTO existing_id FROM DBSyncs WHERE DBSyncID = db_sync_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISImage`(
	image_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT ImageID INTO existing_id FROM Images WHERE ImageID = image_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISModality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISModality`(
	modality_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT ModalityID INTO existing_id FROM Modalities WHERE ModalityID = modality_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISNetwork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISNetwork`(
	network_id_in INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;

	SELECT network_id INTO existing_id FROM membership.network WHERE membership.network.network_id = network_id_in;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISProject`(
	project_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT ProjectID INTO existing_id FROM Projects WHERE ProjectID = project_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISProjectColumn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISProjectColumn`(
	project_column_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT ProjectColumnID INTO existing_id FROM ProjectColumns WHERE ProjectColumnID = project_column_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISProjectRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISProjectRow`(
	project_row_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT ProjectRowID INTO existing_id FROM ProjectRows WHERE ProjectRowID = project_row_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISProjectType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISProjectType`(
	project_type_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT ProjectTypeID INTO existing_id FROM ProjectTypes WHERE ProjectTypeID = project_type_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISProtocol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISProtocol`(
	protocol_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT ProtocolID INTO existing_id FROM Protocols WHERE ProtocolID = protocol_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISQCAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISQCAnswer`(
	qc_answer_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT QCAnswerID INTO existing_id FROM QCAnswers WHERE QCAnswerID = qc_answer_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISQCChoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISQCChoice`(
	qc_choice_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT(11);
	
	SELECT QCChoiceID INTO existing_id FROM QCChoices WHERE QCChoiceID = qc_choice_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISQCSession`(
	qc_session_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT QCSessionID INTO existing_id FROM QCSessions WHERE QCSessionID = qc_session_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISScanSession`(
	scan_session_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT ScanSessionID INTO existing_id FROM ScanSessions WHERE ScanSessionID = scan_session_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISSequence`(
	sequence_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT SequenceID INTO existing_id FROM Sequences WHERE SequenceID = sequence_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISSite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISSite`(
	site_id_in INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT site_id INTO existing_id FROM membership.site WHERE membership.site.site_id = site_id_in;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISStudy`(
	study_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT(11);
	
	SELECT StudyID INTO existing_id FROM Studies WHERE StudyID = study_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISStudyImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISStudyImage`(
	study_image_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT(11);
	
	SELECT StudyImageID INTO existing_id FROM StudyImages WHERE StudyImageID = study_image_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISStudySubject`(
	study_subject_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT(11);
	
	SELECT StudySubjectID INTO existing_id FROM StudySubjects WHERE StudySubjectID = study_subject_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ISSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `ISSubject`(
	subject_id INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE existing_id INT;
	
	SELECT SubjectID INTO existing_id FROM Subjects WHERE SubjectID = subject_id;
	IF existing_id IS NULL THEN
		RETURN FALSE;
	ELSE
		RETURN TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUSHQuarantineTOStudyImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUSHQuarantineTOStudyImage`(
	quarantine_id INT(11), 
	patient_id VARCHAR(255),
	patient_name VARCHAR(255), 
	site_acronym_var VARCHAR(8), 
	study_name VARCHAR(255), 
	network_code_var VARCHAR(255), 
	scan_date DATE, 
	acquisition_date DATE, 
	instance_creation_date DATE, 
	study_uid VARCHAR(255), 
	protocol_name VARCHAR(255), 
	request_procedure_description VARCHAR(255), 
	sequence_name VARCHAR(255), 
	protocol_name_literal VARCHAR(255), 
	series_uid VARCHAR(255), 
	sequence_number INT(11)) RETURNS int(11)
BEGIN
	DECLARE file_status INT DEFAULT 1;
	DECLARE series_uid_of_quarantine VARCHAR(255);
	DECLARE correction_id INT;
	DECLARE notification_description VARCHAR(1000);
	DECLARE contact_id INT;
	DECLARE network_id_var INT;
	DECLARE study_id INT;
	DECLARE network_id_of_study INT;
	DECLARE site_id_var INT;
	DECLARE subject_regex VARCHAR(255);
	DECLARE subject_name VARCHAR(255);
	DECLARE protocol_id INT;
	DECLARE sequence_id INT;
	DECLARE subject_id INT;
	DECLARE study_subject_id INT;
	DECLARE recycle_flag_var BOOL;
	DECLARE scan_session_id INT;
	DECLARE image_id INT;
	DECLARE study_image_id INT;

	/*Check if quarantine_id provided is valid, return SeriesUID for optimization (will need to be checked in next step anyway)*/
	SELECT SeriesUID INTO series_uid_of_quarantine FROM QuarantineFiles WHERE QuarantineID = quarantine_id;
	/*If no record exists, we really can't do anything else, so return with an error code. */
	IF series_uid_of_quarantine IS NULL THEN
		RETURN 0;
	/*To further ensure validity, we need to check that the provided series_uid does match with the quarantine_id record*/
	ELSEIF series_uid_of_quarantine <> series_uid THEN
		RETURN 0;
	END IF;

	/*Check if network_code is valid*/
	/*first check if an unresolved correction to NetworkCode already exists for this series_uid*/
	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex IS NULL AND FieldName = 'NetworkCode' AND SeriesUID = series_uid AND CorrectedValue IS NULL;
	/*if so, a notification should have already been sent and an unresolved correction still exists*/
	/*update the file_status, as the process cannot continue, however, do not exit because we want to determine the validity of the other arguments as well*/
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	ELSE
		/*Check the validity of the network_code by checking against the Network table*/
		SELECT network_id INTO network_id_var FROM membership.network WHERE network_code = network_code_var;
		IF network_id_var IS NULL THEN
			/*if there is no match, then a notification/correction should be initiated*/
			SET notification_description = CONCAT('NetworkCode provided (', network_code_var, ') does not exist in database');
			INSERT INTO Hub.Notification (ContactID, NotificationTypeIDID, Identifier, Description) VALUES (2, 2, quarantine_id, notification_description);
			INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, FieldName) VALUES (series_uid, network_code_var, 'NetworkCode');
			SET file_status = 0;
		END IF;
	END IF;
	
	/*Check if study_name is valid and if it corresponds to the network_code*/
	/*first check if an unresolved correction to StudyName already exists for this series_uid*/
	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex IS NULL AND FieldName = 'StudyName' AND SeriesUID = series_uid AND CorrectedValue IS NULL;
	/*if so, a notification should have already been sent and an unresolved correction still exists*/
	/*update the file_status, as the process cannot continue, however, do not exit because we want to determine the validity of the other arguments as well*/
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	ELSE
		/*Check the validity of the study_name by checking against the Studies table*/
		SELECT StudyID INTO study_id FROM Studies WHERE StudyName = study_name;
		/*if there is no match, then a notification/correction should be initiated*/
		IF study_id IS NULL THEN
			SET notification_description = CONCAT('Study Name provided (', study_name, ') does not exist in database');
			INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (2, 3, quarantine_id, notification_description);
			INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, FieldName) VALUES (series_uid, study_name, 'StudyName');
			SET file_status = 0;
		/*also in the case that the network_code was valid, also check that the network records of the give study_name and network_code do not clash*/
		ELSEIF network_id_var IS NOT NULL THEN
			SELECT NetworkID INTO network_id_of_study FROM Studies WHERE StudyName = study_name;
			IF network_id_of_study <> network_id_var THEN
				SET notification_description = CONCAT('Study Name provided (', study_name, ') has a different network in database than one provided (', network_code_var, ')');
				INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (2, 4, quarantine_id, notification_description);
				INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, FieldName) VALUES (series_uid, study_name, 'StudyName');
				SET file_status = 0;
			ELSE
				SELECT ContactID INTO contact_id FROM Studies WHERE StudyID = study_id;
			END IF;
		ELSE
			SELECT ContactID INTO contact_id FROM Studies WHERE StudyID = study_id;
		END IF;
	END IF;
	
	IF contact_id IS NULL THEN
		SET contact_id = 1;
	END IF;

	/*Check if the site_name is valid*/
	/*first check if an unresolved correction to SiteAcronym already exists for this series_uid*/
	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex IS NULL AND FieldName = 'SiteAcronym' AND SeriesUID = series_uid AND CorrectedValue IS NULL;
	/*if so, a notification should have already been sent and an unresolved correction still exists*/
	/*update the file_status, as the process cannot continue, however, do not exit because we want to determine the validity of the other arguments as well*/
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	ELSE
		/*Check the validity of the site_acronym by checking against the Site table*/
		SELECT site_id INTO site_id_var FROM membership.site WHERE site_acronym = site_acronym_var;
		IF site_id_var IS NULL THEN
			/*if there is no match, then a notification/correction should be initiated*/
			SET notification_description = CONCAT('SiteAcronym provided (', site_acronym_var, ') does not exist in database');
			INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (2, 5, quarantine_id, notification_description);
			INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, FieldName) VALUES (series_uid, network_code_var, 'SiteAcronym');
			SET file_status = 0;
		END IF;
	END IF;

	/*The rest of the validity checks can only be done if preceding fields have been determined cleanly*/
	IF file_status = 0 THEN
		UPDATE QuarantineFiles SET FileStatus = 0 WHERE QuarantineID = quarantine_id;
		RETURN 0;
	END IF;

	/*Check if the patient_id is valid by regex, use patient_name field as backup*/
	/*first check if an unresolved correction to PatientID already exists for this series_uid*/
	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex = '00100020' AND SeriesUID = series_uid AND CorrectedValue IS NULL;
	/*if so, a notification should have already been sent and an unresolved correction still exists*/
	/*update the file_status, as the process cannot continue, however, do not exit because we want to determine the validity of the other arguments as well*/
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	ELSE
		SELECT SubjectRegex INTO subject_regex FROM Studies WHERE StudyID = study_id;
		/*Check if the provided patient_id matches with subject_regex*/
		IF patient_id NOT REGEXP subject_regex THEN
			/*if not, set file_status to 0*/
			/*try to determine if other formations of patient_name match the regex, if so, create a correction record*/
			SET file_status = 0;
			IF patient_name REGEXP subject_regex THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('00100020', 'PatientID', series_uid, patient_id, patient_name);
			ELSEIF patient_name REGEXP CONCAT(TRIM(TRAILING '$' FROM subject_regex), '\n.*') THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('00100020', 'PatientID', series_uid, patient_id, SUBSTRING(patient_name, 1, LOCATE('\n', patient_name) - 1));
			ELSEIF patient_name REGEXP CONCAT('.*\n', TRIM(LEADING '^' FROM subject_regex)) THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('00100020', 'PatientID', series_uid, patient_id, SUBSTRING(patient_name, LOCATE('\n', patient_name) + 1, LENGTH(patient_name) - LOCATE('\n', patient_name)));
			ELSE
				/*if no matches at all, notification and placeholder correction records need to be created*/
				SET notification_description = CONCAT('PatientID provided (', patient_id, ') does not match the correct format for its study');
				INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (contact_id, 6, quarantine_id, notification_description);
				INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, DICOMFieldIndex, FieldName) VALUES (series_uid, patient_id, '00100020', 'PatientID');			
			END IF;
		ELSE
			SET subject_name = patient_id;
		END IF;
	END IF;

	/*Check if the scan_date provided is in a valid format*/
	/*first check if an unresolved correction to ScanDate already exists for this series_uid*/
	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex = '00080020' AND SeriesUID = series_uid AND CorrectedValue IS NULL;
	/*if so, a notification should have already been sent and an unresolved correction still exists*/
	/*update the file_status, as the process cannot continue, however, do not exit because we want to determine the validity of the other arguments as well*/
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	/*if not, check if the provided scan_date is a valid date*/
	ELSEIF scan_date + INTERVAL 0 DAY IS NULL THEN
		/*if not, set the file_status to 0*/
		/*try to determine if other DICOM date fields are instead valid dates, if so, create a correction record*/
		SET file_status = 0;
		IF acquisition_date + INTERVAL 0 DAY IS NOT NULL THEN
			INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
			VALUES ('00080020', 'StudyDate', series_uid, scan_date, acquisition_date);
		ELSEIF instance_creation_date + INTERVAL 0 DAY IS NOT NULL THEN
			INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
			VALUES ('00080020', 'StudyDate', series_uid, scan_date, instance_creation_date);
		ELSE
			/*if no matches at all, notification and placeholder correction records need to be created*/
			SET notification_description = CONCAT('ScanDate provided (', scan_date, ') is not in a correct date format');
			INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (contact_id, 7, quarantine_id, notification_description);
			INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, DICOMFieldIndex, FieldName) VALUES (series_uid, scan_date, '00080020', 'StudyDate');				
		END IF;
	END IF;
	
	/*Check if the protocol_name provided is valid*/
	/*first check if an unresolved correction to ProtocolName already exists for this series_uid*/
	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex = '00081030' AND SeriesUID = series_uid AND CorrectedValue <> protocol_name;
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	ELSE
		/*Check the validity of the protocol name by checking against the Protocols table*/
		IF GETProtocol(protocol_name) = 0 THEN
			/*if not, set file_status to 0*/
			/*try to determine if other formations of protocol_name are valid, if so, create a correction record*/
			SET file_status = 0;
			IF GETProtocol(request_procedure_description) > 0 THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('00081030', 'StudyDescription', series_uid, protocol_name, request_procedure_description);
			ELSEIF GETProtocol(UDF_SAFE_NAME(protocol_name)) > 0 THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('00081030', 'StudyDescription', series_uid, protocol_name, UDF_SAFE_NAME(protocol_name));
			ELSEIF GETProtocol(UDF_SAFE_NAME(request_procedure_description)) > 0 THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('00081030', 'StudyDescription', series_uid, protocol_name, UDF_SAFE_NAME(request_procedure_description));
			ELSE
				/*if no matches at all, notification and placeholder correction records need to be created*/
				SET notification_description = CONCAT('ProtocolName provided (', protocol_name, ') does not exist in the database');
				INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (contact_id, 8, quarantine_id, notification_description);
				INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, DICOMFieldIndex, FieldName) VALUES (series_uid, protocol_name, '00081030', 'StudyDescription');
			END IF;
		ELSE
			SET protocol_id = GETProtocol(protocol_name);
		END IF;
	END IF;

	/*Check if the sequence_name provided is valid*/
	/*first check if an unresolved correction to SequenceName already exists for this series_uid*/
	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex = '0008103e' AND SeriesUID = series_uid AND CorrectedValue <> sequence_name;
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	ELSE
		/*Check the validity of the protocol name by checking against the Protocols table*/
		IF GETSequence(sequence_name) = 0 THEN
			/*if not, set file_status to 0*/
			/*try to determine if other formations of sequence_name are valid, if so, create a correction record*/
			SET file_status = 0;
			IF GETSequence(protocol_name_literal) > 0 THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('0008103e', 'SeriesDescription', series_uid, sequence_name, protocol_name_literal);
			ELSEIF GETSequence(UDF_SAFE_NAME(sequence_name)) > 0 THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('0008103e', 'SeriesDescription', series_uid, sequence_name, UDF_SAFE_NAME(sequence_name));
			ELSEIF GETSequence(UDF_SAFE_NAME(protocol_name_literal)) > 0 THEN
				INSERT INTO QuarantineCorrections (DICOMFieldIndex, FieldName, SeriesUID, OriginalValue, CorrectedValue)
				VALUES ('0008103e', 'SeriesDescription', series_uid, sequence_name, UDF_SAFE_NAME(protocol_name_literal));
			ELSE
				/*if no matches at all, notification and placeholder correction records need to be created*/
				SET notification_description = CONCAT('SequenceName provided (', sequence_name, ') does not exist in the database');
				INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (contact_id, 9, quarantine_id, notification_description);
				INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, DICOMFieldIndex, FieldName) VALUES (series_uid, sequence_name, '0008103e', 'SeriesDescription');
			END IF;
		ELSE
			SET sequence_id = GETSequence(sequence_name);
		END IF;
	END IF;

	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex = '00200011' AND SeriesUID = series_uid AND CorrectedValue IS NULL;
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	ELSE
		SELECT ImageID INTO image_id 
		FROM Images LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
		WHERE StudyUID = study_uid AND SequenceNumber = sequence_number AND SeriesUID <> series_uid;
		IF image_id IS NOT NULL THEN
			SET notification_description = CONCAT('SequenceNumber provided (', sequence_number, ') already used for this ScanSession');
			INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (contact_id, 9, quarantine_id, notification_description);
			INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, DICOMFieldIndex, FieldName) VALUES (series_uid, CAST(sequence_number AS CHAR), '00200011', 'SeriesNumber');
		END IF;
	END IF;

	/*The rest of the process (adding info to subject_studies and repository tables) cannot be done if preceding fields have not been determined cleanly*/
	IF file_status = 0 THEN
		UPDATE QuarantineFiles SET FileStatus = 0 WHERE QuarantineID = quarantine_id;
		RETURN 0;
	END IF;

	/*Get subject_id and study_subject_id based on the StudySubject table*/
	/*first check if an unresolved correction to PatientID already exists for this series_uid*/
	SELECT CorrectionID INTO correction_id FROM QuarantineCorrections WHERE DICOMFieldIndex = '00100020' AND SeriesUID = series_uid AND CorrectedValue IS NULL;
	IF correction_id IS NOT NULL THEN
		SET file_status = 0;
	ELSE
		/*Check if this SubjectName has been used for the same study for a subject from a different site*/
		SELECT StudySubjectID INTO study_subject_id
		FROM StudySubjects LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
		WHERE StudyID = study_id AND SubjectName = subject_name AND SiteID <> site_id_var;
		IF study_subject_id IS NOT NULL THEN
			/*if any, notification and placeholder correction records need to be created*/
			SET notification_description = CONCAT('SubjectName provided (', subject_name, ') already used for this Study (', study_name, ') for a subject from another site');
			INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (contact_id, 9, quarantine_id, notification_description);
			INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, DICOMFieldIndex, FieldName) VALUES (series_uid, sequence_name, '0008103e', 'SeriesDescription');
			SET study_subject_id = NULL;
			SET file_status = 0;
		ELSE
			/*if no match, try to match on the current site*/
			SELECT StudySubjectID INTO study_subject_id
			FROM StudySubjects LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
			WHERE StudyID = study_id AND SubjectName = subject_name AND SiteID = site_id_var;
			IF study_subject_id IS NULL THEN
				/*If the current network does not have a recycled_flag, try to identify subject_id and study_subject_id based on SubjectName and NetworkID*/
				SELECT recycle_flag INTO recycle_flag_var
				FROM membership.network
				WHERE network_id = network_id_var;
				IF NOT recycle_flag_var THEN
					/*First check if the SubjectName has already been taken*/
					SELECT StudySubjectID INTO study_subject_id
					FROM StudySubjects LEFT JOIN Studies ON StudySubjects.StudyID = Studies.StudyID LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
					WHERE NetworkID = network_id_var AND SubjectName = subject_name AND SiteID <> site_id_var;
					IF study_subject_id IS NOT NULL THEN
						/*if any, notification and placeholder correction records need to be created*/
						SET notification_description = CONCAT('SubjectName provided (', subject_name, ') already used for this Study (', study_name, ') for a subject from another site');
						INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (contact_id, 9, quarantine_id, notification_description);
						INSERT INTO QuarantineCorrections (SeriesUID, OriginalValue, DICOMFieldIndex, FieldName) VALUES (series_uid, sequence_name, '0008103e', 'SeriesDescription');
						SET study_subject_id = NULL;
						SET file_status = 0;
					ELSE
						SELECT StudySubjectID INTO study_subject_id
						FROM StudySubjects LEFT JOIN Studies ON StudySubjects.StudyID = Studies.StudyID LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
						WHERE NetworkID = network_id_var AND SubjectName = subject_name AND SiteID = site_id_var;
						IF study_subject_id IS NULL THEN
							/*Add a new record for Subject and StudySubject*/
							INSERT INTO Subjects (SiteID) VALUES (site_id_var);
							SELECT LAST_INSERT_ID() INTO subject_id;
							INSERT INTO StudySubjects (StudyID, SubjectID, SubjectName) VALUES (study_id, subject_id, subject_name);
							SELECT LAST_INSERT_ID() INTO study_subject_id;
						ELSE
							/*Get the SubjectID of that record*/
							SELECT SubjectID INTO subject_id
							FROM StudySubjects
							WHERE StudySubjectID = study_subject_id;
						END IF;
					END IF;
				ELSE
					/*Add a new record for Subject and StudySubject*/
					INSERT INTO Subjects (SiteID) VALUES (site_id_var);
					SELECT LAST_INSERT_ID() INTO subject_id;
					INSERT INTO StudySubjects (StudyID, SubjectID, SubjectName) VALUES (study_id, subject_id, subject_name);
					SELECT LAST_INSERT_ID() INTO study_subject_id;
				END IF;
			ELSE
				/*Get the SubjectID of that record*/
				SELECT SubjectID INTO subject_id
				FROM StudySubjects
				WHERE StudySubjectID = study_subject_id;
			END IF;
		END IF;
	END IF;

	/*The rest of the process (adding info to repository tables) cannot be done if the preciding fields have not been determined cleanly*/
	IF file_status = 0 THEN
		UPDATE QuarantineFiles SET FileStatus = 0 WHERE QuarantineID = quarantine_id;
		RETURN 0;
	END IF;

	SELECT ScanSessionID INTO scan_session_id FROM ScanSessions WHERE StudyUID = study_uid;
	IF scan_session_id IS NULL THEN
		INSERT INTO ScanSessions (ProtocolID, SubjectID, ScanDate, StudyUID) VALUES (protocol_id, subject_id, scan_date, study_uid);
		SELECT LAST_INSERT_ID() INTO scan_session_id;
	END IF;

	SELECT ImageID INTO image_id FROM Images WHERE SeriesUID = series_uid;
	IF image_id IS NULL THEN
		INSERT INTO Images (ScanSessionID, SequenceID, SeriesUID, SequenceNumber) VALUES (scan_session_id, sequence_id, series_uid, sequence_number);
		SELECT LAST_INSERT_ID() INTO image_id;
	END IF;

	SELECT StudyImageID INTO study_image_id FROM StudyImages WHERE StudySubjectID = study_subject_id AND ImageID = image_id;
	IF study_image_id IS NULL THEN
		INSERT INTO StudyImages (StudySubjectID, ImageID) VALUES (study_subject_id, image_id);
		SELECT LAST_INSERT_ID() INTO study_image_id;
	END IF;

RETURN study_image_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUSHUploadToRepository` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUSHUploadToRepository`(
	varFilePath VARCHAR(1000), 
	varMD5Sum VARCHAR(255), 
	varImageType VARCHAR(255), 				#0008,0008
	varScanningSequence VARCHAR(255), 		#0018,0020
	varSequenceVariant VARCHAR(255), 		#0018,0021
	varScanOptions VARCHAR(255), 			#0018,0022
	varSOPInstanceUID VARCHAR(255), 		#0008,0018
	varSeriesInstanceUID VARCHAR(255), 		#0020,000e
	varSeriesDescription VARCHAR(255), 		#0008,103e
	varSeriesNumber VARCHAR(255), 			#0020,0011
	varStudyInstanceUID VARCHAR(255), 		#0020,000d
	varStudyDescription VARCHAR(255), 		#0008,1030
	varStudyDate VARCHAR(255), 				#0008,0020
	varPatientID VARCHAR(255), 				#0010,0020
	varMagneticFieldStrength VARCHAR(255), 	#0018,0087
	varSpaceBetweenSlices VARCHAR(255), 	#0018,0088
	varSliceThickness VARCHAR(255), 		#0018,0050
	varPixelSpacing VARCHAR(255), 			#0028,0030
	varRows VARCHAR(255), 					#0028,0010
	varColumns VARCHAR(255), 				#0028,0011
	varAcquisitionMatrix VARCHAR(255), 		#0019,1310
	varRepetitionTime VARCHAR(255), 		#0018,0080
	varEchoTime VARCHAR(255), 				#0018,0081
	varFlipAngle VARCHAR(255), 				#0018,1314
	varInterpolationType VARCHAR(255), 		#0052,0039
	varUploadID INT
) RETURNS int(11)
BEGIN
	DECLARE varFileName VARCHAR(255);
	DECLARE varFileDir VARCHAR(255);
	DECLARE varQuarantineDirectoryID INT;
	DECLARE varQuarantineID INT;
	DECLARE varFileStatus INT;
	DECLARE varPeopleID INT;
	DECLARE varNotificationID INT;
	DECLARE varNonCompliantFlag BOOL;
	DECLARE varAllCompliantFlag BOOL DEFAULT TRUE;
	DECLARE varSubjectRegex VARCHAR(255);
	DECLARE varQuarantineParameterID INT;
	DECLARE varCorrectedValue VARCHAR(255);
	DECLARE varStudyID INT;
	DECLARE varNetworkID INT;
	DECLARE varSiteID INT;
	DECLARE varStudySubjectID INT;
	DECLARE varSubjectID INT;
	DECLARE varRecycleFlag BOOL;
	DECLARE varScanSessionID INT;
	DECLARE varImageID INT;
	DECLARE varStudyImageID INT;
	DECLARE varModalityID INT;
	DECLARE varQCSessionID INT;
	DECLARE varQCChoiceID INT;
	DECLARE varQCAnswerID INT;
	DECLARE varTextData VARCHAR(255);

	/*NOTE: "IF TRUE THEN" blocks used for collapsibility of code and thus improved readability and organization*/
	/*RETURN VALUES:
		-1 : File is a duplicate (either by MD5 or SOPUID)
		-2 : File is from a derived image
		-3 : File parameters need correction
		>0 : StudyImageID of file image
	/*STRATEGY: 
		1) GET/SET QuarantineDirectoryID, FileName. Determine the FileStatus of a given FullPath.
			IF NULL (New)		:
				IF Duplicate by MD5 or SOPUID
					INSERT Quarantine record (FileStatus = -1)
					RETURN -1
				IF Derived
					INSERT Quarantine record (FileStatus = -2)
					RETURN -2
				ELSE
					INSERT Quarantine record (FileStatus = 0)
					Get QuarantineID
			IF 0 (Default)		:
				Get QuarantineID
			IF -1 (Duplicate)	:
				RETURN -1
			IF -2 (Derived)		:
				RETURN -2
			IF -3 (Pending)		:
				Get QuarantineID
			IF 1 (Complete)		:
				IF StudyImageID NOT NULL
					RETURN StudyImageID
				ELSE
					UPDATE Quarantine record (FileStatus = 0)
			IF NOT RETURNED
				QuarantineID ISSET
				QuarantineDirectoryID ISSET
				FileName ISSET
		2) Get/Set Upload NotificationID. Check if derived or duplicate
			IF derived		: 
				UPDATE Quarantine record (FileStatus = -2)
				RETURN -2
			IF duplicate	:
				UPDATE Quarantine record (FileStatus = -1)
				RETURN -1
			IF NOT RETURNED
				NotificationID ISSET
		3) Determine Compliance of parameters. Replacing with Corrected Values if present
			IF any Non-compliance
				UPDATE Quarantine record (FileStatus = -3)
				RETURN -3
		4) Determine SubjectID
			IF conflict		:
				UPDATE PatientID QuarantineParameter (NonCompliant = TRUE)
				UPDATE Quarantine record (FileStatus = -3)
			IF NOT RETURNED
				SubjectID ISSET
				StudySubjectID ISSET
		5) Get/Set ScanSession, Image, StudyImage
			IF NOT RETURNED
				ScanSessionID ISSET
				ImageID ISSET
				StudyImageID ISSET
		6) Get/Set QCSession. INSERT QCAnswers
			IF Modality 2, 3, 4
				INSERT QCSession record
				INSERT QCAnswer records
			UPDATE Quarantine record (FileStatus = 1, StudyImageID = StudyImageID)
			RETURN StudyImageID
	*/

	INSERT INTO DebugLog (Message) VALUES ('Point 0');
	IF TRUE THEN/*1) Look up QuarantineFile by UploadID, Directory and FileName (fullpath). If match, RETURN StudyImageID or existing Error-File-Status*/
		INSERT INTO DebugLog (Message) VALUES ('Point 1');
		IF TRUE THEN/*Determine Directory and FileName from varFilePath*/
			SET varFileName = SUBSTRING_INDEX(varFilePath, '/', -1);
			SET varFileDir = TRIM(TRAILING varFileName FROM varFilePath);
			/*Get the QuarantineDirectoryID from the directory name, if null, INSERT a record get the insert ID*/
			SELECT QuarantineDirectoryID INTO varQuarantineDirectoryID FROM QuarantineDirectories WHERE QuarantineDirectories.UploadID = varUploadID AND QuarantineDirectories.DirectoryPath = varFileDir;
			IF varQuarantineDirectoryID IS NULL THEN
				INSERT INTO QuarantineDirectories (UploadID, DirectoryPath) VALUES (varUploadID, varFileDir);
				SELECT LAST_INSERT_ID() INTO varQuarantineDirectoryID;
			END IF;
		END IF;
		IF TRUE THEN/*Search for a pre-existing record in QuarantineFiles by UploadID, Directory and FileName (fullpath)*/
			SELECT FileStatus INTO varFileStatus FROM QuarantineFiles WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
			CASE varFileStatus
				WHEN NULL THEN /*New File, INSERT INTO QuarantineFiles*/
					INSERT INTO QuarantineFiles (QuarantineDirectoryID, FileName, MD5Sum, SeriesUID, SOPUID, FileStatus) VALUES (varQuarantineDirectoryID, varFileName, varMD5Sum, varSeriesInstanceUID, varSOPInstanceUID, 0);
					SELECT LAST_INSERT_ID() INTO varQuarantineID;
				WHEN 0 THEN/*Default Status, get QuarantineID*/
					SELECT QuarantineID INTO varQuarantineID FROM QuarantineFiles WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
				WHEN -1 THEN/*Previously determined duplicate, RETURN -1*/
					RETURN -1;
				WHEN -2 THEN/*Previously determined derived file, RETURN -2*/
					RETURN -2;
				WHEN -3 THEN/*File from a pending Series, get QuarantineID*/
					SELECT QuarantineID INTO varQuarantineID FROM QuarantineFiles WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
				WHEN 1 THEN/*Previously completed file, get StudyImageID. If fail, reset file to default FileStatus*/
					SELECT StudyImageID INTO varStudyImageID FROM QuarantineFiles WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
					IF varStudyImageID = 0 THEN
						UPDATE QuarantineFiles SET FileStatus = 0 WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
						SELECT QuarantineID INTO varQuarantineID FROM QuarantineFiles WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
					ELSE
						RETURN varStudyImageID;
					END IF;
			END CASE;
		END IF;
	END IF;

	IF TRUE THEN/*2) Get/Set NotificationID, Check if derived. If so, RETURN -2. Check if duplicate by MD5 and SOPUID. If match, RETURN -1*/
		INSERT INTO DebugLog (Message) VALUES ('Point 2');
		IF TRUE THEN/*Get/Set the Upload NotificationID for this StudyUID (ScanSession), if none, INSERT a new record, get insert ID;*/
			SELECT NotificationID INTO varNotificationID FROM Hub.Notifications WHERE StudyUID = varStudyInstanceUID AND NotificationTypeID = 2;
			IF varNotificationID IS NULL THEN/*If no existing record, INSERT it. First we need to determine the PeopleID From the StudyID*/
				SELECT PeopleID INTO varPeopleID FROM Quarantine_Uploads LEFT JOIN Studies ON Quarantine_Uploads.study_id = Studies.StudyID WHERE Quarantine_Uploads.upload_id = varUploadID;
				IF varPeopleID IS NULL THEN/*If no match, set it to an Admin ID (Mher)*/
					SET varPeopleID = 115;
				END IF;
				INSERT INTO Hub.Notifications (PeopleID, NotificationTypeID) VALUES (varPeopleID, 2);
				SELECT LAST_INSERT_ID() INTO varNotificationID;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is of derived type*/
			IF SUBSTRING_INDEX(varImageType, '\\', 1) = 'DERIVED' THEN/*If derived, UPDATE record (FileStatus = -2). RETURN -2*/
				UPDATE QuarantineFiles SET FileStatus = -2 WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
				RETURN -2;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is a duplicate by MD5Sum.*/
			SELECT QuarantineID INTO varQuarantineID FROM QuarantineFiles WHERE MD5Sum = varMD5Sum AND FileStatus = 0 LIMIT 1;
			IF varQuarantineID IS NOT NULL THEN/*If duplicate by MD5, UPDATE record (FileStatus = -1). RETURN -1*/
				UPDATE QuarantineFiles SET FileStatus = -1 WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
				RETURN -1;
			END IF;
		END IF;
		IF TRUE THEN/*Determine if the file is a duplicate by SOPUID.*/
			SELECT QuarantineID INTO varQuarantineID FROM QuarantineFiles WHERE SOPUID = varSOPInstanceUID AND FileStatus = 0 LIMIT 1;
			IF varQuarantineID IS NOT NULL THEN/*If duplicate by SOPUID, UPDATE record (FileStatus = -1). RETURN -1*/
				UPDATE QuarantineFiles SET FileStatus = -1 WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
				RETURN -1;
			END IF;
			/*Reset QuarantineID*/
			SELECT QuarantineID INTO varQuarantineID FROM QuarantineFiles WHERE QuarantineDirectoryID = varQuarantineDirectoryID AND FileName = varFileName;
		END IF;
	END IF;

	IF TRUE THEN/*3) Determine Compliance of input Parameters, INSERT QuarantineParameters. If any Non-Compliance, RETURN -2*/
		INSERT INTO DebugLog (Message) VALUES ('Point 3');
		IF TRUE THEN/*INSERT the PatientID (SubjectName) parameter into QuarantineParameters if needed (One per StudyUID)*/
			SELECT QuarantineParameterID INTO varQuarantineParameterID FROM QuarantineParameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DICOMTag = '00100020';
			IF varQuarantineParameterID IS NULL THEN/*If no QuarantineParameter record exists for this StudyUID and DICOMTag, INSERT it*/
				SELECT SubjectRegex INTO varSubjectRegex FROM Studies WHERE StudyID = varStudyID;
				IF varSubjectRegex IS NULL THEN/*If the PatientID does not comply with the Study's SubjectRegex, mark as NonCompliant*/
					SET varNonCompliantFlag = FALSE;
				ELSEIF varPatientID REGEXP varSubjectRegex THEN
					SET varNonCompliantFlag = FALSE;
				ELSE
					SET varNonCompliantFlag = TRUE;
					SET varAllCompliantFlag = FALSE;
				END IF;
				INSERT INTO QuarantineParameters (UploadID, StudyUID, DICOMTag, DICOMValue, NonCompliantFlag) VALUES (varUploadID, varStudyInstanceUID, '00100020', varPatientID, varNonCompliantFlag, varNotificationID);
			ELSE/*If a QuarantineParameter record exists, check whether it is marked as NonCompliant*/
				SELECT NonCompliantFlag INTO varNonCompliantFlag FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
				IF varNonCompliantFlag THEN/*If the existing QuarantineParameter record is marked as NonCompliant, check for a CorrectedValue*/
					SELECT CorrectedValue INTO varCorrectedValue FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
					IF varCorrectedValue IS NOT NULL THEN/*If a CorrectedValue exists, check for compliance*/
						SELECT SubjectRegex INTO varSubjectRegex FROM Studies WHERE StudyID = varStudyID;
						IF varSubjectRegex IS NULL THEN
							SET varPatientID = varCorrectedValue;
						ELSEIF varCorrectedValue REGEXP varSubjectRegex THEN
							SET varPatientID = varCorrectedValue;
						ELSE
							UPDATE QuarantineParameters SET CorrectedValue = NULL WHERE QuarantineParameterID = varQuarantineParameterID;
							SET varAllCompliantFlag = FALSE;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*INSERT the StudyDate (ScanDate) parameter into QuarantineParameters if needed (One per StudyUID)*/
			SELECT QuarantineParameterID INTO varQuarantineParameterID FROM QuarantineParameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DICOMTag = '00080020';
			IF varQuarantineParameterID IS NULL THEN/*If no QuarantineParameter record exists for this StudyUID and DICOMTag, INSERT it*/
				IF varStudyDate + INTERVAL 0 DAY IS NULL THEN/*If the StudyDate does not resolve to a date value, mark as NonCompliant*/
					SET varNonCompliantFlag = TRUE;
					SET varAllCompliantFlag = FALSE;
				ELSE
					SET varNonCompliantFlag = FALSE;
				END IF;
				INSERT INTO QuarantineParameters (UploadID, StudyUID, DICOMTag, DICOMValue, NonCompliantFlag) VALUES (varUploadID, varStudyInstanceUID, '00080020', varStudyDate, varNonCompliantFlag, varNotificationID);
			ELSE/*If a QuarantineParameter record exists, check whether it is marked as NonCompliant*/
				SELECT NonCompliantFlag INTO varNonCompliantFlag FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
				IF varNonCompliantFlag THEN/*If the existing QuarantineParameter record is marked as NonCompliant, check for a CorrectedValue*/
					SELECT CorrectedValue INTO varCorrectedValue FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
					IF varCorrectedValue IS NOT NULL THEN/*If a CorrectedValue exists, check for compliance*/
						IF varCorrectedValue + INTERVAL 0 DAY IS NULL THEN
							UPDATE QuarantineParameters SET CorrectedValue = NULL WHERE QuarantineParameterID = varQuarantineParameterID;
							SET varAllCompliantFlag = FALSE;
						ELSE
							SET varStudyDate = varCorrectedValue;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*INSERT the StudyDescription (ProtocolName) parameter into QuarantineParameters if needed (One per StudyUID)*/
			SELECT QuarantineParameterID INTO varQuarantineParameterID FROM QuarantineParameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DICOMTag = '00081030';
			IF varQuarantineParameterID IS NULL THEN/*If no QuarantineParameter record exists for this StudyUID and DICOMTag, INSERT it*/
				IF GETProtocol(varStudyDescription) = 0 THEN/*If the StudyDescription does not exist as a ProtocolName in the Protocols table, mark it as NonCompliant*/
					SET varNonCompliantFlag = TRUE;
					SET varAllCompliantFlag = FALSE;
				ELSE
					SET varNonCompliantFlag = FALSE;
				END IF;
				INSERT INTO QuarantineParameters (UploadID, StudyUID, DICOMTag, DICOMValue, NonCompliantFlag) VALUES (varUploadID, varStudyInstanceUID, '00081030', varStudyDescription, varNonCompliantFlag, varNotificationID);
			ELSE/*If a QuarantineParameter record exists, check whether it is marked as NonCompliant*/
				SELECT NonCompliantFlag INTO varNonCompliantFlag FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
				IF varNonCompliantFlag THEN/*If the existing QuarantineParameter record is marked as NonCompliant, check for a CorrectedValue*/
					SELECT CorrectedValue INTO varCorrectedValue FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
					IF varCorrectedValue IS NOT NULL THEN/*If a CorrectedValue exists, check for compliance*/
						IF GETProtocol(varCorrectedValue) = 0 THEN
							UPDATE QuarantineParameters SET CorrectedValue = NULL WHERE QuarantineParameterID = varQuarantineParameterID;
							SET varAllCompliantFlag = FALSE;
						ELSE
							SET varStudyDescription = varCorrectedValue;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*INSERT the SeriesDescription (SequenceName) parameter into QuarantineParameters if needed (One per StudyUID + SeriesUID)*/
			SELECT QuarantineParameterID INTO varQuarantineParameterID FROM QuarantineParameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID = varSeriesInstanceUID AND DICOMTag = '0008103e';
			IF varQuarantineParameterID IS NULL THEN/*If no QuarantineParameter record exists for this StudyUID, SeriesUID, and DICOMTag, INSERT it*/
				IF GETSequence(varSeriesDescription) = 0 THEN/*If the SeriesDescription does not exist as a SequenceName in the Sequences table, mark it as NonCompliant*/
					SET varNonCompliantFlag = TRUE;
					SET varAllCompliantFlag = FALSE;
				ELSE
					SET varNonCompliantFlag = FALSE;
				END IF;
				INSERT INTO QuarantineParameters (UploadID, SeriesUID, StudyUID, DICOMTag, DICOMValue, NonCompliantFlag) VALUES (varUploadID, varSeriesInstanceUID, varStudyInstanceUID, '0008103e', varSeriesDescription, varNonCompliantFlag, varNotificationID);
			ELSE/*If a QuarantineParameter record exists, check whether it is marked as NonCompliant*/
				SELECT NonCompliantFlag INTO varNonCompliantFlag FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
				IF varNonCompliantFlag THEN/*If the existing QuarantineParameter record is marked as NonCompliant, check for a CorrectedValue*/
					SELECT CorrectedValue INTO varCorrectedValue FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
					IF varCorrectedValue IS NOT NULL THEN/*If a CorrectedValue exists, check for compliance*/
						IF GETSequence(varCorrectedValue) = 0 THEN
							UPDATE QuarantineParameters SET CorrectedValue = NULL WHERE QuarantineParameterID = varQuarantineParameterID;
							SET varAllCompliantFlag = FALSE;
						ELSE
							SET varSeriesDescription = varCorrectedValue;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*INSERT the SeriesNumber (SequenceNumber) parameter into QuarantineParameters if needed (One per StudyUID + SeriesUID)*/
			SELECT QuarantineParameterID INTO varQuarantineParameterID FROM QuarantineParameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID = varSeriesInstanceUID AND DICOMTag = '00200011';
			IF varQuarantineParameterID IS NULL THEN/*If no QuarantineParameter record exists for this StudyUID, SeriesUID, and DICOMTag, INSERT it*/
				IF CAST(varCorrectedValue AS UNSIGNED) = 0 THEN
					SET varNonCompliantFlag = TRUE;
					SET varAllCompliantFlag = FALSE;
				ELSE
					SELECT QuarantineParameterID INTO varQuarantineParameterID FROM QuarantineParameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID <> varSeriesInstanceUID AND DICOMTag = '00200011' AND DICOMValue = varSeriesNumber;
					IF varQuarantineParameterID IS NULL THEN/*If a different SeriesUID (Sequence) within the same StudyUID (ScanSession) has the same SeriesNumber (SequenceNumber), mark it as NonCompliant*/
						SET varNonCompliantFlag = FALSE;
					ELSE
						SET varNonCompliantFlag = TRUE;
						SET varAllCompliantFlag = FALSE;
					END IF;
				END IF;
				INSERT INTO QuarantineParameters (UploadID, SeriesUID, StudyUID, DICOMTag, DICOMValue, NonCompliantFlag) VALUES (varUploadID, varSeriesInstanceUID, varStudyInstanceUID, '00200011', varSeriesNumber, varNonCompliantFlag, varNotificationID);
			ELSE/*If a QuarantineParameter record exists, check whether it is marked as NonCompliant*/
				SELECT NonCompliantFlag INTO varNonCompliantFlag FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
				IF varNonCompliantFlag THEN/*If the existing QuarantineParameter record is marked as NonCompliant, check for a CorrectedValue*/
					SELECT CorrectedValue INTO varCorrectedValue FROM QuarantineParameters WHERE QuarantineParameterID = varQuarantineParameterID;
					IF varCorrectedValue IS NOT NULL THEN/*If a CorrectedValue exists, check for compliance*/
						IF CAST(varCorrectedValue AS UNSIGNED) = 0 THEN
							UPDATE QuarantineParameters SET CorrectedValue = NULL WHERE QuarantineParameterID = varQuarantineParameterID;
							SET varAllCompliantFlag = FALSE;
						ELSE
							SELECT QuarantineParameterID INTO varQuarantineParameterID FROM QuarantineParameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID <> varSeriesInstanceUID AND DICOMTag = '00200011' AND DICOMValue = varCorrectedValue;
							IF varQuarantineParameterID IS NULL THEN
								SET varSeriesNumber = varCorrectedValue;
							ELSE
								SELECT QuarantineParameterID INTO varQuarantineParameterID FROM QuarantineParameters WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND SeriesUID = varSeriesInstanceUID AND DICOMTag = '00200011';
								UPDATE QuarantineParameters SET CorrectedValue = NULL WHERE QuarantineParameterID = varQuarantineParameterID;
								SET varAllCompliantFlag = FALSE;
							END IF;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
		IF TRUE THEN/*If any NonCompliant fields, change status of QuarantineFile to Pending (-3) and Notification to Quarantine-With-Non-Compliance (3)*/
			IF NOT varAllCompliantFlag THEN
				UPDATE QuarantineFiles SET FileStatus = -3 WHERE QuarantineID = varQuarantineID;
				UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
				RETURN -3;
			ELSE
				UPDATE Hub.Notifications SET NotificationTypeID = 2 WHERE NotificationID = varNotificationID;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*4) Determine SubjectID. INSERT if needed. If conflict, RETURN -3*/
		INSERT INTO DebugLog (Message) VALUES ('Point 4');
		IF TRUE THEN/*Determine StudyID, NetworkID, SiteID*/
			SELECT study_id INTO varStudyID FROM Quarantine_Uploads WHERE UploadID = varUploadID;
			SELECT NetworkID INTO varNetworkID FROM Studies WHERE StudyID = varStudyID;
			SELECT site_id INTO varSiteID FROM Quarantine_Uploads WHERE UploadID = varUploadID;
		END IF;
		IF TRUE THEN/*Determine if conflict for Study+SubjectName+Site. If so, RETURN -3*/
			SELECT StudySubjectID INTO varStudySubjectID 
				FROM StudySubjects LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID <> varSiteID;
			IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Study for a subject with a different Site, mark as NonCompliant, RETURN -3*/
				UPDATE QuarantineParameters SET NonCompliantFlag = TRUE WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DICOMTag = '00100020';
				UPDATE QuarantineFiles SET FileStatus = -3 WHERE QuarantineID = varQuarantineID;
				UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
				RETURN -3;
			END IF;
		END IF;
		IF TRUE THEN/*Determine SubjectID, if no match, INSERT it. If conflict for Network(w/o recycling)+SubjectName+Site, RETURN -3*/
			SELECT StudySubjectID INTO varStudySubjectID
				FROM StudySubjects LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
				WHERE StudyID = varStudyID AND SubjectName = varPatientID AND SiteID = varSiteID;
			IF varStudySubjectID IS NULL THEN/*If no match by Study+SubjectName+Site, try to match by Network+SubjectName+Site (if recycle flag is off)*/
				SELECT recycle_flag INTO varRecycleFlag FROM membership.network WHERE network_id = varNetworkID;
				IF varRecycleFlag THEN/*If recycling is on, then consider this a new Subject, INSERT it*/
					INSERT INTO Subjects (SiteID) VALUES (varSiteID);
					SELECT LAST_INSERT_ID() INTO varSubjectID;
					INSERT INTO StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
					SELECT LAST_INSERT_ID() INTO varStudySubjectID;
				ELSE/*If recycling is off, then try to match by Network+SubjectName+Site*/
					SELECT StudySubjectID INTO varStudySubjectID
						FROM StudySubjects LEFT JOIN Studies ON StudySubjects.StudyID = Studies.StudyID LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
						WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID <> varSiteID;
					IF varStudySubjectID IS NOT NULL THEN/*If the SubjectName has already been used for this Network (without recycling) for a subject with a different Site, mark it as NonCompliant, RETURN -3*/
						UPDATE QuarantineParameters SET NonCompliantFlag = TRUE WHERE UploadID = varUploadID AND StudyUID = varStudyInstanceUID AND DICOMTag = '00100020';
						UPDATE QuarantineFiles SET FileStatus = -3 WHERE QuarantineID = varQuarantineID;
						UPDATE Hub.Notifications SET NotificationTypeID = 3 WHERE NotificationID = varNotificationID;
						RETURN -3;
					END IF;
					SELECT StudySubjectID INTO varStudySubjectID
						FROM StudySubjects LEFT JOIN Studies ON StudySubjects.StudyID = Studies.StudyID LEFT JOIN Subjects ON StudySubjects.SubjectID = Subjects.SubjectID
						WHERE NetworkID = varNetworkID AND SubjectName = varPatientID AND SiteID = varSiteID;
					IF varStudySubjectID IS NULL THEN/*If no match by Network(without recycling)+SubjectName+Site, then consider this a new Subject, INSERT it*/
						INSERT INTO Subjects (SiteID) VALUES (varSiteID);
						SELECT LAST_INSERT_ID() INTO varSubjectID;
						INSERT INTO StudySubjects (StudyID, SubjectID, SubjectName) VALUES (varStudyID, varSubjectID, varPatientID);
						SELECT LAST_INSERT_ID() INTO varStudySubjectID;
					ELSE/*Get the SubjectID of the match by Network(without recycling)+SubjectName+Site*/
						SELECT SubjectID INTO varSubjectID FROM StudySubjects WHERE StudySubjectID = varStudySubjectID;
					END IF;
				END IF;
			ELSE/*Get the SubjectID of the match by Study+SubjectName+Site*/
				SELECT SubjectID INTO varSubjectID FROM StudySubjects WHERE StudySubjectID = varStudySubjectID;
			END IF;
		END IF;
	END IF;

	IF TRUE THEN/*5) INSERT into ScanSessions, Images, and StudyImages*/
		INSERT INTO DebugLog (Message) VALUES ('Point 5');
		SELECT ScanSessionID INTO varScanSessionID FROM ScanSessions WHERE StudyUID = varStudyInstanceUID;
		IF varScanSessionID IS NULL THEN/*If no match for ScanSession, INSERT it*/
			INSERT INTO ScanSessions (ProtocolID, SubjectID, ScanDate, StudyUID) VALUES (GETProtocol(varStudyDescription), varSubjectID, varStudyDate, varStudyInstanceUID);
			SELECT LAST_INSERT_ID() INTO varScanSessionID;
		END IF;
		SELECT ImageID INTO varImageID FROM Images WHERE SeriesUID = varSeriesInstanceUID;
		IF varImageID IS NULL THEN/*If no match for Image, INSERT it*/
			INSERT INTO Images (ScanSessionID, SequenceID, SeriesUID, SequenceNumber) VALUES (varScanSessionID, GETSequence(varSeriesDescription), varSeriesInstanceUID, CAST(varSeriesNumber AS UNSIGNED));
			SELECT LAST_INSERT_ID() INTO varImageID;
		END IF;
		SELECT StudyImageID INTO varStudyImageID FROM StudyImages WHERE StudySubjectID = varStudySubjectID AND ImageID = varImageID;
		IF varStudyImageID IS NULL THEN/*If no match for StudyImage, INSERT it*/
			INSERT INTO StudyImages (StudySubjectID, ImageID) VALUES (varStudySubjectID, varImageID);
			SELECT LAST_INSERT_ID() INTO varStudyImageID;
		END IF;
	END IF;

	IF TRUE THEN/*6) If Anatomical/Functional/Diffusion, INSERT Into QCSessions and DICOM Parameter QCAnswers. RETURN StudyImageID*/
		INSERT INTO DebugLog (Message) VALUES ('Point 6');
		IF TRUE THEN/*Determine Modality, INSERT QCSession*/
			UPDATE QuarantineFiles SET FileStatus = 1, StudyImageID = varStudyImageID WHERE QuarantineID = varQuarantineID;
			SELECT ModalityID INTO varModalityID FROM Sequences WHERE SequenceID = GETSequence(varSeriesDescription);
			IF varModalityID <> 2 AND varModalityID <> 3 AND varModalityID <> 4 THEN
				RETURN varStudyImageID;
			END IF;
			SELECT QCSessionID INTO varQCSessionID FROM QCSessions WHERE StudyImageID = varStudyImageID;
			IF varQCSessionID IS NULL THEN/*If no match for QCSession, INSERT it*/
				INSERT INTO QCSessions (StudyImageID) VALUES (varStudyImageID);
				SELECT LAST_INSERT_ID() INTO varQCSessionID;
			END IF;
		END IF;
		IF TRUE THEN/*INSERT MagneticFieldStrength*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varMagneticFieldStrength = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varMagneticFieldStrength;
				END IF;
				SET varQCChoiceID = varModalityID + 87;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT SpaceBetweenSlices*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varSpaceBetweenSlices = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varSpaceBetweenSlices;
				END IF;
				SET varQCChoiceID = varModalityID + 90;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT SliceThickness*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varSliceThickness = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varSliceThickness;
				END IF;
				SET varQCChoiceID = varModalityID + 93;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT PixelSpacing*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varPixelSpacing = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varPixelSpacing;
				END IF;
				SET varQCChoiceID = varModalityID + 96;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT Rows*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varRows = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varRows;
				END IF;
				SET varQCChoiceID = varModalityID + 99;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT Columns*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varColumns = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varColumns;
				END IF;
				SET varQCChoiceID = varModalityID + 102;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT AcquisitionMatrix*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varAcquisitionMatrix = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varAcquisitionMatrix;
				END IF;
				SET varQCChoiceID = varModalityID + 105;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT RepetitionTime*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varRepetitionTime = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varRepetitionTime;
				END IF;
				SET varQCChoiceID = varModalityID + 108;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT EchoTime*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varEchoTime = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varEchoTime;
				END IF;
				SET varQCChoiceID = varModalityID + 112;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT FlipAngle*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varFlipAngle = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varFlipAngle;
				END IF;
				SET varQCChoiceID = varModalityID + 114;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT InterpolationType*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varInterpolationType = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varInterpolationType;
				END IF;
				SET varQCChoiceID = varModalityID + 117;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT ScanningSequence*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varScanningSequence = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varScanningSequence;
				END IF;
				SET varQCChoiceID = varModalityID + 120;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT SequenceVariant*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varSequenceVariant = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varSequenceVariant;
				END IF;
				SET varQCChoiceID = varModalityID + 123;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		IF TRUE THEN/*INSERT ScanOptions*/
			SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers WHERE QCSessionID = varQCSessionID AND QCChoiceID = varQCChoiceID;
			IF varQCAnswerID IS NULL THEN
				IF varScanOptions = '' THEN 
					SET varTextData = 'NOT INCLUDED';
				ELSE
					SET varTextData = varScanOptions;
				END IF;
				SET varQCChoiceID = varModalityID + 126;
				INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (varQCSessionID, varTextData, varQCChoiceID);
			END IF;
		END IF;
		RETURN varStudyImageID;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTAssignment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTAssignment`(
	project_row_id INT(11), 
	project_column_id INT(11), 
	image_id INT(11)) RETURNS int(11)
BEGIN
	#Error Codes:
	#0 - ImageID for this ProjectRowID & ProjectColumnID already exists
	#-1 - ProjectRowID record does not exist
	#-2 - ProjectColumnID record does not exist
	#-3 - ImageID record does not exist
	#-4 - ProjectRowID and ProjectColumnID do not refer to the same ProjectType record
	DECLARE is_project_row BOOL;
	DECLARE is_project_column BOOL;
	DECLARE is_image BOOL;
	DECLARE existing_id INT;
	DECLARE project_type_id_by_row INT;
	DECLARE project_type_id_by_column INT;
	DECLARE new_assignment_id INT;

	SET existing_id = GETAssignment(project_row_id, project_column_id);
	IF NOT existing_id = 0 THEN
		RETURN 0;
	END IF;

	SET is_project_row = ISProjectRow(project_row_id);
	SET is_project_column = ISProjectColumn(project_column_id);
	SET is_image = ISImage(image_id);

	IF NOT is_project_row THEN
		RETURN -1;
	ELSEIF NOT is_project_column THEN
		RETURN -2;
	ELSEIF NOT is_image THEN
		RETURN -3;
	END IF;

	SELECT ProjectTypeID INTO project_type_id_by_row
		FROM ProjectRows
			LEFT JOIN Projects ON ProjectRows.ProjectID = Projects.ProjectID
		WHERE ProjectRows.ProjectRowID = project_row_id;

	SELECT ProjectTypeID INTO project_type_id_by_column
		FROM ProjectColumns
		WHERE ProjectColumnID = project_column_id;

	IF project_type_id_by_row = project_type_id_by_column THEN
		INSERT INTO Assignments (ProjectRowID, ProjectColumnID, ImageID) VALUES (project_row_id, project_column_id, image_id);
		SELECT LAST_INSERT_ID() INTO new_assignment_id;
		RETURN new_assignment_id;
	ELSE
		RETURN -4;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTGETQuarantineFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTGETQuarantineFile`(
	upload_id INT(11),
	file_path VARCHAR(8192),
	md5_sum VARCHAR(32),
	series_uid VARCHAR(255),
	sop_uid VARCHAR(255)
	) RETURNS int(11)
BEGIN
	DECLARE quarantine_id_by_path INT(11);
	DECLARE quarantine_id_by_md5 INT(11);
	DECLARE quarantine_id_by_uid INT(11);
	DECLARE notification_description VARCHAR(1000);
	DECLARE new_quarantine_id INT(11);
	DECLARE file_status INT;
	DECLARE quarantine_directory_in VARCHAR(8192);
	DECLARE quarantine_directory_id INT(11);
	DECLARE file_name_in VARCHAR(255);

	SET file_name_in = SUBSTRING_INDEX(file_path, '/', -1);
	SET quarantine_directory_in = TRIM(TRAILING file_name_in FROM file_path);
	SELECT QuarantineDirectoryID INTO quarantine_directory_id FROM QuarantineDirectories WHERE QuarantineDirectories.UploadID = upload_id AND QuarantineDirectories.DirectoryPath = quarantine_directory_in;
	IF quarantine_directory_id IS NULL THEN
		INSERT INTO QuarantineDirectories(UploadID, DirectoryPath) VALUES (upload_id, quarantine_directory_in);
		SELECT LAST_INSERT_ID() INTO quarantine_directory_id;
	END IF;

	SELECT QuarantineID INTO quarantine_id_by_path FROM QuarantineFiles WHERE QuarantineFiles.QuarantineDirectoryID = quarantine_directory_id AND FileName = file_name_in;

	IF quarantine_id_by_path IS NULL THEN
		SELECT QuarantineID INTO quarantine_id_by_md5 FROM QuarantineFiles WHERE MD5Sum = md5_sum;
		IF quarantine_id_by_md5 IS NOT NULL THEN
			INSERT INTO QuarantineFiles (QuarantineDirectoryID, FileName, MD5Sum, SeriesUID, SOPUID, FileStatus)
			VALUES (quarantine_directory_id, file_name_in, md5_sum, series_uid, sop_uid, -1);
			SELECT LAST_INSERT_ID() INTO new_quarantine_id;
			SET notification_description = 'Newly added quarantine record is actually a duplicate (by MD5Sum)';
			INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (2, 1, new_quarantine_id, notification_description);
			RETURN -1;
		END IF;

		SELECT QuarantineID INTO quarantine_id_by_uid FROM QuarantineFiles WHERE SOPUID = sop_uid;

		IF quarantine_id_by_uid IS NOT NULL THEN
			INSERT INTO QuarantineFiles (QuarantineDirectoryID, FileName, MD5Sum, SeriesUID, SOPUID, FileStatus)
			VALUES (quarantine_directory_id, file_name_in, md5_sum, series_uid, sop_uid, -1);
			SELECT LAST_INSERT_ID() INTO new_quarantine_id;
			SET notification_description = 'Newly added quarantine record is actually a duplicate (by SOP UID, but not MD5Sum)';
			INSERT INTO Hub.Notifications (ContactID, NotificationTypeID, Identifier, Description) VALUES (2, 1, new_quarantine_id, notification_description);
			RETURN -1;
		END IF;

		INSERT INTO QuarantineFiles (QuarantineDirectoryID, FileName, MD5Sum, SeriesUID, SOPUID, FileStatus)
		VALUES (quarantine_directory_id, file_name_in, md5_sum, series_uid, sop_uid, 0);
		SELECT LAST_INSERT_ID() INTO new_quarantine_id;
		RETURN new_quarantine_id;
	ELSE
		SELECT FileStatus INTO file_status FROM QuarantineFiles WHERE QuarantineID = quarantine_id_by_path;
		IF file_status = 0 THEN
			RETURN quarantine_id_by_path;
		ELSE
			RETURN file_status;
		END IF;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTImage`(
	scan_session_id INT(11), 
	sequence_id INT(11), 
	series_uid VARCHAR(255), 
	sequence_number INT(11)) RETURNS int(11)
BEGIN
	#Error Codes:
	#0 - Record with SeriesUID already exists
	#-1 - ScanSessionID record does not exist
	#-2 - SequenceID record does not exist
	#-3 - SequenceNumber for this ScanSessionID already exists
	DECLARE is_scan_session BOOL;
	DECLARE is_sequence BOOL;
	DECLARE existing_id INT;
	DECLARE new_image_id INT;

	SET existing_id = GETImage(series_uid, 0, 0);
	IF NOT existing_id = 0 THEN
		RETURN -13;
	END IF;

	SET existing_id = GETImage('', scan_session_id, sequence_number);
	IF NOT existing_id = 0 THEN
		RETURN -14;
	END IF;

	SET is_scan_session = ISScanSession(scan_session_id);
	SET is_sequence = ISSequence(sequence_id);

	IF NOT is_scan_session THEN
		RETURN -1;
	ELSEIF NOT is_sequence THEN
		RETURN -2;
	END IF;

	INSERT INTO Images (ScanSessionID, SequenceID, SeriesUID, SequenceNumber) VALUES (ScanSessionID, SequenceID, SeriesUID, SequenceNumber);
	SELECT LAST_INSERT_ID() INTO new_image_id;
	RETURN new_image_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTProject`(
	project_name VARCHAR(255), 
	project_type_id INT(11)) RETURNS int(11)
BEGIN
	#Error Codes :
	#0 - Record with ProjectName already exists
	#-1 - ProjectTypeID record does not exist
	DECLARE is_project_type BOOL;
	DECLARE existing_id INT;
	DECLARE new_project_id INT;

	SET is_project_type = ISProjectType(project_type_id);
	IF NOT is_project_type THEN
		RETURN -1;
	END IF;

	SET existing_id = GETProject(project_name);
	IF existing_id = 0 THEN
		INSERT INTO Projects (ProjectName, ProjectTypeID) VALUES (project_name, project_type_id);
		SELECT LAST_INSERT_ID() INTO new_project_id;
		RETURN new_project_id;
	ELSE
		RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTProjectColumn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTProjectColumn`(
	project_type_id INT(11), 
	project_column_name VARCHAR(255), 
	project_column_number INT(11)) RETURNS int(11)
BEGIN
	#Error Codes :
	#0 - ProjectColumnName for this ProjectTypeID already exists
	#-1 - ProjectTypeID record does not exist
	#-2 - ProjectColumnNumber for this ProjectTypeID already exists
	DECLARE is_project_type BOOL;
	DECLARE existing_id INT;
	DECLARE new_project_column_id INT;

	SET is_project_type = ISProjectType(project_type_id);

	IF NOT is_project_type THEN
		RETURN -1;
	END IF;

	SET existing_id = GETProjectColumn(project_type_id, project_column_name, 0);
	IF NOT existing_id = 0 THEN
		RETURN 0;
	END IF;

	SET existing_id = GETProjectColumn(project_type_id, '', project_column_number);
	IF NOT existing_id = 0 THEN
		RETURN -2;
	END IF;

	INSERT INTO ProjectColumns (ProjectTypeID, ProjectColumnName, ProjectColumnNumber) VALUES (project_type_id, project_column_name, project_column_number);
	SELECT LAST_INSERT_ID() INTO new_project_column_id;
	RETURN new_project_column_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTProjectRow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTProjectRow`(
	project_id INT(11), 
	project_row_name VARCHAR(255), 
	project_row_number INT(11)) RETURNS int(11)
BEGIN
	DECLARE is_project BOOL;
	DECLARE existing_id INT;
	DECLARE new_project_row_id INT;

	SET is_project = ISProject(project_id);

	IF NOT is_project THEN
		RETURN 0;
	END IF;

	SET existing_id = GETProjectRow(project_id, project_row_name, 0);
	IF NOT existing_id = 0 THEN
		RETURN 0;
	END IF;

	SET existing_id = GETProjectRow(project_id, '', project_row_number);
	IF NOT existing_id = 0 THEN
		RETURN 0;
	END IF;

	INSERT INTO ProjectRows (ProjectID, ProjectRowName, ProjectRowNumber) VALUES (project_id, project_row_name, project_row_number);
	SELECT LAST_INSERT_ID() INTO new_project_row_id;
	RETURN new_project_row_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTProjectType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTProjectType`(
	project_type_name VARCHAR(255)) RETURNS int(11)
BEGIN
	#Error Codes :
	#0 - ProjectTypeName record already exists
	DECLARE existing_id INT;
	DECLARE new_project_type_id INT;

	SET existing_id = GETProjectType(project_type_name);
	IF existing_id = 0 THEN
		INSERT INTO ProjectTypes (ProjectTypeName) VALUES (project_type_name);
		SELECT LAST_INSERT_ID() INTO new_project_type_id;
		RETURN new_project_type_id;
	ELSE
		RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTProtocol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTProtocol`(
	protocol_name VARCHAR(255)) RETURNS int(11)
BEGIN
	#Error Codes :
	#0 - ProtocolName record already exists
	DECLARE existing_id INT;
	DECLARE new_protocol_id INT;

	SET existing_id = GETProtocol(protocol_name);
	IF existing_id = 0 THEN
		INSERT INTO Protocols(ProtocolName) VALUES (protocol_name);
		SELECT LAST_INSERT_ID() INTO new_protocol_id;
		RETURN new_protocol_id;
	ELSE
		RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTQCAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTQCAnswer`(
	qc_session_id INT(11), 
	numeric_data decimal(15,5), 
	text_data VARCHAR(255), 
	qc_choice_id INT(11), 
	brain_region_id INT(11), 
	laterality TINYINT(4), 
	brain_region_direction TINYINT(4), 
	volume_number INT(10), 
	x_coord SMALLINT(4), 
	y_coord SMALLINT(4), 
	z_coord SMALLINT(4), 
	db_sync_id INT(11), 
	comments VARCHAR(250)) RETURNS int(11)
BEGIN

DECLARE is_qc_session BOOL;
DECLARE is_qc_choice BOOL;
DECLARE is_db_sync BOOL;
DECLARE is_brain_region BOOL;
DECLARE is_unique BOOL;
DECLARE is_numeric BOOL;
DECLARE is_text BOOL;
DECLARE is_overall BOOL;
DECLARE qc_question_count INT(11);
DECLARE required_count INT(11);
DECLARE qc_session_finalized_date DATETIME;
DECLARE qc_question_id INT(11);
DECLARE modality_id_by_qc_session INT(11);
DECLARE modality_id_by_qc_choice INT(11);
DECLARE new_qc_answer_id INT(11);

#Ensure that QCSessionID is valid
SET is_qc_session = ISQCSession(qc_session_id);
IF NOT is_qc_session THEN
	RETURN 0;
END IF;

#Ensure that QCChoiceID is valid
SET is_qc_choice = ISQCChoice(qc_choice_id);
IF NOT is_qc_choice THEN
	RETURN 0;
END IF;

#Ensure that DBSyncID is valid
SET is_db_sync = ISDBSync(db_sync_id);
IF NOT is_db_sync THEN
	RETURN 0;
END IF;

#Ensure that BrainRegionID is valid
SET is_brain_region = ISBrainRegion(brain_region_id);
IF brain_region_id > 0 AND NOT is_brain_region THEN
	RETURN 0;
END IF;

#Ensure that Record is not finalized
SELECT FinalizedDate INTO qc_session_finalized_date
	FROM QCSessions
	WHERE QCSessionID = qc_session_id;

IF qc_session_finalized_date IS NOT NULL THEN
	RETURN 0;
END IF;

#Ensure that the QCChoice applies to the same modality as the image
SELECT ModalityID INTO modality_id_by_qc_session
	FROM QCSessions
		LEFT JOIN StudyImages ON QCSessions.StudyImageID = StudyImages.StudyImageID
		LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
		LEFT JOIN Sequences ON Images.SequenceID = Sequences.SequenceID
	WHERE QCSessions.QCSessionID = qc_session_id;

SELECT ModalityID INTO modality_id_by_qc_choice
	FROM QCChoices
		LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
	WHERE QCChoices.QCChoiceID = qc_choice_id;

IF modality_id_by_qc_session <> modality_id_by_qc_choice THEN
	RETURN 0;
END IF;

#Ensure that a unique Question is not added more than once
SELECT UniqueFlag INTO is_unique
	FROM QCChoices
		LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
	WHERE QCChoices.QCChoiceID = qc_choice_id;

SELECT QCQuestionID INTO qc_question_id
	FROM QCChoices
	WHERE QCChoices.QCChoiceID = qc_choice_id;

SELECT Count(QCAnswerID) INTO qc_question_count
	FROM QCAnswers
		LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
	WHERE QCChoices.QCQuestionID = qc_question_id AND QCAnswers.QCSessionID = qc_session_id
	GROUP BY QCQuestionID;

IF is_unique AND qc_question_count > 0 THEN
	RETURN 0;
END IF;

IF is_unique THEN
	SET brain_region_id = 0;
	SET laterality = 0;
	SET brain_region_direction = 0;
	SET volume_number = 0;
	SET x_coord = 0;
	SET y_coord = 0;
	SET z_coord = 0;
END IF;

#Ensure that an overall Questions is not added before all required questions have been added
SELECT OverallFlag INTO is_overall
	FROM QCChoices
		LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
	WHERE QCChoices.QCChoiceID = qc_choice_id;	

SELECT Count(QCChoices.QCChoiceID) INTO required_count
	FROM QCChoices
		LEFT JOIN (
			SELECT QCChoiceID
				FROM QCAnswers
				WHERE QCSessionID = qc_session_id)
			AS AddedAnswers ON QCChoices.QCChoiceID = AddedAnswers.QCChoiceID
		LEFT JOIN (
			SELECT QCQuestionID
				FROM QCQuestions
				WHERE ModalityID = modality_id_by_qc_choice AND RequiredFlag = TRUE AND OverallFlag = FALSE)
			AS RequiredQuestions ON QCChoices.QCQuestionID = RequiredQuestions.QCQuestionID;

IF is_overall AND required_count > 0 THEN
	RETURN 0;
END IF;

SELECT NumericFlag INTO is_numeric
	FROM QCChoices
		LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
	WHERE QCChoices.QCChoiceID = qc_choice_id;	

IF NOT is_numeric THEN
	SET numeric_data = NULL;
END IF;

SELECT TextFlag INTO is_text
	FROM QCChoices
		LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
	WHERE QCChoices.QCChoiceID = qc_choice_id;	

IF NOT is_text THEN
	SET text_data = NULL;
END IF;

IF laterality > 1 OR laterality < -1 THEN
	SET laterality = 0;
END IF;

IF brain_region_direction > 3 OR brain_region_direction < 0 THEN
	SET brain_region_direction = 0;
END IF;

INSERT INTO QCAnswers (QCSessionID, NumericData, TextData, QCChoiceID, BrainRegionID, Laterality, BrainRegionDirection, VolumeNumber, XCoord, YCoord, ZCoord, DBSyncID, Comments)
	VALUES (qc_session_id, numeric_data, text_data, qc_choice_id, brain_region_id, laterality, brain_region_direction, volume_number, x_coord, y_coord, z_coord, db_sync_id, comments);
SELECT LAST_INSERT_ID() INTO new_qc_answer_id;
RETURN new_qc_answer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTQuarantineFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTQuarantineFile`(
	upload_id_in INT(11),
	file_path VARCHAR(255),
	md5sum_in VARCHAR(255),
	series_uid VARCHAR(255),
	sop_uid VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE quarantine_id_by_path INT(11);
	DECLARE quarantine_id_by_md5 INT(11);
	DECLARE quarantine_id_by_uid INT(11);
	DECLARE message_json VARCHAR(1000);
	DECLARE new_quarantine_id INT(11);

	SELECT quarantine_id INTO quarantine_id_by_path FROM Quarantine_Files WHERE filepath = file_path;
	SELECT quarantine_id INTO quarantine_id_by_md5 FROM Quarantine_Files WHERE md5sum = md5sum_in;
	SELECT quarantine_id INTO quarantine_id_by_uid FROM Quarantine_Files WHERE SOPInstanceUID = sop_uid;

	IF quarantine_id_by_path IS NOT NULL THEN
		RETURN -12;
	END IF;
			
	IF quarantine_id_by_md5 IS NOT NULL THEN
		INSERT INTO Quarantine_Files (upload_id, filepath, md5sum, SeriesUID, SOPUID, file_status)
		VALUES (upload_id_in, file_path, md5sum_in, series_uid, sop_uid, -1);
		SELECT LAST_INSERT_ID() INTO new_quarantine_id;
		SET message_json =
			"Type:'Quarantine',PK:" & CAST(new_quarantine_id AS CHAR) & ",Message:'Newly added quarantine record is actually a duplicate (by MD5Sum)'";
		INSERT INTO Hub.Notifications (MessageID, ContactID) VALUES (message_json, 2);
		RETURN -23;
	END IF;

	IF quarantine_id_by_uid IS NOT NULL THEN
		INSERT INTO Quarantine_Files (upload_id, filepath, md5sum, SeriesUID, SOPUID, file_status)
		VALUES (upload_id_in, file_path, md5sum_in, series_uid, sop_uid, -1);
		SELECT LAST_INSERT_ID() INTO new_quarantine_id;
		SET message_json =
			"Type:'Quarantine',PK:" & CAST(new_quarantine_id AS CHAR) & ",Message:'Newly added quarantine record is actually a duplicate (by SOP UID, but not MD5Sum)'";
		INSERT INTO Hub.Notifications (MessageID, ContactID) VALUES (message_json, 2);
		RETURN -25;
	END IF;

	INSERT INTO Quarantine_Files (upload_id, filepath, md5sum, SeriesUID, SOPUID)
	VALUES (upload_id_in, file_path, md5sum_in, series_uid, sop_uid);
	SELECT LAST_INSERT_ID() INTO new_quarantine_id;
	RETURN new_quarantine_id;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTScanSession`(
	protocol_id INT(11), 
	subject_id INT(11), 
	scan_date DATE, 
	study_uid VARCHAR(255)) RETURNS int(11)
BEGIN
	#Error Codes :
	#0 - Record with StudyUID already exists
	#-1 - ProtocolID record does not exist
	#-2 - SubjectID record does not exist
	DECLARE is_protocol BOOL;
	DECLARE is_subject BOOL;
	DECLARE existing_id INT;
	DECLARE new_scan_session_id INT;

	SET is_protocol = ISProtocol(protocol_id);
	IF NOT is_protocol THEN
		RETURN -1;
	END IF;

	SET is_subject = ISSubject(subject_id);
	IF NOT is_subject THEN
		RETURN -2;
	END IF;

	SET existing_id = GETScanSession(study_uid);
	IF existing_id = 0 THEN
		INSERT INTO ScanSessions (ProtocolID, SubjectID, ScanDate, StudyUID) VALUES (protocol_id, subject_id, scan_date, study_uid);
	ELSE
		RETURN -14;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTSequence`(
	sequence_name VARCHAR(255), 
	modality_id INT(11)) RETURNS int(11)
BEGIN
	#Error Codes:
	#0 - Record with SequenceName already exists
	#-1 - ModalityID record does not exist
	DECLARE is_modality BOOL;
	DECLARE existing_id INT;
	DECLARE new_sequence_id INT;

	SET is_modality = ISModality(modality_id);
	IF NOT is_modality THEN
		RETURN -1;
	END IF;

	SET existing_id = GETSequence(sequence_name);
	IF existing_id = 0 THEN
		INSERT INTO Sequences(SequenceName, ModalityID) VALUES (sequence_name, modality_id);
		SELECT LAST_INSERT_ID() INTO new_sequence_id;
		RETURN new_sequence_id;
	ELSE
		RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTStudy`(
	study_name VARCHAR(255), 
	study_nick_name VARCHAR(255),
	network_id INT(11)) RETURNS int(11)
BEGIN
	#Error Codes :
	#0 - Record with StudyName already exists
	#-1 - NetworkID record does not exist
	DECLARE is_network BOOL;
	DECLARE existing_id INT;
	DECLARE new_study_id INT;

	SET is_network = ISNetwork(network_id);
	IF NOT is_network THEN
		RETURN -1;
	END IF;

	SET existing_id = GETStudy(study_name);
	IF existing_id = 0 THEN
		INSERT INTO Studies(StudyName, StudyNickName, NetworkID) VALUES (study_name, study_nick_name, network_id);
		SELECT LAST_INSERT_ID() INTO new_study_id;
		RETURN new_study_id;
	ELSE
		RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTStudyImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTStudyImage`(
	image_id INT(11), 
	study_subject_id INT(11)) RETURNS int(11)
BEGIN
	#Error Codes:
	#0 - ImageID for this StudyID already exists
	#-1 - ImageID record does not exist
	#-2 - StudySubjectID record does not exist
	#-3 - ImageID and StudySubject do not refer to the same Subject record
	DECLARE is_image BOOL;
	DECLARE is_study_subject BOOL;
	DECLARE existing_id INT;
	DECLARE subject_id_by_image INT;
	DECLARE subject_id_by_study_subject INT;
	DECLARE new_study_image_id INT;

	SET existing_id = GETStudyImage(image_id, study_subject_id, 0);
	IF NOT existing_id = 0 THEN
		RETURN -11;
	END IF;

	SET is_image = ISImage(image_id);
	SET is_study_subject = ISStudySubject(study_subject_id);

	IF NOT is_image THEN
		RETURN -1;
	ELSEIF NOT is_study_subject THEN
		RETURN -2;
	END IF;

	SELECT SubjectID INTO subject_id_by_image 
		FROM Images 
			LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSession.ScanSessionID
		WHERE Images.ImageID = image_id;

	SELECT SubjectID INTO subject_id_by_study_subject
		FROM StudySubjects
		WHERE StudySubjectID = study_subject_id;

	IF subject_id_by_image = subject_id_by_study_subject THEN
		INSERT INTO StudyImages (ImageID, StudySubjectID) VALUES (image_id, study_subject_id);
		SELECT LAST_INSERT_ID() INTO new_study_image_id;
		INSERT INTO QCSessions (StudyImageID) VALUES (new_study_image_id);
		RETURN new_study_image_id;
	ELSE
		RETURN -21;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTStudySubject`(
	study_id INT(11), 
	subject_id INT(11), 
	subject_name VARCHAR(255)) RETURNS int(11)
BEGIN
	DECLARE is_study BOOL;
	DECLARE is_subject BOOL;
	DECLARE network_id_var INT;
	DECLARE recycle_flag_var BOOL;
	DECLARE existing_id INT;
	DECLARE new_study_subject_id INT;

	SET is_study = ISStudy(study_id);
	IF NOT is_study THEN
		RETURN -1;
	END IF;

	SET is_subject = ISSubject(subject_id);
	IF NOT is_subject THEN
		RETURN -2;
	END IF;

	SET existing_id = GETStudySubject(study_id, 0, subject_name);
	IF existing_id > 0 THEN
		RETURN -12;
	END IF;

	SET existing_id = GETStudySubject(study_id, subject_id, '');
	IF existing_id > 0 THEN
		RETURN -13;
	END IF;

	SELECT NetworkID INTO network_id_var FROM Studies WHERE StudyID = study_id;

	SELECT recycle_flag INTO recycle_flag_var
		FROM membership.network
		WHERE membership.network.network_id = network_id_var;

	IF recycle_flag THEN
		INSERT INTO StudySubjects (StudyID, SubjectID, SubjectName) VALUES (study_id, subject_id, subject_name);
		SELECT LAST_INSERT_ID() INTO new_study_subject_id;
	ELSE
		SELECT StudySubjectID INTO existing_id
			FROM StudySubjects LEFT JOIN Studies ON StudySubjects.StudyID = Studies.StudyID
			WHERE NetworkID = network_id_var AND SubjectID = subject_id AND NOT SubjectName = subject_name
			LIMIT 1;
		IF existing_id IS NOT NULL THEN
			RETURN -23;
		END IF;
		SELECT StudySubjectID INTO existing_id
			FROM StudySubjects LEFT JOIN Studies ON StudySubjects.StudyID = Studies.StudyID
			WHERE NetworkID = network_id_var AND NOT SubjectID = subject_id AND SubjectName = subject_name
			LIMIT 1;
		IF existing_id IS NOT NULL THEN
			RETURN -22;
		END IF;
		INSERT INTO StudySubjects(StudyID, SubjectID, SubjectName) VALUES (study_id, subject_id, subject_name);
		SELECT LAST_INSERT_ID() INTO new_study_subject_id;
	END IF;
	RETURN new_study_subject_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PUTSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `PUTSubject`(
	site_id INT(11)) RETURNS int(11)
BEGIN
	#Error Codes :
	#0 - SiteID does not exist
	DECLARE is_site BOOL;
	DECLARE new_subject_id INT;

	SET is_site = ISSite(site_id);
	IF is_site THEN
		INSERT INTO Subjects(SiteID) VALUES (site_id);
		SELECT LAST_INSERT_ID() INTO new_subject_id;
		RETURN new_subject_id;
	ELSE
		RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TestFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `TestFunction`(`study_id` INT,`report_criteria_id` INT) RETURNS char(1) CHARSET latin1
BEGIN

	DECLARE miniSQL VARCHAR(5000);
    SELECT 
		GROUP_CONCAT(
				DISTINCT CONCAT(
					'GROUP_CONCAT((CASE BigQuery.ModalityID WHEN ', Sequences.ModalityID, ' THEN BigQuery.Result ELSE NULL END)) AS ', REPLACE(Modalities.ModalityName, ' ', '_')))
    INTO miniSQL
    FROM
		StudyImages
		LEFT JOIN
			StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
		LEFT JOIN 
			Images ON StudyImages.ImageID = Images.ImageID
			LEFT JOIN 
				Sequences ON Images.SequenceID = Sequences.SequenceID
				LEFT JOIN
					Modalities ON Sequences.ModalityID = Modalities.ModalityID
    WHERE
		StudySubjects.StudyID = study_id;

	RETURN miniSQL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UDF_SAFE_NAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UDF_SAFE_NAME`(ManipString VARCHAR(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN
	SET ManipString = UPPER(ManipString);
	SET ManipString = REPLACE(ManipString, ' ', '_');
	SET ManipString = REPLACE(ManipString, '!', '_');
	SET ManipString = REPLACE(ManipString, '@', '_');
	SET ManipString = REPLACE(ManipString, '#', '_');
	SET ManipString = REPLACE(ManipString, '$', '_');
	SET ManipString = REPLACE(ManipString, '%', '_');
	SET ManipString = REPLACE(ManipString, '^', '_');
	SET ManipString = REPLACE(ManipString, '*', '_');
	SET ManipString = REPLACE(ManipString, '-', '_');
	SET ManipString = REPLACE(ManipString, '+', '_');
	SET ManipString = REPLACE(ManipString, '=', '_');
	SET ManipString = REPLACE(ManipString, '{', '(');
	SET ManipString = REPLACE(ManipString, '}', ')');
	SET ManipString = REPLACE(ManipString, '[', '(');
	SET ManipString = REPLACE(ManipString, ']', ')');
	SET ManipString = REPLACE(ManipString, '<', '(');
	SET ManipString = REPLACE(ManipString, '>', ')');
	SET ManipString = REPLACE(ManipString, '|', '_');
	SET ManipString = REPLACE(ManipString, '\\', '_');
	SET ManipString = REPLACE(ManipString, ':', '_');
	SET ManipString = REPLACE(ManipString, ';', '_');
	SET ManipString = REPLACE(ManipString, '"', '');
	SET ManipString = REPLACE(ManipString, '\'', '');
	SET ManipString = REPLACE(ManipString, ',', '_');
	SET ManipString = REPLACE(ManipString, '.', '_');
	SET ManipString = REPLACE(ManipString, ' ', '_');
	SET ManipString = REPLACE(ManipString, '?', '_');
	SET ManipString = REPLACE(ManipString, '/', '_');
	SET ManipString = TRIM(BOTH '_' FROM ManipString);
	
RETURN ManipString;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONBrainRegion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONBrainRegion`(
	qc_answer_id INT(11), 
	brain_region_id INT(11), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_brain_region BOOL;
	DECLARE is_db_sync BOOL;
	DECLARE qc_question_id INT(11);
	DECLARE is_unique BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	IF brain_region_id = 0 THEN
		SET is_brain_region = TRUE;
	ELSE
		SET is_brain_region = ISBrainRegion(brain_region_id);
	END IF;
	
	IF NOT is_brain_region THEN
		RETURN -1;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -2;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT UniqueFlag INTO is_unique
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF is_unique THEN
		RETURN -3;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -4;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -5;
	END IF;

	UPDATE QCAnswers SET BrainRegionID = brain_region_id, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONBrainRegionDirection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONBrainRegionDirection`(
	qc_answer_id INT(11), 
	brain_region_direction INT(11), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_brain_region_direction BOOL;
	DECLARE is_db_sync INT(11);
	DECLARE qc_question_id INT(11);
	DECLARE is_unique BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	IF brain_region_direction > 3 OR brain_region_direction < -3 THEN
		RETURN -1;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -2;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT UniqueFlag INTO is_unique
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF is_unique THEN
		RETURN -3;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -4;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -5;
	END IF;

	UPDATE QCAnswers SET BrainRegionDirection = brain_region_direction, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONComments`(
	qc_answer_id INT(11), 
	comments VARCHAR(250), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_db_sync INT(11);
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -1;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -2;
	END IF;

	UPDATE QCAnswers SET Comments = comments, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONLaterality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONLaterality`(
	qc_answer_id INT(11), 
	laterality INT(11), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_laterality BOOL;
	DECLARE is_db_sync BOOL;
	DECLARE qc_question_id INT(11);
	DECLARE is_unique BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	IF laterality > 1 OR laterality < -1 THEN
		RETURN -1;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -2;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT UniqueFlag INTO is_unique
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF is_unique THEN
		RETURN -3;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -4;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -5;
	END IF;

	UPDATE QCAnswers SET Laterality = laterality, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONNumericData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONNumericData`(
	qc_answer_id INT(11), 
	numeric_data DECIMAL(15,5), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_db_sync BOOL;
	DECLARE qc_question_id INT(11);
	DECLARE is_numeric BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT NumericFlag INTO is_numeric
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_numeric THEN
		RETURN -1;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -2;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -3;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -4;
	END IF;

	UPDATE QCAnswers SET NumericData = numeric_data, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONTextData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONTextData`(
	qc_answer_id INT(11), 
	text_data VARCHAR(255), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_db_sync BOOL;
	DECLARE qc_question_id INT(11);
	DECLARE is_text BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -1;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT TextFlag INTO is_text
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_text THEN
		RETURN -2;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -3;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -4;
	END IF;

	UPDATE QCAnswers SET TextData = text_data, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONVolumeNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONVolumeNumber`(
	qc_answer_id INT(11), 
	volume_number INT(11), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_volume_number BOOL;
	DECLARE is_db_sync INT(11);
	DECLARE qc_question_id INT(11);
	DECLARE is_unique BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	IF volume_number < 0 THEN
		RETURN -1;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -2;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT UniqueFlag INTO is_unique
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF is_unique THEN
		RETURN -3;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -4;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -5;
	END IF;

	UPDATE QCAnswers SET VolumeNumber = volume_number, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONXCoord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONXCoord`(
	qc_answer_id INT(11), 
	x_coord INT(11), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_db_sync INT(11);
	DECLARE qc_question_id INT(11);
	DECLARE is_unique BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	IF x_coord < 0 THEN
		RETURN -1;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -2;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT UniqueFlag INTO is_unique
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF is_unique THEN
		RETURN -3;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -4;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -5;
	END IF;

	UPDATE QCAnswers SET XCoord = x_coord, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONYCoord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONYCoord`(
	qc_answer_id INT(11), 
	y_coord INT(11), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_db_sync INT(11);
	DECLARE qc_question_id INT(11);
	DECLARE is_unique BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	IF y_coord < 0 THEN
		RETURN -1;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -2;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT UniqueFlag INTO is_unique
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF is_unique THEN
		RETURN -3;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -4;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -5;
	END IF;

	UPDATE QCAnswers SET YCoord = y_coord, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEQCAnswerONZCoord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEQCAnswerONZCoord`(
	qc_answer_id INT(11), 
	z_coord INT(11), 
	db_sync_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_qc_answer BOOL;
	DECLARE is_db_sync INT(11);
	DECLARE qc_question_id INT(11);
	DECLARE is_unique BOOL;
	DECLARE is_human BOOL;
	DECLARE qc_session_id INT(11);
	DECLARE is_finalized BOOL;
	
	SET is_qc_answer = ISQCAnswer(qc_answer_id);
	IF NOT is_qc_answer THEN
		RETURN 0;
	END IF;

	IF z_coord < 0 THEN
		RETURN -1;
	END IF;

	SET is_db_sync = ISDBSync(db_sync_id);
	IF NOT is_db_sync THEN
		RETURN -2;
	END IF;

	SELECT QCQuestionID INTO qc_question_id
		FROM QCAnswers
			LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		WHERE QCAnswers.QCAnswerID = qc_answer_id;

	SELECT UniqueFlag INTO is_unique
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF is_unique THEN
		RETURN -3;
	END IF;

	SELECT HumanFlag INTO is_human
		FROM QCQuestions
		WHERE QCQuestionID = qc_question_id;

	IF NOT is_human THEN
		RETURN -4;
	END IF;

	SELECT QCSessionID INTO qc_session_id
		FROM QCAnswers
		WHERE QCAnswerID = qc_answer_id;

	SELECT NOT(ISNULL(FinalizedDate)) INTO is_finalized
		FROM QCSessions
		WHERE QCSessionID = qc_session_id;

	IF is_finalized THEN
		RETURN -5;
	END IF;

	UPDATE QCAnswers SET ZCoord = z_coord, DBSyncID = db_sync_id WHERE QCAnswerID = qc_answer_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATESequenceONModality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATESequenceONModality`(
	sequence_id INT(11), 
	modality_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_sequence BOOL;
	DECLARE is_modality BOOL;

	SET is_sequence = ISSequence(sequence_id);
	IF NOT is_sequence THEN
		RETURN 0;
	END IF;

	SET is_modality = ISModality(modality_id);
	IF NOT is_modality THEN
		RETURN -1;
	END IF;

	UPDATE Sequences SET ModalityID = modality_id WHERE SequenceID = sequence_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATEStudyONNetwork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATEStudyONNetwork`(
	study_id INT(11), 
	network_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_study BOOL;
	DECLARE is_network BOOL;

	SET is_study = ISStudy(study_id);
	IF NOT is_study THEN
		RETURN 0;
	END IF;

	SET is_network = ISNetwork(network_id);
	IF NOT is_network THEN
		RETURN -1;
	END IF;

	UPDATE Studies SET NetworkID = network_id WHERE StudyID = study_id;
	RETURN 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UPDATESubjectONSite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` FUNCTION `UPDATESubjectONSite`(
	subject_id INT(11), 
	site_id INT(11)) RETURNS int(11)
BEGIN

	DECLARE is_subject BOOL;
	DECLARE is_site BOOL;

	SET is_subject = ISSubject(subject_id);
	IF NOT is_subject THEN
		RETURN 0;
	END IF;

	SET is_site = ISSite(site_id);
	IF NOT is_site THEN
		RETURN -1;
	END IF;

	UPDATE Subjects SET SiteID = site_id WHERE SubjectID = subject_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addQCAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `addQCAnswer`(IN inQCSessionID INT, IN inQCChoiceID INT, IN inDBSyncID INT)
Main :BEGIN

DECLARE varUniqueFlag BOOL;
DECLARE varQCQuestionID INT;
DECLARE varQCAnswerID INT;

SELECT UniqueFlag INTO varUniqueFlag
FROM QCChoices LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
WHERE QCChoiceID = inQCChoiceID;

IF varUniqueFlag = 1 THEN
	SELECT QCQuestionID INTO varQCQuestionID
	FROM QCChoices
	WHERE QCChoiceID = inQCChoiceID;
	IF varQCQuestionID IS NULL THEN
		SELECT 0;
		LEAVE Main;
	END IF;
	SELECT QCAnswerID INTO varQCAnswerID
	FROM QCAnswers LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
	WHERE QCSessionID = inQCSessionID AND QCQuestionID = varQCQuestionID;
	IF varQCAnswerID IS NOT NULL THEN
		SELECT 0;
		LEAVE Main;
	END IF;
	INSERT INTO QCAnswers (QCSessionID, QCChoiceID, DBSyncID) VALUES (inQCSessionID, inQCChoiceID, inDBSyncID);
	SELECT 1;
	LEAVE Main;
ELSE
	INSERT INTO QCAnswers (QCSessionID, QCChoiceID, DBSyncID) VALUES (inQCSessionID, inQCChoiceID, inDBSyncID);
	SELECT 1;
	LEAVE Main;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cloneSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `cloneSequence`(IN inSequenceID INT, IN inSequenceName VARCHAR(255))
Main : BEGIN

DECLARE varSequenceID INT;
DECLARE varModalityID INT;
DECLARE varOModalityID INT;

SELECT ModalityID INTO varOModalityID FROM Sequences WHERE SequenceID = inSequenceID;
IF varOModalityID IS NULL THEN
	SELECT 0; LEAVE Main;
END IF;

SELECT SequenceID, ModalityID INTO varSequenceID, varModalityID FROM Sequences WHERE SequenceName = inSequenceName;

IF varSequenceID IS NULL THEN
	INSERT INTO Sequences (ModalityID, SequenceName) VALUES (varOModalityID, inSequenceName);
	SELECT LAST_INSERT_ID() INTO varSequenceID;
ELSE
	IF varModalityID <> varOModalityID THEN
		SELECT 0; LEAVE Main;
	END IF;
	IF varSequenceID = inSequenceID THEN
		SELECT 0; LEAVE Main;
	END IF;
END IF;

INSERT INTO ParameterStandards (SequenceID, QCQuestionID, ValueRegex) SELECT varSequenceID, QCQuestionID, ValueRegex FROM ParameterStandards WHERE SequenceID = inSequenceID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createTrainingSet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `createTrainingSet`(IN inPeopleID INT)
Main : BEGIN

DECLARE varPeopleID INT;
DECLARE varPeopleName VARCHAR(255);
DECLARE varStudyID INT;

SELECT people_id INTO varPeopleID FROM membership.people WHERE people_id = inPeopleID;

IF varPeopleID IS NULL THEN
	SELECT 0; LEAVE Main;
END IF;

SELECT CONCAT(first_name, ' ', SUBSTR(last_name, 1, 1)) INTO varPeopleName FROM membership.people WHERE people_id = inPeopleID;

SELECT Studies.StudyID INTO varStudyID FROM Studies LEFT JOIN StudyPeople ON Studies.StudyID = StudyPeople.StudyID WHERE Studies.StudyNickName = 'CNS Training' AND StudyPeople.PeopleRoleID = 3 AND StudyPeople.PeopleID = inPeopleID;
IF varStudyID IS NULL THEN
	INSERT INTO Studies (NetworkID, StudyName, StudyNickName, PeopleID) VALUES (2, CONCAT('CNS_Training (', varPeopleName, ')'), 'CNS Training', inPeopleID);
	SELECT LAST_INSERT_ID() INTO varStudyID;
	INSERT INTO StudyPeople (StudyID, PeopleID, PeopleRoleID) VALUES (varStudyID, inPeopleID, 3);
END IF;

INSERT INTO StudySubjects (StudyID, SubjectID, SubjectName)
SELECT DISTINCT varStudyID, QCAnswerInfo.SubjectID, QCAnswerInfo.SubjectName 
FROM QCAnswerInfo LEFT JOIN (SELECT SubjectID FROM StudySubjects WHERE StudyID = varStudyID) AS AlreadyIn ON QCAnswerInfo.SubjectID = AlreadyIn.SubjectID
WHERE AlreadyIn.SubjectID IS NULL AND AlertFlag = 1 AND OverallFlag = 0 AND HumanFlag = 1 AND NetworkID = 2;

INSERT INTO StudyImages (StudySubjectID, ImageID)
SELECT DISTINCT StudySubjects.StudySubjectID, StudyImageInfo.ImageID
FROM StudyImageInfo 
INNER JOIN StudySubjects ON StudyImageInfo.SubjectID = StudySubjects.SubjectID
LEFT JOIN (SELECT ImageID FROM StudyImages LEFT JOIN StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID WHERE StudySubjects.StudyID = varStudyID) AS AlreadyIn ON StudyImageInfo.ImageID = AlreadyIn.ImageID
WHERE StudySubjects.StudyID = varStudyID AND AlreadyIn.ImageID IS NULL AND (StudyImageInfo.ModalityID = 2 OR StudyImageInfo.ModalityID = 3 OR StudyImageInfo.ModalityID = 4);

INSERT INTO QCSessions (StudyImageID)
SELECT DISTINCT StudyImageInfo.StudyImageID
FROM StudyImageInfo
LEFT JOIN (SELECT StudyImageID FROM QCSessionInfo WHERE StudyID = varStudyID) AS AlreadyIn ON StudyImageInfo.StudyImageID = AlreadyIn.StudyImageID
WHERE StudyImageInfo.StudyID = varStudyID AND AlreadyIn.StudyImageID IS NULL AND (StudyImageInfo.ModalityID = 2 OR StudyImageInfo.ModalityID = 3 OR StudyImageInfo.ModalityID = 4);

DELETE QCAnswers FROM QCAnswers LEFT JOIN QCAnswerInfo ON QCAnswers.QCAnswerID = QCAnswerInfo.QCAnswerID WHERE StudyID = varStudyID;

INSERT INTO QCAnswers (QCSessionID, NumericData, TextData, QCChoiceID, BrainRegionID, Laterality, BrainRegionDirection, VolumeNumber, XCoord, YCoord, ZCoord, Comments)
SELECT QCSessionInfo.QCSessionID, NumericData, TextData, QCChoiceID, BrainRegionID, Laterality, BrainRegionDirection, VolumeNumber, XCoord, YCoord, ZCoord, QCAnswerInfo.Comments
FROM 
(SELECT * FROM QCSessionInfo WHERE StudyID = varStudyID) AS QCSessionInfo
INNER JOIN (SELECT * FROM QCAnswerInfo WHERE StudyNickName <> 'CNS Training' OR StudyNickName IS NULL AND HumanFlag = 0) AS QCAnswerInfo ON QCSessionInfo.ImageID = QCAnswerInfo.ImageID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `forkStudyImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `forkStudyImage`(IN inStudyImageID INT, IN inSubjectName VARCHAR(255), IN inStudyID INT)
Main: BEGIN

DECLARE varSubjectID INT;
DECLARE varStudySubjectIDByID INT;
DECLARE varStudySubjectIDByName INT;
DECLARE varSubjectRegex VARCHAR(255);
DECLARE varImageID INT;
DECLARE varStudyImageID INT;

SELECT SubjectRegex INTO varSubjectRegex FROM Studies WHERE StudyID = inStudyID;
IF varSubjectRegex IS NULL THEN
	SELECT 0; LEAVE Main;
END IF;
IF inSubjectName NOT REGEXP BINARY varSubjectRegex THEN
	SELECT -1; LEAVE Main;
END IF;

SELECT SubjectID INTO varSubjectID FROM StudyImageInfo WHERE StudyImageID = inStudyImageID;
IF varSubjectID IS NULL THEN
	SELECT -2; LEAVE Main;
END IF;

SELECT ImageID INTO varImageID FROM StudyImages WHERE StudyImageID = inStudyImageID;
IF varImageID IS NULL THEN
	SELECT -3; LEAVE Main;
END IF;

SELECT StudySubjectID INTO varStudySubjectIDByID FROM StudySubjects WHERE StudyID = inStudyID AND SubjectID = varSubjectID;
SELECT StudySubjectID INTO varStudySubjectIDByName FROM StudySubjects WHERE StudyID = inStudyID AND SubjectName = inSubjectName;

IF varStudySubjectIDByID IS NULL AND varStudySubjectIDByName IS NULL THEN
	INSERT INTO StudySubjects (StudyID, SubjectID, SubjectName) VALUES (inStudyID, varSubjectID, inSubjectName);
	SELECT LAST_INSERT_ID() INTO varStudySubjectIDByID;
ELSEIF varStudySubjectIDByID <> varStudySubjectIDByName THEN
	SELECT -4; LEAVE Main;
END IF;

SELECT StudyImageID INTO varStudyImageID FROM StudyImages WHERE ImageID = varImageID AND StudySubjectID = varStudySubjectIDByID;
IF varStudyImageID IS NULL THEN
	INSERT INTO StudyImages (ImageID, StudySubjectID) VALUES (varImageID, varStudySubjectIDByID);
	SELECT LAST_INSERT_ID(); LEAVE Main;
ELSE
	SELECT varStudyImageID;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FSLONIReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `FSLONIReport`()
BEGIN

SELECT ScanSessions.ScanSessionID, SubjectName, ScanDate, StudyID, StudyName, DTIStatus.QCChoiceName AS LONIStatus, AnatStatus.QCChoiceName AS FreeSurferStatus, DTIPostQC.QCChoiceName AS DTIPostQC, AnatPostQC.QCChoiceName AS AnatPostQC, DTIImages.StudyImageID AS DTIStudyImageID, AnatImages.StudyImageID AS AnatStudyImageID, DTIQC.QCChoiceName AS DTIQC, AnatQC.QCChoiceName AS AnatQC
FROM (SELECT DISTINCT SubjectName, ScanDate, ScanSessionID, StudyID, StudyName FROM StudyImageInfo WHERE SiteID = 12) AS ScanSessions
LEFT JOIN (SELECT QCChoiceID, QCChoiceName, ScanSessionID FROM QCAnswerInfo WHERE QCQuestionID = 85) AS DTIStatus ON ScanSessions.ScanSessionID = DTIStatus.ScanSessionID
LEFT JOIN (SELECT QCChoiceID, QCChoiceName, ScanSessionID FROM QCAnswerInfo WHERE QCQUestionID = 158) AS AnatStatus ON ScanSessions.ScanSessionID = AnatStatus.ScanSessionID
LEFT JOIN (SELECT QCChoiceID, QCChoiceName, ScanSessionID FROM QCAnswerInfo WHERE QCQuestionID = 74) AS DTIPostQC ON ScanSessions.ScanSessionID = DTIPostQC.ScanSessionID
LEFT JOIN (SELECT QCChoiceID, QCChoiceName, ScanSessionID FROM QCAnswerInfo WHERE QCQUestionID = 75) AS AnatPostQC ON ScanSessions.ScanSessionID = AnatPostQC.ScanSessionID
LEFT JOIN (SELECT StudyImageID, ScanSessionID FROM StudyImageInfo WHERE ModalityID = 4) AS DTIImages ON ScanSessions.ScanSessionID = DTIImages.ScanSessionID
LEFT JOIN (SELECT StudyImageID, ScanSessionID FROM StudyImageInfo WHERE ModalityID = 2) AS AnatImages ON ScanSessions.ScanSessionID = AnatImages.ScanSessionID
LEFT JOIN (SELECT StudyImageID, QCChoiceName FROM QCAnswerInfo WHERE OverallFlag = 1) AS DTIQC ON DTIImages.StudyImageID = DTIQC.StudyImageID
LEFT JOIN (SELECT StudyImageID, QCChoiceName FROM QCAnswerInfo WHERE OverallFlag = 1) AS AnatQC ON AnatImages.StudyImageId = AnatQC.StudyImageID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GATHERScanSessionsByStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GATHERScanSessionsByStudy`(IN study_id INT(11))
BEGIN
	SELECT SubjectName, ScanSessionInfo.*
	FROM ScanSessionInfo
		LEFT JOIN StudySubjects ON ScanSessionInfo.SubjectID = StudySubjects.SubjectID
	WHERE StudyID = study_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETAddableQuestionsByQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETAddableQuestionsByQCSession`(IN qc_session_id INT(11))
BEGIN
	DECLARE modality_id INT;

	SELECT ModalityID INTO modality_id FROM QCSessions LEFT JOIN Images ON QCSessions.ImageID = Images.ImageID LEFT JOIN Sequences ON Images.SequenceID = Sequences.SequenceID WHERE QCSessionID = qc_session_id;

	SELECT QCQuestions.QCQuestionID, QCQuestionName, QCQuestionDescription, IF (RequiredFlag, 'REQUIRED', '') AS IsRequired, IF (UniqueFlag, 'UNIQUE', '') AS IsUnique
	FROM QCQuestions
		LEFT JOIN
			(SELECT DISTINCT QCQuestionID
			FROM QCAnswers
				LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
			WHERE QCSessionID = qc_session_id)
			AS AddedMeasures
			ON QCQuestions.QCQuestionID = AddedMeasures.QCQuestionID
	WHERE ModalityID = modality_id
		AND HumanFlag
		AND (NOT UniqueFlag OR (UniqueFlag AND AddedMeasures.QCQuestionID IS NULL))
	ORDER BY IsRequired, QCQuestions.QCQuestionID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETAddedQuestionsByQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETAddedQuestionsByQCSession`(IN qc_session_id INT(11))
BEGIN

	SELECT QCAnswerID, QCQuestionName, UniqueFlag, OverallFlag, NumericData, TextData, QCChoiceName, BrainRegionName, 
		CASE Laterality
			WHEN -1 THEN 'LEFT'
			WHEN 1 THEN 'RIGHT'
			ELSE ''
		END AS Side,
		CASE BrainRegionDirection
			WHEN -3 THEN 'POSTERIOR'
			WHEN -2 THEN 'INFERIOR'
			WHEN -1 THEN 'MEDIAL'
			WHEN 1 THEN 'LATERAL'
			WHEN 2 THEN 'SUPERIOR'
			WHEN 3 THEN 'ANTERIOR'
			ELSE ''
		END AS Direction, 
		XCoord, 
		YCoord, 
		ZCoord, 
		VolumeNumber
	FROM QCAnswers
		LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
		LEFT JOIN BrainRegions ON QCAnswers.BrainRegionID = BrainRegions.BrainRegionID
	WHERE QCSessionID = qc_session_id;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETAllNotifications` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETAllNotifications`()
BEGIN

	DECLARE varNotificationID INT;
	DECLARE varItemTypeID INT;
	DECLARE varAlertCount INT;
	DECLARE varUploadID INT;
	DECLARE varEndLoop BOOL DEFAULT FALSE;
	DECLARE varCursor CURSOR FOR 
		SELECT NotificationID, ItemTypeID
		FROM Hub.Notifications 
			LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID
		WHERE UploadID IS NOT NULL
			AND ResolvedFlag = 0;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET varEndLoop = TRUE;

	OPEN varCursor;
	NotificationLoop : LOOP
		FETCH varCursor INTO varNotificationID, varItemTypeID;
		IF varEndLoop THEN
			LEAVE NotificationLoop;
		END IF;
		SELECT UploadID INTO varUploadID FROM Hub.Notifications WHERE NotificationID = varNotificationID;
		CASE varItemTypeID
			WHEN 1 THEN
				SELECT COUNT(FileID) INTO varAlertCount FROM Quarantine.Files LEFT JOIN Quarantine.Directories ON Quarantine.Files.DirectoryID = Quarantine.Directories.DirectoryID WHERE Quarantine.Directories.UploadID = varUploadID;
				IF varAlertCount = 0 THEN
					UPDATE Hub.Notifications SET AlertFlag = 0 WHERE NotificationID = varNotificationID;
				ELSE
					UPDATE Hub.Notifications SET AlertFlag = 1 WHERE NotificationID = varNotificationID;
				END IF;
			WHEN 2 THEN
				SELECT COUNT(ParameterID) INTO varAlertCount FROM Quarantine.Parameters WHERE NotificationID = varNotificationID;
				IF varAlertCount = 0 THEN
					UPDATE Hub.Notifications SET AlertFlag = 0 WHERE NotificationID = varNotificationID;
				ELSE
					UPDATE Hub.Notifications SET AlertFlag = 1 WHERE NotificationID = varNotificationID;
				END IF;
		END CASE;
	END LOOP;
	SELECT NotificationID, ItemTypeID, AlertFlag, NotificationDescription
	FROM Hub.Notifications
		LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID
	WHERE UploadID IS NOT NULL
		AND ResolvedFlag = 0
		AND AlertFlag = 1;
	CLOSE varCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAnatomicalsByStudyImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getAnatomicalsByStudyImage`(IN inStudyImageID INT)
BEGIN

DECLARE varSubjectID INT;
SELECT SubjectID INTO varSubjectID FROM StudyImageInfo WHERE StudyImageID = inStudyImageID;

SELECT StudyImageID, CONCAT(SubjectName, ' - ', ScanDate, ' : ', SequenceName, ' (', SequenceNumber, ')') AS ImageDescription
FROM StudyImageInfo
WHERE SubjectID = varSubjectID AND ModalityID = 2;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAutoAddedQCAnswersByQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getAutoAddedQCAnswersByQCSession`(IN inQCSessionID INT)
BEGIN

DECLARE varSequenceID INT;

SELECT SequenceID INTO varSequenceID FROM QCSessionInfo WHERE QCSessionID = inQCSessionID;

SELECT
	QCAnswers.QCAnswerID, 
	QCChoices.QCChoiceID, 
	QCQuestions.QCQuestionName, 
	REPLACE(IF(QCQuestions.NumericFlag, QCAnswers.NumericData, QCAnswers.TextData), '\\', '\\ ') AS ResultData, 
	QCChoices.QCChoiceName, 
	#ParameterStandardsOfSequence.ValueRegex AS Standard, 
	QCChoices.AlertFlag
FROM
	QCAnswers
	LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
	LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
	LEFT JOIN (
		SELECT QCQuestionID, ValueRegex FROM ParameterStandards WHERE SequenceID = varSequenceID)
		AS ParameterStandardsOfSequence
		ON QCChoices.QCQuestionID = ParameterStandardsOfSequence.QCQuestionID
WHERE
	QCAnswers.QCSessionID = inQCSessionID
	AND QCQuestions.HumanFlag = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAvailableQCQuestionsByQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getAvailableQCQuestionsByQCSession`(IN inQCSessionID INT)
BEGIN

SELECT
		QCQuestions.QCQuestionID, 
		QCQuestions.QCQuestionName, 
		QCQuestions.QCQuestionDescription, 
		QCQuestions.RequiredFlag, 
		QCQuestions.UniqueFlag
	FROM
		QCQuestions
		LEFT JOIN
			(SELECT DISTINCT
				QCChoices.QCQuestionID
			FROM
				QCAnswers
				LEFT JOIN
					QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
			WHERE
				QCAnswers.QCSessionID = inQCSessionID
			) AS AddedMeasures ON QCQuestions.QCQuestionID = AddedMeasures.QCQuestionID
		INNER JOIN
			(SELECT
				Sequences.ModalityID
			FROM
				QCSessions
				LEFT JOIN
					StudyImages ON QCSessions.StudyImageID = StudyImages.StudyImageID
				LEFT JOIN
					Images ON StudyImages.ImageID = Images.ImageID
				LEFT JOIN
					Sequences ON Images.SequenceID = Sequences.SequenceID
			WHERE
				QCSessions.QCSessionID = inQCSessionID
			) AS ModalityMatch ON QCQuestions.ModalityID = ModalityMatch.ModalityID
	WHERE
		QCQuestions.HumanFlag = 1
		AND (QCQuestions.UniqueFlag = 0 OR (QCQuestions.UniqueFlag = 1 AND AddedMeasures.QCQuestionID IS NULL))
	ORDER BY
		RequiredFlag DESC, QCQuestions.QCQuestionID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAvailableStudyRolesByStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getAvailableStudyRolesByStudySubject`(IN inStudySubjectID INT)
BEGIN

DECLARE varStudyID INT;

SELECT StudyID INTO varStudyID FROM StudySubjects WHERE StudySubjectID = inStudySubjectID;

SELECT NULL AS StudyRoleID, NULL AS StudyRoleName
UNION
SELECT
	StudyRoles.StudyRoleID, StudyRoles.StudyRoleName
FROM
	(SELECT
		StudyImageID, StudyRoleID
	FROM
		StudyImages
	WHERE
		StudySubjectID = inStudySubjectID) AS StudyImagesBySubject
	RIGHT JOIN
		StudyRoles ON StudyImagesBySubject.StudyRoleID = StudyRoles.StudyRoleID
WHERE
	StudyImagesBySubject.StudyImageID IS NULL
	AND StudyID = varStudyID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAvailableVisitsByStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getAvailableVisitsByStudySubject`(IN inStudySubject INT)
BEGIN

SELECT
	NULL AS VisitID, NULL AS VisitName
UNION
SELECT
	Visits.VisitID, Visits.VisitName
FROM
	(SELECT
		ScanSessions.ScanSessionID, VisitID
	FROM
		StudyImages
		LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
		LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
	WHERE
		StudyImages.StudySubjectID = inStudySubject) AS ScanSessionsBySubject
	RIGHT JOIN
		Visits ON ScanSessionsBySubject.VisitID = Visits.VisitID
WHERE ScanSessionsBySubject.ScanSessionID IS NULL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETChoicesByQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETChoicesByQuestion`(IN qc_question_id INT(11))
BEGIN
	SELECT *
	FROM QCChoiceInfo
	WHERE QCQuestionID = qc_question_id
	ORDER BY QCChoiceOrder, QCChoiceID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETDicomMeasuresByModality` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETDicomMeasuresByModality`(IN modality_id INT(3))
BEGIN
	SELECT CONCAT(SUBSTRING(QCQuestionDescription, 8, 4), SUBSTRING(QCQuestionDescription, 13, 4)) AS DicomIndex, QCQuestionName AS DicomName, QCChoiceID AS DBInputID
	FROM QCChoices
		LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
	WHERE DICOMFlag = 1 AND ModalityID = modality_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETDICOMQuarantineCorrections` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` PROCEDURE `GETDICOMQuarantineCorrections`(IN series_uid VARCHAR(255))
BEGIN
	SELECT CONCAT('(',SUBSTRING(DICOMFieldIndex,1,4),',',SUBSTRING(DICOMFieldIndex,5),')=',CorrectedValue) AS DCModify FROM QuarantineCorrections WHERE SeriesUID = series_uid AND CorrectedValue IS NOT NULL AND DICOMFieldIndex <> 0 AND PostQuarantine = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETEditablesByItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETEditablesByItem`(IN varItemID INT)
BEGIN

DECLARE varDataKey VARCHAR(8);
SELECT DataKey INTO varDataKey FROM Quarantine.Parameters WHERE Quarantine.Parameters.ParameterID = varItemID;

CASE varDataKey
	WHEN '0008103e' THEN
		SELECT SequenceName AS NewValue FROM ImagingRepositoryV6.Sequences;
	WHEN '00081030' THEN
		SELECT ProtocolName AS NewValue FROM ImagingRepositoryV6.Protocols;
END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getHumanAddedQCAnswersByQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getHumanAddedQCAnswersByQCSession`(IN inQCSessionID INT)
BEGIN

	SELECT
		QCAnswers.QCAnswerID, 
		QCChoices.QCChoiceID, 
		QCChoices.QCQuestionID, 
		QCQuestions.QCQuestionName, 
		QCQuestions.OverallFlag, 
		QCQuestions.UniqueFlag, 
		IF(QCQuestions.NumericFlag, QCAnswers.NumericData, IF(QCQuestions.TextFlag, QCAnswers.TextData, ''))
			AS Info,
		QCChoices.QCChoiceName AS Result, 
		BrainRegions.BrainRegionName, 
		QCChoices.AlertFlag
	FROM
		QCAnswers
		LEFT JOIN
			QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
		LEFT JOIN
			QCQuestions 
				ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
		LEFT JOIN
			BrainRegions ON QCAnswers.BrainRegionID = BrainRegions.BrainRegionID
		LEFT JOIN
			Atlases ON BrainRegions.AtlasID = Atlases.AtlasID
	WHERE
		QCAnswers.QCSessionID = inQCSessionID
		AND QCQuestions.HumanFlag = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getImageIDsByScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getImageIDsByScanSession`(IN inScanSessionID INT)
BEGIN

SELECT
	ImageID, ModalityID
FROM
	ImageInfo
WHERE
	ScanSessionID = inScanSessionID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETImagesByScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETImagesByScanSession`(IN scan_session_id INT(11))
BEGIN
	SELECT *
	FROM ImageInfo
	WHERE ScanSessionID = scan_session_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETImagesBySequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETImagesBySequence`(IN sequence_id INT(11))
BEGIN
	SELECT *
	FROM ImageInfo
	WHERE SequenceID = sequence_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETImagesByStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETImagesByStudy`(IN study_id INT(11))
BEGIN
	SELECT *
	FROM StudyImageInfo
	WHERE StudyID = study_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETItemsByNotification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETItemsByNotification`(IN varNotificationID INT)
BEGIN

DECLARE varItemTypeID INT;
DECLARE varUploadID INT;

SELECT UploadID INTO varUploadID FROM Hub.Notifications WHERE NotificationID = varNotificationID;

SELECT ItemTypeID INTO varItemTypeID FROM Hub.Notifications LEFT JOIN Hub.NotificationTypes ON Hub.Notifications.NotificationTypeID = Hub.NotificationTypes.NotificationTypeID WHERE Hub.Notifications.NotificationID = varNotificationID;

CASE varItemTypeID
	WHEN 1 THEN
		SELECT FileStatuses.FileStatus AS ItemID, FileStatusDescription AS 'Property', CONCAT(CAST(COUNT(FileID) AS CHAR), ' Files') AS 'Value'
		FROM Quarantine.Files 
			LEFT JOIN Quarantine.FileStatuses ON Quarantine.Files.FileStatus = Quarantine.FileStatuses.FileStatus 
			LEFT JOIN Quarantine.Directories ON Quarantine.Files.DirectoryID = Quarantine.Directories.DirectoryID
		WHERE Quarantine.Directories.UploadID = varUploadID
			AND (FileStatuses.FileStatus = -1) OR (FileStatuses.FileStatus = -2)
		GROUP BY Quarantine.Directories.UploadID, Quarantine.FileStatuses.FileStatus;
	WHEN 2 THEN
		SELECT ParameterID AS ItemID, KeyDisplay AS 'Property', DataValue AS 'Value'
		FROM Quarantine.Parameters
			LEFT JOIN Quarantine.DataKeys ON Quarantine.Parameters.DataKey = Quarantine.DataKeys.DataKey
		WHERE NotificationID = varNotificationID;
END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMoreQCInfoByQCAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getMoreQCInfoByQCAnswer`(IN inQCAnswerID INT)
BEGIN

SELECT 
	QCAnswerID, 
	UniqueFlag, 
	IF(
		QCAnswerInfo.Laterality = -1, 
		'LEFT', 
		IF(
			QCAnswerInfo.Laterality = 1, 
			'RIGHT', 
			''))
		AS Side, 
	IF(
		QCAnswerInfo.BrainRegionDirection = -3, 
		'POSTERIOR', 
		IF(
			QCAnswerInfo.BrainRegionDirection = -2, 
			'INFERIOR', 
			IF(
				QCAnswerInfo.BrainRegionDirection = -1, 
				'MEDIAL', 
				IF(
					QCAnswerInfo.BrainRegionDirection = 1, 
					'LATERAL', 
					IF(
						QCAnswerInfo.BrainRegionDirection = 2, 
						'SUPERIOR', 
						IF(
							QCAnswerInfo.BrainRegionDirection = 3, 
							'ANTERIOR', 
							''))))))
		AS Direction, 
	QCAnswerInfo.XCoord, 
	QCAnswerInfo.YCoord,
	QCAnswerInfo.ZCoord, 
	QCAnswerInfo.VolumeNumber, 
	QCAnswerInfo.Comments
FROM
	QCAnswerInfo
WHERE
	QCAnswerID = inQCAnswerID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETNetworkInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETNetworkInfo`(IN network_id INT(11))
BEGIN
	SELECT NetworkName FROM Networks WHERE NetworkID = network_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProjectReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getProjectReport`(IN inProjectID INT)
Main : BEGIN
	DECLARE miniSQL TEXT;
	SET  SESSION group_concat_max_len = 1000000;
	SELECT
		GROUP_CONCAT('GROUP_CONCAT(CASE ProjectColumnID WHEN ', ProjectColumnID, ' THEN IF(CrossProjectInfoToImages.StudyImageID IS NULL, NULL, IF(QCAnswerID IS NULL, "Not Documented", QCChoiceName)) ELSE NULL END) AS ', REPLACE(ProjectColumnName, ' ', '_')) AS CommandString
		INTO @miniSQL
	FROM
		ProjectColumns
	WHERE
		ProjectID = inProjectID;
	#SELECT @miniSQL; LEAVE Main;
	IF @miniSQL IS NULL THEN
		SET @miniSQL = CONCAT(
			'SELECT
				ProjectRowID, 
				ProjectRowName
			FROM
				CrossProjectInfoToImages
				LEFT JOIN (SELECT * FROM QCAnswerInfoQCChoicesBrainRegions WHERE QCReportID = 1) AS QCAnswersOverall ON CrossProjectInfoToImages.QCSessionID = QCAnswersOverall.QCSessionID
			WHERE
				ProjectID =', CAST(inProjectID AS CHAR), '
			GROUP BY
				ProjectRowID'
		);
	ELSE
		SET @miniSQL = CONCAT(
			'SELECT
				ProjectRowID, 
				ProjectRowName, ', 
				@miniSQL, '
			FROM
				CrossProjectInfoToImages
				LEFT JOIN (SELECT * FROM QCAnswerInfoQCChoicesBrainRegions WHERE QCReportID = 1) AS QCAnswersOverall ON CrossProjectInfoToImages.QCSessionID = QCAnswersOverall.QCSessionID
			WHERE
				ProjectID =', CAST(inProjectID AS CHAR), '
			GROUP BY
				ProjectRowID'
		);
	END IF;
	#SELECT @miniSQL; LEAVE Main;
	PREPARE stmt FROM @miniSQL;
	EXECUTE stmt;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getProjects`()
BEGIN
	SELECT ProjectID, ProjectName FROM Projects;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProjectsByPeople` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getProjectsByPeople`(IN inPeopleID INT(11))
BEGIN
	SELECT 
		Projects.ProjectID, 
		Projects.ProjectName, 
		Projects.ProjectTypeID, 
		ProjectTypes.ProjectTypeName, 
		IF(
			ISNULL(GroupedProjectRows.ProjectRowCount), 
			0, 
			GroupedProjectRows.ProjectRowCount) AS ProjectRowCount
	FROM 
		Projects
			LEFT JOIN ProjectPeople ON Projects.ProjectID = ProjectPeople.ProjectID
			LEFT JOIN ProjectTypes ON Projects.ProjectTypeID = ProjectTypes.ProjectTypeID
			LEFT JOIN
				(SELECT
					ProjectRows.ProjectID, 
					COUNT(ProjectRowID) AS ProjectRowCount
				FROM
					ProjectRows
				GROUP BY ProjectID
				) AS GroupedProjectRows ON Projects.ProjectID = GroupedProjectRows.ProjectID
	WHERE 
		ProjectPeople.PeopleID = inPeopleID;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQCAnswerByStudyImageQCQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getQCAnswerByStudyImageQCQuestion`(IN inStudyImageID INT, IN inQCQuestionID INT)
BEGIN

SELECT
	QCAnswerID, QCChoiceID
FROM
	QCAnswerInfo
WHERE
	StudyImageID = inStudyImageID AND QCQuestionID = inQCQuestionID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQCAnswerInfoByStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getQCAnswerInfoByStudy`(IN inStudyID INT)
BEGIN

SELECT 
	QCAnswerID, 
	SubjectName, 
	ScanDate, 
	SequenceName, 
	ModalityName, 
	NumericData, 
	TextData, 
	QCChoiceName, 
	QCQuestionName
FROM
	QCAnswerInfo
WHERE
	StudyID = inStudyID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETQCAnswersByImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETQCAnswersByImage`(IN image_id INT(11))
BEGIN
	SELECT *
	FROM QCAnswerInfo
	WHERE ImageID = image_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETQCAnswersByProtocol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETQCAnswersByProtocol`(IN protocol_id INT(11))
BEGIN
	SELECT *
	FROM QCAnswerInfo
	WHERE ProtocolID = protocol_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETQCAnswersByQCChoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETQCAnswersByQCChoice`(IN qc_choice_id INT(11))
BEGIN
	SELECT *
	FROM QCAnswerInfo
	WHERE QCChoiceID = qc_choice_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETQCAnswersByQCQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETQCAnswersByQCQuestion`(IN qc_question_id INT(11))
BEGIN
	SELECT *
	FROM QCAnswerInfo
	WHERE QCQuestionID = qc_question_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETQCAnswersByQCSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETQCAnswersByQCSession`(IN qc_session_id INT(11))
BEGIN
	SELECT *
	FROM QCAnswerInfo
	WHERE QCSessionID = qc_session_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQCAnswersByReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getQCAnswersByReport`(in inQCReportID INT)
BEGIN

SELECT * FROM QCAnswerInfo WHERE QCReportID = inQCReportID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETQCAnswersByScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETQCAnswersByScanSession`(IN scan_session_id INT(11))
BEGIN
	SELECT *
	FROM QCAnswerInfo
	WHERE ScanSessionID = scan_session_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETQCAnswersBySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETQCAnswersBySubject`(IN subject_id INT(11))
BEGIN
	SELECT *
	FROM QCAnswerInfo
	WHERE SubjectID = subject_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQCSessionInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getQCSessionInfo`(IN inQCSessionID INT)
BEGIN

SELECT
	QCSessions.QCSessionID, 
	StudyImages.StudyImageID, 
	Images.ImageID, 
	StudySubjects.SubjectName, 
	ScanSessions.ScanDate, 
	Sequences.SequenceName, 
	Images.SequenceNumber, 
	QCSessions.FinalizedDate
FROM
	QCSessions
	LEFT JOIN StudyImages ON QCSessions.StudyImageID = StudyImages.StudyImageID
	LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
	LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
	LEFT JOIN Sequences ON Images.SequenceID = Sequences.SequenceID
	LEFT JOIN StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
WHERE QCSessions.QCSessionID = inQCSessionID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETQCSessionsByImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETQCSessionsByImage`(IN image_id INT(11))
BEGIN
	SELECT *
	FROM QCSessionInfo
	WHERE ImageID = image_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQCSessionsByStudyAndScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getQCSessionsByStudyAndScanSession`(IN varStudyID INT, IN varScanSessionID INT)
BEGIN

SELECT
	StudyImageID, 
	QCSessionInfo.QCSessionID, 
	SubjectName,
	ScanDate, 
	VisitName,
	SequenceNumber, 
	SequenceName, 
	ModalityName, 
	StudyRoleName, 
	QCChoiceName
FROM
	QCSessionInfo
	LEFT JOIN 
	(SELECT * FROM QCAnswerInfoQCChoicesBrainRegions WHERE QCReportID = 1) AS QCAnswersOverall ON QCSessionInfo.QCSessionID = QCAnswersOverall.QCSessionID
WHERE
	StudyID = varStudyID
	AND ScanSessionID = varScanSessionID
ORDER BY
	SequenceNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQCSessionsByStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getQCSessionsByStudySubject`(IN inStudySubjectID INT)
BEGIN

SELECT
	StudyImageID, 
	QCSessionInfo.QCSessionID, 
	SubjectName,
	ScanDate, 
	VisitName,
	SequenceNumber, 
	SequenceName, 
	ModalityName, 
	StudyRoleName, 
	IF(ISNULL(QCChoiceName), 'Not Documented', QCChoiceName) AS QCChoiceName
FROM
	QCSessionInfo
	LEFT JOIN 
	(SELECT * FROM QCAnswerInfoQCChoicesBrainRegions WHERE QCReportID = 1) AS QCAnswersOverall ON QCSessionInfo.QCSessionID = QCAnswersOverall.QCSessionID
WHERE
	StudySubjectID = inStudySubjectID
ORDER BY
	ScanDate, SequenceNumber;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQualityReportByStudyUpload` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getQualityReportByStudyUpload`(IN inStudyID INT)
Main : BEGIN
	DECLARE miniSQL TEXT;
	SET  SESSION group_concat_max_len = 1000000;
	SELECT
		GROUP_CONCAT('GROUP_CONCAT(CASE StudyRoleID WHEN ', StudyRoleID, ' THEN IF(SubjectRolesCrossStudyToQCSessions.StudyImageID IS NULL, NULL, IF(QCAnswerID IS NULL, "Not Documented", QCChoiceName)) ELSE NULL END) AS ', REPLACE(StudyRoleName, ' ', '_')) AS CommandString
		INTO @miniSQL
	FROM
		StudyRoles
	WHERE
		StudyID = inStudyID;
	#SELECT @miniSQL; LEAVE Main;
	IF @miniSQL IS NULL THEN
		SET @miniSQL = CONCAT(
			'SELECT
				StudySubjectID, 
				SubjectName, 
				UploadID, 
				UploadTime, 
				SiteID, 
				SiteAcronym, 
				IF(ISNULL(UnassignedCount), 0, UnassignedCount) AS UnassignedCount
			FROM
				SubjectRolesCrossStudyToQCSessions
				INNER JOIN Quarantine.StudyImageUploads ON SubjectRolesCrossStudyToQCSessions.StudyImageID = StudyImageUploads.StudyImageID
				LEFT JOIN (SELECT StudySubjectID AS UStudySubjectID, COUNT(StudyImageID) AS UnassignedCount FROM StudyImages WHERE StudyRoleID IS NULL GROUP BY UStudySubjectID) AS Unassigned ON SubjectRolesCrossStudyToQCSessions.StudySubjectID = Unassigned.UStudySubjectID
				LEFT JOIN (SELECT * FROM QCAnswerInfoQCChoicesBrainRegions WHERE QCReportID = 1) AS QCAnswersOverall ON SubjectRolesCrossStudyToQCSessions.QCSessionID = QCAnswersOverall.QCSessionID
			WHERE
				StudyID =', CAST(inStudyID AS CHAR), '
			GROUP BY
				StudySubjectID, 
				UploadID, 
				UnassignedCount'
		);
	ELSE
		SET @miniSQL = CONCAT(
			'SELECT
				StudySubjectID, 
				SubjectName, 
				UploadID, 
				UploadTime, 
				SiteID, 
				SiteAcronym, 
				IF(ISNULL(UnassignedCount), 0, UnassignedCount) AS UnassignedCount, ', 
				@miniSQL, '
			FROM
				SubjectRolesCrossStudyToQCSessions
				INNER JOIN Quarantine.StudyImageUploads ON SubjectRolesCrossStudyToQCSessions.StudyImageID = StudyImageUploads.StudyImageID
				LEFT JOIN (SELECT StudySubjectID AS UStudySubjectID, COUNT(StudyImageID) AS UnassignedCount FROM StudyImages WHERE StudyRoleID IS NULL GROUP BY UStudySubjectID) AS Unassigned ON SubjectRolesCrossStudyToQCSessions.StudySubjectID = Unassigned.UStudySubjectID
				LEFT JOIN (SELECT * FROM QCAnswerInfoQCChoicesBrainRegions WHERE QCReportID = 1) AS QCAnswersOverall ON SubjectRolesCrossStudyToQCSessions.QCSessionID = QCAnswersOverall.QCSessionID
			WHERE
				StudyID =', CAST(inStudyID AS CHAR), '
			GROUP BY
				StudySubjectID, 
				UploadID, 
				UnassignedCount'
		);
	END IF;
	#SELECT @miniSQL; LEAVE Main;
	PREPARE stmt FROM @miniSQL;
	EXECUTE stmt;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReportByStudySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getReportByStudySubject`(IN inStudySubjectID INT, IN inReportCriteriaID INT)
BEGIN

SELECT
	SubjectRoleReportCriteriaQCAnswers.StudyImageID, 
	QCSessionID, 
	SubjectName, 
	ScanDate, 
	VisitName, 
	SequenceName, 
	ModalityName, 
	StudyRoleName
	QCChoiceName
FROM
	SubjectRoleReportCriteriaQCAnswers
	LEFT JOIN StudyImages ON SubjectRoleReportCriteriaQCAnswers.StudyImageID = StudyImages.StudyImageID
	LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
	LEFT JOIN Sequences ON Images.SequenceID = Sequences.SequenceID
	LEFT JOIN Modalities ON Sequences.ModalityID = Modalities.ModalityID
	LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
	LEFT JOIN Visits ON ScanSessions.VisitID = Visits.VisitID
	LEFT JOIN QCSessions ON SubjectRoleReportCriteriaQCAnswers.StudyImageID = QCSessions.StudyImageID
WHERE
	SubjectRoleReportCriteriaQCAnswers.StudySubjectID = inStudySubjectID
	AND SubjectRoleReportCriteriaQCAnswers.StudyImageID IS NOT NULL
	AND SubjectRoleReportCriteriaQCAnswers.ReportCriteriaID = inReportCriteriaID
ORDER BY
	ScanDate, ModalityName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getScanSessionIDsByUpload` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getScanSessionIDsByUpload`(IN inUploadID INT)
BEGIN

SELECT 
	DISTINCT StudyImageInfo.ScanSessionID
FROM
	Quarantine.Files
	LEFT JOIN Quarantine.Directories ON Files.DirectoryID = Directories.DirectoryID
	INNER JOIN StudyImageInfo ON Files.StudyImageID = StudyImageInfo.StudyImageID
WHERE
	Directories.UploadID = inUploadID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getScanSessionInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getScanSessionInfo`(IN inScanSessionID INT, IN inStudyID INT)
BEGIN

	SELECT 
		ScanSessions.ScanSessionID, 
		StudySubjects.StudySubjectID, 
		StudySubjects.SubjectName, 
		ScanSessions.ScanDate, 
		Visits.VisitName, 
		COUNT(StudyImages.StudyImageID) AS ScanCount
	FROM 
		StudyImages
			LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
				LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
					LEFT JOIN Visits ON ScanSessions.VisitID = Visits.VisitID
			LEFT JOIN StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
	WHERE 
		StudySubjects.StudyID = inStudyID
		AND ScanSessions.ScanSessionID = inScanSessionID
	GROUP BY 
		ScanSessions.ScanSessionID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETScanSessionsByProtocol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETScanSessionsByProtocol`(IN ProtocolID INT(11))
BEGIN
	SELECT *
	FROM ScanSessionInfo
	WHERE ProtocolID = protocol_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETScanSessionsByStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETScanSessionsByStudy`(IN varStudyID INT)
BEGIN

SELECT 
	ScanSessions.ScanSessionID, 
	StudySubjects.StudySubjectID, 
	StudySubjects.SubjectName, 
	ScanSessions.ScanDate, 
	Visits.VisitName, 
	COUNT(StudyImages.StudyImageID) AS ScanCount, 
	CONCAT('<a class=\'anatImg\', href=\'Resources/BrainImages/', CAST(ScanSessions.ScanSessionID AS CHAR), '.png\'>Image</a>') AS ViewImage
FROM 
	StudyImages
		LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
			LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
				LEFT JOIN Visits ON ScanSessions.VisitID = Visits.VisitID
		LEFT JOIN StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
WHERE 
	StudySubjects.StudyID = varStudyID
GROUP BY 
	ScanSessions.ScanSessionID
ORDER BY SubjectName, ScanDate;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETScanSessionsBySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETScanSessionsBySubject`(IN subject_id INT(11))
BEGIN
	SELECT *
	FROM ScanSessionInfo
	WHERE SubjectID = subject_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETSiteInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETSiteInfo`(IN site_id INT(11))
BEGIN
	SELECT SiteCode, SiteName, Institution, Website FROM Sites WHERE SiteID = site_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStandardByQCAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getStandardByQCAnswer`(IN inQCAnswerID INT)
BEGIN

DECLARE varSequenceID INT;

SELECT SequenceID INTO varSequenceID FROM QCAnswerInfo WHERE QCAnswerID = inQCAnswerID;

SELECT
	ParameterStandardsOfSequence.ValueRegex AS Standard
FROM
	QCAnswers
	LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
	LEFT JOIN QCQuestions ON QCChoices.QCQuestionID = QCQuestions.QCQuestionID
	LEFT JOIN (
		SELECT QCQuestionID, ValueRegex FROM ParameterStandards WHERE SequenceID = varSequenceID)
		AS ParameterStandardsOfSequence
		ON QCChoices.QCQuestionID = ParameterStandardsOfSequence.QCQuestionID
WHERE
	QCAnswers.QCAnswerID = inQCAnswerID
	AND QCQuestions.HumanFlag = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETStudiesByImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETStudiesByImage`(IN image_id INT(11))
BEGIN
	SELECT *
	FROM StudyImageInfo
	WHERE ImageID = image_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETStudiesByNetwork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETStudiesByNetwork`(IN network_id INT(11))
BEGIN
	SELECT *
	FROM StudyInfo 
	WHERE NetworkID = network_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETStudiesByPeople` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETStudiesByPeople`(IN varPeopleID INT(11), IN inInactiveFlag BOOL)
BEGIN
	SELECT 
		Studies.StudyID, 
		Studies.StudyName, 
		membership.network.network_code AS NetworkCode, 
		IF (
			ISNULL(GroupedScanSessions.ScanSessionCount), 
			0, 
			GroupedScanSessions.ScanSessionCount) AS ScanSessionCount, 
		GroupedScanSessions.MostRecentScan
	FROM 
		Studies
			LEFT JOIN membership.network ON Studies.NetworkID = membership.network.network_id
				LEFT JOIN membership.people_network ON membership.network.network_id = membership.people_network.network_id
			LEFT JOIN
				(SELECT
					StudySubjects.StudyID, 
					COUNT(DISTINCT ScanSessions.ScanSessionID) AS ScanSessionCount, 
					MAX(ScanSessions.ScanDate) AS MostRecentScan
				FROM
					StudyImages
						LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
							LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
						LEFT JOIN StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
				GROUP BY
					StudySubjects.StudyID)
				AS GroupedScanSessions ON Studies.StudyID = GroupedScanSessions.StudyID
	WHERE 
		membership.people_network.people_id = varPeopleID
		AND Studies.InactiveFlag = inInactiveFlag
	ORDER BY 
		membership.network.network_code, 
		GroupedScanSessions.MostRecentScan;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETStudiesBySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETStudiesBySubject`(IN subject_id INT(11))
BEGIN
	SELECT *
	FROM StudySubjectInfo
	WHERE SubjectID = subject_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudyImageIDsByImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getStudyImageIDsByImage`(IN inImageID INT)
BEGIN

SELECT StudyImageID FROM StudyImageInfo WHERE ImageID = inImageID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudyImageReportByStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getStudyImageReportByStudy`(IN inStudyID INT, in inQCReportID INT)
Main : BEGIN

	DECLARE miniSQL TEXT;
	SET  SESSION group_concat_max_len = 1000000;
	SELECT
		GROUP_CONCAT('GROUP_CONCAT(CASE StudyRoleID WHEN ', StudyRoleID, ' THEN IF(StudyImageID IS NULL, NULL, IF(QCAnswerID IS NULL, "Not Documented", QCChoiceName)) ELSE NULL END) AS ', REPLACE(StudyRoleName, ' ', '_')) AS CommandString
		INTO @miniSQL
	FROM
		StudyRoles
	WHERE
		StudyID = inStudyID;
	#SELECT @miniSQL; LEAVE Main;
	IF @miniSQL IS NULL THEN
		SET @miniSQL = CONCAT(
			'SELECT
				StudySubjectID, 
				SubjectName, 
				IF(ISNULL(UnassignedCount), 0, UnassignedCount) AS UnassignedCount 
			FROM
				SubjectRolesCrossStudyToQCSessions
				LEFT JOIN (SELECT StudySubjectID AS UStudySubjectID, COUNT(StudyImageID) AS UnassignedCount FROM StudyImages WHERE StudyRoleID IS NULL GROUP BY UStudySubjectID) AS Unassigned ON SubjectRolesCrossStudyToQCSessions.StudySubjectID = Unassigned.UStudySubjectID
				LEFT JOIN (SELECT * FROM QCAnswerInfoQCChoicesBrainRegions WHERE QCReportID =  ', CAST(inQCReportID AS CHAR), ') AS QCAnswersOverall ON SubjectRolesCrossStudyToQCSessions.QCSessionID = QCAnswersOverall.QCSessionID
			WHERE
				StudyID =', CAST(inStudyID AS CHAR), '
			GROUP BY
				StudySubjectID, 
				SubjectName, 
				UnassignedCount'
		);
	ELSE
		SET @miniSQL = CONCAT(
			'SELECT
				StudySubjectID, 
				SubjectName, 
				IF(ISNULL(UnassignedCount), 0, UnassignedCount) AS UnassignedCount, ',  
				@miniSQL, '
			FROM
				SubjectRolesCrossStudyToQCSessions
				LEFT JOIN (SELECT StudySubjectID AS UStudySubjectID, COUNT(StudyImageID) AS UnassignedCount FROM StudyImages WHERE StudyRoleID IS NULL GROUP BY UStudySubjectID) AS Unassigned ON SubjectRolesCrossStudyToQCSessions.StudySubjectID = Unassigned.UStudySubjectID
				LEFT JOIN (SELECT * FROM QCAnswerInfoQCChoicesBrainRegions WHERE QCReportID =  ', CAST(inQCReportID AS CHAR), ') AS QCAnswersOverall ON SubjectRolesCrossStudyToQCSessions.QCSessionID = QCAnswersOverall.QCSessionID
			WHERE
				StudyID =', CAST(inStudyID AS CHAR), '
			GROUP BY
				StudySubjectID, 
				SubjectName, 
				UnassignedCount'
		);
	END IF;
	#SELECT @miniSQL; LEAVE Main;
	PREPARE stmt FROM @miniSQL;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudyInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getStudyInfo`(IN inStudyID INT)
BEGIN

CASE inStudyID
	WHEN 0 THEN
		SELECT
			StudyID, 
			StudyName, 
			NetworkID, 
			network_code AS NetworkCode
		FROM
			Studies LEFT JOIN membership.network ON Studies.NetworkID = membership.network.network_id
		ORDER BY network_code;
	ELSE
		SELECT
			StudyID, 
			StudyName, 
			NetworkID, 
			network_code AS NetworkCode
		FROM
			Studies LEFT JOIN membership.network ON Studies.NetworkID = membership.network.network_id
		WHERE Studies.StudyID = inStudyID
		ORDER BY network_code;
END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudyPaths` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` PROCEDURE `getStudyPaths`(IN inParseString VARCHAR(255))
Main : BEGIN

DECLARE varArg VARCHAR(255);
DECLARE varCond VARCHAR(255);
DECLARE varVar VARCHAR(255);
DECLARE pathSQL VARCHAR(10000);
DECLARE whereSQL VARCHAR(10000);
DECLARE isSubj BOOL DEFAULT FALSE;
DECLARE isDate BOOL DEFAULT FALSE;
DECLARE isStat BOOL DEFAULT FALSE;
DECLARE isProt BOOL DEFAULT FALSE;
DECLARE isSequ BOOL DEFAULT FALSE;
DECLARE isSite BOOL DEFAULT FALSE;
DECLARE isVist BOOL DEFAULT FALSE;
DECLARE isRole BOOL DEFAULT FALSE;
DECLARE isMody BOOL DEFAULT FALSE;
DECLARE isNumb BOOL DEFAULT FALSE;
DECLARE isWhere BOOL DEFAULT FALSE;

SET @pathSQL = '';
SET @whereSQL = '';

WHILE LENGTH(inParseString) > 0 DO
	SET varArg = SUBSTRING_INDEX(inParseString, ' ', 1);
	SET inParseString = TRIM(LEADING varArg FROM inParseString);
	SET inParseString = TRIM(LEADING ' ' FROM inParseString);
	IF varArg = '-s' AND NOT isSubj THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(SubjectName, " ", "_")');
	ELSEIF varArg = '-d' AND NOT isDate THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(REPLACE(ScanDate, " ", "_"), "-", "")');
	ELSEIF varArg = '-sd' AND NOT isDate THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(REPLACE(StudyName, " ", "_"), "-", "")');
	ELSEIF varArg = '-st' AND NOT isStat THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(StationName, " ", "_")');
	ELSEIF varArg = '-p' AND NOT isProt THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(ProtocolName, " ", "_")');
	ELSEIF varArg = '-sq' AND NOT isSequ THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(SequenceName, " ", "_")');
	ELSEIF varArg = '-se' AND NOT isSite THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(SiteAcronym, " ", "_")');
	ELSEIF varArg = '-v' AND NOT isVist THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(IF(ISNULL(VisitName), CONCAT("(Uncategorized)", ProtocolName, "__", REPLACE(ScanDate, "-", "")), VisitName), " ", "_")');
	ELSEIF varArg = '-r' AND NOT isRole THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(IF(ISNULL(StudyRoleName), CONCAT("(Uncategorized)", ScanDate, "__", SequenceName, "__", SequenceNumber), StudyRoleName), " ", "_")');
	ELSEIF varArg = '-m' AND NOT isMody THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(ModalityName, " ", "_")');
	ELSEIF varArg = '-n' AND NOT isNumb THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(SequenceNumber, " ", "_")');
	ELSEIF varArg = '-nt' AND NOT isNumb THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "/", REPLACE(NetworkCode, " ", "_")');
	ELSEIF varArg = '+s' AND NOT isSubj THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(SubjectName, " ", "_")');
	ELSEIF varArg = '+d' AND NOT isDate THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(REPLACE(ScanDate, " ", "_"), "-", "")');
	ELSEIF varArg = '+sd' AND NOT isDate THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(REPLACE(StudyName, " ", "_"), "-", "")');
	ELSEIF varArg = '+st' AND NOT isStat THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(StationName, " ", "_")');
	ELSEIF varArg = '+p' AND NOT isProt THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(ProtocolName, " ", "_")');
	ELSEIF varArg = '+sq' AND NOT isSequ THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(SequenceName, " ", "_")');
	ELSEIF varArg = '+se' AND NOT isSite THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(SiteAcronym, " ", "_")');
	ELSEIF varArg = '+v' AND NOT isVist THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(IF(ISNULL(VisitName), CONCAT(ProtocolName, "__", REPLACE(ScanDate, "-", "")), VisitName), " ", "_")');
	ELSEIF varArg = '+r' AND NOT isRole THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(IF(ISNULL(StudyRoleName), CONCAT(SequenceName, "__", SequenceNumber), StudyRoleName), " ", "_")');
	ELSEIF varArg = '+m' AND NOT isMody THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(ModalityName, " ", "_")');
	ELSEIF varArg = '+n' AND NOT isNumb THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(SequenceNumber, " ", "_")');
	ELSEIF varArg = '+nt' AND NOT isNumb THEN
		SET @pathSQL = CONCAT(@pathSQL, ', "__", REPLACE(NetworkCode, " ", "_")');
	ELSEIF LEFT(varArg, 1) = '#' THEN
		SET varArg = TRIM(LEADING '#' FROM varArg);
		SET @whereSQL = CONCAT(@whereSQL, 'OR (TRUE ');
		WHILE LENGTH(varArg) > 0 DO
			SET varCond = SUBSTRING_INDEX(varArg, '*', 1);
			SET varArg = TRIM(LEADING varCond FROM varArg);
			SET varArg = TRIM(LEADING '*' FROM varArg);
			SET varVar = SUBSTRING_INDEX(varCond, '=', 1);
			IF varVar = varCond THEN
				SET varVar = SUBSTRING_INDEX(varCond, '/', 1);
				IF varVar <> varCond THEN
					SET varCond = TRIM(LEADING varVar FROM varCond);
					SET varCond = TRIM(LEADING '/' FROM varCond);
					IF CAST(varCond AS UNSIGNED) <> 0 THEN
						IF varVar = 's' THEN
							SET @whereSQL = CONCAT(@whereSQL, 'AND SubjectID <> ', varCond, ' ');
						ELSEIF varVar = 'ss' THEN
							SET @whereSQL = CONCAT(@whereSQL, 'AND StudySubjectID <> ', varCond, ' ');
						ELSEIF varVar = 'sd' THEN
							SET @whereSQL = CONCAT(@whereSQL, 'AND StudyID <> ', varCond, ' ');
						ELSEIF varVar = 'se' THEN
							SET @whereSQL = CONCAT(@whereSQL, 'AND SiteID <> ', varCond, ' ');
						ELSEIF varVar = 'm' THEN
							SET @whereSQL = CONCAT(@whereSQL, 'AND ModalityID <> ', varCond, ' ');
						ELSEIF varVar = 'nt' THEN
							SET @whereSQL = CONCAT(@whereSQL, 'AND NetworkID <> ', varCond, ' ');
						ELSEIF varVar = 'i' THEN
							SET @whereSQL = CONCAT(@whereSQL, 'AND ImageID <> ', varCond, ' ');
						ELSEIF varVar = 'si' THEN
							SET @whereSQL = CONCAT(@whereSQL, 'AND StudyImageID <> ', varCond, ' ');
						END IF;
					END IF;
				END IF;
			ELSE
				SET varCond = TRIM(LEADING varVar FROM varCond);
				SET varCond = TRIM(LEADING '=' FROM varCond);
				IF CAST(varCond AS UNSIGNED) <> 0 THEN
					IF varVar = 's' THEN
						SET @whereSQL = CONCAT(@whereSQL, 'AND SubjectID = ', varCond, ' ');
					ELSEIF varVar = 'ss' THEN
						SET @whereSQL = CONCAT(@whereSQL, 'AND StudySubjectID = ', varCond, ' ');
					ELSEIF varVar = 'sd' THEN
						SET @whereSQL = CONCAT(@whereSQL, 'AND StudyID = ', varCond, ' ');
					ELSEIF varVar = 'se' THEN
						SET @whereSQL = CONCAT(@whereSQL, 'AND SiteID = ', varCond, ' ');
					ELSEIF varVar = 'm' THEN
						SET @whereSQL = CONCAT(@whereSQL, 'AND ModalityID = ', varCond, ' ');
					ELSEIF varVar = 'nt' THEN
						SET @whereSQL = CONCAT(@whereSQL, 'AND NetworkID = ', varCond, ' ');
					ELSEIF varVar = 'i' THEN
						SET @whereSQL = CONCAT(@whereSQL, 'AND ImageID = ', varCond, ' ');
					ELSEIF varVar = 'si' THEN
						SET @whereSQL = CONCAT(@whereSQL, 'AND StudyImageID = ', varCond, ' ');
					END IF;
				END IF;
			END IF;
		END WHILE;
		SET @whereSQL = CONCAT(@whereSQL, ') ');
	END IF;
END WHILE;

IF @pathSQL = '' THEN
	SELECT StudyImageID FROM StudyImageInfo WHERE StudyID = inStudyID;
	LEAVE Main;
END IF;

IF @whereSQL <> '' THEN
	SET @whereSQL = TRIM(LEADING 'OR' FROM @whereSQL);
	SET @whereSQL = CONCAT('WHERE', @whereSQL);
END IF;

SET @pathSQL = TRIM(LEADING ', "/", ' FROM @pathSQL);


SET @pathSQL = CONCAT('SELECT StudyImageID, ScanSessionID, CONCAT(', @pathSQL, ') AS NewPath FROM StudyImageInfo ', @whereSQL);

#SELECT @pathSQL;LEAVE Main;

PREPARE stmt FROM @pathSQL;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudyRolesByStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `getStudyRolesByStudy`(IN inStudyID INT)
BEGIN

SELECT NULL AS StudyRoleID, NULL AS StudyRoleName
UNION
SELECT StudyRoleID, StudyRoleName FROM StudyRoles WHERE StudyID = inStudyID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETSubjectInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETSubjectInfo`(IN subject_id INT(11))
BEGIN
	SELECT OriginalID, SiteID, SiteCode, SiteName, Institution, Website FROM SubjectInfo WHERE SubjectID = subject_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETSubjectsBySite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETSubjectsBySite`(IN site_id INT(11))
BEGIN
	SELECT * 
	FROM SubjectInfo 
	WHERE SiteID = site_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GETSubjectsByStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `GETSubjectsByStudy`(IN study_id INT(11))
BEGIN
	SELECT *
	FROM StudySubjectInfo
	WHERE StudyID = study_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nextToConn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `nextToConn`()
BEGIN

SELECT
	StudyImageInfo.StudyImageID
FROM
	StudyImageInfo
	INNER JOIN (SELECT StudyImageID, NumericData AS CoregStudyImageID FROM QCAnswerInfo WHERE QCChoiceID = 512 OR QCChoiceID = 514) AS CoregAnatomical ON StudyImageInfo.StudyImageID = CoregAnatomical.StudyImageID
	INNER JOIN (SELECT StudyImageID FROM QCAnswerInfo WHERE QCChoiceID = 521) AS AlreadyFS ON StudyImageInfo.StudyImageID = AlreadyFS.StudyImageID
	LEFT JOIN (SELECT StudyImageID FROM QCAnswerInfo WHERE QCChoiceID = 511 OR QCChoiceID = 523) AS AlreadyConn ON StudyImageInfo.StudyImageID = AlreadyConn.StudyImageID
WHERE
	StudyImageInfo.ModalityID = 3 AND AlreadyConn.StudyImageID IS NULL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nextToFS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `nextToFS`()
BEGIN

SELECT StudyImageInfo.StudyImageID
FROM StudyImageInfo
LEFT JOIN (SELECT StudyImageID FROM QCAnswerInfo WHERE QCChoiceID = 521 OR QCChoiceID = 522) AS AlreadyFS ON StudyImageInfo.StudyImageID = AlreadyFS.StudyImageID
WHERE StudyImageInfo.ModalityID = 2 AND AlreadyFS.StudyImageID IS NULL
LIMIT 12;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NextToQC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `NextToQC`()
BEGIN

INSERT INTO QCSessions (StudyImageID) 
SELECT StudyImages.StudyImageID 
FROM StudyImages LEFT JOIN QCSessions ON StudyImages.StudyImageID = QCSessions.StudyImageID 
WHERE QCSessions.StudyImageID IS NULL;

#SELECT QCSessionInfo.QCSessionID, QCSessionInfo.SubjectName, QCSessionInfo.ScanDate, QCSessionInfo.SequenceName, QCSessionInfo.SequenceNumber
SELECT DISTINCT QCSessionInfo.ScanSessionID, QCSessionInfo.StudyID, QCSessionInfo.SubjectName, QCSessionInfo.ScanDate
FROM QCSessionInfo
LEFT JOIN (SELECT DISTINCT QCSessionID FROM QCAnswerInfo WHERE OverallFlag = TRUE) AS AlreadyQC ON QCSessionInfo.QCSessionID = AlreadyQC.QCSessionID
LEFT JOIN Studies ON QCSessionInfo.StudyID = Studies.StudyID
WHERE QCSessionInfo.SiteID = 12 AND QCSessionInfo.NetworkID = 2 AND Studies.InactiveFlag = FALSE AND AlreadyQC.QCSessionID IS NULL AND (QCSessionInfo.ModalityID = 2 OR QCSessionInfo.ModalityID = 3 OR QCSessionInfo.ModalityID = 4)
ORDER BY QCSessionInfo.ScanDate DESC, SequenceNumber;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProjectCrossTab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProjectCrossTab`(IN `project_id` INT, IN `report_criteria_id` INT)
    READS SQL DATA
BEGIN
	DECLARE miniSQL VARCHAR(5000);
	DECLARE row_number int(11);
    SELECT 
		GROUP_CONCAT(
				DISTINCT CONCAT(
					'GROUP_CONCAT((CASE BigQuery.ProjectColumnID WHEN ', ProjectColumns.ProjectColumnID, ' THEN BigQuery.Result ELSE NULL END)) AS ', REPLACE(ProjectColumns.ProjectColumnName, ' ', '_')))
    INTO @miniSQL
    FROM
		ProjectColumns
    WHERE
		ProjectID = project_id;

	SELECT Count(ProjectRowID) INTO row_number FROM ProjectRows WHERE ProjectID = project_id;

IF @miniSQL IS NULL THEN
	IF row_number = 0 THEN
		SET @miniSQL = 
		'SELECT 0 AS ProjectRowID, "No Rows" AS ProjectRowName, NULL AS NoColumns;';
	ELSE
		SET  @miniSQL = 
		CONCAT('SELECT 
			ProjectRows.ProjectRowID, 
			ProjectRows.ProjectRowName,
			NULL AS NoColumns
		FROM
			ProjectRows
		WHERE ProjectRows.ProjectID =', CAST(project_id AS CHAR(100)), ';') ;
	END IF;
ELSE
	IF row_number = 0 THEN
		SET @miniSQL = CONCAT(
			'SELECT
				0 AS ProjectRowID, 
				"No Rows" AS ProjectRowName, ', 
				@miniSQL, ', 
				GROUP_CONCAT(
					IF(
						BigQuery.ProjectColumnID IS NULL, 
						BigQuery.Result, 
						NULL)) 
						AS Unassigned 
			FROM (
				SELECT
					ProjectColumnID,
					ProjectColumnName, 
					NULL AS Result
				FROM
					ProjectColumns
				WHERE
					ProjectColumns.ProjectID = ', CAST(project_id AS CHAR(100)), ') AS BigQuery');
	ELSE
		SET @miniSQL = CONCAT(
			'SELECT 
				BigQuery.ProjectRowID, 
				BigQuery.ProjectRowName, 
				', @miniSQL, ', 
				GROUP_CONCAT(
					IF(
						BigQuery.ProjectColumnID IS NULL, 
						BigQuery.Result, 
						NULL)) 
						AS Unassigned 
			FROM (
				SELECT
					ProjectRows.ProjectRowID, 
					ProjectRows.ProjectRowName, 
					IF(
						AnswerView.QCChoiceName IS NULL, 
						"Not Documented", 
						AnswerView.QCChoiceName) 
						AS Result,
					ProjectImages.ProjectColumnID, 
					ProjectColumns.ProjectColumnName
				FROM
					ProjectRows
					LEFT JOIN
						ProjectImages ON ProjectRows.ProjectRowID = ProjectImages.ProjectRowID
						LEFT JOIN
							StudyImages ON ProjectImages.StudyImageID = StudyImages.StudyImageID
							LEFT JOIN
								Images ON StudyImages.ImageID = Images.ImageID
								LEFT JOIN
									ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
								LEFT JOIN
									QCSessions ON Images.ImageID = QCSessions.ImageID    
									LEFT JOIN (
										SELECT
											QCAnswers.QCAnswerID,       
											QCAnswers.QCSessionID, 
											QCChoices.QCChoiceName
										FROM      
											QCAnswers
											LEFT JOIN
												QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
												INNER JOIN
													ReportCriteriaQuestions ON QCChoices.QCQuestionID = ReportCriteriaQuestions.QCQuestionID
										WHERE  ReportCriteriaQuestions.ReportCriteriaID =', CAST(report_criteria_id AS CHAR(100)), ' )     
										AS AnswerView ON QCSessions.QCSessionID = AnswerView.QCSessionID
								LEFT JOIN
									Sequences ON Images.SequenceID = Sequences.SequenceID
									LEFT JOIN
										Modalities ON Sequences.ModalityID = Modalities.ModalityID
						LEFT JOIN
							ProjectColumns ON ProjectImages.ProjectColumnID = ProjectColumns.ProjectColumnID
				WHERE ProjectRows.ProjectID =', CAST(project_id AS CHAR(100)) , ') 
				AS BigQuery
			GROUP BY   BigQuery.ProjectRowID;');
	END IF;
END IF;
#SELECT @miniSQL;
PREPARE stmt FROM @miniSQL;
#SELECT stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PUTDicomChoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `PUTDicomChoice`(IN image_id INT(11), IN qc_choice_id INT(11), IN result_text VARCHAR(255), IN overwrite BOOL)
BEGIN

	DECLARE qc_session_id INT;
	DECLARE existing_qc_answer_id INT;
	
	SELECT QCSessionID INTO qc_session_id FROM QCSessions WHERE ImageID = image_id;
	SELECT QCAnswerID INTO existing_qc_answer_id FROM QCAnswers WHERE QCSessionID = qc_session_id AND QCChoiceID = qc_choice_id;
	IF existing_qc_answer_id IS NULL THEN
		INSERT INTO QCAnswers (QCSessionID, TextData, QCChoiceID) VALUES (qc_session_id, result_text, qc_choice_id);
	ELSE
		IF overwrite THEN
			UPDATE QCAnswers SET TextData = result_text WHERE QCSessionID = qc_session_id AND QCChoiceID = qc_choice_id;
		END IF;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `putQCAnswersFromXML` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `putQCAnswersFromXML`(IN inStudyImageID INT, IN inXMLPath VARCHAR(255))
BEGIN

	DECLARE varQCSessionID INT;
	DECLARE varXML LONGTEXT;
	DECLARE varNoXMLFlag BOOL DEFAULT FALSE;
	DECLARE varQCQuestionID INT;
	DECLARE varNumericFlag INT;
	DECLARE varRequiredFlag INT;
	DECLARE varDICOMTag CHAR(9);
	DECLARE varTagCount INT;
	DECLARE varTextData VARCHAR(255);
	DECLARE varNumData DECIMAL(15,5);
	DECLARE varQCChoiceOrder INT;
	DECLARE varValueRegex VARCHAR(255);
	DECLARE varValueMin DECIMAL(10,3);
	DECLARE varValueMax DECIMAL(10,3);
	DECLARE varQCChoiceID INT;
	DECLARE varQCAnswerID INT;
	DECLARE varEndLoop BOOL DEFAULT FALSE;
	DECLARE varCursor CURSOR FOR 
		SELECT 
			QCQuestionID, 
			NumericFlag, 
			RequiredFlag, 
			DICOMTag
		FROM
			QCQuestions
			INNER JOIN (
				SELECT ModalityID
				FROM StudyImageInfo
				WHERE StudyImageID = inStudyImageID)
				AS ModalityOfStudyImage
				ON QCQuestions.ModalityID = ModalityOfStudyImage.ModalityID
		WHERE
			DICOMTag IS NOT NULL;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET varEndLoop = TRUE;

	SELECT QCSessionID INTO varQCSessionID FROM QCSessions WHERE StudyImageID = inStudyImageID;
	IF varQCSessionID IS NULL THEN
		INSERT INTO QCSessions (StudyImageID) VALUES (inStudyImageID);
		SELECT LAST_INSERT_ID() INTO varQCSessionID;
		SET varEndLoop = FALSE;
	END IF;
	
	SET varXML = LOAD_FILE(inXMLPath);
	IF varXML IS NULL THEN
		SET varNoXMLFlag = TRUE;
		SET varEndLoop = FALSE;
	END IF;

	OPEN varCursor;
	REPEAT 
		SET varQCQuestionID = NULL;
		SET varTextData = NULL;
		SET varNumData = NULL;
		SET varValueRegex = NULL;
		SET varValueMin = NULL;
		SET varValueMax = NULL;
		FETCH varCursor INTO varQCQuestionID, varNumericFlag, varRequiredFlag, varDICOMTag;
		IF varQCQuestionID IS NULL THEN
			SET varEndLoop = TRUE;
		ELSE
			IF varNoXMLFlag THEN
				SET varTagCount = 0;
			ELSE
				SELECT ExtractValue(varXML, CONCAT('count(//element[@tag="', varDICOMTag, '"])')) INTO varTagCount;
			END IF;
			#Case in DICOM
			IF varTagCount = 1 THEN
				SELECT ExtractValue(varXML, CONCAT('//element[@tag="', varDICOMTag, '"]')) INTO varTextData;
				#Case Parameter Numeric
				IF varNumericFlag = 1 THEN
					#Case Value Non-Numeric
					IF CAST(varTextData AS DECIMAL(15,5)) = 0 AND varTextData NOT REGEXP '^0.*' THEN
						SET varQCChoiceOrder = 3;
						SET varTextData = NULL;
					#Case Value Numeric
					ELSE
						SET varNumData = CAST(varTextData AS DECIMAL(15,5));
						SET varTextData = NULL;
						SELECT 
							ValueMin, ValueMax INTO varValueMin, varValueMax 
						FROM ParameterStandards
							INNER JOIN 
								(SELECT SequenceID FROM StudyImages LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID WHERE StudyImageID = inStudyImageID) 
								AS SequenceOfStudyImage 
								ON ParameterStandards.SequenceID = SequenceOfStudyImage.SequenceID
						WHERE
							ParameterStandards.QCQuestionID = varQCQuestionID
						LIMIT 1;
						IF varValueMin IS NULL OR varValueMax IS NULL THEN
							SET varQCChoiceOrder = 0;
							SET varEndLoop = FALSE;
						ELSEIF varNumData >= varValueMin AND varNumData <= varValueMax THEN
							SET varQCChoiceOrder = 1;
						ELSE
							SET varQCChoiceOrder = 2;
						END IF;
					END IF;
				#Case Parameter Text
				ELSE
					SELECT 
						ValueRegex INTO varValueRegex 
					FROM ParameterStandards
						INNER JOIN 
							(SELECT SequenceID FROM StudyImages LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID WHERE StudyImageID = inStudyImageID) 
							AS SequenceOfStudyImage 
							ON ParameterStandards.SequenceID = SequenceOfStudyImage.SequenceID
					WHERE
						ParameterStandards.QCQuestionID = varQCQuestionID
					LIMIT 1;
					IF varValueRegex IS NULL THEN
						SET varQCChoiceOrder = 0;
						SET varEndLoop = FALSE;
					ELSE
						IF varTextData REGEXP varValueRegex THEN
							SET varQCChoiceOrder = 1;
						ELSE
							SET varQCChoiceOrder = 2;
						END IF;
					END IF;
				END IF;
			#Case Not in DICOM
			ELSE
				SET varQCChoiceOrder = 3;
			END IF;
			SET varQCChoiceID = NULL;
			SELECT QCChoiceID INTO varQCChoiceID FROM QCChoices WHERE QCQuestionID = varQCQuestionID AND QCChoiceOrder = varQCChoiceOrder;
			IF varQCChoiceID IS NULL THEN
				SET varEndLoop = FALSE;
			ELSEIF varRequiredFlag = 1 OR (varRequiredFlag = 0 AND varQCChoiceOrder <> 0 AND varQCChoiceOrder <> 3) THEN
				SET varQCAnswerID = NULL;
				SELECT QCAnswerID INTO varQCAnswerID FROM QCAnswers LEFT JOIN QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID WHERE QCQuestionID = varQCQuestionID AND QCSessionID = varQCSessionID;
				IF varQCAnswerID IS NULL THEN
					INSERT INTO QCAnswers (QCSessionID, QCChoiceID, NumericData, TextData) VALUES (varQCSessionID, varQCChoiceID, varNumData, varTextData);
					SET varEndLoop = FALSE;
				ELSEIF varQCChoiceOrder <> 3 THEN
					UPDATE QCAnswers SET QCChoiceID = varQCChoiceID, NumericData = varNumData, TextData = varTextData WHERE QCAnswerID = varQCAnswerID;
				END IF;
			END IF;
		END IF;
	UNTIL varEndLoop END REPEAT;
	CLOSE varCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `putQCAnswersFromXMLForAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `putQCAnswersFromXMLForAll`()
BEGIN
	DECLARE varStudyImageID INT;
	DECLARE varXMLPath VARCHAR(255);
	DECLARE varEndLoop BOOL DEFAULT FALSE;
	DECLARE varCursor CURSOR FOR 
		SELECT 
			StudyImageInfo.StudyImageID, 
			CONCAT(REPLACE(DirectoryPath, 'QC0', 'XML'), '/00001.xml') AS XMLPath
		FROM 
			StudyImageInfo 
			INNER JOIN ImagingRepositoryV4.ImageScans ON StudyImageInfo.SeriesUID = ImageScans.SeriesUID 
		WHERE DirectoryPath IS NOT NULL;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET varEndLoop = TRUE;

	OPEN varCursor;
	REPEAT 
		FETCH varCursor INTO varStudyImageID, varXMLPath;
		CALL putQCAnswersFromXML(varStudyImageID, varXMLPath);
	UNTIL varEndLoop END REPEAT;
	CLOSE varCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `putQCAnswersFromXMLForStudy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `putQCAnswersFromXMLForStudy`(IN inStudyID INT)
BEGIN
	DECLARE varStudyImageID INT;
	DECLARE varXMLPath VARCHAR(255);
	DECLARE varEndLoop BOOL DEFAULT FALSE;
	DECLARE varCursor CURSOR FOR 
		SELECT 
			StudyImageInfo.StudyImageID, 
			CONCAT('/data/XML/', StudyImageInfo.StudyImageID,'/00001.xml') AS XMLPath
		FROM 
			StudyImageInfo 
		WHERE StudyID = inStudyID;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET varEndLoop = TRUE;

	OPEN varCursor;
	REPEAT 
		FETCH varCursor INTO varStudyImageID, varXMLPath;
		CALL putQCAnswersFromXML(varStudyImageID, varXMLPath);
	UNTIL varEndLoop END REPEAT;
	CLOSE varCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `putStudyRoleByStudyImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `putStudyRoleByStudyImage`(IN inStudyImageID INT, IN inStudyRoleID INT)
Main : BEGIN

DECLARE varStudyIDByImage INT;
DECLARE varStudyIDByRole INT;
DECLARE varStudySubjectID INT;
DECLARE varStudyImageID INT;

IF inStudyRoleID IS NULL THEN
	UPDATE StudyImages SET StudyRoleID = NULL WHERE StudyImageID = inStudyImageID;
END IF;

SELECT StudyID INTO varStudyIDByImage FROM StudyImages LEFT JOIN StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID WHERE StudyImageID = inStudyImageID;
IF varStudyIDByImage IS NULL THEN
	LEAVE Main;
END IF;

SELECT StudyID INTO varStudyIDByRole FROM StudyRoles WHERE StudyRoleID = inStudyRoleID;
IF varStudyIDByRole IS NULL THEN
	LEAVE Main;
END IF;

IF varStudyIDByImage <> varStudyIDByRole THEN
	LEAVE Main;
END IF;

SELECT StudySubjectID INTO varStudySubjectID FROM StudyImages WHERE StudyImageID = inStudyImageID;
SELECT StudyImageID INTO varStudyImageID FROM StudyImages WHERE StudySubjectID = varStudySubjectID AND StudyRoleID = inStudyRoleID LIMIT 1;
IF varStudyImageID IS NULL THEN
	UPDATE StudyImages SET StudyRoleID = inStudyRoleID WHERE StudyImageID = inStudyImageID;
	LEAVE Main;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `putVisitByScanSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mher`@`%` PROCEDURE `putVisitByScanSession`(IN inScanSessionID INT, IN inVisitID INT)
Main : BEGIN

DECLARE varScanSessionID INT;
DECLARE varVisitID INT;
DECLARE varStudySubjectID INT;

IF inVisitID IS NULL THEN
	UPDATE ScanSessions SET VisitID = NULL WHERE ScanSessionID = inScanSessionID;
END IF;

SELECT ScanSessionID INTO varScanSessionID FROM ScanSessions WHERE ScanSessionID = inScanSessionID;
IF varScanSessionID IS NULL THEN
	LEAVE Main;
END IF;

SELECT VisitID INTO varVisitID FROM Visits WHERE VisitID = inVisitID;
IF varVisitID IS NULL THEN
	LEAVE Main;
END IF;

SET varScanSessionID = NULL;
SELECT
	ScanSessions.ScanSessionID INTO varScanSessionID
FROM
	(SELECT
		StudySubjectID
	FROM
		StudyImages
		LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID
	WHERE
		ScanSessionID = inScanSessionID) AS StudyImagesByScanSession
	LEFT JOIN StudyImages ON StudyImagesByScanSession.StudySubjectID = StudyImages.StudySubjectID
	LEFT JOIN Images ON	StudyImages.ImageID = Images.ImageID
	LEFT JOIN ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
WHERE
	VisitID = inVisitID
LIMIT 1;

IF varScanSessionID IS NULL THEN
	UPDATE ScanSessions SET VisitID = inVisitID WHERE ScanSessionID = inScanSessionID;
	LEAVE Main;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QCReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` PROCEDURE `QCReport`(IN PastXDays INT)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
SELECT @full_error;
END;

SELECT 	Scanned.StudyName, Scanned.SubjectName, 
		Scanned.ScanDate,
		CONCAT(CAST(SUM(NeedQC.QCCount) AS CHAR), " Need") AS NeedsQC, 
        CONCAT(CAST(SUM(PassQC.QCCount) AS CHAR), " Passed") AS PassedQC,
        CONCAT(CAST(SUM(FailQC.QCCount) AS CHAR), " Failed") AS FailedQC
FROM ImagingRepositoryV6.StudyImageInfo AS Scanned 
LEFT OUTER JOIN (SELECT QCSessionInfo.StudyImageID, COUNT(QCSessionInfo.StudyImageID) as QCCount FROM QCSessionInfo
                                LEFT JOIN (
                                        SELECT StudyImageID FROM QCAnswerInfo WHERE OverallFlag = 1) 
                                        AS DoneQC
                                        ON QCSessionInfo.StudyImageID = DoneQC.StudyImageID
                                LEFT JOIN QCSessions ON QCSessionInfo.QCSessionID = QCSessions.QCSessionID
                        WHERE DoneQC.StudyImageID IS NULL AND QCSessionInfo.ModalityID IN ( 2, 3, 4 )
						GROUP BY QCSessionInfo.StudyImageID) AS NeedQC ON Scanned.StudyImageID = NeedQC.StudyImageID
LEFT OUTER JOIN (SELECT StudyImageID, COUNT(StudyImageID) as QCCount FROM QCAnswerInfo
                        WHERE ModalityID IN ( 2, 3, 4 ) AND OverallFlag=1  AND QCChoiceName LIKE "%Pass%"
						GROUP BY StudyImageID) AS PassQC ON Scanned.StudyImageID = PassQC.StudyImageID                       
LEFT OUTER JOIN (SELECT StudyImageID, COUNT(StudyImageID) as QCCount FROM QCAnswerInfo
                        WHERE ModalityID IN ( 2, 3, 4 ) AND OverallFlag=1  AND QCChoiceName = "Fail"
                        GROUP BY StudyImageID) AS FailQC ON Scanned.StudyImageID = FailQC.StudyImageID
WHERE Scanned.ScanDate BETWEEN DATE_SUB(NOW(), INTERVAL PastXDays DAY) AND NOW() 
GROUP BY Scanned.SubjectName, Scanned.ScanDate, Scanned.StudyID
ORDER BY StudyName, ScanDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudyCrossTab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudyCrossTab`(IN `study_id` INT, IN `report_criteria_id` INT)
    READS SQL DATA
BEGIN
	DECLARE miniSQL VARCHAR(5000);
    SELECT 
		GROUP_CONCAT(
				DISTINCT CONCAT(
					'GROUP_CONCAT((CASE BigQuery.ModalityID WHEN ', Sequences.ModalityID, ' THEN BigQuery.Result ELSE NULL END)) AS ', REPLACE(Modalities.ModalityName, ' ', '_')))
    INTO @miniSQL
    FROM
		StudyImages
		LEFT JOIN
			StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
		LEFT JOIN 
			Images ON StudyImages.ImageID = Images.ImageID
			LEFT JOIN 
				Sequences ON Images.SequenceID = Sequences.SequenceID
				LEFT JOIN
					Modalities ON Sequences.ModalityID = Modalities.ModalityID
    WHERE
		StudySubjects.StudyID = study_id;

IF @miniSQL IS NULL THEN
	SELECT NULL AS ScanSessionID, NULL AS SubjectName, NULL AS ScanDate LIMIT 0;
ELSE
	SET @miniSQL = CONCAT(
		'SELECT 
			BigQuery.ScanSessionID, 
			BigQuery.SubjectName, 
			BigQuery.ScanDate,
			', @miniSQL, ', 
			GROUP_CONCAT(
				IF(
					BigQuery.ModalityID IS NULL, 
					BigQuery.Result, 
					NULL)) 
					AS Unassigned 
		FROM (
			SELECT
				ScanSessions.ScanSessionID, 
				StudySubjects.SubjectName, 
				ScanSessions.ScanDate,
				IF(
					AnswerView.QCChoiceName IS NULL, 
					"Not Documented", 
					AnswerView.QCChoiceName) 
					AS Result,
				Sequences.ModalityID, 
				Modalities.ModalityName
			FROM
				StudyImages
				LEFT JOIN
					StudySubjects ON StudyImages.StudySubjectID = StudySubjects.StudySubjectID
				LEFT JOIN
					Images ON StudyImages.ImageID = Images.ImageID
					LEFT JOIN
						ScanSessions ON Images.ScanSessionID = ScanSessions.ScanSessionID
					LEFT JOIN
						Sequences ON Images.SequenceID = Sequences.SequenceID
						LEFT JOIN
							Modalities ON Sequences.ModalityID = Modalities.ModalityID
				LEFT JOIN
					QCSessions ON StudyImages.StudyImageID = QCSessions.StudyImageID    
					LEFT JOIN (
						SELECT
							QCAnswers.QCAnswerID,       
							QCAnswers.QCSessionID, 
							QCChoices.QCChoiceName
						FROM      
							QCAnswers
							LEFT JOIN
								QCChoices ON QCAnswers.QCChoiceID = QCChoices.QCChoiceID
								INNER JOIN
									ReportCriteriaQuestions ON QCChoices.QCQuestionID = ReportCriteriaQuestions.QCQuestionID
						WHERE  ReportCriteriaQuestions.ReportCriteriaID =', CAST(report_criteria_id AS CHAR(100)), ' )     
						AS AnswerView ON QCSessions.QCSessionID = AnswerView.QCSessionID
			WHERE StudySubjects.StudyID =', CAST(study_id AS CHAR(100)) , ') 
			AS BigQuery
		GROUP BY   BigQuery.ScanSessionID;');
	#SELECT @miniSQL;
	PREPARE stmt FROM @miniSQL;
	#SELECT stmt;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `syncJVH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cody`@`%` PROCEDURE `syncJVH`(IN series_uid VARCHAR(255))
BEGIN

DECLARE id_var INT;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
SELECT @full_error;
END;

select QCAnswerID into id_var from QCAnswerInfo where QCQuestionID = 85 and SeriesUID = series_uid and StudyID != 146;

IF id_var IS NOT NULL THEN
	UPDATE QCAnswers SET QCChoiceID = 179 WHERE QCAnswerID = id_var;
    SELECT id_var;
ELSE
	SELECT QCSessionID into id_var from QCAnswerInfo where SeriesUID = series_uid GROUP BY QCSessionID ORDER BY QCSessionID LIMIT 1;
	IF id_var IS NOT NULL THEN
		INSERT INTO QCAnswers(QCSessionID, QCChoiceID, Comments) VALUES(id_var,179,"SYNC_JVH");
        SELECT last_insert_id();
	ELSE
		SELECT StudyImageID INTO id_var FROM StudyImages INNER JOIN Images USING (ImageID) WHERE Images.SeriesUID = series_uid;
        IF id_var IS NOT NULL THEN
			INSERT INTO QCSessions(StudyImageID, QCDate) VALUES(id_var,CURDATE());
            INSERT INTO QCAnswers(QCSessionID, QCChoiceID, Comments) VALUES(last_insert_id(),179,"SYNC_JVH");
            SELECT last_insert_id();
		ELSE
			SELECT -1;
		END IF;
    END IF;
END IF;

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

-- Dump completed on 2016-01-12 13:41:35
