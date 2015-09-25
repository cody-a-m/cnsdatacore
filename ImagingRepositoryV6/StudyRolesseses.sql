CREATE TABLE `StudyRolesseses` (
  `StudyRoleID` int(11) NOT NULL,
  `StudyID` int(11) DEFAULT NULL,
  `VisitLevel` tinyint(4) DEFAULT NULL,
  `SessionLevel` tinyint(4) DEFAULT NULL,
  `ModalityID` int(11) DEFAULT NULL,
  `StudyRoleName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StudyRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
