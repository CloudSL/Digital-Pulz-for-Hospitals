-- MySQL dump 10.13  Distrib 5.6.21, for Win32 (x86)
--
-- Host: localhost    Database: HIS
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `admin_permission`
--

DROP TABLE IF EXISTS `admin_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_discription` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`permission_id`),
  KEY `permission_IDfk_1` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permission`
--

LOCK TABLES `admin_permission` WRITE;
/*!40000 ALTER TABLE `admin_permission` DISABLE KEYS */;
INSERT INTO `admin_permission` VALUES (1,'Add Role',1),(2,'Delete Role',1),(3,'Update Role',1),(4,'View Role',1),(5,'View Permission',1),(6,'View User',1);
/*!40000 ALTER TABLE `admin_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissionrequest`
--

DROP TABLE IF EXISTS `admin_permissionrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissionrequest` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `reqest_permission` varchar(250) NOT NULL,
  `reason` text NOT NULL,
  `requester` int(11) NOT NULL,
  `approver` int(11) DEFAULT NULL,
  `request_date` date NOT NULL,
  `approve_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_approve` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `requester` (`requester`),
  KEY `approver` (`approver`),
  KEY `FK_qskxeneayyv0l6xmdu9xnkfsr` (`approver`),
  KEY `FK_c2jbd8eea44uhed4d861j9tu7` (`requester`),
  CONSTRAINT `FK_c2jbd8eea44uhed4d861j9tu7` FOREIGN KEY (`requester`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_qskxeneayyv0l6xmdu9xnkfsr` FOREIGN KEY (`approver`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissionrequest`
--

LOCK TABLES `admin_permissionrequest` WRITE;
/*!40000 ALTER TABLE `admin_permissionrequest` DISABLE KEYS */;
INSERT INTO `admin_permissionrequest` VALUES (1,'Request Add Role Permission','To add role details',3,3,'2014-08-25','2014-08-25',1,1),(2,'Request Add User Permission','To add User details',3,3,'2014-08-25','2014-08-25',1,0),(5,'Delete permission for all domain classes','To delete user details  \n \n',3,3,'2014-08-26','2014-08-26',1,0),(6,'Show user roles','Please add show user role for me',3,3,'2014-08-27','2014-08-27',1,1),(7,'Show user roles','Please add show user role for me',3,3,'2014-08-27','2014-08-28',1,1),(8,'Delete admin','To delete admin ',3,3,'2014-08-27','2014-08-29',1,1);
/*!40000 ALTER TABLE `admin_permissionrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_rolepermissions`
--

DROP TABLE IF EXISTS `admin_rolepermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_rolepermissions` (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_id` (`role_id`),
  KEY `FK_qqe16o018t45tpuv8tk7kujov` (`permission_id`),
  KEY `FK_g4ormkr5yobcdyltbs0lwispt` (`role_id`),
  CONSTRAINT `FK_g4ormkr5yobcdyltbs0lwispt` FOREIGN KEY (`role_id`) REFERENCES `admin_userroles` (`role_id`),
  CONSTRAINT `FK_qqe16o018t45tpuv8tk7kujov` FOREIGN KEY (`permission_id`) REFERENCES `admin_permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_rolepermissions`
--

LOCK TABLES `admin_rolepermissions` WRITE;
/*!40000 ALTER TABLE `admin_rolepermissions` DISABLE KEYS */;
INSERT INTO `admin_rolepermissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(2,2),(4,2),(4,3),(6,3);
/*!40000 ALTER TABLE `admin_rolepermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(250) NOT NULL,
  `password` varchar(110) NOT NULL,
  `role_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `userName` (`user_name`),
  KEY `user_IDfk_1` (`role_id`),
  KEY `employee_id` (`employee_id`),
  KEY `FK_95qbudlsn1lawjcfplbr2gh01` (`role_id`),
  KEY `FK_nx0o3ysngbnyqgc8p3y9pp0cn` (`employee_id`),
  CONSTRAINT `FK_95qbudlsn1lawjcfplbr2gh01` FOREIGN KEY (`role_id`) REFERENCES `admin_userroles` (`role_id`),
  CONSTRAINT `FK_nx0o3ysngbnyqgc8p3y9pp0cn` FOREIGN KEY (`employee_id`) REFERENCES `hr_employee` (`emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'Wasantha','1000:36811180741ae8228031ab39f3435b37a5d9879511055c92:85e4f4ffd3f3d486827212e47b2a0f13d215880fcdf3d5ee',1,1,1),(2,'Sahan','1000:36811180741ae8228031ab39f3435b37a5d9879511055c92:85e4f4ffd3f3d486827212e47b2a0f13d215880fcdf3d5ee',4,12,1),(3,'Rasangi','1000:36811180741ae8228031ab39f3435b37a5d9879511055c92:85e4f4ffd3f3d486827212e47b2a0f13d215880fcdf3d5ee',2,1,1),(4,'Nisha','1000:36811180741ae8228031ab39f3435b37a5d9879511055c92:85e4f4ffd3f3d486827212e47b2a0f13d215880fcdf3d5ee',5,12,1),(5,'Ishara','1000:36811180741ae8228031ab39f3435b37a5d9879511055c92:85e4f4ffd3f3d486827212e47b2a0f13d215880fcdf3d5ee',1,13,1),(6,'Madhura','1000:36811180741ae8228031ab39f3435b37a5d9879511055c92:85e4f4ffd3f3d486827212e47b2a0f13d215880fcdf3d5ee',2,26,1),(7,'Dilini','1000:36811180741ae8228031ab39f3435b37a5d9879511055c92:85e4f4ffd3f3d486827212e47b2a0f13d215880fcdf3d5ee',1,19,1),(8,'Hansi','1000:36811180741ae8228031ab39f3435b37a5d9879511055c92:85e4f4ffd3f3d486827212e47b2a0f13d215880fcdf3d5ee',1,12,1),(13,'kamal','1000:408e60a6ba5d08a190812488b3113a8460a265b210c5573a:27758a619cdbe1bd756017897490c5a73eed0e10149abb2d',1,26,1),(14,'mahirangi','1000:e8df2833f229e7027e41a0397ab91fc770e0a630efd8f65d:634f79a94396e24bb90dce9fbf01cdf92e1d9a983ceff37d',1,26,1);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_userroles`
--

DROP TABLE IF EXISTS `admin_userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_userroles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_userroles`
--

LOCK TABLES `admin_userroles` WRITE;
/*!40000 ALTER TABLE `admin_userroles` DISABLE KEYS */;
INSERT INTO `admin_userroles` VALUES (1,'Doctor',1),(2,'Nurse',1),(3,'MLT',1),(4,'Chief Pharmacist',1),(5,'Assistant Pharmacist',1);
/*!40000 ALTER TABLE `admin_userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_log`
--

DROP TABLE IF EXISTS `attendance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_log` (
  `Bcode` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_log`
--

LOCK TABLES `attendance_log` WRITE;
/*!40000 ALTER TABLE `attendance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_patient_attachment`
--

DROP TABLE IF EXISTS `clinic_patient_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_patient_attachment` (
  `attachment_id` int(11) NOT NULL,
  `clinic_visit_id` int(11) NOT NULL,
  `attachment_type` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `create_user` varchar(100) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_patient_attachment`
--

LOCK TABLES `clinic_patient_attachment` WRITE;
/*!40000 ALTER TABLE `clinic_patient_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_patient_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_patient_history`
--

DROP TABLE IF EXISTS `clinic_patient_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_patient_history` (
  `clinic_history_id` int(11) NOT NULL,
  `clinic_visit_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  PRIMARY KEY (`clinic_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_patient_history`
--

LOCK TABLES `clinic_patient_history` WRITE;
/*!40000 ALTER TABLE `clinic_patient_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_patient_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_patient_queue`
--

DROP TABLE IF EXISTS `clinic_patient_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_patient_queue` (
  `clinic_queue_token_no` varchar(20) NOT NULL,
  `clinic_visit_id` int(11) NOT NULL,
  `clinic_visit_type` varchar(200) NOT NULL,
  `clinic_queue_assign_date` datetime NOT NULL,
  `clinic_queue_assign_by` varchar(100) NOT NULL,
  `clinic_queue_status` varchar(100) NOT NULL,
  PRIMARY KEY (`clinic_queue_token_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_patient_queue`
--

LOCK TABLES `clinic_patient_queue` WRITE;
/*!40000 ALTER TABLE `clinic_patient_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_patient_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_patient_treatment`
--

DROP TABLE IF EXISTS `clinic_patient_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_patient_treatment` (
  `treatment_id` int(11) NOT NULL,
  `clinic_visit_id` int(11) NOT NULL,
  `clinic_date` date NOT NULL,
  `prescriptionItems_ID` int(11) NOT NULL,
  `clinic_doc` varchar(100) NOT NULL,
  `clinic_diagnosis` varchar(200) NOT NULL,
  `clinic_remarks` varchar(200) NOT NULL,
  PRIMARY KEY (`treatment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_patient_treatment`
--

LOCK TABLES `clinic_patient_treatment` WRITE;
/*!40000 ALTER TABLE `clinic_patient_treatment` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_patient_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_schedule`
--

DROP TABLE IF EXISTS `clinic_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_schedule` (
  `schedule_id` int(11) NOT NULL,
  `clinic_visit_id` int(11) NOT NULL,
  `clinic_datetime` datetime NOT NULL,
  `mobile_no` int(10) NOT NULL,
  `create_user` varchar(100) NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_schedule`
--

LOCK TABLES `clinic_schedule` WRITE;
/*!40000 ALTER TABLE `clinic_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_visit`
--

DROP TABLE IF EXISTS `clinic_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_visit` (
  `clinic_visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `clinic_visit_date` date NOT NULL,
  `clinic_visit_type` varchar(200) NOT NULL,
  `clinic_visit_create_user` varchar(200) NOT NULL,
  PRIMARY KEY (`clinic_visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_visit`
--

LOCK TABLES `clinic_visit` WRITE;
/*!40000 ALTER TABLE `clinic_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_xray`
--

DROP TABLE IF EXISTS `clinic_xray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinic_xray` (
  `xray_id` int(11) NOT NULL,
  `clinic_visit_id` int(11) NOT NULL,
  `clinic_patient_name` varchar(200) NOT NULL,
  `clinic_problem` varchar(200) NOT NULL,
  `clinic_image` longblob NOT NULL,
  `clinic_remarks` varchar(200) NOT NULL,
  PRIMARY KEY (`xray_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_xray`
--

LOCK TABLES `clinic_xray` WRITE;
/*!40000 ALTER TABLE `clinic_xray` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_xray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `COMPID` int(11) NOT NULL AUTO_INCREMENT,
  `ICPCCode` varchar(8) DEFAULT NULL,
  `Name` varchar(36) DEFAULT NULL,
  `ICDCode` varchar(200) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `isNotify` tinyint(1) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`COMPID`)
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,'-30','Medical examin/health eval complete',NULL,NULL,0,1),(2,'-31','Medical examin/health eval partial',NULL,NULL,0,1),(3,'-32','Sensitivity test',NULL,NULL,0,1),(4,'-33','Microbiological/immunological test',NULL,NULL,0,1),(5,'-34','Blood test',NULL,NULL,0,1),(6,'-35','Urine test',NULL,NULL,0,1),(7,'-36','Faeces test',NULL,NULL,0,1),(8,'-37','Histological/exfoliative cytology',NULL,NULL,0,1),(9,'-38','Other laboratory test NEC',NULL,NULL,0,1),(10,'-39','Physical function test',NULL,NULL,0,1),(11,'-40','Diagnostic endoscopy',NULL,NULL,0,1),(12,'-41','Diagnostic radiology/imaging',NULL,NULL,0,1),(13,'-42','Electrical tracing',NULL,NULL,0,1),(14,'-43','Other diagnostic procedure',NULL,NULL,0,1),(15,'-44','Preventive immunization/medication',NULL,NULL,0,1),(16,'-45','Observ/health educat/advice/diet',NULL,NULL,0,1),(17,'-46','Consultation primary care provider',NULL,NULL,0,1),(18,'-47','Consultation with specialist',NULL,NULL,0,1),(19,'-48','Clarification/discussion rfe/demand',NULL,NULL,0,1),(20,'-49','Other preventive procedure',NULL,NULL,0,1),(21,'-50','Medication/prescr/renewal/inject',NULL,NULL,0,1),(22,'-51','I&d/flush/aspiration ',NULL,NULL,0,1),(23,'-52','Exc/remov/biopsy/destruc/debrid/caut',NULL,NULL,0,1),(24,'-53','Instrument/catheter/intubate/dilate',NULL,NULL,0,1),(25,'-54','Repair/fix-suture/cast/prosth device',NULL,NULL,0,1),(26,'-55','Local injection/infiltration',NULL,NULL,0,1),(27,'-56','Dressing/pressure/compress/tamponade',NULL,NULL,0,1),(28,'-57','Physical medicine/rehabilitation',NULL,NULL,0,1),(29,'-58','Therapeutic counselling/listening',NULL,NULL,0,1),(30,'-59','Other therap proced/minor surg NEC',NULL,NULL,0,1),(31,'-60','Result test/procedure',NULL,NULL,0,1),(32,'-61','Result exam/test/lett oth provider',NULL,NULL,0,1),(33,'-62','Administrative procedure',NULL,NULL,0,1),(34,'-63','Follow-up encounter unspecified',NULL,NULL,0,1),(35,'-64','Encounter/prob initiated by provider',NULL,NULL,0,1),(36,'-65','Enc/prob init by other than pt/prov',NULL,NULL,0,1),(37,'-66','Referral to non-MD provider',NULL,NULL,0,1),(38,'-67','Referral to physician/hospital',NULL,NULL,0,1),(39,'-68','Other referral NEC',NULL,NULL,0,1),(40,'-69','Other reason for encounter NEC',NULL,NULL,0,1),(41,'A01','Pain general/multiple sites','R52.0; R52.1; R52.2; R52.9',NULL,0,1),(42,'A02','Chills','R68.8',NULL,0,1),(43,'A03','Fever','R50.8; R50.9',NULL,0,1),(44,'A04','Weakness/tiredness general','G93.3; R53',NULL,0,1),(45,'A05','Feeling ill','R53',NULL,0,1),(46,'A06','Fainting/syncope','R55',NULL,0,1),(47,'A07','Coma','R40.0; R40.1; R40.2',NULL,0,1),(48,'A08','Swelling','R68.8',NULL,0,1),(49,'A09','Sweating problem',NULL,NULL,0,1),(50,'A10','Bleeding/haemorrhage NOS','R58',NULL,0,1),(51,'A11','Chest pain NOS','R07.4',NULL,0,1),(52,'A13','Concern/fear medical treatment','Z71.1',NULL,0,1),(53,'A16','Irritable infant','R68.1',NULL,0,1),(54,'A18','Concern about appearance','R46.8',NULL,0,1),(55,'A20','Euthanasia request/discussion','Z71.8',NULL,0,1),(56,'A21','Risk factor for malignancy','Z80.0; Z80.1; Z80.2; Z80.3; Z80.4; Z80.5; Z80.6; Z80.7; Z80.8; Z80.9; Z85.0; Z85.1; Z85.2; Z85.3; Z85.4; Z85.5; Z85.6; Z85.7; Z85.8; Z85.9; Z92.6',NULL,0,1),(57,'A23','Risk factor NOS','Z20.0; Z20.1; Z20.2; Z20.3; Z20.4; Z20.5; Z20.6; Z20.7; Z20.8; Z20.9; Z28.0; Z28.1; Z28.2; Z28.8; Z28.9; Z72.0; Z72.1; Z72.2; Z72.3; Z72.4; Z72.5; Z73.2; Z81.0; Z81.1; Z81.2; Z81.3; Z81.4; Z81.8; Z82.',NULL,0,1),(58,'A25','Fear of death/dying','Z71.1',NULL,0,1),(59,'A26','NOS',NULL,NULL,0,1),(60,'A27','Fear of other disease NOS','Z71.1',NULL,0,1),(61,'A28','Limited function/disability NOS','R26.3; R29.6; Z73.6; Z74.0; Z74.1; Z74.2; Z74.3; Z74.8; Z74.9; Z99.0; Z99.3; Z99.8; Z99.9',NULL,0,1),(62,'A29','General symptom/complaint other','R68.0; R68.8',NULL,0,1),(63,'A70','Tuberculosis','A15.0; A15.1; A15.2; A15.3; A15.4; A15.5; A15.6; A15.7; A15.8; A15.9; A16.0; A16.1; A16.2; A16.3; A16.4; A16.5; A16.7; A16.8; A16.9; A17.0; A17.1; A17.8; A17.9; A18.0; A18.1; A18.2; A18.3; A18.4; A18.',NULL,0,1),(64,'A71','Measles','B05.0; B05.1; B05.2; B05.3; B05.4; B05.8; B05.9',NULL,0,1),(65,'A72','Chickenpox',NULL,NULL,0,1),(66,'A73','Malaria','B50.0; B50.8; B50.9; B51.0; B51.8; B51.9; B52.0; B52.8; B52.9; B53.0; B53.1; B53.8; B54',NULL,0,1),(67,'A74','Rubella','B06.0; B06.8; B06.9',NULL,0,1),(68,'A75','Infectious mononucleosis','B27.0; B27.1; B27.8; B27.9',NULL,0,1),(69,'A76','Viral exanthem other','A88.0; B03; B04; B08.0; B08.2; B08.3; B08.4; B08.8; B09',NULL,0,1),(70,'A77','Viral disease other/NOS','A82.0; A82.1; A82.9; A90; A91; A92.0; A92.1; A92.2; A92.3; A92.4; A92.8; A92.9; A93.0; A93.1; A93.2; A93.8; A94; A95.0; A95.1; A95.9; A96.0; A96.1; A96.2; A96.8; A96.9; A98.0; A98.1; A98.2; A98.3; A98',NULL,0,1),(71,'A78','Infectious disease other/NOS','A20.0; A20.1; A20.2; A20.3; A20.7; A20.8; A20.9; A21.0; A21.1; A21.2; A21.3; A21.7; A21.8; A21.9; A22.0; A22.1; A22.2; A22.7; A22.8; A22.9; A23.0; A23.1; A23.2; A23.3; A23.8; A23.9; A24.0; A24.1; A24.',NULL,0,1),(72,'A79','Malignancy NOS','C38.8; C45.9; C46.7; C46.8; C46.9; C76.0; C76.1; C76.2; C76.3; C76.4; C76.5; C76.7; C76.8; C78.0; C78.1; C78.2; C78.3; C78.4; C78.5; C78.6; C78.7; C78.8; C79.0; C79.1; C79.2; C79.3; C79.4; C79.5; C79.',NULL,0,1),(73,'A80','Trauma/injury NOS','S11.0; S11.1; S11.2; S11.7; S11.8; S11.9; S15.0; S15.1; S15.2; S15.3; S15.7; S15.8; S15.9; S21.0; S21.1; S21.2; S21.7; S21.8; S21.9; S25.0; S25.1; S25.2; S25.3; S25.4; S25.5; S25.7; S25.8; S25.9; S26.',NULL,0,1),(74,'A81','Multiple trauma/injuries','S17.0; S17.8; S17.9; S18; S19.7; S19.8; S19.9; S28.0; S28.1; S29.0; S29.7; S29.8; S29.9; S31.7; S36.7; S36.8; S37.7; S37.8; S39.0; S39.6; S39.7; S39.8; S39.9; T00.0; T00.1; T00.2; T00.3; T00.6; T00.8;',NULL,0,1),(75,'A82','Secondary effect of trauma','T79.0; T79.1; T79.2; T79.4; T79.5; T79.7; T79.8; T79.9; T90.0; T90.1; T90.2; T90.3; T90.4; T90.5; T90.8; T90.9; T91.0; T91.1; T91.2; T91.3; T91.4; T91.5; T91.8; T91.9; T92.0; T92.1; T92.2; T92.3; T92.',NULL,0,1),(76,'A84','Poisoning by medical agent','T36.0; T36.1; T36.2; T36.3; T36.4; T36.5; T36.6; T36.7; T36.8; T36.9; T37.0; T37.1; T37.2; T37.3; T37.4; T37.5; T37.8; T37.9; T38.0; T38.1; T38.2; T38.3; T38.4; T38.5; T38.6; T38.7; T38.8; T38.9; T39.',NULL,0,1),(77,'A85','Adverse effect medical agent',NULL,NULL,0,1),(78,'A86','Toxic effect non-medicinal substance','D61.2; D64.2; T51.0; T51.1; T51.2; T51.3; T51.8; T51.9; T52.0; T52.1; T52.2; T52.3; T52.4; T52.8; T52.9; T53.0; T53.1; T53.2; T53.3; T53.4; T53.5; T53.6; T53.7; T53.9; T54.0; T54.1; T54.2; T54.3; T54.',NULL,0,1),(79,'A87','Complication of medical treatment','E89.0; E89.1; E89.2; E89.3; E89.4; E89.5; E89.6; E89.8; E89.9; G97.0; G97.1; G97.2; G97.8; G97.9; H59.0; H59.8; H59.9; H95.0; H95.1; H95.8; H95.9; I97.0; I97.1; I97.2; I97.8; I97.9; J70.0; J70.1; J70.',NULL,0,1),(80,'A88','Adverse effect physical factor','T33.0; T33.1; T33.2; T33.3; T33.4; T33.5; T33.6; T33.7; T33.8; T33.9; T34.0; T34.1; T34.2; T34.3; T34.4; T34.5; T34.6; T34.7; T34.8; T34.9; T35.0; T35.1; T35.2; T35.3; T35.4; T35.5; T35.6; T35.7; T66;',NULL,0,1),(81,'A89','Effect prosthetic device',NULL,NULL,0,1),(82,'A90','Congenital anomaly NOS/multiple','Q85.0; Q85.1; Q85.8; Q85.9; Q86.0; Q86.1; Q86.2; Q86.8; Q87.0; Q87.1; Q87.2; Q87.3; Q87.4; Q87.5; Q87.8; Q89.3; Q89.4; Q89.7; Q89.9; Q90.0; Q90.1; Q90.2; Q90.9; Q91.0; Q91.1; Q91.2; Q91.3; Q91.4; Q91.',NULL,0,1),(83,'A91','Abnormal result investigation NOS','R73.0; R73.9; R74.0; R74.8; R74.9; R76.0; R76.1; R76.2; R76.8; R76.9; R77.0; R77.1; R77.2; R77.8; R77.9; R78.0; R78.1; R78.2; R78.3; R78.4; R78.5; R78.6; R78.7; R78.8; R78.9; R79.0; R79.8; R79.9; R83.',NULL,0,1),(84,'A92','Allergy/allergic reaction NOS','T78.0; T78.1; T78.2; T78.3; T78.4',NULL,0,1),(85,'A93','Premature newborn','P07.0; P07.1; P07.2; P07.3',NULL,0,1),(86,'A94','Perinatal morbidity other','P00.0; P00.1; P00.2; P00.3; P00.4; P00.5; P00.6; P00.7; P00.8; P00.9; P01.0; P01.1; P01.2; P01.3; P01.4; P01.5; P01.6; P01.7; P01.8; P01.9; P02.0; P02.1; P02.2; P02.3; P02.4; P02.5; P02.6; P02.7; P02.',NULL,0,1),(87,'A95','Perinatal mortality','P95; R95',NULL,0,1),(88,'A96','Death','O95; O97.0; O97.1; O97.9; R95; R95.0; R95.9; R96.0; R96.1; R98; R99',NULL,0,1),(89,'A97','No disease',NULL,NULL,0,1),(90,'A98','Health maint/preventive medicine',NULL,NULL,0,1),(91,'A99','Disease/condition unspecnature/site','D15.7; D15.9; D19.7; D19.9; D36.7; D36.9; D48.9; R57.8; R57.9; R69; Z03.0; Z03.1; Z03.2; Z03.3; Z03.4; Z03.5; Z03.6; Z03.8; Z03.9; Z04.0; Z04.1; Z04.2; Z04.3; Z04.4; Z04.5; Z04.6; Z04.8; Z04.9; Z08.0;',NULL,0,1),(92,'B02','Lymph gland(s) enlarged/painful','R59.0; R59.1; R59.9',NULL,0,1),(93,'B04','Blood symptom/complaint','R68.8',NULL,0,1),(94,'B25','Fear of AIDS/HIV',NULL,NULL,0,1),(95,'B26','Fear cancer blood/lymph',NULL,NULL,0,1),(96,'B27','Fear blood/lymph disease other','Z71.1',NULL,0,1),(97,'B28','Limited function/disability (B)','Z73.6',NULL,0,1),(98,'B29','Lymph/immune mech sympt/complt other','R68.8',NULL,0,1),(99,'B70','Lymphadenitis acute',NULL,NULL,0,1),(100,'B71','Lymphadenitis chronic/non-specific','I88.0; I88.1; I88.8; I88.9',NULL,0,1),(101,'B72','Hodgkin Lymphoma','C81.0; C81.1; C81.2; C81.3; C81.7; C81.9; C82.0; C82.1; C82.2; C82.7; C82.9; C83.0; C83.1; C83.3; C83.5; C83.7; C83.8; C83.9; C84.0; C84.1; C84.4; C84.5; C85.1; C85.7; C85.9; C86.0; C86.1; C86.2; C86.',NULL,0,1),(102,'B73','Leukaemia','C91.0; C91.1; C91.3; C91.4; C91.5; C91.6; C91.7; C91.8; C91.9; C92.0; C92.1; C92.2; C92.3; C92.4; C92.5; C92.6; C92.7; C92.8; C92.9; C93.0; C93.1; C93.3; C93.7; C93.9; C94.0; C94.2; C94.3; C94.4; C94.',NULL,0,1),(103,'B74','Malignant neoplasm blood other','C26.1; C37; C46.3; C77.0; C77.1; C77.2; C77.3; C77.4; C77.5; C77.8; C77.9; C88.0; C88.2; C88.3; C88.4; C88.7; C88.9; C90.0; C90.1; C90.2; C90.3; C94.6; C96.0; C96.2; C96.4; C96.5; C96.6; C96.7; C96.8;',NULL,0,1),(104,'B75','Neoplasm blood benign/unspecified','D15.0; D36.0; D45; D47.0; D47.1; D47.2; D47.3; D47.4; D47.5; D47.7; D47.9',NULL,0,1),(105,'B76','Ruptured spleen traumatic','S36.0',NULL,0,1),(106,'B77','Injury blood/lymph/spleen other','T11.4; T13.4; T14.9;',NULL,0,1),(107,'B78','Hereditary haemolytic anaemia','other congenital anomaly blood/lymph B79',NULL,0,1),(108,'B79','Congen anomaly blood/lymph other','D61.0; D64.0; D64.4; Q89.0; Q89.8',NULL,0,1),(109,'B80','Iron deficiency anaemia','D50.0; D50.1; D50.8; D50.9',NULL,0,1),(110,'B81','Anaemia vit B12/folate deficiency','D51.0; D51.1; D51.2; D51.3; D51.8; D51.9; D52.0; D52.1; D52.8; D52.9',NULL,0,1),(111,'B82','Anaemia other/unspecified','D46.0; D46.1; D46.2; D46.4; D46.5; D46.6; D46.7; D46.9; D53.0; D53.1; D53.2; D53.8; D53.9; D55.0; D55.1; D55.2; D55.3; D55.8; D55.9; D59.0; D59.1; D59.2; D59.3; D59.4; D59.5; D59.6; D59.8; D59.9; D60.',NULL,0,1),(112,'B83','Purpura/coagulation defect','D65; D66; D67; D68.0; D68.1; D68.2; D68.3; D68.4; D68.5; D68.6; D68.8; D68.9; D69.0; D69.1; D69.2; D69.3; D69.4; D69.5; D69.6; D69.8; D69.9',NULL,0,1),(113,'B84','Unexplained abnormal white cells','D70; D71; D72.0; D72.1; D72.8; D72.9; R72',NULL,0,1),(114,'B87','Splenomegaly','R16.1; R16.2',NULL,0,1),(115,'B90','HIV-infection/AIDS','B20.0; B20.1; B20.2; B20.3; B20.4; B20.5; B20.6; B20.7; B20.8; B20.9; B21.0; B21.1; B21.2; B21.3; B21.7; B21.8; B21.9; B22.0; B22.1; B22.2; B22.7; B23.0; B23.1; B23.2; B23.8; B24; R75; Z21',NULL,0,1),(116,'B99','Blood/lymph/spleen disease other','D73.0; D73.1; D73.2; D73.3; D73.4; D73.5; D73.8; D73.9; D74.0; D74.8; D74.9; D75.0; D75.1; D75.8; D75.9; D76.1; D76.2; D76.3; D77; D80.0; D80.1; D80.2; D80.3; D80.4; D80.5; D80.6; D80.7; D80.8; D80.9;',NULL,0,1),(117,'D01','Abdominal pain/cramps general','R10.0; R10.4',NULL,0,1),(118,'D02','Abdominal pain epigastric','R10.1',NULL,0,1),(119,'D03','Heartburn','R12',NULL,0,1),(120,'D04','Rectal/anal pain','K59.4; R10.2; R10.3',NULL,0,1),(121,'D05','Perianal itching','L29.0; L29.3',NULL,0,1),(122,'D06','Abdominal pain localized other','R10.1; R10.2; R10.3',NULL,0,1),(123,'D07','Dyspepsia/indigestion','K30',NULL,0,1),(124,'D08','Flatulence/gas/belching','R14',NULL,0,1),(125,'D09','Nausea','R11',NULL,0,1),(126,'D10','Vomiting','F50.5; R11',NULL,0,1),(127,'D11','Diarrhoea','K52.9; K59.1',NULL,0,1),(128,'D12','Constipation','K56.4; K59.0',NULL,0,1),(129,'D13','Jaundice','R17',NULL,0,1),(130,'D14','Haematemesis/vomiting blood','K92.0',NULL,0,1),(131,'D15','Melaena','K92.1',NULL,0,1),(132,'D16','Rectal bleeding','K62.5',NULL,0,1),(133,'D17','Incontinence of bowel','R15',NULL,0,1),(134,'D18','Change in faeces/bowel movements','R19.4; R19.5',NULL,0,1),(135,'D19','Teeth/gum symptom/complaint','K00.7; K03.6; K03.7; K08.8',NULL,0,1),(136,'D20','Mouth/tongue/lip symptom/complaint','K13.1; K13.7; K14.1; K14.2; K14.5; K14.6; R19.6; R68.2',NULL,0,1),(137,'D21','Swallowing problem','R13',NULL,0,1),(138,'D23','Hepatomegaly','R16.0; R16.2',NULL,0,1),(139,'D24','Abdominal mass NOS','R19.0',NULL,0,1),(140,'D25','Abdominal distension','R19.0',NULL,0,1),(141,'D26','Fear of cancer of digestive system',NULL,NULL,0,1),(142,'D27','Fear of digestive disease other','Z71.1',NULL,0,1),(143,'D28','Limited function/disability (D)','Z73.6',NULL,0,1),(144,'D29','Digestive symptom/complaint other','K03.8; R18; R19.1; R19.2; R19.3; R19.8',NULL,0,1),(145,'D70','Gastrointestinal infection','cholera',NULL,0,1),(146,'D71','Mumps','B26.0; B26.1; B26.2; B26.3; B26.8; B26.9',NULL,0,1),(147,'D72','Viral hepatitis','B15.0; B15.9; B16.0; B16.1; B16.2; B16.9; B17.0; B17.1; B17.2; B17.8; B17.9; B18.0; B18.1; B18.2; B18.8; B18.9; B19.0; B19.9',NULL,0,1),(148,'D73','Gastroenteritis presumed infection','A09.0; A09.9',NULL,0,1),(149,'D74','Malignant neoplasm stomach','C16.0; C16.1; C16.2; C16.3; C16.4; C16.5; C16.6; C16.8; C16.9',NULL,0,1),(150,'D75','Malignant neoplasm colon/rectum','C18.0; C18.1; C18.2; C18.3; C18.4; C18.5; C18.6; C18.7; C18.8; C18.9; C19; C20; C21.0; C21.1; C21.2; C21.8',NULL,0,1),(151,'D76','Malignant neoplasm pancreas','C25.0; C25.1; C25.2; C25.3; C25.4; C25.7; C25.8; C25.9',NULL,0,1),(152,'D77','Malignant digestive neopl other/NOS','benign/unspecified digestive neoplasm D78',NULL,0,1),(153,'D78','Neoplasm digestive benign/unspecif','D00.0; D00.1; D00.2; D01.0; D01.1; D01.2; D01.3; D01.4; D01.5; D01.7; D01.9; D10.0; D10.1; D10.2; D10.3; D10.4; D10.5; D10.6; D10.7; D10.9; D11.0; D11.7; D11.9; D12.0; D12.1; D12.2; D12.3; D12.4; D12.',NULL,0,1),(154,'D79','Foreign body digestive system',NULL,NULL,0,1),(155,'D80','Injury digestive system other','S00.5; S01.5; S02.5; S03.2; S10.0; S36.1; S36.2; S36.3; S36.4; S36.5; S36.6; T28.0; T28.1; T28.2; T28.5; T28.6; T28.7',NULL,0,1),(156,'D81','Congenital anomaly digestive system','K00.5; Q18.0; Q18.1; Q18.2; Q18.3; Q18.4; Q18.5; Q18.6; Q18.7; Q18.8; Q18.9; Q35.1; Q35.3; Q35.5; Q35.7; Q35.9; Q36.0; Q36.1; Q36.9; Q37.0; Q37.1; Q37.2; Q37.3; Q37.4; Q37.5; Q37.8; Q37.9; Q38.0; Q38.',NULL,0,1),(157,'D82','Teeth/gum disease','K00.0; K00.1; K00.2; K00.3; K00.4; K00.6; K00.8; K00.9; K01.0; K01.1; K02.0; K02.1; K02.2; K02.3; K02.4; K02.5; K02.8; K02.9; K03.0; K03.1; K03.2; K03.3; K03.4; K03.5; K03.9; K04.0; K04.1; K04.2; K04.',NULL,0,1),(158,'D83','Mouth/tongue/lip disease','A69.0; A69.1; B00.2; B37.0; K11.0; K11.1; K11.2; K11.3; K11.4; K11.5; K11.6; K11.7; K11.8; K11.9; K12.0; K12.1; K12.2; K12.3; K13.0; K13.2; K13.3; K13.4; K13.5; K13.6; K13.7; K14.0; K14.2; K14.3; K14.',NULL,0,1),(159,'D84','Oesophagus disease','K20; K21.0; K21.9; K22.0; K22.1; K22.2; K22.3; K22.4; K22.5; K22.6; K22.7; K22.8; K22.9; K23.0; K23.1; K23.8',NULL,0,1),(160,'D85','Duodenal ulcer','K26.0; K26.1; K26.2; K26.3; K26.4; K26.5; K26.6; K26.7; K26.9',NULL,0,1),(161,'D86','Peptic ulcer other','E16.4; K25.0; K25.1; K25.2; K25.3; K25.4; K25.5; K25.6; K25.7; K25.9; K27.0; K27.1; K27.2; K27.3; K27.4; K27.5; K27.6; K27.7; K27.9; K28.0; K28.1; K28.2; K28.3; K28.4; K28.5; K28.6; K28.7; K28.9',NULL,0,1),(162,'D87','Stomach function disorder','B98.0; K29.0; K29.1; K29.2; K29.3; K29.4; K29.5; K29.6; K29.7; K29.8; K29.9; K31.0; K31.1; K31.2; K31.3; K31.4; K31.5; K31.6; K31.8; K31.9',NULL,0,1),(163,'D88','Appendicitis',NULL,NULL,0,1),(164,'D89','Inguinal hernia',NULL,NULL,0,1),(165,'D90','Hiatus hernia','K44.0; K44.1; K44.9',NULL,0,1),(166,'D91','Abdominal hernia other','K41.0; K41.1; K41.2; K41.3; K41.4; K41.9; K42.0; K42.1; K42.9; K43.0; K43.1; K43.6; K43.7; K43.9; K45.0; K45.1; K45.8; K46.0; K46.1; K46.9',NULL,0,1),(167,'D92','Diverticular disease','K57.0; K57.1; K57.2; K57.3; K57.4; K57.5; K57.8; K57.9',NULL,0,1),(168,'D93','Irritable bowel syndrome','K58.0; K58.9',NULL,0,1),(169,'D94','Chronic enteritis/ulcerative colitis','K50.0; K50.1; K50.8; K50.9; K51.0; K51.2; K51.3; K51.4; K51.5; K51.8; K51.9',NULL,0,1),(170,'D95','Anal fissure/perianal abscess','K60.0; K60.1; K60.2; K60.3; K60.4; K60.5; K61.0; K61.1; K61.2; K61.3; K61.4',NULL,0,1),(171,'D96','Worms/other parasites','B65.0; B65.1; B65.2; B65.3; B65.8; B65.9; B66.0; B66.1; B66.2; B66.3; B66.4; B66.5; B66.8; B66.9; B67.0; B67.1; B67.2; B67.3; B67.4; B67.5; B67.6; B67.7; B67.8; B67.9; B68.0; B68.1; B68.9; B69.0; B69.',NULL,0,1),(172,'D97','Liver disease NOS','B58.1; B94.2; K70.0; K70.1; K70.2; K70.3; K70.4; K70.9; K71.0; K71.1; K71.2; K71.3; K71.4; K71.5; K71.6; K71.7; K71.8; K71.9; K72.0; K72.1; K72.9; K73.0; K73.1; K73.2; K73.8; K73.9; K74.0; K74.1; K74.',NULL,0,1),(173,'D98','Cholecystitis/cholelithiasis','K80.0; K80.1; K80.2; K80.3; K80.4; K80.5; K80.8; K81.0; K81.1; K81.8; K81.9; K82.0; K82.1; K82.2; K82.3; K82.4; K82.8; K82.9; K83.0; K83.1; K83.2; K83.3; K83.4; K83.5; K83.8; K83.9; K87.0',NULL,0,1),(174,'D99','Disease digestive system other','K38.0; K38.1; K38.2; K38.3; K38.8; K38.9; K52.1; K52.2; K52.3; K52.8; K52.9; K55.0; K55.1; K55.2; K55.8; K55.9; K56.0; K56.1; K56.2; K56.3; K56.5; K56.6; K56.7; K59.2; K59.3; K59.8; K59.9; K62.2; K62.',NULL,0,1),(175,'F01','Eye pain','H57.1',NULL,0,1),(176,'F02','Red eye','H57.8',NULL,0,1),(177,'F03','Eye discharge','H04.2',NULL,0,1),(178,'F04','Visual floaters/spots','H53.1',NULL,0,1),(179,'F05','Visual disturbance other','H53.1; H53.2; H53.3; H53.8; H53.9',NULL,0,1),(180,'F13','Eye sensation abnormal','H57.8',NULL,0,1),(181,'F14','Eye movements abnormal','H55',NULL,0,1),(182,'F15','Eye appearance abnormal','H57.8',NULL,0,1),(183,'F16','Eyelid symptom/complaint','H02.2; H02.3; H02.4; H02.5; H02.6; H02.7',NULL,0,1),(184,'F17','Glasses symptom/complaint',NULL,NULL,0,1),(185,'F18','Contact lens symptom/complaint',NULL,NULL,0,1),(186,'F27','Fear of eye disease',NULL,NULL,0,1),(187,'F28','Limited function/disability (F)','H54.4; H54.5; H54.6; H54.9; Z73.6',NULL,0,1),(188,'F29','Eye symptom/complaint other','H57.8; H57.9',NULL,0,1),(189,'F70','Conjunctivitis infectious','A74.0; B30.0; B30.1; B30.2; B30.3; B30.8; B30.9; H10.0; H10.2; H10.3; H10.4; H10.5; H10.8; H10.9; H13.0; H13.1; H13.2; H13.3; H13.8',NULL,0,1),(190,'F71','Conjunctivitis allergic',NULL,NULL,0,1),(191,'F72','Blepharitis/stye/chalazion','H00.0; H00.1; H01.0; H01.1; H01.8; H01.9',NULL,0,1),(192,'F73','Eye infection/inflammation other','B00.5; B58.0; H03.0; H03.1; H03.8; H04.3; H04.4; H05.0; H05.1; H16.1; H16.2; H16.3; H16.4; H16.8; H16.9; H20.0; H20.1; H20.2; H20.8; H20.9; H21.0; H21.1; H21.2; H21.3; H21.4; H21.5; H21.8; H21.9; H22.',NULL,0,1),(193,'F74','Neoplasm of eye/adnexa','C69.0; C69.1; C69.2; C69.3; C69.4; C69.5; C69.6; C69.8; C69.9; D09.2; D31.0; D31.1; D31.2; D31.3; D31.4; D31.5; D31.6; D31.9; D48.7',NULL,0,1),(194,'F75','Contusion/haemorrhage eye','H11.3; S00.1; S05.1',NULL,0,1),(195,'F76','Foreign body in eye','T15.0; T15.1; T15.8; T15.9',NULL,0,1),(196,'F79','Injury eye other','H16.1; H44.6; H44.7; S00.2; S01.1; S05.0; S05.2; S05.3; S05.4; S05.5; S05.6; S05.7; S05.8; S05.9; S09.9; T26.0; T26.1; T26.2; T26.3; T26.4; T26.5; T26.6; T26.7; T26.8; T26.9',NULL,0,1),(197,'F80','Blocked lacrimal duct of infant',NULL,NULL,0,1),(198,'F81','Congenital anomaly eye other','Q10.0; Q10.1; Q10.2; Q10.3; Q10.4; Q10.6; Q10.7; Q11.0; Q11.1; Q11.2; Q11.3; Q12.0; Q12.1; Q12.2; Q12.3; Q12.4; Q12.8; Q12.9; Q13.0; Q13.1; Q13.2; Q13.3; Q13.4; Q13.5; Q13.8; Q13.9; Q14.0; Q14.1; Q14.',NULL,0,1),(199,'F82','Detached retina','H33.0; H33.1; H33.2; H33.3; H33.4; H33.5',NULL,0,1),(200,'F83','Retinopathy','e.g. diabetes T89',NULL,0,1),(201,'F84','Macular degeneration','H35.3',NULL,0,1),(202,'F85','Corneal ulcer','H16.0; H19.0; H19.1; H19.2; H19.3; H19.8',NULL,0,1),(203,'F86','Trachoma',NULL,NULL,0,1),(204,'F91','Refractive error','H44.2; H52.0; H52.1; H52.2; H52.3; H52.4; H52.5; H52.6; H52.7',NULL,0,1),(205,'F92','Cataract','H25.0; H25.1; H25.2; H25.8; H25.9; H26.0; H26.1; H26.2; H26.3; H26.4; H26.8; H26.9; H28.0; H28.1; H28.2; H28.8',NULL,0,1),(206,'F93','Glaucoma','H40.0; H40.1; H40.2; H40.3; H40.4; H40.5; H40.6; H40.8; H40.9; H42.0; H42.8',NULL,0,1),(207,'F94','Blindness','H54.0; H54.1; H54.2; H54.3',NULL,0,1),(208,'F95','Strabismus','H49.0; H49.1; H49.2; H49.3; H49.4; H49.8; H49.9; H50.0; H50.1; H50.2; H50.3; H50.4; H50.5; H50.6; H50.8; H50.9; H51.0; H51.1; H51.2; H51.8; H51.9',NULL,0,1),(209,'F99','Eye/adnexa disease other','H02.0; H02.1; H02.8; H02.9; H04.0; H04.1; H04.5; H04.6; H04.8; H04.9; H05.2; H05.3; H05.4; H05.5; H05.8; H05.9; H06.0; H06.1; H06.2; H06.3; H11.0; H11.1; H11.2; H11.4; H11.8; H11.9; H15.0; H15.1; H15.',NULL,0,1),(210,'H01','Ear pain/earache','H92.0',NULL,0,1),(211,'H02','Hearing complaint','H93.2',NULL,0,1),(212,'H03','ringing/buzzing ear',NULL,NULL,0,1),(213,'H04','Ear discharge','H92.1',NULL,0,1),(214,'H05','Bleeding ear','H92.2',NULL,0,1),(215,'H13','Plugged feeling ear','H93.8',NULL,0,1),(216,'H15','Concern with appearance of ears','R46.8',NULL,0,1),(217,'H27','Fear of ear disease',NULL,NULL,0,1),(218,'H28','Limited function/disability (H)','Z73.6',NULL,0,1),(219,'H29','Ear symptom/complaint other','H93.8; H93.9',NULL,0,1),(220,'H70','Otitis externa','H60.0; H60.1; H60.2; H60.3; H60.4; H60.5; H60.8; H60.9; H62.0; H62.1; H62.2; H62.3; H62.4; H62.8',NULL,0,1),(221,'H71','Acute otitis media/myringitis','H66.0; H66.4; H66.9; H67.0; H67.1; H67.8; H70.0; H73.0',NULL,0,1),(222,'H72','Serous otitis media','H65.0; H65.1; H65.2; H65.3; H65.4; H65.9',NULL,0,1),(223,'H73','Eustachian salpingitis','H68.0; H68.1; H69.0; H69.8; H69.9',NULL,0,1),(224,'H74','Chronic otitis media','H66.1; H66.2; H66.3; H66.9; H70.1; H70.2; H70.8; H70.9; H71; H73.1; H75.0; H75.8',NULL,0,1),(225,'H75','Neoplasm of ear','C30.1; C44.2; C49.0; D02.3; D04.2; D14.0; D21.0; D23.2',NULL,0,1),(226,'H76','Foreign body in ear','T16',NULL,0,1),(227,'H77','Perforation ear drum','H72.0; H72.1; H72.2; H72.8; H72.9',NULL,0,1),(228,'H78','Superficial injury of ear','S00.4',NULL,0,1),(229,'H79','Ear injury other','S01.3; S07.8; S08.1; S09.2; T70.0',NULL,0,1),(230,'H80','Congenital anomaly of ear','Q16.0; Q16.1; Q16.2; Q16.3; Q16.4; Q16.5; Q16.9; Q17.0; Q17.1; Q17.2; Q17.3; Q17.4; Q17.5; Q17.8; Q17.9',NULL,0,1),(231,'H81','Excessive ear wax','H61.2',NULL,0,1),(232,'H82','Vertiginous syndrome','A88.1; H81.0; H81.1; H81.2; H81.3; H81.4; H81.8; H81.9; H82; H83.0; H83.1; H83.2',NULL,0,1),(233,'H83','Otosclerosis','H80.0; H80.1; H80.2; H80.8; H80.9',NULL,0,1),(234,'H84','Presbyacusis','hearing impairment H28',NULL,0,1),(235,'H85','Acoustic trauma','H83.3',NULL,0,1),(236,'H86','Deafness','H90.0; H90.1; H90.2; H90.3; H90.4; H90.5; H90.6; H90.7; H90.8; H91.0; H91.2; H91.3; H91.8; H91.9',NULL,0,1),(237,'H99','Ear/mastoid disease other','H61.0; H61.1; H61.3; H61.8; H61.9; H73.8; H73.9; H74.0; H74.1; H74.2; H74.3; H74.4; H74.8; H74.9; H83.8; H83.9; H93.0; H93.3; H93.8; H93.9; H94.0; H94.8',NULL,0,1),(238,'K01','Heart pain','R07.2',NULL,0,1),(239,'K02','Pressure/tightness of heart','R07.2',NULL,0,1),(240,'K03','Cardiovascular pain NOS','R09.8',NULL,0,1),(241,'K04','Palpitations/awareness of heart','R00.0; R00.1; R00.2',NULL,0,1),(242,'K05','Irregular heartbeat other','R00.8',NULL,0,1),(243,'K06','Prominent veins','I78.1; I87.8',NULL,0,1),(244,'K07','Swollen ankles/oedema','R60.0; R60.1; R60.9',NULL,0,1),(245,'K22','Risk factor cardiovascular disease','Z82.3; Z82.4; Z86.7',NULL,0,1),(246,'K24','Fear of heart disease',NULL,NULL,0,1),(247,'K25','Fear of hypertension',NULL,NULL,0,1),(248,'K27','Fear cardiovascular disease other','Z71.1',NULL,0,1),(249,'K28','Limited function/disability (K)','Z73.6',NULL,0,1),(250,'K29','Cardiovascular sympt/complt other','R03.1; R09.8',NULL,0,1),(251,'K70','Infection of circulatory system','A39.5; B33.2; B37.6; I30.1; I32.0; I32.1; I33.0; I33.9; I38; I40.0; I40.1; I40.8; I40.9; I41.0; I41.1; I41.2; I41.8',NULL,0,1),(252,'K71','Rheumatic fever/heart disease','I00; I01.0; I01.1; I01.2; I01.8; I01.9; I02.0; I02.9; I05.0; I05.1; I05.2; I05.8; I05.9; I06.0; I06.1; I06.2; I06.8; I06.9; I07.0; I07.1; I07.2; I07.8; I07.9; I08.0; I08.1; I08.2; I08.3; I08.8; I08.9;',NULL,0,1),(253,'K72','Neoplasm cardiovascular','C38.0; C45.2; D15.1; D15.2; D48.7',NULL,0,1),(254,'K73','Congenital anomaly cardiovascular','I42.4; Q20.0; Q20.1; Q20.2; Q20.3; Q20.4; Q20.5; Q20.6; Q20.8; Q20.9; Q21.0; Q21.1; Q21.2; Q21.3; Q21.4; Q21.8; Q21.9; Q22.0; Q22.1; Q22.2; Q22.3; Q22.4; Q22.5; Q22.6; Q22.8; Q22.9; Q23.0; Q23.1; Q23.',NULL,0,1),(255,'K74','Ischaemic heart dis with angina','I20.0; I20.1; I20.8; I20.9; I24.0; I24.8; I24.9',NULL,0,1),(256,'K75','Acute myocardial infarction','heart pain K01; angina pectoris K74; chronic ischaemic heart disease K76',NULL,0,1),(257,'K76','Ischaemic heart dis without angina','I25.0; I25.1; I25.2; I25.3; I25.4; I25.5; I25.6; I25.8; I25.9',NULL,0,1),(258,'K77','Heart failure',NULL,NULL,0,1),(259,'K78','Atrial fibrillation/flutter','I48',NULL,0,1),(260,'K79','Paroxysmal tachycardia','I47.0; I47.1; I47.2; I47.9',NULL,0,1),(261,'K80','Cardiac arrhythmia NOS','I49.0; I49.1; I49.2; I49.3; I49.4; I49.5; I49.8; I49.9',NULL,0,1),(262,'K81','Heart/arterial murmur NOS','R01.0; R01.1; R01.2; R09.8',NULL,0,1),(263,'K82','Pulmonary heart disease','I27.0; I27.1; I27.2; I27.8; I27.9; I28.0; I28.1; I28.8; I28.9',NULL,0,1),(264,'K83','Heart valve disease NOS','I34.0; I34.1; I34.2; I34.8; I34.9; I35.0; I35.1; I35.2; I35.8; I35.9; I36.0; I36.1; I36.2; I36.8; I36.9; I37.0; I37.1; I37.2; I37.8; I37.9; I39.0; I39.1; I39.2; I39.3; I39.4; I39.8',NULL,0,1),(265,'K84','Heart disease other','I30.0; I30.8; I30.9; I31.0; I31.1; I31.2; I31.3; I31.8; I31.9; I32.8; I42.0; I42.1; I42.2; I42.3; I42.5; I42.6; I42.7; I42.8; I42.9; I43.0; I43.1; I43.2; I43.8; I44.0; I44.1; I44.2; I44.3; I44.4; I44.',NULL,0,1),(266,'K85','Elevated blood pressure','R03.0',NULL,0,1),(267,'K86','Hypertension uncomplicated',NULL,NULL,0,1),(268,'K87','Hypertension complicated',NULL,NULL,0,1),(269,'K88','Postural hypotension','I95.0; I95.1; I95.8; I95.9',NULL,0,1),(270,'K89','Transient cerebral ischaemia',NULL,NULL,0,1),(271,'K90','Stroke/cerebrovascular accident',NULL,NULL,0,1),(272,'K91','Cerebrovascular disease','I65.0; I65.1; I65.2; I65.3; I65.8; I65.9; I66.0; I66.1; I66.2; I66.3; I66.4; I66.8; I66.9; I67.0; I67.1; I67.2; I67.3; I67.5; I67.6; I67.7; I67.8; I67.9; I68.0; I68.1; I68.2; I68.8; I69.0; I69.1; I69.',NULL,0,1),(273,'K92','Atherosclerosis/periph vascular dis','I70.0; I70.1; I70.2; I70.8; I70.9; I73.0; I73.1; I73.8; I73.9; I74.0; I74.1; I74.2; I74.3; I74.4; I74.5; I74.8; I74.9; R02',NULL,0,1),(274,'K93','Pulmonary embolism',NULL,NULL,0,1),(275,'K94','Phlebitis/thrombophlebitis','I80.0; I80.1; I80.2; I80.3; I80.8; I80.9; I81; I82.0; I82.1; I82.2; I82.3; I82.8; I82.9; I87.0',NULL,0,1),(276,'K95','Varicose veins of leg','I83.1; I83.9; I87.2',NULL,0,1),(277,'K96','Haemorrhoids','I84.0; I84.1; I84.2; I84.3; I84.4; I84.5; I84.6; I84.7; I84.8; I84.9',NULL,0,1),(278,'K99','Cardiovascular disease other','I71.0; I71.1; I71.2; I71.3; I71.4; I71.5; I71.6; I71.8; I71.9; I72.0; I72.1; I72.2; I72.3; I72.4; I72.5; I72.6; I72.8; I72.9; I77.0; I77.1; I77.2; I77.3; I77.4; I77.5; I77.6; I77.8; I77.9; I78.0; I78.',NULL,0,1),(279,'L01','Neck symptom/complaint','M54.0; M54.2',NULL,0,1),(280,'L02','Back symptom/complaint','M54.0; M54.6; M54.8; M54.9',NULL,0,1),(281,'L03','Low back symptom/complaint','M53.3; M54.0; M54.5',NULL,0,1),(282,'L04','Chest symptom/complaint','R07.3; R29.8',NULL,0,1),(283,'L05','Flank/axilla symptom/complaint','R29.8',NULL,0,1),(284,'L07','Jaw symptom/complaint','K07.6; K10.8; M25.4; M25.5; M25.6; R29.8',NULL,0,1),(285,'L08','Shoulder symptom/complaint','M25.4; M25.5; M25.6',NULL,0,1),(286,'L09','Arm symptom/complaint','M79.6; R29.8',NULL,0,1),(287,'L10','Elbow symptom/complaint','M25.4; M25.5; M25.6',NULL,0,1),(288,'L11','Wrist symptom/complaint','M25.4; M25.5; M25.6',NULL,0,1),(289,'L12','Hand/finger symptom/complaint','M25.4; M25.5; M25.6; M79.6; R29.8',NULL,0,1),(290,'L13','Hip symptom/complaint','M25.4; M25.5; M25.6; R29.4',NULL,0,1),(291,'L14','Leg/thigh symptom/complaint','M79.6; R29.8',NULL,0,1),(292,'L15','Knee symptom/complaint','M25.4; M25.5; M25.6',NULL,0,1),(293,'L16','Ankle symptom/complaint','M25.4; M25.5; M25.6',NULL,0,1),(294,'L17','Foot/toe symptom/complaint','M25.4; M25.5; M25.6; M77.4; M79.6; R29.8',NULL,0,1),(295,'L18','Muscle pain','M60.1; M60.2; M60.8; M60.9; M79.0; M79.1; M79.3; M79.6; M79.7; R25.2',NULL,0,1),(296,'L19','Muscle symptom/complaint NOS','M62.5; M62.6; M79.9',NULL,0,1),(297,'L20','Joint symptom/complaint NOS','M25.4; M25.5; M25.6; M25.8; M25.9',NULL,0,1),(298,'L26','Fear of cancer musculoskeletal',NULL,NULL,0,1),(299,'L27','Fear of musculoskeletal dis other','Z71.1',NULL,0,1),(300,'L28','Limited function/disability (L)','R26.2; Z73.6',NULL,0,1),(301,'L29','Musculoskeletal sympt/complt other','R26.8; R29.3; R29.8',NULL,0,1),(302,'L70','Infection of musculoskeletal system','M00.0; M00.1; M00.2; M00.8; M00.9; M01.0; M01.1; M01.2; M01.3; M01.4; M01.5; M01.6; M01.8; M46.2; M46.3; M46.4; M46.5; M60.0; M65.0; M65.1; M71.0; M71.1; M72.6; M72.8; M86.0; M86.1; M86.2; M86.3; M86.',NULL,0,1),(303,'L71','Malignant neoplasm musculoskeletal','C40.0; C40.1; C40.2; C40.3; C40.8; C40.9; C41.0; C41.1; C41.2; C41.3; C41.4; C41.8; C41.9; C46.1; C49.0; C49.1; C49.2; C49.3; C49.4; C49.5; C49.6; C49.8; C49.9',NULL,0,1),(304,'L72','Fracture: radius/ulna','S52.0; S52.1; S52.2; S52.3; S52.4; S52.5; S52.6; S52.7; S52.8; S52.9',NULL,0,1),(305,'L73','Fracture: tibia/fibula','S82.1; S82.2; S82.3; S82.4; S82.5; S82.6; S82.7; S82.8; S82.9',NULL,0,1),(306,'L74','Fracture: hand/foot bone','S62.0; S62.1; S62.2; S62.3; S62.4; S62.5; S62.6; S62.7; S62.8; S92.0; S92.1; S92.2; S92.3; S92.4; S92.5; S92.7; S92.9',NULL,0,1),(307,'L75','Fracture: femur','S72.0; S72.1; S72.2; S72.3; S72.4; S72.7; S72.8; S72.9',NULL,0,1),(308,'L76','Fracture: other','S02.2; S02.3; S02.4; S02.6; S02.7; S02.8; S02.9; S12.0; S12.1; S12.2; S12.7; S12.8; S12.9; S22.0; S22.1; S22.2; S22.3; S22.4; S22.5; S22.8; S22.9; S32.0; S32.1; S32.2; S32.3; S32.4; S32.5; S32.7; S32.',NULL,0,1),(309,'L77','Sprain/strain of ankle','S93.4',NULL,0,1),(310,'L78','Sprain/strain of knee','S83.4; S83.6',NULL,0,1),(311,'L79','Sprain/strain of joint NOS','S03.4; S03.5; S13.4; S13.5; S13.6; S23.3; S23.4; S23.5; S33.6; S43.4; S43.5; S43.6; S43.7; S53.2; S53.3; S53.4; S63.3; S63.4; S63.5; S63.6; S63.7; S73.1; S93.2; S93.5; S93.6; T09.2; T11.2; T13.2; T14.',NULL,0,1),(312,'L80','Dislocation/subluxation',NULL,NULL,0,1),(313,'L81','Injury musculoskeletal NOS','M79.5; S09.1; S16; S20.2; S30.0; S30.1; S33.4; S39.0; S39.8; S39.9; S40.0; S46.0; S46.1; S46.2; S46.3; S46.7; S46.8; S46.9; S47; S48.0; S48.1; S48.9; S49.7; S49.8; S49.9; S50.0; S50.1; S56.0; S56.1; S',NULL,0,1),(314,'L82','Congenital anomaly musculoskeletal','Q65.0; Q65.1; Q65.2; Q65.3; Q65.4; Q65.5; Q65.6; Q65.8; Q65.9; Q66.0; Q66.1; Q66.2; Q66.3; Q66.4; Q66.5; Q66.6; Q66.7; Q66.8; Q66.9; Q67.0; Q67.1; Q67.2; Q67.3; Q67.4; Q67.5; Q67.6; Q67.7; Q67.8; Q68.',NULL,0,1),(315,'L83','Neck syndrome','M43.0; M43.1; M43.3; M43.4; M43.6; M46.0; M47.1; M47.2; M47.8; M47.9; M48.0; M48.1; M48.2; M48.3; M48.4; M48.5; M48.8; M48.9; M50.0; M50.1; M50.2; M50.3; M50.8; M50.9; M53.0; M53.1',NULL,0,1),(316,'L84','Back syndrome without radiat pain','M43.0; M43.1; M43.5; M46.0; M46.1; M46.8; M46.9; M47.0; M47.8; M47.9; M48.0; M48.1; M48.2; M48.3; M48.4; M48.5; M48.8; M48.9; M51.2; M51.3; M51.4; M51.8; M51.9; M53.2; M53.3; M53.8; M53.9; S33.5; S33.',NULL,0,1),(317,'L85','Acquired deformity of spine','M40.0; M40.1; M40.2; M40.3; M40.4; M40.5; M41.0; M41.1; M41.2; M41.3; M41.4; M41.5; M41.8; M41.9; M43.8; M43.9',NULL,0,1),(318,'L86','Back syndrome with radiating pain','G55.0; G55.1; G55.2; G55.3; G55.8; M47.1; M47.2; M51.0; M51.1; M51.2; M51.3; M51.4; M51.8; M51.9; M54.3; M54.4',NULL,0,1),(319,'L87','Bursitis/tendinitis/synovitis NOS','M65.2; M65.3; M65.4; M65.8; M65.9; M67.3; M67.4; M70.0; M70.1; M70.2; M70.3; M70.4; M70.5; M70.6; M70.7; M70.8; M70.9; M71.2; M71.3; M71.4; M71.5; M71.8; M71.9; M72.0; M72.1; M72.2; M72.4; M72.9; M76.',NULL,0,1),(320,'L88','Rheumatoid/seropositive arthritis','M05.0; M05.1; M05.2; M05.3; M05.8; M05.9; M06.0; M06.1; M06.2; M06.3; M06.4; M06.8; M06.9; M08.0; M08.1; M08.2; M08.3; M08.4; M08.8; M08.9; M45',NULL,0,1),(321,'L89','Osteoarthrosis of hip','M16.0; M16.1; M16.2; M16.3; M16.4; M16.5; M16.6; M16.7; M16.9',NULL,0,1),(322,'L90','Osteoarthrosis of knee','M17.0; M17.1; M17.2; M17.3; M17.4; M17.5; M17.9',NULL,0,1),(323,'L91','Osteoarthrosis other','M13.0; M13.1; M13.8; M13.9; M15.0; M15.1; M15.2; M15.3; M15.4; M15.8; M15.9; M18.0; M18.1; M18.2; M18.3; M18.4; M18.5; M18.9; M19.0; M19.1; M19.2; M19.8; M19.9',NULL,0,1),(324,'L92','Shoulder syndrome','M19.0; M19.1; M19.2; M19.8; M19.9; M75.0; M75.1; M75.2; M75.3; M75.4; M75.5; M75.8; M75.9',NULL,0,1),(325,'L93','Tennis elbow','M77.1',NULL,0,1),(326,'L94','Osteochondrosis','M42.0; M42.1; M42.9; M91.0; M91.1; M91.2; M91.3; M91.8; M91.9; M92.0; M92.1; M92.2; M92.3; M92.4; M92.5; M92.6; M92.7; M92.8; M92.9; M93.0; M93.1; M93.2; M93.8; M93.9',NULL,0,1),(327,'L95','Osteoporosis','M80.0; M80.1; M80.2; M80.3; M80.4; M80.5; M80.8; M80.9; M81.0; M81.1; M81.2; M81.3; M81.4; M81.5; M81.6; M81.8; M81.9; M82.0; M82.1; M82.8',NULL,0,1),(328,'L96','Acute internal damage knee',NULL,NULL,0,1),(329,'L97','Neoplasm musculoskel benign/unspec','D16.0; D16.1; D16.2; D16.3; D16.4; D16.5; D16.6; D16.7; D16.8; D16.9; D21.0; D21.1; D21.2; D21.3; D21.4; D21.5; D21.6; D21.9; D48.0; D48.1; K10.1',NULL,0,1),(330,'L98','Acquired deformity of limb','M20.0; M20.1; M20.2; M20.3; M20.4; M20.5; M20.6; M21.0; M21.1; M21.2; M21.3; M21.4; M21.5; M21.6; M21.7; M21.8; M21.9',NULL,0,1),(331,'L99','Musculoskeletal disease other','K09.2; K10.9; M02.0; M02.1; M02.2; M02.3; M02.8; M02.9; M03.0; M03.1; M03.2; M03.6; M07.0; M07.1; M07.2; M07.3; M07.4; M07.5; M07.6; M09.0; M09.1; M09.2; M09.8; M12.0; M12.1; M12.2; M12.3; M12.4; M12.',NULL,0,1),(332,'N01','Headache','G44.3; G44.8; R51',NULL,0,1),(333,'N03','Pain face','G50.1; R51',NULL,0,1),(334,'N04','Restless legs','G25.8',NULL,0,1),(335,'N05','Tingling fingers/feet/toes','R20.2',NULL,0,1),(336,'N06','Sensation disturbance other','R20.0; R20.1; R20.3; R20.8',NULL,0,1),(337,'N07','Convulsion/seizure','R56.0; R56.8',NULL,0,1),(338,'N08','Abnormal involuntary movements','G25.0; G25.1; G25.2; G25.3; G25.4; G25.5; G25.6; G25.8; G25.9; R25.0; R25.1; R25.3; R25.8; R29.0',NULL,0,1),(339,'N16','Disturbance of smell/taste','R43.0; R43.1; R43.2; R43.8',NULL,0,1),(340,'N17','Vertigo/dizziness','R42',NULL,0,1),(341,'N18','Paralysis/weakness','G81.0; G81.1; G81.9; G82.0; G82.1; G82.2; G82.3; G82.4; G82.5; G83.0; G83.1; G83.2; G83.3; G83.4; G83.8; G83.9; G98',NULL,0,1),(342,'N19','Speech disorder','R47.0; R47.1; R47.8',NULL,0,1),(343,'N26','Fear cancer neurological system',NULL,NULL,0,1),(344,'N27','Fear of neurological disease other','Z71.1',NULL,0,1),(345,'N28','Limited function/disability (N)','Z73.6',NULL,0,1),(346,'N29','Neurological sympt/complt other','M79.2; R26.0; R26.1; R26.8; R27.0; R27.8; R29.0; R29.1; R29.2; R29.8',NULL,0,1),(347,'N70','Poliomyelitis','A80.0; A80.1; A80.2; A80.3; A80.4; A80.9; A85.0; B91; G14',NULL,0,1),(348,'N71','Meningitis/encephalitis','A32.1; A39.0; A83.0; A83.1; A83.2; A83.3; A83.4; A83.5; A83.6; A83.8; A83.9; A84.0; A84.1; A84.8; A84.9; A85.1; A85.2; A85.8; A86; A87.0; A87.1; A87.2; A87.8; A87.9; B00.3; B00.4; B37.5; B58.2; B94.1;',NULL,0,1),(349,'N72','Tetanus',NULL,NULL,0,1),(350,'N73','Neurological infection other','A81.0; A81.1; A81.2; A81.8; A81.9; A88.8; A89; G06.0; G06.1; G06.2; G07; G08; G09',NULL,0,1),(351,'N74','Malignant neoplasm nervous system','C47.0; C47.1; C47.2; C47.3; C47.4; C47.5; C47.6; C47.8; C47.9; C70.0; C70.1; C70.9; C71.0; C71.1; C71.2; C71.3; C71.4; C71.5; C71.6; C71.7; C71.8; C71.9; C72.0; C72.1; C72.2; C72.3; C72.4; C72.5; C72.',NULL,0,1),(352,'N75','Benign neoplasm nervous system','D32.0; D32.1; D32.9; D33.0; D33.1; D33.2; D33.3; D33.4; D33.7; D33.9; D36.1',NULL,0,1),(353,'N76','Neoplasm nervous system unspecified','D42.0; D42.1; D42.9; D43.0; D43.1; D43.2; D43.3; D43.4; D43.7; D43.9; D48.2',NULL,0,1),(354,'N79','Concussion','S06.0',NULL,0,1),(355,'N80','Head injury other',NULL,NULL,0,1),(356,'N81','Injury nervous system other','S04.0; S04.1; S04.2; S04.3; S04.4; S04.5; S04.6; S04.7; S04.8; S04.9; S09.9; S14.0; S14.1; S14.2; S14.3; S14.4; S14.5; S14.6; S24.0; S24.1; S24.2; S24.3; S24.4; S24.5; S24.6; S34.0; S34.1; S34.2; S34.',NULL,0,1),(357,'N85','Congenital anomaly neurological','Q00.0; Q00.1; Q00.2; Q01.0; Q01.1; Q01.2; Q01.8; Q01.9; Q02; Q03.0; Q03.1; Q03.8; Q03.9; Q04.0; Q04.1; Q04.2; Q04.3; Q04.4; Q04.5; Q04.6; Q04.8; Q04.9; Q05.0; Q05.1; Q05.2; Q05.3; Q05.4; Q05.5; Q05.6;',NULL,0,1),(358,'N86','Multiple sclerosis','G35',NULL,0,1),(359,'N87','Parkinsonism',NULL,NULL,0,1),(360,'N88','Epilepsy',NULL,NULL,0,1),(361,'N89','Migraine','G43.0; G43.1; G43.2; G43.3; G43.8; G43.9; G44.1',NULL,0,1),(362,'N90','Cluster headache','sometimes associated with conjunctival injection',NULL,0,1),(363,'N91','Facial paralysis/bell\'s palsy','G51.0; G51.1; G51.2; G51.3; G51.4; G51.8; G51.9; G53.0; G53.1; G53.2; G53.3; G53.8',NULL,0,1),(364,'N92','Trigeminal neuralgia','neuralgia NOS N99',NULL,0,1),(365,'N93','Carpal tunnel syndrome',NULL,NULL,0,1),(366,'N94','Peripheral neuritis/neuropathy',NULL,NULL,0,1),(367,'N95','Tension headache',NULL,NULL,0,1),(368,'N99','Neurological disease other','E51.2; G10; G11.0; G11.1; G11.2; G11.3; G11.4; G11.8; G11.9; G12.0; G12.1; G12.2; G12.8; G12.9; G13.0; G13.1; G13.2; G13.8; G23.0; G23.1; G23.2; G23.8; G23.9; G24.0; G24.1; G24.2; G24.3; G24.4; G24.5;',NULL,0,1),(369,'P01','Feeling anxious/nervous/tense','R45.0',NULL,0,1),(370,'P02','Acute stress reaction',NULL,NULL,0,1),(371,'P03','Feeling depressed','R45.2; R45.3',NULL,0,1),(372,'P04','Feeling/behaving irritable/angry',NULL,NULL,0,1),(373,'P05','feeling/behaving old',NULL,NULL,0,1),(374,'P06','Sleep disturbance',NULL,NULL,0,1),(375,'P07','Sexual desire reduced',NULL,NULL,0,1),(376,'P08','Sexual fulfilment reduced',NULL,NULL,0,1),(377,'P09','Sexual preference concern',NULL,NULL,0,1),(378,'P10','Stammering/stuttering/tic',NULL,NULL,0,1),(379,'P11','Eating problem in child',NULL,NULL,0,1),(380,'P12','Bedwetting/enuresis',NULL,NULL,0,1),(381,'P13','Encopresis/bowel training problem',NULL,NULL,0,1),(382,'P15','Chronic alcohol abuse',NULL,NULL,0,1),(383,'P16','Acute alcohol abuse',NULL,NULL,0,1),(384,'P17','Tobacco abuse',NULL,NULL,0,1),(385,'P18','Medication abuse',NULL,NULL,0,1),(386,'P19','Drug abuse',NULL,NULL,0,1),(387,'P20','Memory disturbance','R41.0; R41.1; R41.2; R41.3; R41.8',NULL,0,1),(388,'P22','Child behaviour symptom/complaint','F91.0; F91.1; F91.2; F91.3; F91.8; F91.9; F92.0; F92.8; F92.9; F93.0; F93.1; F93.2; F93.3; F93.8; F93.9; F94.0; F94.1; F94.2; F94.8; F94.9; F98.8; F98.9; R62.0',NULL,0,1),(389,'P23','Adolescent behaviour sympt/compl','F91.0; F91.1; F91.2; F91.3; F91.8; F91.9; F92.0; F92.8; F92.9; F94.0; F94.1; F94.2; F94.8; F94.9; F98.8; F98.9',NULL,0,1),(390,'P24','Specific learning problem',NULL,NULL,0,1),(391,'P25','Phase of life problem adult','Z60.0',NULL,0,1),(392,'P27','Fear of mental disorder',NULL,NULL,0,1),(393,'P28','Limited function/disability (P)','Z73.6',NULL,0,1),(394,'P29','Psychological sympt/compl other','F50.8; F50.9; F63.3; F98.8; F98.9; R44.0; R44.1; R44.2; R44.3; R44.8; R45.7; R45.8; R46.0; R46.1; R46.2; R46.3; R46.4; R46.5; R46.6; R46.7; R46.8; R63.6; Z64.2; Z64.3; Z73.0; Z73.1; Z73.3',NULL,0,1),(395,'P70','Dementia',NULL,NULL,0,1),(396,'P71','Organic psychosis other',NULL,NULL,0,1),(397,'P72','Schizophrenia',NULL,NULL,0,1),(398,'P73','Affective psychosis',NULL,NULL,0,1),(399,'P74','Anxiety disorder/anxiety state',NULL,NULL,0,1),(400,'P75','Somatization disorder',NULL,NULL,0,1),(401,'P76','Depressive disorder',NULL,NULL,0,1),(402,'P77','Suicide/suicide attempt','Z91.5',NULL,0,1),(403,'P78','Neuraesthenia/surmenage','F48.0',NULL,0,1),(404,'P79','Phobia/compulsive disorder','F40.0; F40.1; F40.2; F40.8; F40.9; F42.0; F42.1; F42.2; F42.8; F42.9',NULL,0,1),(405,'P80','Personality disorder',NULL,NULL,0,1),(406,'P81','Hyperkinetic disorder',NULL,NULL,0,1),(407,'P82','Post-traumatic stress disorder',NULL,NULL,0,1),(408,'P85','Mental retardation',NULL,NULL,0,1),(409,'P86','Anorexia nervosa/bulimia','eating disorder, food refusal P11; eating disorder, food refusal P29; feeding problem T04; feeding problem T05',NULL,0,1),(410,'P98','Psychosis NOS/other','F23.0; F23.1; F23.2; F23.3; F23.8; F23.9; F29; F53.1',NULL,0,1),(411,'P99','Psychological disorders other','F48.1; F48.8; F48.9; F53.8; F53.9; F54; F59; F84.0; F84.1; F84.2; F84.3; F84.4; F84.5; F84.8; F84.9; F88; F89; F99',NULL,0,1),(412,'R01','Pain respiratory system','R07.1',NULL,0,1),(413,'R02','Shortness of breath/dyspnoea','R06.0',NULL,0,1),(414,'R03','Wheezing','R06.2',NULL,0,1),(415,'R04','Breathing problem other','R06.1; R06.3; R06.5; R06.8',NULL,0,1),(416,'R05','Cough','R05',NULL,0,1),(417,'R06','Nose bleed/epistaxis','R04.0',NULL,0,1),(418,'R07','Sneezing/nasal congestion','R06.7',NULL,0,1),(419,'R08','Nose symptom/complaint other','J34.8',NULL,0,1),(420,'R09','Sinus symptom/complaint','J34.8',NULL,0,1),(421,'R21','Throat symptom/complaint','R07.0; R09.8',NULL,0,1),(422,'R23','Voice symptom/complaint','R49.0; R49.1; R49.2; R49.8',NULL,0,1),(423,'R24','Haemoptysis','R04.2',NULL,0,1),(424,'R25','Sputum/phlegm abnormal','R09.3',NULL,0,1),(425,'R26','Fear cancer respiratory system',NULL,NULL,0,1),(426,'R27','Fear of respiratory disease other','Z71.1',NULL,0,1),(427,'R28','Limited function/disability (R)','Z73.6; Z99.1',NULL,0,1),(428,'R29','Respiratory symptom/complaint other','R04.1; R04.8; R04.9; R06.6; R09.0; R09.2; R09.8',NULL,0,1),(429,'R71','Whooping cough','A37.0; A37.1; A37.8; A37.9',NULL,0,1),(430,'R72','Strep throat',NULL,NULL,0,1),(431,'R73','Boil/abscess nose','J34.0',NULL,0,1),(432,'R74','Upper respiratory infection acute','B00.2; B08.5; J00; J02.8; J02.9; J06.0; J06.8; J06.9',NULL,0,1),(433,'R75','Sinusitis acute/chronic','J01.0; J01.1; J01.2; J01.3; J01.4; J01.8; J01.9; J32.0; J32.1; J32.2; J32.3; J32.4; J32.8; J32.9',NULL,0,1),(434,'R76','Tonsillitis acute',NULL,NULL,0,1),(435,'R77','Laryngitis/tracheitis acute','upper respiratory tract infection R74',NULL,0,1),(436,'R78','Acute bronchitis/bronchiolitis','J20.0; J20.1; J20.2; J20.3; J20.4; J20.5; J20.6; J20.7; J20.8; J20.9; J21.0; J21.1; J21.8; J21.9; J22; J40',NULL,0,1),(437,'R79','Chronic bronchitis','J41.0; J41.1; J41.8; J42',NULL,0,1),(438,'R80','Influenza','J09; J10.1; J10.8; J11.1; J11.8',NULL,0,1),(439,'R81','Pneumonia','A48.1; B33.4; J10.0; J11.0; J12.0; J12.1; J12.2; J12.3; J12.8; J12.9; J13; J14; J15.0; J15.1; J15.2; J15.3; J15.4; J15.5; J15.6; J15.7; J15.8; J15.9; J16.0; J16.8; J17.0; J17.1; J17.2; J17.3; J17.8; J',NULL,0,1),(440,'R82','Pleurisy/pleural effusion','J90; J91; J94.0; J94.1; J94.2; J94.8; J94.9; R09.1',NULL,0,1),(441,'R83','Respiratory infection other','A36.0; A36.1; A36.2; A36.3; A36.8; A36.9; B37.1; B44.0; B44.1; B44.2; B44.7; B44.8; B44.9; B58.3; J05.1; J31.0; J31.1; J31.2; J37.0; J37.1; J85.0; J85.1; J85.2; J85.3; J86.0; J86.9',NULL,0,1),(442,'R84','Malignant neoplasm bronchus/lung','C33; C34.0; C34.1; C34.2; C34.3; C34.8; C34.9; C45.7',NULL,0,1),(443,'R85','Malignant neopl respiratory other','C09.0; C09.1; C09.8; C09.9; C10.0; C10.1; C10.2; C10.3; C10.4; C10.8; C10.9; C11.0; C11.1; C11.2; C11.3; C11.8; C11.9; C12; C13.0; C13.1; C13.2; C13.8; C13.9; C14.0; C14.2; C30.0; C31.0; C31.1; C31.2;',NULL,0,1),(444,'R86','Benign neoplasm respiratory','D14.0; D14.1; D14.2; D14.3; D14.4; D19.0',NULL,0,1),(445,'R87','Foreign body nose/larynx/bronchus','T17.0; T17.1; T17.2; T17.3; T17.4; T17.5; T17.8; T17.9',NULL,0,1),(446,'R88','Injury respiratory other','S00.3; S01.2; S03.1; S10.0; S17.0; S19.8; S27.0; S27.1; S27.2; S27.3; S27.4; S27.5; S27.6; S27.7; T27.0; T27.1; T27.2; T27.3; T27.4; T27.5; T27.6; T27.7; T70.1',NULL,0,1),(447,'R89','Congenital anomaly respiratory','Q30.0; Q30.1; Q30.2; Q30.3; Q30.8; Q30.9; Q31.0; Q31.1; Q31.2; Q31.3; Q31.5; Q31.8; Q31.9; Q32.0; Q32.1; Q32.2; Q32.3; Q32.4; Q33.0; Q33.1; Q33.2; Q33.3; Q33.4; Q33.5; Q33.6; Q33.8; Q33.9; Q34.0; Q34.',NULL,0,1),(448,'R90','Hypertrophy tonsils/adenoids','J34.8; J35.0; J35.1; J35.2; J35.3; J35.8; J35.9',NULL,0,1),(449,'R92','Neoplasm respiratory unspecified','D02.0; D02.1; D02.2; D02.3; D02.4; D38.0; D38.1; D38.2; D38.3; D38.4; D38.5; D38.6',NULL,0,1),(450,'R95','Chron obstructive pulmonary disease',NULL,NULL,0,1),(451,'R96','Asthma','J45.0; J45.1; J45.8; J45.9; J46',NULL,0,1),(452,'R97','Allergic rhinitis','J30.0; J30.1; J30.2; J30.3; J30.4',NULL,0,1),(453,'R98','Hyperventilation syndrome','R06.4',NULL,0,1),(454,'R99','Respiratory disease other','J33.0; J33.1; J33.8; J33.9; J34.1; J34.2; J34.3; J34.8; J38.0; J38.1; J38.2; J38.3; J38.4; J38.5; J38.6; J38.7; J39.0; J39.1; J39.2; J39.3; J39.8; J39.9; J47; J60; J61; J62.0; J62.8; J63.0; J63.1; J63',NULL,0,1),(455,'S01','Pain/tenderness of skin','R20.8',NULL,0,1),(456,'S02','Pruritus','L29.8; L29.9',NULL,0,1),(457,'S03','Warts','B07',NULL,0,1),(458,'S04','Lump/swelling localized','R22.0; R22.1; R22.2; R22.3; R22.4; R22.9; R23.8',NULL,0,1),(459,'S05','Lumps/swellings generalized','R22.7; R23.8',NULL,0,1),(460,'S06','Rash localized','L53.9; R21',NULL,0,1),(461,'S07','Rash generalized','L53.9; R21',NULL,0,1),(462,'S08','Skin colour change','L81.0; L81.1; L81.2; L81.3; R23.0; R23.1; R23.2',NULL,0,1),(463,'S09','Infected finger/toe','L03.0',NULL,0,1),(464,'S10','Boil/carbuncle','L02.0; L02.1; L02.2; L02.3; L02.4; L02.8; L02.9',NULL,0,1),(465,'S11','Skin infection post-traumatic','T79.3',NULL,0,1),(466,'S12','Insect bite/sting','S00.0; S00.2; S00.3; S00.4; S00.5; S00.7; S00.8; S00.9; S10.1; S10.7; S10.8; S10.9; S20.1; S20.3; S20.4; S20.7; S20.8; S30.7; S30.8; S30.9; S40.7; S40.8; S50.7; S50.8; S60.7; S60.8; S70.7; S70.8; S80.',NULL,0,1),(467,'S13','Animal/human bite','T14.1',NULL,0,1),(468,'S14','Burn/scald','T20.0; T20.1; T20.2; T20.3; T20.4; T20.5; T20.6; T20.7; T21.0; T21.1; T21.2; T21.3; T21.4; T21.5; T21.6; T21.7; T22.0; T22.1; T22.2; T22.3; T22.4; T22.5; T22.6; T22.7; T23.0; T23.1; T23.2; T23.3; T23.',NULL,0,1),(469,'S15','Foreign body in skin','S00.0; S00.2; S00.3; S00.4; S00.5; S00.7; S00.8; S00.9; S10.1; S10.7; S10.8; S10.9; S20.1; S20.3; S20.4; S20.7; S20.8; S30.7; S30.8; S30.9; S40.7; S40.8; S50.7; S50.8; S60.7; S60.8; S70.7; S70.8; S80.',NULL,0,1),(470,'S16','Bruise/contusion','S00.0; S00.7; S00.8; S00.9; S10.1; S10.7; S10.8; S10.9; S20.0; S20.1; S20.2; S20.3; S20.4; S20.7; S20.8; S30.0; S30.1; S40.0; S40.7; S40.8; S40.9; S50.0; S50.1; S50.7; S50.8; S50.9; S60.0; S60.1; S60.',NULL,0,1),(471,'S17','Abrasion/scratch/blister','S00.0; S00.7; S00.8; S00.9; S10.1; S10.7; S10.8; S10.9; S20.1; S20.3; S20.4; S20.7; S20.8; S30.7; S30.8; S30.9; S40.7; S40.8; S40.9; S50.7; S50.8; S50.9; S60.7; S60.8; S60.9; S70.7; S70.8; S70.9; S80.',NULL,0,1),(472,'S18','Laceration/cut','S01.0; S01.2; S01.4; S01.7; S01.8; S01.9; S11.0; S11.1; S11.2; S11.7; S11.8; S11.9; S21.0; S21.1; S21.2; S21.7; S21.8; S21.9; S31.0; S31.1; S31.8; S41.0; S41.1; S41.7; S41.8; S51.0; S51.7; S51.8; S51.',NULL,0,1),(473,'S19','Skin injury other','S00.0; S00.7; S00.8; S00.9; S10.1; S10.7; S10.8; S10.9; S10.1; S10.7; S10.8; S10.9; S20.1; S20.3; S20.4; S20.7; S20.8; S30.7; S30.8; S30.9; S40.7; S40.8; S40.9; S50.7; S50.8; S50.9; S60.7; S60.8; S60.',NULL,0,1),(474,'S20','Corn/callosity','L84',NULL,0,1),(475,'S21','Skin texture symptom/complaint','R23.4',NULL,0,1),(476,'S22','Nail symptom/complaint','L60.1; L60.4; L60.5; L60.9; L62.0; L62.8; R68.3',NULL,0,1),(477,'S23','Hair loss/baldness','L63.0; L63.1; L63.2; L63.8; L63.9; L64.0; L64.8; L64.9; L65.0; L65.1; L65.2; L65.8; L65.9; L66.0; L66.1; L66.2; L66.3; L66.4; L66.8; L66.9',NULL,0,1),(478,'S24','Hair/scalp symptom/complaint other','L67.0; L67.1; L67.8; L67.9; L68.0; L68.1; L68.2; L68.3; L68.8; L68.9',NULL,0,1),(479,'S26','Fear of cancer of skin',NULL,NULL,0,1),(480,'S27','Fear of skin disease other','Z71.1',NULL,0,1),(481,'S28','Limited function/disability (S)','Z73.6',NULL,0,1),(482,'S29','Skin symptom/complaint other','R23.3; R23.8',NULL,0,1),(483,'S70','Herpes zoster','skin pain S01; localized rash S06',NULL,0,1),(484,'S71','Herpes simplex','B00.0; B00.1; B00.8; B00.9',NULL,0,1),(485,'S72','Scabies/other acariasis','B86; B88.0; B88.2',NULL,0,1),(486,'S73','Pediculosis/skin infestation other','B85.0; B85.1; B85.2; B85.3; B85.4; B87.0; B87.1; B87.2; B87.3; B87.4; B87.8; B87.9; B88.1; B88.3; B88.8; B88.9',NULL,0,1),(487,'S74','Dermatophytosis','B35.0; B35.1; B35.2; B35.3; B35.4; B35.5; B35.6; B35.8; B35.9; B36.0; B36.1; B36.2; B36.3; B36.8; B36.9',NULL,0,1),(488,'S75','Moniliasis/candidiasis skin','B37.2',NULL,0,1),(489,'S76','Skin infection other','A46; A66.0; A66.1; A66.2; A66.3; A66.4; A66.5; A66.6; A66.7; A66.8; A66.9; A67.0; A67.1; A67.2; A67.3; A67.9; L03.1; L03.2; L03.3; L03.8; L03.9; L08.0; L08.1; L08.8; L08.9; L98.0',NULL,0,1),(490,'S77','Malignant neoplasm of skin','C43.0; C43.1; C43.2; C43.3; C43.4; C43.5; C43.6; C43.7; C43.8; C43.9; C44.0; C44.1; C44.2; C44.3; C44.4; C44.5; C44.6; C44.7; C44.8; C44.9; C46.0',NULL,0,1),(491,'S78','Lipoma','D17.0; D17.1; D17.2; D17.3; D17.4; D17.5; D17.6; D17.7; D17.9',NULL,0,1),(492,'S79','Neoplasm skin benign/unspecified','D03.0; D03.1; D03.2; D03.3; D03.4; D03.5; D03.6; D03.7; D03.8; D03.9; D04.0; D04.1; D04.2; D04.3; D04.4; D04.5; D04.6; D04.7; D04.8; D04.9; D23.0; D23.1; D23.2; D23.3; D23.4; D23.5; D23.6; D23.7; D23.',NULL,0,1),(493,'S80','Solar keratosis/sunburn','L55.0; L55.1; L55.2; L55.8; L55.9; L56.0; L56.1; L56.2; L56.3; L56.4; L56.8; L56.9; L57.0; L57.1; L57.2; L57.3; L57.4; L57.5; L57.8; L57.9; L58.0; L58.1; L58.9; L59.0; L59.8; L59.9',NULL,0,1),(494,'S81','Haemangioma/lymphangioma',NULL,NULL,0,1),(495,'S82','Naevus/mole','D22.0; D22.1; D22.2; D22.3; D22.4; D22.5; D22.6; D22.7; D22.9',NULL,0,1),(496,'S83','Congenital skin anomaly other','Q80.0; Q80.1; Q80.2; Q80.3; Q80.4; Q80.8; Q80.9; Q81.0; Q81.1; Q81.2; Q81.8; Q81.9; Q82.0; Q82.1; Q82.2; Q82.3; Q82.4; Q82.5; Q82.8; Q82.9; Q84.0; Q84.1; Q84.2; Q84.3; Q84.4; Q84.5; Q84.6; Q84.8; Q84.',NULL,0,1),(497,'S84','Impetigo','other localized skin infection S11',NULL,0,1),(498,'S85','Pilonidal cyst/fistula','L05.0; L05.9',NULL,0,1),(499,'S86','Dermatitis seborrhoeic',NULL,NULL,0,1),(500,'S87','Dermatitis/atopic eczema',NULL,NULL,0,1),(501,'S88','Dermatitis contact/allergic','L23.0; L23.1; L23.2; L23.3; L23.4; L23.5; L23.6; L23.7; L23.8; L23.9; L24.0; L24.1; L24.2; L24.3; L24.4; L24.5; L24.6; L24.7; L24.8; L24.9; L25.0; L25.1; L25.2; L25.3; L25.4; L25.5; L25.8; L25.9; L27.',NULL,0,1),(502,'S89','Diaper rash',NULL,NULL,0,1),(503,'S90','Pityriasis rosea','localized rash S06; generalized rash S07',NULL,0,1),(504,'S91','Psoriasis','double code psoriatic arthritis L99',NULL,0,1),(505,'S92','Sweat gland disease','L30.1; L73.2; L74.0; L74.1; L74.2; L74.3; L74.4; L74.8; L74.9; L75.0; L75.1; L75.2; L75.8; L75.9',NULL,0,1),(506,'S93','Sebaceous cyst','L72.1',NULL,0,1),(507,'S94','Ingrowing nail','L60.0',NULL,0,1),(508,'S95','Molluscum contagiosum','B08.1',NULL,0,1),(509,'S96','Acne','L70.0; L70.1; L70.2; L70.3; L70.4; L70.5; L70.8; L70.9',NULL,0,1),(510,'S97','Chronic ulcer skin','I83.0; I83.2; L89.0; L89.1; L89.2; L89.3; L89.9; L97; L98.4',NULL,0,1),(511,'S98','Urticaria','L50.0; L50.1; L50.2; L50.3; L50.4; L50.5; L50.6; L50.8; L50.9',NULL,0,1),(512,'S99','Skin disease other','L10.0; L10.1; L10.2; L10.3; L10.4; L10.5; L10.8; L10.9; L11.0; L11.1; L11.8; L11.9; L12.0; L12.1; L12.2; L12.3; L12.8; L12.9; L13.0; L13.1; L13.8; L13.9; L14; L26; L28.0; L28.1; L28.2; L30.2; L30.5; L',NULL,0,1),(513,'T01','Excessive thirst','R63.1',NULL,0,1),(514,'T02','Excessive appetite','R63.2',NULL,0,1),(515,'T03','Loss of appetite','R63.0',NULL,0,1),(516,'T04','Feeding problem of infant/child','R63.3',NULL,0,1),(517,'T05','Feeding problem of adult','R63.3',NULL,0,1),(518,'T07','Weight gain','R63.5',NULL,0,1),(519,'T08','Weight loss','R63.4; R64',NULL,0,1),(520,'T10','Growth delay','E34.3; R62.8; R62.9',NULL,0,1),(521,'T11','Dehydration','E86',NULL,0,1),(522,'T26','Fear of cancer of endocrine system',NULL,NULL,0,1),(523,'T27','Fear endocrine/metabol disease other','Z71.1',NULL,0,1),(524,'T28','Limited function/disability (T)','Z73.6',NULL,0,1),(525,'T29','Endocr/metab/nutr sympt/compl other','R63.8',NULL,0,1),(526,'T70','Endocrine infection','E06.0',NULL,0,1),(527,'T71','Malignant neoplasm thyroid','C73',NULL,0,1),(528,'T72','Benign neoplasm thyroid','D34',NULL,0,1),(529,'T73','Neoplasm endocrine other/unspecified','C74.0; C74.1; C74.9; C75.0; C75.1; C75.2; C75.3; C75.4; C75.5; C75.8; C75.9; D09.3; D35.0; D35.1; D35.2; D35.3; D35.4; D35.5; D35.6; D35.7; D35.8; D35.9; D44.0; D44.1; D44.2; D44.3; D44.4; D44.5; D44.',NULL,0,1),(530,'T78','Thyroglossal duct/cyst','Q89.2',NULL,0,1),(531,'T80','Congen anomaly endocrine/metabolic','E00.0; E00.1; E00.2; E00.9; E25.0; Q89.1; Q89.2',NULL,0,1),(532,'T81','Goitre','E04.0; E04.1; E04.2; E04.8; E04.9',NULL,0,1),(533,'T82','Obesity','E66.0; E66.1; E66.2; E66.8; E66.9',NULL,0,1),(534,'T83','Overweight','E66.0; E66.1; E66.2; E66.8; E66.9',NULL,0,1),(535,'T85','Hyperthyroidism/thyrotoxicosis','E05.0; E05.1; E05.2; E05.3; E05.4; E05.5; E05.8; E05.9',NULL,0,1),(536,'T86','Hypothyroidism/myxoedema','E01.0; E01.1; E01.2; E01.8; E02; E03.0; E03.1; E03.2; E03.3; E03.4; E03.5; E03.8; E03.9',NULL,0,1),(537,'T87','Hypoglycaemia',NULL,NULL,0,1),(538,'T89','Diabetes insulin dependent','nephropathy U88. 2) in pregnancy',NULL,0,1),(539,'T90','Diabetes non-insulin dependent','nephropathy U88. 2) In pregnancy',NULL,0,1),(540,'T91','Vitamin/nutritional deficiency','E40; E41; E42; E43; E44.0; E44.1; E45; E46; E50.0; E50.1; E50.2; E50.3; E50.4; E50.5; E50.6; E50.7; E50.8; E50.9; E51.1; E51.8; E51.9; E52; E53.0; E53.1; E53.8; E53.9; E54; E55.0; E55.9; E56.0; E56.1;',NULL,0,1),(541,'T92','Gout','M10.0; M10.1; M10.2; M10.3; M10.4; M10.9',NULL,0,1),(542,'T93','Lipid disorder','E78.0; E78.1; E78.2; E78.3; E78.4; E78.5; E78.6; E78.8; E78.9',NULL,0,1),(543,'T99','Endocr/metab/nutrit disease other','E06.1; E06.2; E06.3; E06.4; E06.5; E06.9; E07.0; E07.1; E07.8; E07.9; E16.8; E20.0; E20.1; E20.8; E20.9; E21.0; E21.1; E21.2; E21.3; E21.4; E21.5; E22.0; E22.1; E22.2; E22.8; E22.9; E23.0; E23.1; E23.',NULL,0,1),(544,'U01','Dysuria/painful urination','R30.0; R30.1; R30.9',NULL,0,1),(545,'U02','Urinary frequency/urgency','R35',NULL,0,1),(546,'U04','Incontinence urine','N39.3; N39.4; R32',NULL,0,1),(547,'U05','Urination problems other','R34; R39.1',NULL,0,1),(548,'U06','Haematuria','N02.0; N02.1; N02.2; N02.3; N02.4; N02.5; N02.6; N02.7; N02.8; N02.9; R31',NULL,0,1),(549,'U07','Urine symptom/complaint other','R39.8',NULL,0,1),(550,'U08','Urinary retention','R33',NULL,0,1),(551,'U13','Bladder symptom/complaint other','R39.0; R39.8',NULL,0,1),(552,'U14','Kidney symptom/complaint','N23',NULL,0,1),(553,'U26','Fear of cancer of urinary system',NULL,NULL,0,1),(554,'U27','Fear of urinary disease other','Z71.1',NULL,0,1),(555,'U28','Limited function/disability (U)','Z73.6; Z99.2',NULL,0,1),(556,'U29','Urinary symptom/complaint other','R39.8',NULL,0,1),(557,'U70','Pyelonephritis/pyelitis','N10; N11.0; N11.1; N11.8; N11.9; N12; N15.1; N15.9',NULL,0,1),(558,'U71','Cystitis/urinary infection other','N30.0; N30.1; N30.2; N30.3; N30.4; N30.8; N30.9; N39.0',NULL,0,1),(559,'U72','Urethritis','A56.0; A56.2; B37.4; N34.0; N34.1; N34.2; N34.3',NULL,0,1),(560,'U75','Malignant neoplasm of kidney','C64; C65',NULL,0,1),(561,'U76','Malignant neoplasm of bladder','C67.0; C67.1; C67.2; C67.3; C67.4; C67.5; C67.6; C67.7; C67.8; C67.9',NULL,0,1),(562,'U77','Malignant neopl urinary tract other','C66; C68.0; C68.1; C68.8; C68.9',NULL,0,1),(563,'U78','Benign neoplasm urinary tract','D30.0; D30.1; D30.2; D30.3; D30.4; D30.7; D30.9',NULL,0,1),(564,'U79','Neoplasm urinary tract unspecified','D09.0; D09.1; D41.0; D41.1; D41.2; D41.3; D41.4; D41.7; D41.9',NULL,0,1),(565,'U80','Injury urinary tract','S37.0; S37.1; S37.2; S37.3; T19.0; T19.1; T28.3; T28.8',NULL,0,1),(566,'U85','Congenital anomaly urinary tract','Q60.0; Q60.1; Q60.2; Q60.3; Q60.4; Q60.5; Q60.6; Q61.0; Q61.1; Q61.2; Q61.3; Q61.4; Q61.5; Q61.8; Q61.9; Q62.0; Q62.1; Q62.2; Q62.3; Q62.4; Q62.5; Q62.6; Q62.7; Q62.8; Q63.0; Q63.1; Q63.2; Q63.3; Q63.',NULL,0,1),(567,'U88','Glomerulonephritis/nephrosis','N00.0; N00.1; N00.2; N00.3; N00.4; N00.5; N00.6; N00.7; N00.8; N00.9; N01.0; N01.1; N01.2; N01.3; N01.4; N01.5; N01.6; N01.7; N01.8; N01.9; N03.0; N03.1; N03.2; N03.3; N03.4; N03.5; N03.6; N03.7; N03.',NULL,0,1),(568,'U90','Orthostatic albuminuria/proteinuria',NULL,NULL,0,1),(569,'U95','Urinary calculus','N20.0; N20.1; N20.2; N20.9; N21.0; N21.1; N21.8; N21.9; N22.0; N22.8',NULL,0,1),(570,'U98','Abnormal urine test NOS','N39.1; R80; R81; R82.0; R82.1; R82.2; R82.3; R82.4; R82.5; R82.6; R82.7; R82.8; R82.9',NULL,0,1),(571,'U99','Urinary disease other','N06.0; N06.1; N06.2; N06.3; N06.4; N06.5; N06.6; N06.7; N06.8; N06.9; N13.0; N13.1; N13.2; N13.3; N13.4; N13.5; N13.6; N13.7; N13.8; N13.9; N17.0; N17.1; N17.2; N17.8; N17.9; N18.1; N18.2; N18.3; N18.',NULL,0,1),(572,'W01','Question of pregnancy','Z32.0',NULL,0,1),(573,'W02','Fear of pregnancy','Z71.1',NULL,0,1),(574,'W03','Antepartum bleeding','O20.0; O20.8; O20.9; O46.0; O46.8; O46.9',NULL,0,1),(575,'W05','Pregnancy vomiting/nausea','O21.0; O21.1; O21.2; O21.8; O21.9',NULL,0,1),(576,'W10','Contraception postcoital','Z30.3',NULL,0,1),(577,'W11','Contraception oral','Z30.4',NULL,0,1),(578,'W12','Contraception intrauterine','Z30.1; Z30.5',NULL,0,1),(579,'W13','Sterilization female','Z30.2',NULL,0,1),(580,'W14','Contraception female other','Z30.0; Z30.8; Z30.9',NULL,0,1),(581,'W15','Infertility/subfertility female',NULL,NULL,0,1),(582,'W17','Post-partum bleeding','O72.0; O72.1; O72.2; O72.3',NULL,0,1),(583,'W18','Post-partum symptom/complaint other','O90.9',NULL,0,1),(584,'W19','Lactation symptom/complaint','O92.5; O92.6; O92.7',NULL,0,1),(585,'W21','Concern with body image in pregnancy','R46.8',NULL,0,1),(586,'W27','Fear of complications of pregnancy',NULL,NULL,0,1),(587,'W28','Limited function/disability (W)','Z73.6',NULL,0,1),(588,'W29','Pregnancy symptom/complaint other','O26.0; O26.1; O26.2; O26.3; O26.5',NULL,0,1),(589,'W70','Puerperal infection/sepsis','O85; O86.1; O86.3',NULL,0,1),(590,'W71','Other infect complic pregn/puerp','O23.0; O23.1; O23.2; O23.3; O23.4; O23.5; O23.9; O26.4; O41.1; O75.2; O75.3; O86.2; O86.4; O86.8; O98.0; O98.1; O98.2; O98.3; O98.4; O98.5; O98.6; O98.7; O98.8; O98.9',NULL,0,1),(591,'W72','Malignant neopl related to pregnancy','C58',NULL,0,1),(592,'W73','Benign/unspecif neopl relat to pregn','O01.0; O01.1; O01.9',NULL,0,1),(593,'W75','Injury complicating pregnancy','T14.9',NULL,0,1),(594,'W76','Congen anom complicating pregnancy','O99.8',NULL,0,1),(595,'W78','Pregnancy','Z32.1; Z33; Z34.0; Z34.8; Z34.9; Z36.0; Z36.1; Z36.2; Z36.3; Z36.4; Z36.5; Z36.8; Z36.9',NULL,0,1),(596,'W79','Unwanted pregnancy','Z32.1; Z64.0',NULL,0,1),(597,'W80','Ectopic pregnancy','antepartum bleeding W03; Pregnancy symptom/complaint, other W29',NULL,0,1),(598,'W81','Toxaemia of pregnancy',NULL,NULL,0,1),(599,'W82','Abortion spontaneous','N96; O02.0; O02.1; O02.8; O02.9; O03.0; O03.1; O03.2; O03.3; O03.4; O03.5; O03.6; O03.7; O03.8; O03.9; O05.0; O05.1; O05.2; O05.3; O05.4; O05.5; O05.6; O05.7; O05.8; O05.9; O06.0; O06.1; O06.2; O06.3;',NULL,0,1),(600,'W83','Abortion induced',NULL,NULL,0,1),(601,'W84','Pregnancy high risk','O24.0; O24.1; O24.2; O24.3; O24.9; O25; O30.0; O30.1; O30.2; O30.8; O30.9; O31.0; O31.1; O31.2; O31.8; O32.0; O32.1; O32.2; O32.3; O32.4; O32.5; O32.6; O32.8; O32.9; O33.0; O33.1; O33.2; O33.3; O33.4;',NULL,0,1),(602,'W85','Gestational diabetes','O24.4',NULL,0,1),(603,'W90','Uncompl labour/delivery livebirth','O80.0; O80.1; O80.8; O80.9; Z37.0; Z37.9; Z38.0; Z38.1; Z38.2; Z38.3; Z38.4; Z38.5; Z38.6; Z38.7; Z38.8; Z39.0; Z39.1; Z39.2',NULL,0,1),(604,'W91','Uncompl labour/delivery stillbirth','Z37.1; Z37.9',NULL,0,1),(605,'W92','Compl labour/ delivery livebirth',NULL,NULL,0,1),(606,'W93','Compl labour/delivery stillbirth',NULL,NULL,0,1),(607,'W94','Puerperal mastitis',NULL,NULL,0,1),(608,'W95','Breast dis in pregn/puerperium other','O92.0; O92.1; O92.2; O92.3; O92.4',NULL,0,1),(609,'W96','Complications of puerperium other','O87.0; O87.1; O87.2; O87.3; O87.8; O87.9; O90.4; O90.8; O90.9',NULL,0,1),(610,'W99','Disorder of pregn/delivery other','O07.0; O07.1; O07.2; O07.3; O07.4; O07.5; O07.6; O07.7; O07.8; O07.9; O08.0; O08.1; O08.2; O08.3; O08.4; O08.5; O08.6; O08.7; O08.8; O08.9; O22.0; O22.1; O22.2; O22.3; O22.4; O22.5; O22.8; O22.9; O26.',NULL,0,1),(611,'X01','Genital pain female','N94.8; R10.2',NULL,0,1),(612,'X02','Menstrual pain','N94.4; N94.5; N94.6',NULL,0,1),(613,'X03','Intermenstrual pain','N94.0',NULL,0,1),(614,'X04','Painful intercourse female','N94.1; N94.2',NULL,0,1),(615,'X05','Menstruation absent/scanty','N91.0; N91.1; N91.2; N91.3; N91.4; N91.5',NULL,0,1),(616,'X06','Menstruation excessive','N92.0; N92.2; N92.4',NULL,0,1),(617,'X07','Menstruation irregular/frequent','N92.0; N92.1; N92.5; N92.6',NULL,0,1),(618,'X08','Intermenstrual bleeding','N92.3; N93.8; N93.9',NULL,0,1),(619,'X09','Premenstrual symptom/complaint','N94.9',NULL,0,1),(620,'X10','Postponement of menstruation','Z30.9',NULL,0,1),(621,'X11','Menopausal symptom/complaint','N95.1; N95.2; N95.3; N95.8; N95.9',NULL,0,1),(622,'X12','Postmenopausal bleeding','N95.0',NULL,0,1),(623,'X13','Postcoital bleeding','N93.0',NULL,0,1),(624,'X14','Vaginal discharge','N89.8',NULL,0,1),(625,'X15','Vaginal symptom/complaint other','N89.9',NULL,0,1),(626,'X16','Vulval symptom/complaint','L29.2; N90.9',NULL,0,1),(627,'X17','Pelvis symptom/complaint female','N94.9',NULL,0,1),(628,'X18','Breast pain female','N64.4',NULL,0,1),(629,'X19','Breast lump/mass female','N63',NULL,0,1),(630,'X20','Nipple symptom/complaint female','N64.0; N64.5',NULL,0,1),(631,'X21','Breast sympt/compl female other','N61; N62; N64.3; N64.5; N64.9',NULL,0,1),(632,'X22','Concern breast appearance fema','R46.8',NULL,0,1),(633,'X23','Fear sexually transm dis female','Z71.1',NULL,0,1),(634,'X24','Fear of sexual dysfunction female','Z71.1',NULL,0,1),(635,'X25','Fear of genital cancer female',NULL,NULL,0,1),(636,'X26','Fear of breast cancer female',NULL,NULL,0,1),(637,'X27','Fear genital/breast dis female other','Z71.1',NULL,0,1),(638,'X28','Limited function/disability (X)','Z73.6; Z90.7',NULL,0,1),(639,'X29','Genital sympt/compl female other','N94.9; R36',NULL,0,1),(640,'X70','Syphilis female',NULL,NULL,0,1),(641,'X71','Gonorrhoea female','A54.0; A54.1; A54.2; A54.3; A54.4; A54.5; A54.6; A54.8; A54.9; N74.3',NULL,0,1),(642,'X72','Genital candidiasis female','B37.3; B37.4',NULL,0,1),(643,'X73','Genital trichomoniasis female','A59.0',NULL,0,1),(644,'X74','Pelvic inflammatory disease',NULL,NULL,0,1),(645,'X75','Malignant neoplasm cervix','C53.0; C53.1; C53.8; C53.9',NULL,0,1),(646,'X76','Malignant neoplasm breast female','C50.0; C50.1; C50.2; C50.3; C50.4; C50.5; C50.6; C50.8; C50.9',NULL,0,1),(647,'X77','Malignant neopl genital female other','C51.0; C51.1; C51.2; C51.8; C51.9; C52; C54.0; C54.1; C54.2; C54.3; C54.8; C54.9; C55; C56; C57.0; C57.1; C57.2; C57.3; C57.4; C57.7; C57.8; C57.9',NULL,0,1),(648,'X78','Fibromyoma uterus',NULL,NULL,0,1),(649,'X79','Benign neoplasm breast female','D24',NULL,0,1),(650,'X80','Benign neoplasm female genital','D26.0; D26.1; D26.7; D26.9; D27; D28.0; D28.1; D28.2; D28.7; D28.9',NULL,0,1),(651,'X81','Genital neopl female other/unspecif','D05.0; D05.1; D05.7; D05.9; D06.0; D06.1; D06.7; D06.9; D07.0; D07.1; D07.2; D07.3; D39.0; D39.1; D39.2; D39.7; D39.9; D48.6',NULL,0,1),(652,'X82','Injury genital female','S30.2; S31.4; S31.5; S37.4; S37.5; S37.6; S38.0; S38.2; S39.8; S39.9; T19.2; T19.3; T28.3; T28.8; Z41.2',NULL,0,1),(653,'X83','Congenital anomaly genital female','Q50.0; Q50.1; Q50.2; Q50.3; Q50.4; Q50.5; Q50.6; Q51.0; Q51.1; Q51.2; Q51.3; Q51.4; Q51.5; Q51.6; Q51.7; Q51.8; Q51.9; Q52.0; Q52.1; Q52.2; Q52.3; Q52.4; Q52.5; Q52.6; Q52.7; Q52.8; Q52.9; Q56.0; Q56.',NULL,0,1),(654,'X84','Vaginitis/vulvitis NOS','N76.0; N76.1; N76.2; N76.3; N76.4; N76.5; N76.6; N76.8; N77.0; N77.1; N77.8',NULL,0,1),(655,'X85','Cervical disease NOS','N72; N84.1; N86; N88.0; N88.1; N88.2; N88.3; N88.4; N88.8; N88.9',NULL,0,1),(656,'X86','Abnormal cervix smear','N87.0; N87.1; N87.2; N87.9; R87.6;',NULL,0,1),(657,'X87','Uterovaginal prolapse','N81.0; N81.1; N81.2; N81.3; N81.4; N81.5; N81.6; N81.8; N81.9',NULL,0,1),(658,'X88','Fibrocystic disease breast','N60.0; N60.1; N60.2; N60.3; N60.4; N60.8; N60.9',NULL,0,1),(659,'X89','Premenstrual tension syndrome','N94.3',NULL,0,1),(660,'X90','Genital herpes female','A60.0; A60.1; A60.9',NULL,0,1),(661,'X91','Condylomata acuminata female',NULL,NULL,0,1),(662,'X92','Chlamydia infection genital female','A56.0; A56.1; A56.2; A56.3; A56.4; A56.8; N74.4',NULL,0,1),(663,'X99','Genital disease female other','A55; A57; A58; A63.8; N61; N64.1; N64.2; N64.8; N75.0; N75.1; N75.8; N75.9; N80.0; N80.1; N80.2; N80.3; N80.4; N80.5; N80.6; N80.8; N80.9; N82.0; N82.1; N82.2; N82.3; N82.4; N82.5; N82.8; N82.9; N83.0',NULL,0,1),(664,'Y01','Pain in penis','N48.8',NULL,0,1),(665,'Y02','Pain in testis/scrotum','N50.8; R10.2',NULL,0,1),(666,'Y03','Urethral discharge male','R36',NULL,0,1),(667,'Y04','Penis symptom/complaint other','N48.9',NULL,0,1),(668,'Y05','Scrotum/testis sympt/compl other','L29.1; N50.9',NULL,0,1),(669,'Y06','Prostate symptom/complaint','N42.9',NULL,0,1),(670,'Y07','Impotence NOS','N48.4',NULL,0,1),(671,'Y08','Sexual function sympt/compl male','N48.3; N48.9',NULL,0,1),(672,'Y10','Infertility/subfertility male','N46; Z31.0; Z31.4; Z31.6; Z31.8; Z31.9',NULL,0,1),(673,'Y13','Sterilization male','Z30.2',NULL,0,1),(674,'Y14','Family planning male other','Z30.0; Z30.8; Z30.9',NULL,0,1),(675,'Y16','Breast symptom/complaint male','N62; N63; N64.5',NULL,0,1),(676,'Y24','Fear of sexual dysfunction male',NULL,NULL,0,1),(677,'Y25','Fear sexually transm disease male','Z71.1',NULL,0,1),(678,'Y26','Fear of genital cancer male',NULL,NULL,0,1),(679,'Y27','Fear of genital disease male other','Z71.1',NULL,0,1),(680,'Y28','Limited function/disability (Y)','Z73.6; Z90.7',NULL,0,1),(681,'Y29','Genital symptom/complaint male other','N50.9',NULL,0,1),(682,'Y70','Syphilis male','A50.0; A50.1; A50.2; A50.3; A50.4; A50.5; A50.6; A50.7; A50.9; A51.0; A51.1; A51.2; A51.3; A51.4; A51.5; A51.9; A52.0; A52.1; A52.2; A52.3; A52.7; A52.8; A52.9; A53.0; A53.9; A65',NULL,0,1),(683,'Y71','Gonorrhoea male',NULL,NULL,0,1),(684,'Y72','Genital herpes male','A60.0; A60.1; A60.9',NULL,0,1),(685,'Y73','Prostatitis/seminal vesiculitis',NULL,NULL,0,1),(686,'Y74','Orchitis/epididymitis',NULL,NULL,0,1),(687,'Y75','Balanitis','B37.4; N48.1',NULL,0,1),(688,'Y76','Condylomata acuminata male',NULL,NULL,0,1),(689,'Y77','Malignant neoplasm prostate','C61',NULL,0,1),(690,'Y78','Malign neopl male genital other','C50.0; C50.1; C50.2; C50.3; C50.4; C50.5; C50.6; C50.8; C50.9; C60.0; C60.1; C60.2; C60.8; C60.9; C62.0; C62.1; C62.9; C63.0; C63.1; C63.2; C63.7; C63.8; C63.9',NULL,0,1),(691,'Y79','Benign/unspecif neopl male genital','D05.0; D05.1; D05.7; D05.9; D07.4; D07.5; D07.6; D24; D29.0; D29.1; D29.2; D29.3; D29.4; D29.7; D29.9; D40.0; D40.1; D40.7; D40.9; D48.6; N42.3',NULL,0,1),(692,'Y80','Injury male genital','S30.2; S31.2; S31.3; S31.5; S38.0; S38.2; T28.3; T28.8; Z41.2',NULL,0,1),(693,'Y81','Phimosis/redundant prepuce',NULL,NULL,0,1),(694,'Y82','Hypospadias','Q54.0; Q54.1; Q54.2; Q54.3; Q54.4; Q54.8; Q54.9',NULL,0,1),(695,'Y83','Undescended testicle',NULL,NULL,0,1),(696,'Y84','Congenital genital anom male other','Q55.0; Q55.1; Q55.2; Q55.3; Q55.4; Q55.5; Q55.6; Q55.8; Q55.9; Q56.0; Q56.1; Q56.2; Q56.3; Q56.4; Q83.0; Q83.1; Q83.2; Q83.3; Q83.8; Q83.9',NULL,0,1),(697,'Y85','Benign prostatic hypertrophy',NULL,NULL,0,1),(698,'Y86','Hydrocoele','N43.0; N43.1; N43.2; N43.3',NULL,0,1),(699,'Y99','Genital disease male other','A55; A56.1; A56.3; A56.4; A56.8; A57; A58; A63.8; N42.0; N42.1; N42.2; N42.8; N42.9; N43.4; N44; N64.9; N48.0; N48.2; N48.5; N48.6; N48.8; N48.9; N49.1; N49.2; N49.8; N49.9; N50.0; N50.1; N50.8; N50.9',NULL,0,1),(700,'Z01','Poverty/financial problem',NULL,NULL,0,1),(701,'Z02','Food/water problem',NULL,NULL,0,1),(702,'Z03','Housing/neighbourhood problem',NULL,NULL,0,1),(703,'Z04','Social cultural problem',NULL,NULL,0,1),(704,'Z05','Work problem',NULL,NULL,0,1),(705,'Z06','Unemployment problem',NULL,NULL,0,1),(706,'Z07','Education problem',NULL,NULL,0,1),(707,'Z08','Social welfare problem',NULL,NULL,0,1),(708,'Z09','Legal problem',NULL,NULL,0,1),(709,'Z10','Health care system problem',NULL,NULL,0,1),(710,'Z11','Compliance/being ill problem','Z75.0; Z75.1; Z75.2; Z75.3; Z75.4; Z75.5; Z75.8; Z75.9',NULL,0,1),(711,'Z12','Relationship problem with partner','T74.0; T74.3; Z63.0',NULL,0,1),(712,'Z13','Partner\'s behaviour problem','Z63.0',NULL,0,1),(713,'Z14','Partner illness problem','Z63.6',NULL,0,1),(714,'Z15','Loss/death of partner problem','Z63.4; Z63.5',NULL,0,1),(715,'Z16','Relationship problem with child','T74.0; T74.3; Z61.0; Z61.1; Z61.2; Z61.3; Z61.4; Z61.5; Z61.6; Z61.7; Z61.8; Z61.9; Z62.0; Z62.1; Z62.2; Z62.3; Z62.4; Z62.5; Z62.6; Z62.8; Z62.9; Z63.8',NULL,0,1),(716,'Z18','Illness problem with child','Z63.6',NULL,0,1),(717,'Z19','Loss/death of child problem','Z63.4',NULL,0,1),(718,'Z20','Relationship problem parent/fam memb','T74.0; Z63.1; Z63.8',NULL,0,1),(719,'Z21','Behaviour problem parent/fam memb','Z63.1; Z63.9',NULL,0,1),(720,'Z22','Illness problem parent/family memb','Z63.6; Z63.7',NULL,0,1),(721,'Z23','Loss/death parent/fam memb problem','Z63.4',NULL,0,1),(722,'Z24','Relationship problem friend','Z63.9',NULL,0,1),(723,'Z25','Assault/harmful event problem','T74.1; T74.2; T74.8; T74.9; Z65.4; Z65.5',NULL,0,1),(724,'Z27','Fear of a social problem',NULL,NULL,0,1),(725,'Z28','Limited function/disability (Z)',NULL,NULL,0,1),(726,'Z29','Social problem NOS','Z58.0; Z58.1; Z58.2; Z58.3; Z58.4; Z58.5; Z58.7; Z58.8; Z58.9; Z63.2; Z63.3; Z63.7; Z63.8; Z63.9; Z64.1; Z65.8; Z65.9; Z72.6; Z72.8; Z72.9; Z73.5; Z73.8; Z73.9; Z76.5',NULL,0,1);
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cps_info`
--

DROP TABLE IF EXISTS `cps_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cps_info` (
  `cps_IP` varchar(11) NOT NULL,
  `cps_Port` int(11) DEFAULT '3306',
  PRIMARY KEY (`cps_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cps_info`
--

LOCK TABLES `cps_info` WRITE;
/*!40000 ALTER TABLE `cps_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `cps_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_ID` int(11) NOT NULL AUTO_INCREMENT,
  `department_Name` varchar(30) NOT NULL,
  `department_Section` varchar(30) DEFAULT NULL,
  `department_Telephone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`department_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'ICU','pediatric','0112890291'),(2,'OPD','OPD','0112890290'),(3,'CCU','pediatric','0112774904'),(4,'IPD Pharamacy','IPD','0112834763'),(5,'LAB','OPD LAB','0112567188');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diabetic_chat`
--

DROP TABLE IF EXISTS `diabetic_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diabetic_chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diabetic_chat`
--

LOCK TABLES `diabetic_chat` WRITE;
/*!40000 ALTER TABLE `diabetic_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `diabetic_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diabetic_graph`
--

DROP TABLE IF EXISTS `diabetic_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diabetic_graph` (
  `graph_id` int(11) NOT NULL AUTO_INCREMENT,
  `clinic_visit_id` int(11) NOT NULL,
  `blood_glucose_level` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`graph_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diabetic_graph`
--

LOCK TABLES `diabetic_graph` WRITE;
/*!40000 ALTER TABLE `diabetic_graph` DISABLE KEYS */;
/*!40000 ALTER TABLE `diabetic_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `employee_SerialNo` int(11) DEFAULT NULL,
  `employee_NIC` varchar(10) NOT NULL,
  `employee_Name` varchar(30) NOT NULL,
  `employee_DOB` date NOT NULL,
  `employee_Address` varchar(50) NOT NULL,
  `employee_TelephoneNo` varchar(30) DEFAULT NULL,
  `employee_Gender` varchar(10) NOT NULL,
  `employee_CivilStatus` varchar(10) NOT NULL,
  `employee_Type` varchar(30) NOT NULL,
  `employee_Post` varchar(30) DEFAULT NULL,
  `employee_AppointmentDate` date NOT NULL,
  `employee_PensionDate` date DEFAULT NULL,
  `employee_WandOPNo` varchar(30) DEFAULT NULL,
  `employee_BasicSalary` double DEFAULT NULL,
  `employee_SalaryCode` varchar(30) DEFAULT NULL,
  `employee_MedRegNo` varchar(30) DEFAULT NULL,
  `employee_DoctorType` varchar(30) DEFAULT NULL,
  `employee_Active` bit(1) NOT NULL,
  `department_ID` int(11) NOT NULL,
  PRIMARY KEY (`employee_ID`),
  KEY `department_ID_idx` (`department_ID`),
  KEY `department_ID_idx1` (`department_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,100,'892754233V','Wasantha Rathnayake','1972-02-13','No:227,Kota Road,Rajagiriya','0112774989','Male','married','Doctor','Consultant','1997-03-13','2027-02-13','82/7321',50000,'PL1-2006-A','20420','Surgeon','',1),(2,101,'712754233V','Rasangi Perera','1971-02-04','No:12,Jothipala Mawatha,New Kandy Road,Malabe','0112774984','Female','married','Nurse','Senior Nurse','1998-03-13','2026-02-13','82/7334',30000,'PL1-2006-B','','','',2),(3,104,'892710325V','Rusiru Perera','1989-08-28','214, Rajagiriya','0723456546','Male','Single','Chief Pharmacist','Chief Pharmacist','2000-10-01','2020-10-09','82/7321',50000,'PL1-2023-B','20420','Pharmacist','',4),(4,105,'892710555V','Kumara Perera','1989-08-28','214, Rajagiriya','0723456578','Male','Single','Assistant Pharmacist','Assistant Pharmacist','2000-10-01','2020-10-09','82/7326',50000,'PL1-2023-P','2042009','Pharmacist','',4),(5,106,'892710555V','Nimal Perera','1989-11-04','214, Rajagiriya','0723456546','Male','Single','MLT','MLT','2000-10-01','2020-10-09','82/7321',50000,'PL1-2023-B','2042009','MLT','',5),(6,3445,'985676543V','Miyuru De Silva','2013-11-05','214, Rajagiriya','0723456546','Male','Single','MLT','MLT','2013-11-05','2013-11-29','82/7344',50000,'PL1-2023-V','204207776','MLT','',5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_patients`
--

DROP TABLE IF EXISTS `external_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_patients` (
  `patientID` int(11) NOT NULL,
  `patient_NIC` varchar(10) DEFAULT NULL,
  `patient_HIN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_patients`
--

LOCK TABLES `external_patients` WRITE;
/*!40000 ALTER TABLE `external_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hin`
--

DROP TABLE IF EXISTS `hin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hin` (
  `hin_Id` int(100) NOT NULL AUTO_INCREMENT,
  `hin_Date` datetime NOT NULL,
  `hin_Pci` varchar(500) NOT NULL,
  `hin_LastserialNumber` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`hin_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hin`
--

LOCK TABLES `hin` WRITE;
/*!40000 ALTER TABLE `hin` DISABLE KEYS */;
INSERT INTO `hin` VALUES (1,'2013-11-16 14:36:39','5555','000002');
/*!40000 ALTER TABLE `hin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_assignschedule`
--

DROP TABLE IF EXISTS `hr_assignschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_assignschedule` (
  `emp_ID` int(11) NOT NULL,
  `shift_ID` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emp_ID`,`shift_ID`),
  KEY `FK_HR_AssignSchedule_HR_ShiftTimes` (`shift_ID`),
  KEY `FK_lcd3k2vm2nm6rrejv5gs8sqmh` (`emp_ID`),
  KEY `FK_i98a811tyhtk6rdmfd8gov9ky` (`shift_ID`),
  CONSTRAINT `FK_i98a811tyhtk6rdmfd8gov9ky` FOREIGN KEY (`shift_ID`) REFERENCES `hr_shifttimes` (`shift_ID`),
  CONSTRAINT `FK_lcd3k2vm2nm6rrejv5gs8sqmh` FOREIGN KEY (`emp_ID`) REFERENCES `hr_employee` (`emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_assignschedule`
--

LOCK TABLES `hr_assignschedule` WRITE;
/*!40000 ALTER TABLE `hr_assignschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_assignschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_attendance`
--

DROP TABLE IF EXISTS `hr_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `in_time` datetime NOT NULL,
  `out_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `ot_hours` double NOT NULL DEFAULT '0',
  `employee_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `employee_id` (`employee_id`),
  KEY `FK_froe7bil86s0qemowe37tebi9` (`employee_id`),
  CONSTRAINT `FK_froe7bil86s0qemowe37tebi9` FOREIGN KEY (`employee_id`) REFERENCES `hr_employee` (`emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_attendance`
--

LOCK TABLES `hr_attendance` WRITE;
/*!40000 ALTER TABLE `hr_attendance` DISABLE KEYS */;
INSERT INTO `hr_attendance` VALUES (1,'2014-08-25 08:00:00','2026-08-25 18:00:00',0,0,1,1,0),(2,'2014-08-05 08:00:00','2026-08-05 18:00:00',0,0,19,1,0);
/*!40000 ALTER TABLE `hr_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_contact`
--

DROP TABLE IF EXISTS `hr_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_contact` (
  `contact_type_ID` int(11) NOT NULL,
  `emp_ID` int(11) NOT NULL,
  `contact` varchar(100) NOT NULL,
  PRIMARY KEY (`contact_type_ID`,`emp_ID`),
  KEY `FK_HR_Contact_HR_Employee` (`emp_ID`),
  KEY `FK_ol79cp1x6wtdt5aqxgt0gbk6l` (`emp_ID`),
  KEY `FK_c2vdxeb5ptucugmwd1jdd51fq` (`contact_type_ID`),
  CONSTRAINT `FK_c2vdxeb5ptucugmwd1jdd51fq` FOREIGN KEY (`contact_type_ID`) REFERENCES `hr_contacttype` (`contact_type_ID`),
  CONSTRAINT `FK_ol79cp1x6wtdt5aqxgt0gbk6l` FOREIGN KEY (`emp_ID`) REFERENCES `hr_employee` (`emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_contact`
--

LOCK TABLES `hr_contact` WRITE;
/*!40000 ALTER TABLE `hr_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_contacttype`
--

DROP TABLE IF EXISTS `hr_contacttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_contacttype` (
  `contact_type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `contact_type` varchar(50) NOT NULL,
  PRIMARY KEY (`contact_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_contacttype`
--

LOCK TABLES `hr_contacttype` WRITE;
/*!40000 ALTER TABLE `hr_contacttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_contacttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_department`
--

DROP TABLE IF EXISTS `hr_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_department` (
  `dept_ID` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) NOT NULL,
  `dept_head_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_ID`),
  KEY `FK_HR_Department_HR_Employee` (`dept_head_ID`),
  KEY `FK_3m6he27exxs37b9htkqfaq4s6` (`dept_head_ID`),
  CONSTRAINT `FK_3m6he27exxs37b9htkqfaq4s6` FOREIGN KEY (`dept_head_ID`) REFERENCES `hr_employee` (`emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_department`
--

LOCK TABLES `hr_department` WRITE;
/*!40000 ALTER TABLE `hr_department` DISABLE KEYS */;
INSERT INTO `hr_department` VALUES (1,'Administrarion',NULL),(3,'Ward-03',NULL),(4,'PCU',NULL),(5,'OPD',12),(6,'Ward-01',NULL),(7,'Ward-02',NULL);
/*!40000 ALTER TABLE `hr_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_designation`
--

DROP TABLE IF EXISTS `hr_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_designation` (
  `designation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(50) NOT NULL,
  `groups` int(11) DEFAULT NULL,
  PRIMARY KEY (`designation_ID`),
  KEY `group` (`groups`),
  KEY `group_2` (`groups`),
  KEY `FK_oo52x1wbx2fiegkd6xqhbsvt` (`groups`),
  CONSTRAINT `FK_oo52x1wbx2fiegkd6xqhbsvt` FOREIGN KEY (`groups`) REFERENCES `hr_designationgroup` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_designation`
--

LOCK TABLES `hr_designation` WRITE;
/*!40000 ALTER TABLE `hr_designation` DISABLE KEYS */;
INSERT INTO `hr_designation` VALUES (1,'Doctor',1),(2,'Head Nurse1',NULL),(3,'Nurse',NULL),(4,'Administrator',NULL),(5,'Child Specialist ',1),(6,'Physician',1),(7,'Surgeon',1),(8,'Chief Nurse',NULL),(9,'Chief',NULL),(10,'Pharmacist',NULL),(11,'Chief Pharmacist',NULL);
/*!40000 ALTER TABLE `hr_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_designationgroup`
--

DROP TABLE IF EXISTS `hr_designationgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_designationgroup` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_designationgroup`
--

LOCK TABLES `hr_designationgroup` WRITE;
/*!40000 ALTER TABLE `hr_designationgroup` DISABLE KEYS */;
INSERT INTO `hr_designationgroup` VALUES (1,'Doctor');
/*!40000 ALTER TABLE `hr_designationgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_employee`
--

DROP TABLE IF EXISTS `hr_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_employee` (
  `emp_ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `emp_image` blob,
  PRIMARY KEY (`emp_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_employee`
--

LOCK TABLES `hr_employee` WRITE;
/*!40000 ALTER TABLE `hr_employee` DISABLE KEYS */;
INSERT INTO `hr_employee` VALUES (1,'Mr','Wasantha ','Rathnayaka','1990-04-08','Male','Single','',NULL),(2,'Mrs','Rasangi','Perera','1990-03-23','Female','Single','',NULL),(12,'Dr','Nishadini','Fernando','2014-09-10','Female','Single','',NULL),(13,'Dr','Ishara','Gunathilake','2014-09-30','Male','Single','',NULL),(14,'Dr','Shermin','Fernandopulle','2014-09-24','Male','Single','',NULL),(15,'Dr','Kasun','Gunathilake','2014-10-01','Male','Single','',NULL),(16,'Dr','Shashindu','Samare','2014-10-01','Male','Single','',NULL),(17,'Dr','Himansha','De Silva','2014-10-01','Female','Single','',NULL),(19,'Dr','Dilini','Jaye','2014-10-01','Female','Single','',NULL),(20,'Dr','Sharmal','Perera','2014-10-01','Male','Single','',NULL),(21,'Dr','Nishon','Wishmith','2014-10-01','Male','Single','',NULL),(22,'Dr','Marlon','Moraes','2014-10-01','Male','Single','',NULL),(23,'Dr','Maleesha','Weerasinghe','2014-10-01','Female','Single','',NULL),(24,'Ms','Nishani','Fernando','2014-10-01','Female','Married','',NULL),(25,'Ms','Hasangi','Shashikala','2014-10-01','Female','Single','',NULL),(26,'Mr','Madhura','Perera','2014-10-01','Male','Married','',NULL);
/*!40000 ALTER TABLE `hr_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hr_employee_view`
--

DROP TABLE IF EXISTS `hr_employee_view`;
/*!50001 DROP VIEW IF EXISTS `hr_employee_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `hr_employee_view` AS SELECT 
 1 AS `emp_ID`,
 1 AS `title`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `birthday`,
 1 AS `gender`,
 1 AS `civil_status`,
 1 AS `Address`,
 1 AS `Phone`,
 1 AS `Mobile`,
 1 AS `Email`,
 1 AS `NIC`,
 1 AS `EPF`,
 1 AS `Driving_Licence`,
 1 AS `dept_name`,
 1 AS `designation_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hr_hasleaves`
--

DROP TABLE IF EXISTS `hr_hasleaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_hasleaves` (
  `emp_ID` int(11) NOT NULL,
  `leave_type_ID` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `remain` int(11) NOT NULL,
  PRIMARY KEY (`emp_ID`,`leave_type_ID`),
  KEY `FK_HR_HasLeaves_HR_LeaveType` (`leave_type_ID`),
  KEY `FK_bgxv25uth08t6c32j6dk6auso` (`emp_ID`),
  KEY `FK_1suslikcqgem3jssc2kfrowcm` (`leave_type_ID`),
  CONSTRAINT `FK_1suslikcqgem3jssc2kfrowcm` FOREIGN KEY (`leave_type_ID`) REFERENCES `hr_leavetype` (`leave_type_ID`),
  CONSTRAINT `FK_bgxv25uth08t6c32j6dk6auso` FOREIGN KEY (`emp_ID`) REFERENCES `hr_employee` (`emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_hasleaves`
--

LOCK TABLES `hr_hasleaves` WRITE;
/*!40000 ALTER TABLE `hr_hasleaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_hasleaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_identity`
--

DROP TABLE IF EXISTS `hr_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_identity` (
  `identity_type_ID` int(11) NOT NULL,
  `emp_ID` int(11) NOT NULL,
  `identity` varchar(50) NOT NULL,
  PRIMARY KEY (`identity_type_ID`,`emp_ID`),
  KEY `FK_HR_Identity_HR_Employee` (`emp_ID`),
  KEY `FK_ax5obk94mgl66fdgnexhocbmm` (`identity_type_ID`),
  KEY `FK_85wm11kbrfd35bgnkbfd05irs` (`emp_ID`),
  CONSTRAINT `FK_85wm11kbrfd35bgnkbfd05irs` FOREIGN KEY (`emp_ID`) REFERENCES `hr_employee` (`emp_ID`),
  CONSTRAINT `FK_ax5obk94mgl66fdgnexhocbmm` FOREIGN KEY (`identity_type_ID`) REFERENCES `hr_identitytype` (`identity_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_identity`
--

LOCK TABLES `hr_identity` WRITE;
/*!40000 ALTER TABLE `hr_identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_identitytype`
--

DROP TABLE IF EXISTS `hr_identitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_identitytype` (
  `identity_type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `identity_type` varchar(50) NOT NULL,
  PRIMARY KEY (`identity_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_identitytype`
--

LOCK TABLES `hr_identitytype` WRITE;
/*!40000 ALTER TABLE `hr_identitytype` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_identitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_leavetype`
--

DROP TABLE IF EXISTS `hr_leavetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_leavetype` (
  `leave_type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(50) NOT NULL,
  `no_of_days` int(11) NOT NULL,
  PRIMARY KEY (`leave_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_leavetype`
--

LOCK TABLES `hr_leavetype` WRITE;
/*!40000 ALTER TABLE `hr_leavetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_leavetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_shifttimes`
--

DROP TABLE IF EXISTS `hr_shifttimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_shifttimes` (
  `shift_ID` int(11) NOT NULL AUTO_INCREMENT,
  `from_datetime` datetime NOT NULL,
  `to_datetime` datetime NOT NULL,
  `dept_ID` int(11) NOT NULL,
  PRIMARY KEY (`shift_ID`),
  KEY `FK_HR_ShiftTimes_HR_Department` (`dept_ID`),
  KEY `FK_d0u8o7cx2rmf355d5u16mdivl` (`dept_ID`),
  CONSTRAINT `FK_d0u8o7cx2rmf355d5u16mdivl` FOREIGN KEY (`dept_ID`) REFERENCES `hr_department` (`dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_shifttimes`
--

LOCK TABLES `hr_shifttimes` WRITE;
/*!40000 ALTER TABLE `hr_shifttimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_shifttimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_takeleaves`
--

DROP TABLE IF EXISTS `hr_takeleaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_takeleaves` (
  `emp_ID` int(11) NOT NULL,
  `leave_type_ID` int(11) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `reason` varchar(100) NOT NULL,
  `approve_status` varchar(50) NOT NULL,
  PRIMARY KEY (`emp_ID`,`leave_type_ID`),
  KEY `FK_HR_TakeLeaves_HR_LeaveType` (`leave_type_ID`),
  KEY `FK_n1d1x9e5js82oeka57h7fg5tp` (`emp_ID`),
  KEY `FK_4gi3jp0yw6ubmtq06mfmvuuai` (`leave_type_ID`),
  CONSTRAINT `FK_4gi3jp0yw6ubmtq06mfmvuuai` FOREIGN KEY (`leave_type_ID`) REFERENCES `hr_leavetype` (`leave_type_ID`),
  CONSTRAINT `FK_n1d1x9e5js82oeka57h7fg5tp` FOREIGN KEY (`emp_ID`) REFERENCES `hr_employee` (`emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_takeleaves`
--

LOCK TABLES `hr_takeleaves` WRITE;
/*!40000 ALTER TABLE `hr_takeleaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_takeleaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_userattendance`
--

DROP TABLE IF EXISTS `hr_userattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_userattendance` (
  `Bcode` varchar(30) DEFAULT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `image` longblob,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_userattendance`
--

LOCK TABLES `hr_userattendance` WRITE;
/*!40000 ALTER TABLE `hr_userattendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `hr_userattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_workin`
--

DROP TABLE IF EXISTS `hr_workin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_workin` (
  `emp_ID` int(11) NOT NULL,
  `dept_ID` int(11) NOT NULL,
  `designation_ID` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` varchar(50) NOT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`emp_ID`,`dept_ID`,`designation_ID`),
  KEY `FK_HR_Department_HR_Designation` (`designation_ID`),
  KEY `FK_HR_WorkIn_HR_Department` (`dept_ID`),
  KEY `FK_t6qdai1uh3k0t8fp9f318xrgs` (`designation_ID`),
  KEY `FK_ikvkufiy0dpj7dyu6ild8c51h` (`dept_ID`),
  KEY `FK_chwpr486s5u03s2mesb8wcsjm` (`emp_ID`),
  CONSTRAINT `FK_chwpr486s5u03s2mesb8wcsjm` FOREIGN KEY (`emp_ID`) REFERENCES `hr_employee` (`emp_ID`),
  CONSTRAINT `FK_ikvkufiy0dpj7dyu6ild8c51h` FOREIGN KEY (`dept_ID`) REFERENCES `hr_department` (`dept_ID`),
  CONSTRAINT `FK_t6qdai1uh3k0t8fp9f318xrgs` FOREIGN KEY (`designation_ID`) REFERENCES `hr_designation` (`designation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_workin`
--

LOCK TABLES `hr_workin` WRITE;
/*!40000 ALTER TABLE `hr_workin` DISABLE KEYS */;
INSERT INTO `hr_workin` VALUES (1,5,1,'2014-11-13','2014-11-29','Assign',''),(12,1,1,'2014-08-01','2014-10-01','Assign',''),(13,6,1,'2015-03-01','2015-12-01','Assign',''),(19,5,1,'2014-08-01','2014-10-08','Assign','');
/*!40000 ALTER TABLE `hr_workin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icd10`
--

DROP TABLE IF EXISTS `icd10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd10` (
  `ICDID` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `isNotify` tinyint(1) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(200) DEFAULT NULL,
  `LastUpDate` datetime DEFAULT NULL,
  `LastUpDateUser` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ICDID`)
) ENGINE=InnoDB AUTO_INCREMENT=18777 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icd10`
--

LOCK TABLES `icd10` WRITE;
/*!40000 ALTER TABLE `icd10` DISABLE KEYS */;
INSERT INTO `icd10` VALUES (16985,'V40.63','Car occupant injured in collision with pedestrian or animal, passenger, traffic accident, passenger van ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16986,'V40.68','Car occupant injured in collision with pedestrian or animal, passenger, traffic accident, other specified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16987,'V40.69','Car occupant injured in collision with pedestrian or animal, passenger, traffic accident, unspecified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16988,'V40.7','Car occupant  injured in collision with pedestrian or animal, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16989,'V40.70','Car occupant injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident, sedan ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16990,'V40.71','Car occupant injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident, all-terrain four-wheel drive ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16991,'V40.72','Car occupant injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16992,'V40.73','Car occupant injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident, passenger van ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16993,'V40.78','Car occupant injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident, other specified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16994,'V40.79','Car occupant injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident, unspecified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16995,'V40.9','Car occupant  injured in collision with pedestrian or animal, unspecified car occupant , traffic accident, while engaged in sports activity',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16996,'V40.90','Car occupant injured in collision with pedestrian or animal, unspecified car occupant, traffic accident, sedan ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16997,'V40.91','Car occupant injured in collision with pedestrian or animal, unspecified car occupant, traffic accident, all-terrain four-wheel drive ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16998,'V40.92','Car occupant injured in collision with pedestrian or animal, unspecified car occupant, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(16999,'V40.93','Car occupant injured in collision with pedestrian or animal, unspecified car occupant, traffic accident, passenger van ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17000,'V40.98','Car occupant injured in collision with pedestrian or animal, unspecified car occupant, traffic accident, other specified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17001,'V40.99','Car occupant injured in collision with pedestrian or animal, unspecified car occupant, traffic accident, unspecified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17002,'V41.0','Car occupant  injured in collision with pedal cycle, driver, nontraffic accident, while engaged in sports activity',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17003,'V41.00','Car occupant injured in collision with pedal cycle, driver, nontraffic accident, sedan ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17004,'V41.01','Car occupant injured in collision with pedal cycle, driver, nontraffic accident, all-terrain four-wheel drive ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17005,'V41.02','Car occupant injured in collision with pedal cycle, driver, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17006,'V41.03','Car occupant injured in collision with pedal cycle, driver, nontraffic accident, passenger van ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17007,'V41.08','Car occupant injured in collision with pedal cycle, driver, nontraffic accident, other specified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17008,'V41.09','Car occupant injured in collision with pedal cycle, driver, nontraffic accident, unspecified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17009,'V41.1','Car occupant  injured in collision with pedal cycle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17010,'V41.10','Car occupant injured in collision with pedal cycle, passenger, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17011,'V41.11','Car occupant injured in collision with pedal cycle, passenger, nontraffic accident, all-terrain four-wheel drive ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17012,'V41.12','Car occupant injured in collision with pedal cycle, passenger, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17013,'V41.13','Car occupant injured in collision with pedal cycle, passenger, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17014,'V41.18','Car occupant injured in collision with pedal cycle, passenger, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17015,'V41.19','Car occupant injured in collision with pedal cycle, passenger, nontraffic accident, unspecified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17016,'V41.2','Car occupant  injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17017,'V41.20','Car occupant injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17018,'V41.21','Car occupant injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17019,'V41.22','Car occupant injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17020,'V41.23','Car occupant injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17021,'V41.28','Car occupant injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17022,'V41.29','Car occupant injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17023,'V41.3','Car occupant  injured in collision with pedal cycle, unspecified car occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17024,'V41.30','Car occupant injured in collision with pedal cycle, unspecified car occupant, nontraffic accident, sedan ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17025,'V41.31','Car occupant injured in collision with pedal cycle, unspecified car occupant, nontraffic accident, all-terrain four-wheel drive ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17026,'V41.32','Car occupant injured in collision with pedal cycle, unspecified car occupant, nontraffic accident, four-wheeled motor cycle ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17027,'V41.33','Car occupant injured in collision with pedal cycle, unspecified car occupant, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17028,'V41.38','Car occupant injured in collision with pedal cycle, unspecified car occupant, nontraffic accident, other specified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17029,'V41.39','Car occupant injured in collision with pedal cycle, unspecified car occupant, nontraffic accident, unspecified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17030,'V41.4','Car occupant  injured in collision with pedal cycle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17031,'V41.40','Car occupant injured in collision with pedal cycle, while boarding or alighting, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17032,'V41.41','Car occupant injured in collision with pedal cycle, while boarding or alighting, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17033,'V41.42','Car occupant injured in collision with pedal cycle, while boarding or alighting, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17034,'V41.43','Car occupant injured in collision with pedal cycle, while boarding or alighting, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17035,'V41.48','Car occupant injured in collision with pedal cycle, while boarding or alighting, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17036,'V41.49','Car occupant injured in collision with pedal cycle, while boarding or alighting, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17037,'V41.5','Car occupant  injured in collision with pedal cycle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17038,'V41.50','Car occupant injured in collision with pedal cycle, driver, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17039,'V41.51','Car occupant injured in collision with pedal cycle, driver, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17040,'V41.52','Car occupant injured in collision with pedal cycle, driver, traffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17041,'V41.53','Car occupant injured in collision with pedal cycle, driver, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17042,'V41.58','Car occupant injured in collision with pedal cycle, driver, traffic accident, other specified car [automobile',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17043,'V41.59','Car occupant injured in collision with pedal cycle, driver, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17044,'V41.6','Car occupant  injured in collision with pedal cycle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17045,'V41.60','Car occupant injured in collision with pedal cycle, passenger, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17046,'V41.61','Car occupant injured in collision with pedal cycle, passenger, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17047,'V41.62','Car occupant injured in collision with pedal cycle, passenger, traffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17048,'V41.63','Car occupant injured in collision with pedal cycle, passenger, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17049,'V41.68','Car occupant injured in collision with pedal cycle, passenger, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17050,'V41.69','Car occupant injured in collision with pedal cycle, passenger, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17051,'V41.7','Car occupant  injured in collision with pedal cycle, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17052,'V41.70','Car occupant injured in collision with pedal cycle, person on outside of vehicle, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17053,'V41.71','Car occupant injured in collision with pedal cycle, person on outside of vehicle, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17054,'V41.72','Car occupant injured in collision with pedal cycle, person on outside of vehicle, traffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17055,'V41.73','Car occupant injured in collision with pedal cycle, person on outside of vehicle, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17056,'V41.78','Car occupant injured in collision with pedal cycle, person on outside of vehicle, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17057,'V41.79','Car occupant injured in collision with pedal cycle, person on outside of vehicle, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17058,'V41.9','Car occupant  injured in collision with pedal cycle, unspecified car occupant , traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17059,'V41.90','Car occupant injured in collision with pedal cycle, unspecified car occupant, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17060,'V41.91','Car occupant injured in collision with pedal cycle, unspecified car occupant, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17061,'V41.92','Car occupant injured in collision with pedal cycle, unspecified car occupant, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17062,'V41.93','Car occupant injured in collision with pedal cycle, unspecified car occupant, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17063,'V41.98','Car occupant injured in collision with pedal cycle, unspecified car occupant, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17064,'V41.99','Car occupant injured in collision with pedal cycle, unspecified car occupant, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17065,'V42.0','Car occupant  injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17066,'V42.00','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17067,'V42.01','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17068,'V42.02','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17069,'V42.03','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17070,'V42.08','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17071,'V42.09','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17072,'V42.1','Car occupant  injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17073,'V42.10','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17074,'V42.11','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17075,'V42.12','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17076,'V42.13','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17077,'V42.18','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17078,'V42.19','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17079,'V42.2','Car occupant  injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17080,'V42.20','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17081,'V42.21','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17082,'V42.22','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17083,'V42.23','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17084,'V42.28','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17085,'V42.29','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17086,'V42.3','Car occupant  injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17087,'V42.30','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17088,'V42.31','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17089,'V42.32','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17090,'V42.33','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17091,'V42.38','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17092,'V42.39','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17093,'V42.4','Car occupant  injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17094,'V42.40','Car occupant injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17095,'V42.41','Car occupant injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17096,'V42.42','Car occupant injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17097,'V42.43','Car occupant injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17098,'V42.48','Car occupant injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17099,'V42.49','Car occupant injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17100,'V42.5','Car occupant  injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17101,'V42.50','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17102,'V42.51','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17103,'V42.52','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17104,'V42.53','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17105,'V42.58','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17106,'V42.59','Car occupant injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17107,'V42.6','Car occupant  injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17108,'V42.60','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17109,'V42.61','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17110,'V42.62','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17111,'V42.63','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17112,'V42.68','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17113,'V42.69','Car occupant injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17114,'V42.7','Car occupant  injured in collision with two- or three-wheeled motor vehicle, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17115,'V42.70','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17116,'V42.71','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17117,'V42.72','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17118,'V42.73','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17119,'V42.78','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident, other specified car [automobile] ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17120,'V42.79','Car occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17121,'V42.9','Car occupant  injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant , traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17122,'V42.90','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17123,'V42.91','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17124,'V42.92','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17125,'V42.93','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17126,'V42.98','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17127,'V42.99','Car occupant injured in collision with two- or three-wheeled motor vehicle, unspecified car occupant, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17128,'V43.0','Car occupant  injured in collision with car, pick-up truck or van, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17129,'V43.00','Car occupant injured in collision with car, pick-up truck or van, driver, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17130,'V43.01','Car occupant injured in collision with car, pick-up truck or van, driver, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17131,'V43.02','Car occupant injured in collision with car, pick-up truck or van, driver, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17132,'V43.03','Car occupant injured in collision with car, pick-up truck or van, driver, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17133,'V43.08','Car occupant injured in collision with car, pick-up truck or van, driver, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17134,'V43.09','Car occupant injured in collision with car, pick-up truck or van, driver, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17135,'V43.1','Car occupant  injured in collision with car, pick-up truck or van, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17136,'V43.10','Car occupant injured in collision with car, pick-up truck or van, passenger, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17137,'V43.11','Car occupant injured in collision with car, pick-up truck or van, passenger, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17138,'V43.12','Car occupant injured in collision with car, pick-up truck or van, passenger, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17139,'V43.13','Car occupant injured in collision with car, pick-up truck or van, passenger, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17140,'V43.18','Car occupant injured in collision with car, pick-up truck or van, passenger, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17141,'V43.19','Car occupant injured in collision with car, pick-up truck or van, passenger, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17142,'V43.2','Car occupant  injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17143,'V43.20','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17144,'V43.21','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17145,'V43.22','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17146,'V43.23','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17147,'V43.28','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17148,'V43.29','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17149,'V43.3','Car occupant  injured in collision with car, pick-up truck or van, unspecified car occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17150,'V43.30','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17151,'V43.31','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17152,'V43.32','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17153,'V43.33','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17154,'V43.38','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17155,'V43.39','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17156,'V43.4','Car occupant  injured in collision with car, pick-up truck or van, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17157,'V43.40','Car occupant injured in collision with car, pick-up truck or van, while boarding or alighting, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17158,'V43.41','Car occupant injured in collision with car, pick-up truck or van, while boarding or alighting, all-terrain four wheel-drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17159,'V43.42','Car occupant injured in collision with car, pick-up truck or van, while boarding or alighting, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17160,'V43.43','Car occupant injured in collision with car, pick-up truck or van, while boarding or alighting, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17161,'V43.48','Car occupant injured in collision with car, pick-up truck or van, while boarding or alighting, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17162,'V43.49','Car occupant injured in collision with car, pick-up truck or van, while boarding or alighting, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17163,'V43.5','Car occupant  injured in collision with car, pick-up truck or van, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17164,'V43.50','Car occupant injured in collision with car, pick-up truck or van, driver, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17165,'V43.51','Car occupant injured in collision with car, pick-up truck or van, driver, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17166,'V43.52','Car occupant injured in collision with car, pick-up truck or van, driver, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17167,'V43.53','Car occupant injured in collision with car, pick-up truck or van, driver, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17168,'V43.58','Car occupant injured in collision with car, pick-up truck or van, driver, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17169,'V43.59','Car occupant injured in collision with car, pick-up truck or van, driver, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17170,'V43.6','Car occupant  injured in collision with car, pick-up truck or van, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17171,'V43.60','Car occupant injured in collision with car, pick-up truck or van, passenger, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17172,'V43.61','Car occupant injured in collision with car, pick-up truck or van, passenger, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17173,'V43.62','Car occupant injured in collision with car, pick-up truck or van, passenger, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17174,'V43.63','Car occupant injured in collision with car, pick-up truck or van, passenger, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17175,'V43.68','Car occupant injured in collision with car, pick-up truck or van, passenger, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17176,'V43.69','Car occupant injured in collision with car, pick-up truck or van, passenger, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17177,'V43.7','Car occupant  injured in collision with car, pick-up truck or van, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17178,'V43.70','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17179,'V43.71','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17180,'V43.72','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17181,'V43.73','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17182,'V43.78','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17183,'V43.79','Car occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17184,'V43.9','Car occupant  injured in collision with car, pick-up truck or van, unspecified car occupant , traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17185,'V43.90','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17186,'V43.91','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17187,'V43.92','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17188,'V43.93','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17189,'V43.98','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17190,'V43.99','Car occupant injured in collision with car, pick-up truck or van, unspecified car occupant, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17191,'V44.0','Car occupant  injured in collision with heavy transport vehicle or bus, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17192,'V44.00','Car occupant injured in collision with heavy transport vehicle or bus, driver, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17193,'V44.01','Car occupant injured in collision with heavy transport vehicle or bus, driver, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17194,'V44.02','Car occupant injured in collision with heavy transport vehicle or bus, driver, nontraffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17195,'V44.03','Car occupant injured in collision with heavy transport vehicle or bus, driver, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17196,'V44.08','Car occupant injured in collision with heavy transport vehicle or bus, driver, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17197,'V44.09','Car occupant injured in collision with heavy transport vehicle or bus, driver, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17198,'V44.1','Car occupant  injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17199,'V44.10','Car occupant injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17200,'V44.11','Car occupant injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17201,'V44.12','Car occupant injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17202,'V44.13','Car occupant injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17203,'V44.18','Car occupant injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17204,'V44.19','Car occupant injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17205,'V44.2','Car occupant  injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17206,'V44.20','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17207,'V44.21','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17208,'V44.22','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17209,'V44.23','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17210,'V44.28','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17211,'V44.29','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17212,'V44.3','Car occupant  injured in collision with heavy transport vehicle or bus, unspecified car occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17213,'V44.30','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17214,'V44.31','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17215,'V44.32','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, nontraffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17216,'V44.33','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17217,'V44.38','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17218,'V44.39','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17219,'V44.4','Car occupant  injured in collision with heavy transport vehicle or bus, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17220,'V44.40','Car occupant injured in collision with heavy transport vehicle or bus, while boarding or alighting, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17221,'V44.41','Car occupant injured in collision with heavy transport vehicle or bus, while boarding or alighting, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17222,'V44.42','Car occupant injured in collision with heavy transport vehicle or bus, while boarding or alighting, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17223,'V44.43','Car occupant injured in collision with heavy transport vehicle or bus, while boarding or alighting, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17224,'V44.48','Car occupant injured in collision with heavy transport vehicle or bus, while boarding or alighting, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17225,'V44.49','Car occupant injured in collision with heavy transport vehicle or bus, while boarding or alighting, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17226,'V44.5','Car occupant  injured in collision with heavy transport vehicle or bus, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17227,'V44.50','Car occupant injured in collision with heavy transport vehicle or bus, driver, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17228,'V44.51','Car occupant injured in collision with heavy transport vehicle or bus, driver, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17229,'V44.52','Car occupant injured in collision with heavy transport vehicle or bus, driver, traffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17230,'V44.53','Car occupant injured in collision with heavy transport vehicle or bus, driver, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17231,'V44.58','Car occupant injured in collision with heavy transport vehicle or bus, driver, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17232,'V44.59','Car occupant injured in collision with heavy transport vehicle or bus, driver, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17233,'V44.6','Car occupant  injured in collision with heavy transport vehicle or bus, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17234,'V44.60','Car occupant injured in collision with heavy transport vehicle or bus, passenger, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17235,'V44.61','Car occupant injured in collision with heavy transport vehicle or bus, passenger, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17236,'V44.62','Car occupant injured in collision with heavy transport vehicle or bus, passenger, traffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17237,'V44.63','Car occupant injured in collision with heavy transport vehicle or bus, passenger, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17238,'V44.68','Car occupant injured in collision with heavy transport vehicle or bus, passenger, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17239,'V44.69','Car occupant injured in collision with heavy transport vehicle or bus, passenger, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17240,'V44.7','Car occupant  injured in collision with heavy transport vehicle or bus, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17241,'V44.70','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17242,'V44.71','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17243,'V44.72','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17244,'V44.73','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17245,'V44.78','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17246,'V44.79','Car occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17247,'V44.9','Car occupant  injured in collision with heavy transport vehicle or bus, unspecified car occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17248,'V44.90','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17249,'V44.91','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17250,'V44.92','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, traffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17251,'V44.93','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17252,'V44.98','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17253,'V44.99','Car occupant injured in collision with heavy transport vehicle or bus, unspecified car occupant, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17254,'V45.0','Car occupant  injured in collision with railway train or railway vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17255,'V45.00','Car occupant injured in collision with railway train or railway vehicle, driver, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17256,'V45.01','Car occupant injured in collision with railway train or railway vehicle, driver, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17257,'V45.02','Car occupant injured in collision with railway train or railway vehicle, driver, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17258,'V45.03','Car occupant injured in collision with railway train or railway vehicle, driver, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17259,'V45.08','Car occupant injured in collision with railway train or railway vehicle, driver, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17260,'V45.09','Car occupant injured in collision with railway train or railway vehicle, driver, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17261,'V45.1','Car occupant  injured in collision with railway train or railway vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17262,'V45.10','Car occupant injured in collision with railway train or railway vehicle, passenger, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17263,'V45.11','Car occupant injured in collision with railway train or railway vehicle, passenger, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17264,'V45.12','Car occupant injured in collision with railway train or railway vehicle, passenger, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17265,'V45.13','Car occupant injured in collision with railway train or railway vehicle, passenger, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17266,'V45.18','Car occupant injured in collision with railway train or railway vehicle, passenger, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17267,'V45.19','Car occupant injured in collision with railway train or railway vehicle, passenger, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17268,'V45.2','Car occupant  injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17269,'V45.20','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17270,'V45.21','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17271,'V45.22','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17272,'V45.23','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17273,'V45.28','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17274,'V45.29','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17275,'V45.3','Car occupant  injured in collision with railway train or railway vehicle, unspecified car occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17276,'V45.30','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17277,'V45.31','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17278,'V45.32','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17279,'V45.33','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17280,'V45.38','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17281,'V45.39','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17282,'V45.4','Car occupant  injured in collision with railway train or railway vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17283,'V45.40','Car occupant injured in collision with railway train or railway vehicle, while boarding or alighting, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17284,'V45.41','Car occupant injured in collision with railway train or railway vehicle, while boarding or alighting, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17285,'V45.42','Car occupant injured in collision with railway train or railway vehicle, while boarding or alighting, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17286,'V45.43','Car occupant injured in collision with railway train or railway vehicle, while boarding or alighting, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17287,'V45.48','Car occupant injured in collision with railway train or railway vehicle, while boarding or alighting, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17288,'V45.49','Car occupant injured in collision with railway train or railway vehicle, while boarding or alighting, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17289,'V45.5','Car occupant  injured in collision with railway train or railway vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17290,'V45.50','Car occupant injured in collision with railway train or railway vehicle, driver, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17291,'V45.51','Car occupant injured in collision with railway train or railway vehicle, driver, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17292,'V45.52','Car occupant injured in collision with railway train or railway vehicle, driver, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17293,'V45.53','Car occupant injured in collision with railway train or railway vehicle, driver, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17294,'V45.58','Car occupant injured in collision with railway train or railway vehicle, driver, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17295,'V45.59','Car occupant injured in collision with railway train or railway vehicle, driver, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17296,'V45.6','Car occupant  injured in collision with railway train or railway vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17297,'V45.60','Car occupant injured in collision with railway train or railway vehicle, passenger, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17298,'V45.61','Car occupant injured in collision with railway train or railway vehicle, passenger, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17299,'V45.62','Car occupant injured in collision with railway train or railway vehicle, passenger, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17300,'V45.63','Car occupant injured in collision with railway train or railway vehicle, passenger, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17301,'V45.68','Car occupant injured in collision with railway train or railway vehicle, passenger, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17302,'V45.69','Car occupant injured in collision with railway train or railway vehicle, passenger, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17303,'V45.7','Car occupant  injured in collision with railway train or railway vehicle, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17304,'V45.70','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17305,'V45.71','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17306,'V45.72','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17307,'V45.73','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17308,'V45.78','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17309,'V45.79','Car occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17310,'V45.9','Car occupant  injured in collision with railway train or railway vehicle, unspecified car occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17311,'V45.90','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17312,'V45.91','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17313,'V45.92','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17314,'V45.93','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17315,'V45.98','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17316,'V45.99','Car occupant injured in collision with railway train or railway vehicle, unspecified car occupant, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17317,'V46.0','Car occupant  injured in collision with other nonmotor vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17318,'V46.00','Car occupant injured in collision with other nonmotor vehicle, driver, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17319,'V46.01','Car occupant injured in collision with other nonmotor vehicle, driver, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17320,'V46.02','Car occupant injured in collision with other nonmotor vehicle, driver, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17321,'V46.03','Car occupant injured in collision with other nonmotor vehicle, driver, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17322,'V46.08','Car occupant injured in collision with other nonmotor vehicle, driver, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17323,'V46.09','Car occupant injured in collision with other nonmotor vehicle, driver, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17324,'V46.1','Car occupant  injured in collision with other nonmotor vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17325,'V46.10','Car occupant injured in collision with other nonmotor vehicle, passenger, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17326,'V46.11','Car occupant injured in collision with other nonmotor vehicle, passenger, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17327,'V46.12','Car occupant injured in collision with other nonmotor vehicle, passenger, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17328,'V46.13','Car occupant injured in collision with other nonmotor vehicle, passenger, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17329,'V46.18','Car occupant injured in collision with other nonmotor vehicle, passenger, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17330,'V46.19','Car occupant injured in collision with other nonmotor vehicle, passenger, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17331,'V46.2','Car occupant  injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17332,'V46.20','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17333,'V46.21','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17334,'V46.22','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17335,'V46.23','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17336,'V46.28','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17337,'V46.29','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17338,'V46.3','Car occupant  injured in collision with other nonmotor vehicle, unspecified car occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17339,'V46.30','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17340,'V46.31','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17341,'V46.32','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17342,'V46.33','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17343,'V46.38','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17344,'V46.39','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17345,'V46.4','Car occupant  injured in collision with other nonmotor vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17346,'V46.40','Car occupant injured in collision with other nonmotor vehicle, while boarding or alighting, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17347,'V46.41','Car occupant injured in collision with other nonmotor vehicle, while boarding or alighting, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17348,'V46.42','Car occupant injured in collision with other nonmotor vehicle, while boarding or alighting, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17349,'V46.43','Car occupant injured in collision with other nonmotor vehicle, while boarding or alighting, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17350,'V46.48','Car occupant injured in collision with other nonmotor vehicle, while boarding or alighting, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17351,'V46.49','Car occupant injured in collision with other nonmotor vehicle, while boarding or alighting, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17352,'V46.5','Car occupant  injured in collision with other nonmotor vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17353,'V46.50','Car occupant injured in collision with other nonmotor vehicle, driver, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17354,'V46.51','Car occupant injured in collision with other nonmotor vehicle, driver, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17355,'V46.52','Car occupant injured in collision with other nonmotor vehicle, driver, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17356,'V46.53','Car occupant injured in collision with other nonmotor vehicle, driver, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17357,'V46.58','Car occupant injured in collision with other nonmotor vehicle, driver, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17358,'V46.59','Car occupant injured in collision with other nonmotor vehicle, driver, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17359,'V46.6','Car occupant  injured in collision with other nonmotor vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17360,'V46.60','Car occupant injured in collision with other nonmotor vehicle, passenger, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17361,'V46.61','Car occupant injured in collision with other nonmotor vehicle, passenger, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17362,'V46.62','Car occupant injured in collision with other nonmotor vehicle, passenger, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17363,'V46.63','Car occupant injured in collision with other nonmotor vehicle, passenger, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17364,'V46.68','Car occupant injured in collision with other nonmotor vehicle, passenger, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17365,'V46.69','Car occupant injured in collision with other nonmotor vehicle, passenger, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17366,'V46.7','Car occupant  injured in collision with other nonmotor vehicle, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17367,'V46.70','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17368,'V46.71','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17369,'V46.72','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17370,'V46.73','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17371,'V46.78','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17372,'V46.79','Car occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17373,'V46.9','Car occupant  injured in collision with other nonmotor vehicle, unspecified car occupant , traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17374,'V46.90','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17375,'V46.91','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17376,'V46.92','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17377,'V46.93','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17378,'V46.98','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17379,'V46.99','Car occupant injured in collision with other nonmotor vehicle, unspecified car occupant, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17380,'V47.0','Car occupant  injured in collision with fixed or stationary object, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17381,'V47.00','Car occupant injured in collision with fixed or stationary object, driver, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17382,'V47.01','Car occupant injured in collision with fixed or stationary object, driver, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17383,'V47.02','Car occupant injured in collision with fixed or stationary object, driver, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17384,'V47.03','Car occupant injured in collision with fixed or stationary object, driver, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17385,'V47.08','Car occupant injured in collision with fixed or stationary object, driver, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17386,'V47.09','Car occupant injured in collision with fixed or stationary object, driver, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17387,'V47.1','Car occupant  injured in collision with fixed or stationary object, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17388,'V47.10','Car occupant injured in collision with fixed or stationary object, passenger, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17389,'V47.11','Car occupant injured in collision with fixed or stationary object, passenger, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17390,'V47.12','Car occupant injured in collision with fixed or stationary object, passenger, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17391,'V47.13','Car occupant injured in collision with fixed or stationary object, passenger, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17392,'V47.18','Car occupant injured in collision with fixed or stationary object, passenger, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17393,'V47.19','Car occupant injured in collision with fixed or stationary object, passenger, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17394,'V47.2','Car occupant  injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17395,'V47.20','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17396,'V47.21','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17397,'V47.22','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17398,'V47.23','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17399,'V47.28','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17400,'V47.29','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17401,'V47.3','Car occupant  injured in collision with fixed or stationary object, unspecified car occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17402,'V47.30','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17403,'V47.31','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17404,'V47.32','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17405,'V47.33','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17406,'V47.38','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17407,'V47.39','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17408,'V47.4','Car occupant  injured in collision with fixed or stationary object, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17409,'V47.40','Car occupant injured in collision with fixed or stationary object, while boarding or alighting, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17410,'V47.41','Car occupant injured in collision with fixed or stationary object, while boarding or alighting, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17411,'V47.42','Car occupant injured in collision with fixed or stationary object, while boarding or alighting, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17412,'V47.43','Car occupant injured in collision with fixed or stationary object, while boarding or alighting, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17413,'V47.48','Car occupant injured in collision with fixed or stationary object, while boarding or alighting, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17414,'V47.49','Car occupant injured in collision with fixed or stationary object, while boarding or alighting, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17415,'V47.5','Car occupant  injured in collision with fixed or stationary object, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17416,'V47.50','Car occupant injured in collision with fixed or stationary object, driver, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17417,'V47.51','Car occupant injured in collision with fixed or stationary object, driver, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17418,'V47.52','Car occupant injured in collision with fixed or stationary object, driver, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17419,'V47.53','Car occupant injured in collision with fixed or stationary object, driver, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17420,'V47.58','Car occupant injured in collision with fixed or stationary object, driver, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17421,'V47.59','Car occupant injured in collision with fixed or stationary object, driver, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17422,'V47.6','Car occupant  injured in collision with fixed or stationary object, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17423,'V47.60','Car occupant injured in collision with fixed or stationary object, passenger, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17424,'V47.61','Car occupant injured in collision with fixed or stationary object, passenger, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17425,'V47.62','Car occupant injured in collision with fixed or stationary object, passenger, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17426,'V47.63','Car occupant injured in collision with fixed or stationary object, passenger, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17427,'V47.68','Car occupant injured in collision with fixed or stationary object, passenger, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17428,'V47.69','Car occupant injured in collision with fixed or stationary object, passenger, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17429,'V47.7','Car occupant  injured in collision with fixed or stationary object, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17430,'V47.70','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17431,'V47.71','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17432,'V47.72','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17433,'V47.73','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17434,'V47.78','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17435,'V47.79','Car occupant injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17436,'V47.9','Car occupant  injured in collision with fixed or stationary object, unspecified car occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17437,'V47.90','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17438,'V47.91','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17439,'V47.92','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, traffic accident, four-wheeled motor cycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17440,'V47.93','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17441,'V47.98','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17442,'V47.99','Car occupant injured in collision with fixed or stationary object, unspecified car occupant, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17443,'V48.0','Car occupant  injured in noncollision transport accident, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17444,'V48.00','Car occupant injured in noncollision transport accident, driver, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17445,'V48.01','Car occupant injured in noncollision transport accident, driver, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17446,'V48.02','Car occupant injured in noncollision transport accident, driver, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17447,'V48.03','Car occupant injured in noncollision transport accident, driver, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17448,'V48.08','Car occupant injured in noncollision transport accident, driver, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17449,'V48.09','Car occupant injured in noncollision transport accident, driver, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17450,'V48.1','Car occupant  injured in noncollision transport accident, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17451,'V48.10','Car occupant injured in noncollision transport accident, passenger, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17452,'V48.11','Car occupant injured in noncollision transport accident, passenger, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17453,'V48.12','Car occupant injured in noncollision transport accident, passenger, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17454,'V48.13','Car occupant injured in noncollision transport accident, passenger, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17455,'V48.18','Car occupant injured in noncollision transport accident, passenger, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17456,'V48.19','Car occupant injured in noncollision transport accident, passenger, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17457,'V48.2','Car occupant  injured in noncollision transport accident, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17458,'V48.20','Car occupant injured in noncollision transport accident, person on outside of vehicle, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17459,'V48.21','Car occupant injured in noncollision transport accident, person on outside of vehicle, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17460,'V48.22','Car occupant injured in noncollision transport accident, person on outside of vehicle, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17461,'V48.23','Car occupant injured in noncollision transport accident, person on outside of vehicle, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17462,'V48.28','Car occupant injured in noncollision transport accident, person on outside of vehicle, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17463,'V48.29','Car occupant injured in noncollision transport accident, person on outside of vehicle, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17464,'V48.3','Car occupant  injured in noncollision transport accident, unspecified car occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17465,'V48.30','Car occupant injured in noncollision transport accident, unspecified car occupant, nontraffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17466,'V48.31','Car occupant injured in noncollision transport accident, unspecified car occupant, nontraffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17467,'V48.32','Car occupant injured in noncollision transport accident, unspecified car occupant, nontraffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17468,'V48.33','Car occupant injured in noncollision transport accident, unspecified car occupant, nontraffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17469,'V48.38','Car occupant injured in noncollision transport accident, unspecified car occupant, nontraffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17470,'V48.39','Car occupant injured in noncollision transport accident, unspecified car occupant, nontraffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17471,'V48.4','Car occupant  injured in noncollision transport accident, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17472,'V48.40','Car occupant injured in noncollision transport accident, while boarding or alighting, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17473,'V48.41','Car occupant injured in noncollision transport accident, while boarding or alighting, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17474,'V48.42','Car occupant injured in noncollision transport accident, while boarding or alighting, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17475,'V48.43','Car occupant injured in noncollision transport accident, while boarding or alighting, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17476,'V48.48','Car occupant injured in noncollision transport accident, while boarding or alighting, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17477,'V48.49','Car occupant injured in noncollision transport accident, while boarding or alighting, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17478,'V48.5','Car occupant  injured in noncollision transport accident, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17479,'V48.50','Car occupant injured in noncollision transport accident, driver, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17480,'V48.51','Car occupant injured in noncollision transport accident, driver, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17481,'V48.52','Car occupant injured in noncollision transport accident, driver, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17482,'V48.53','Car occupant injured in noncollision transport accident, driver, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17483,'V48.58','Car occupant injured in noncollision transport accident, driver, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17484,'V48.59','Car occupant injured in noncollision transport accident, driver, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17485,'V48.6','Car occupant  injured in noncollision transport accident, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17486,'V48.60','Car occupant injured in noncollision transport accident, passenger, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17487,'V48.61','Car occupant injured in noncollision transport accident, passenger, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17488,'V48.62','Car occupant injured in noncollision transport accident, passenger, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17489,'V48.63','Car occupant injured in noncollision transport accident, passenger, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17490,'V48.68','Car occupant injured in noncollision transport accident, passenger, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17491,'V48.69','Car occupant injured in noncollision transport accident, passenger, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17492,'V48.7','Car occupant  injured in noncollision transport accident, person on oustide of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17493,'V48.70','Car occupant injured in noncollision transport accident, person on outside of vehicle, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17494,'V48.71','Car occupant injured in noncollision transport accident, person on outside of vehicle, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17495,'V48.72','Car occupant injured in noncollision transport accident, person on outside of vehicle, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17496,'V48.73','Car occupant injured in noncollision transport accident, person on outside of vehicle, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17497,'V48.78','Car occupant injured in noncollision transport accident, person on outside of vehicle, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17498,'V48.79','Car occupant injured in noncollision transport accident, person on outside of vehicle, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17499,'V48.9','Car occupant  injured in noncollision transport accident, unspecified car occupant , traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17500,'V48.90','Car occupant injured in noncollision transport accident, unspecified car occupant, traffic accident, sedan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17501,'V48.91','Car occupant injured in noncollision transport accident, unspecified car occupant, traffic accident, all-terrain four-wheel drive',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17502,'V48.92','Car occupant injured in noncollision transport accident, unspecified car occupant, traffic accident, four-wheeled motorcycle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17503,'V48.93','Car occupant injured in noncollision transport accident, unspecified car occupant, traffic accident, passenger van',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17504,'V48.98','Car occupant injured in noncollision transport accident, unspecified car occupant, traffic accident, other specified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17505,'V48.99','Car occupant injured in noncollision transport accident, unspecified car occupant, traffic accident, unspecified car [automobile]',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17506,'V50.0','Occupant of pick-up truck or van injured in collision with pedestrian or animal, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17507,'V50.1','Occupant of pick-up truck or van injured in collision with pedestrian or animal, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17508,'V50.2','Occupant of pick-up truck or van injured in collision with pedestrian or animal, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17509,'V50.3','Occupant of pick-up truck or van injured in collision with pedestrian or animal, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17510,'V50.4','Occupant of pick-up truck or van injured in collision with pedestrian or animal, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17511,'V50.5','Occupant of pick-up truck or van injured in collision with pedestrian or animal, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17512,'V50.6','Occupant of pick-up truck or van injured in collision with pedestrian or animal, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17513,'V50.7','Occupant of pick-up truck or van injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17514,'V50.9','Occupant of pick-truck or van injured in collision with pedestrian or animal, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17515,'V51.0','Occupant of pick-up truck or van injured in collision with pedal cycle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17516,'V51.1','Occupant of pick-up truck or van injured in collision with pedal cycle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17517,'V51.2','Occupant of pick-up truck or van injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17518,'V51.3','Occupant of pick-up truck or van injured in collision with pedal cycle, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17519,'V51.4','Occupant of pick-up truck or van injured in collision with pedal cycle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17520,'V51.5','Occupant of pick-up truck or van injured in collision with pedal cycle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17521,'V51.6','Occupant of pick-up truck or van injured in collision with pedal cycle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17522,'V51.7','Occupant of pick-up truck or van injured in collision with pedal cycle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17523,'V51.9','Occupant of pick-truck or van injured in collision with pedal cycle, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17524,'V52.0','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17525,'V52.1','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17526,'V52.2','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17527,'V52.3','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17528,'V52.4','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17529,'V52.5','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17530,'V52.6','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17531,'V52.7','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17532,'V52.9','Occupant of pick-up truck or van injured in collision with two- or three-wheeled motor vehicle, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17533,'V53.0','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17534,'V53.1','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17535,'V53.2','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17536,'V53.3','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17537,'V53.4','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17538,'V53.5','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17539,'V53.6','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17540,'V53.7','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17541,'V53.9','Occupant of pick-up truck or van injured in collision with car, pick-up truck or van, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17542,'V54.0','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17543,'V54.1','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17544,'V54.2','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17545,'V54.3','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17546,'V54.4','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17547,'V54.5','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17548,'V54.6','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17549,'V54.7','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17550,'V54.9','Occupant of pick-up truck or van injured in collision with heavy transport vehicle or bus, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17551,'V55.0','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17552,'V55.1','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17553,'V55.2','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17554,'V55.3','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17555,'V55.4','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17556,'V55.5','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17557,'V55.6','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17558,'V55.7','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17559,'V55.9','Occupant of pick-up truck or van injured in collision with railway train or railway vehicle, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17560,'V56.0','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17561,'V56.1','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17562,'V56.2','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17563,'V56.3','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17564,'V56.4','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17565,'V56.5','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17566,'V56.6','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17567,'V56.7','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17568,'V56.9','Occupant of pick-up truck or van injured in collision with other nonmotor vehicle, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17569,'V57.0','Occupant of pick-up truck or van injured in collision with fixed or stationary object, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17570,'V57.1','Occupant of pick-up truck or van injured in collision with fixed or stationary object, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17571,'V57.2','Occupant of pick-up truck or van injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17572,'V57.3','Occupant of pick-up truck or van injured in collision with fixed or stationary object, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17573,'V57.4','Occupant of pick-up truck or van injured in collision with fixed or stationary object, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17574,'V57.5','Occupant of pick-up truck or van injured in collision with fixed or stationary object, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17575,'V57.6','Occupant of pick-up truck or van injured in collision with fixed or stationary object, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17576,'V57.7','Occupant of pick-up truck or van injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17577,'V57.9','Occupant of pick-up truck or van injured in collision with fixed or stationary object, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17578,'V58.0','Occupant of pick-up truck or van injured in noncollision transport accident, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17579,'V58.1','Occupant of pick-up truck or van injured in noncollision transport accident, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17580,'V58.2','Occupant of pick-up truck or van injured in noncollision transport accident, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17581,'V58.3','Occupant of pick-up truck or van injured in noncollision transport accident, unspecified occupant of pick-up truck or van, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17582,'V58.4','Occupant of pick-up truck or van injured in noncollision transport accident, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17583,'V58.5','Occupant of pick-up truck or van injured in noncollision transport accident, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17584,'V58.6','Occupant of pick-up truck or van injured in noncollision transport accident, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17585,'V58.7','Occupant of pick-up truck or van injured in noncollision transport accident, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17586,'V58.9','Occupant of pick-up truck or van injured in noncollision transport accident, unspecified occupant of pick-up truck or van, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17587,'V60.0','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17588,'V60.1','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17589,'V60.2','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17590,'V60.3','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17591,'V60.4','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17592,'V60.5','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17593,'V60.6','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17594,'V60.7','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17595,'V60.9','Occupant of heavy transport vehicle injured in collision with pedestrian or animal, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17596,'V61.0','Occupant of heavy transport vehicle injured in collision with pedal cycle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17597,'V61.1','Occupant of heavy transport vehicle injured in collision with pedal cycle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17598,'V61.2','Occupant of heavy transport vehicle injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17599,'V61.3','Occupant of heavy transport vehicle injured in collision with pedal cycle, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17600,'V61.4','Occupant of heavy transport vehicle injured in collision with pedal cycle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17601,'V61.5','Occupant of heavy transport vehicle injured in collision with pedal cycle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17602,'V61.6','Occupant of heavy transport vehicle injured in collision with pedal cycle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17603,'V61.7','Occupant of heavy transport vehicle injured in collision with pedal cycle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17604,'V61.9','Occupant of heavy transport vehicle injured in collision with pedal cycle, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17605,'V62.0','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17606,'V62.1','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17607,'V62.2','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17608,'V62.3','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17609,'V62.4','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17610,'V62.5','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17611,'V62.6','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17612,'V62.7','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17613,'V62.9','Occupant of heavy transport vehicle injured in collision with two- or three-wheeled motor vehicle, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17614,'V63.0','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17615,'V63.1','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17616,'V63.2','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17617,'V63.3','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17618,'V63.4','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17619,'V63.5','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17620,'V63.6','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17621,'V63.7','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17622,'V63.9','Occupant of heavy transport vehicle injured in collision with car, pick-up truck or van, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17623,'V64.0','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17624,'V64.1','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17625,'V64.2','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17626,'V64.3','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17627,'V64.4','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17628,'V64.5','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17629,'V64.6','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17630,'V64.7','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17631,'V64.9','Occupant of heavy transport vehicle injured in collision with heavy transport vehicle or bus, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17632,'V65.0','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17633,'V65.1','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17634,'V65.2','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17635,'V65.3','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17636,'V65.4','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17637,'V65.5','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17638,'V65.6','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17639,'V65.7','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17640,'V65.9','Occupant of heavy transport vehicle injured in collision with railway train or railway vehicle, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17641,'V66.0','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17642,'V66.1','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17643,'V66.2','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17644,'V66.3','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17645,'V66.4','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17646,'V66.5','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17647,'V66.6','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17648,'V66.7','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17649,'V66.9','Occupant of heavy transport vehicle injured in collision with other nonmotor vehicle, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17650,'V67.0','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17651,'V67.1','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17652,'V67.2','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17653,'V67.3','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17654,'V67.4','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17655,'V67.5','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17656,'V67.6','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17657,'V67.7','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17658,'V67.9','Occupant of heavy transport vehicle injured in collision with fixed or stationary object, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17659,'V68.0','Occupant of heavy transport vehicle injured in noncollision transport accident, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17660,'V68.1','Occupant of heavy transport vehicle injured in noncollision transport accident, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17661,'V68.2','Occupant of heavy transport vehicle injured in noncollision transport accident, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17662,'V68.3','Occupant of heavy transport vehicle injured in noncollision transport accident, unspecified occupant of heavy transport vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17663,'V68.4','Occupant of heavy transport vehicle injured in noncollision transport accident, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17664,'V68.5','Occupant of heavy transport vehicle injured in noncollision transport accident, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17665,'V68.6','Occupant of heavy transport vehicle injured in noncollision transport accident, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17666,'V68.7','Occupant of heavy transport vehicle injured in noncollision transport accident, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17667,'V68.9','Occupant of heavy transport vehicle injured in noncollision transport accident, unspecified occupant of heavy transport vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17668,'V70.0','Bus occupant injured in collision with pedestrian or animal, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17669,'V70.1','Bus occupant injured in collision with pedestrian or animal, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17670,'V70.2','Bus occupant injured in collision with pedestrian or animal, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17671,'V70.3','Bus occupant injured in collision with pedestrian or animal, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17672,'V70.4','Bus occupant injured in collision with pedestrian or animal, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17673,'V70.5','Bus occupant injured in collision with pedestrian or animal, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17674,'V70.6','Bus occupant injured in collision with pedestrian or animal, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17675,'V70.7','Bus occupant injured in collision with pedestrian or animal, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17676,'V70.9','Bus occupant injured in collision with pedestrian or animal, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17677,'V71.0','Bus occupant injured in collision with pedal cycle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17678,'V71.1','Bus occupant injured in collision with pedal cycle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17679,'V71.2','Bus occupant injured in collision with pedal cycle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17680,'V71.3','Bus occupant injured in collision with pedal cycle, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17681,'V71.4','Bus occupant injured in collision with pedal cycle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17682,'V71.5','Bus occupant injured in collision with pedal cycle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17683,'V71.6','Bus occupant injured in collision with pedal cycle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17684,'V71.7','Bus occupant injured in collision with pedal cycle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17685,'V71.9','Bus occupant injured in collision with pedal cycle, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17686,'V72.0','Bus occupant injured in collision with two- or three-wheeled motor vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17687,'V72.1','Bus occupant injured in collision with two- or three-wheeled motor vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17688,'V72.2','Bus occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17689,'V72.3','Bus occupant injured in collision with two- or three-wheeled motor vehicle, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17690,'V72.4','Bus occupant injured in collision with two- or three-wheeled motor vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17691,'V72.5','Bus occupant injured in collision with two- or three-wheeled motor vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17692,'V72.6','Bus occupant injured in collision with two- or three-wheeled motor vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17693,'V72.7','Bus occupant injured in collision with two- or three-wheeled motor vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17694,'V72.9','Bus occupant injured in collision with two- or three-wheeled motor vehicle, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17695,'V73.0','Bus occupant injured in collision with car, pick-up truck or van, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17696,'V73.1','Bus occupant injured in collision with car, pick-up truck or van, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17697,'V73.2','Bus occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17698,'V73.3','Bus occupant injured in collision with car, pick-up truck or van, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17699,'V73.4','Bus occupant injured in collision with car, pick-up truck or van, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17700,'V73.5','Bus occupant injured in collision with car, pick-up truck or van, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17701,'V73.6','Bus occupant injured in collision with car, pick-up truck or van, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17702,'V73.7','Bus occupant injured in collision with car, pick-up truck or van, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17703,'V73.9','Bus occupant injured in collision with car, pick-up truck or van, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17704,'V74.0','Bus occupant injured in collision with heavy transport vehicle or bus, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17705,'V74.1','Bus occupant injured in collision with heavy transport vehicle or bus, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17706,'V74.2','Bus occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17707,'V74.3','Bus occupant injured in collision with heavy transport vehicle or bus, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17708,'V74.4','Bus occupant injured in collision with heavy transport vehicle or bus, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17709,'V74.5','Bus occupant injured in collision with heavy transport vehicle or bus, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17710,'V74.6','Bus occupant injured in collision with heavy transport vehicle or bus, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17711,'V74.7','Bus occupant injured in collision with heavy transport vehicle or bus, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17712,'V74.9','Bus occupant injured in collision with heavy transport vehicle or bus, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17713,'V75.0','Bus occupant injured in collision with railway train or railway vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17714,'V75.1','Bus occupant injured in collision with railway train or railway vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17715,'V75.2','Bus occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17716,'V75.3','Bus occupant injured in collision with railway train or railway vehicle, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17717,'V75.4','Bus occupant injured in collision with railway train or railway vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17718,'V75.5','Bus occupant injured in collision with railway train or railway vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17719,'V75.6','Bus occupant injured in collision with railway train or railway vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17720,'V75.7','Bus occupant injured in collision with railway train or railway vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17721,'V75.9','Bus occupant injured in collision with railway train or railway vehicle, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17722,'V76.0','Bus occupant injured in collision with other nonmotor vehicle, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17723,'V76.1','Bus occupant injured in collision with other nonmotor vehicle, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17724,'V76.2','Bus occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17725,'V76.3','Bus occupant injured in collision with other nonmotor vehicle, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17726,'V76.4','Bus occupant injured in collision with other nonmotor vehicle, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17727,'V76.5','Bus occupant injured in collision with other nonmotor vehicle, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17728,'V76.6','Bus occupant injured in collision with other nonmotor vehicle, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17729,'V76.7','Bus occupant injured in collision with other nonmotor vehicle, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17730,'V76.9','Bus occupant injured in collision with other nonmotor vehicle, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17731,'V77.0','Bus occupant injured in collision with fixed or stationary object, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17732,'V77.1','Bus occupant injured in collision with fixed or stationary object, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17733,'V77.2','Bus occupant injured in collision with fixed or stationary object, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17734,'V77.3','Bus occupant injured in collision with fixed or stationary object, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17735,'V77.4','Bus occupant injured in collision with fixed or stationary object, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17736,'V77.5','Bus occupant injured in collision with fixed or stationary object, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17737,'V77.6','Bus occupant injured in collision with fixed or stationary object, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17738,'V77.7','Bus occupant injured in collision with fixed or stationary object, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17739,'V77.9','Bus occupant injured in collision with fixed or stationary object, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17740,'V78.0','Bus occupant injured in noncollision transport accident, driver, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17741,'V78.1','Bus occupant injured in noncollision transport accident, passenger, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17742,'V78.2','Bus occupant injured in noncollision transport accident, person on outside of vehicle, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17743,'V78.3','Bus occupant injured in noncollision transport accident, unspecified bus occupant, nontraffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17744,'V78.4','Bus occupant injured in noncollision transport accident, while boarding or alighting',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17745,'V78.5','Bus occupant injured in noncollision transport accident, driver, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17746,'V78.6','Bus occupant injured in noncollision transport accident, passenger, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17747,'V78.7','Bus occupant injured in noncollision transport accident, person on outside of vehicle, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17748,'V78.9','Bus occupant injured in noncollision transport accident, unspecified bus occupant, traffic accident',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17749,'V80.00','Rider or occupant injured by fall from or being thrown from animal or animal-drawn vehicle in noncollision accident, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17750,'V80.01','Rider or occupant injured by fall from or being thrown from animal or animal-drawn vehicle in noncollision accident, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17751,'V80.09','Rider or occupant injured by fall from or being thrown from animal or animal-drawn vehicle in noncollision accident, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17752,'V80.10','Rider or occupant injured in collision with pedestrian or animal, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17753,'V80.11','Rider or occupant injured in collision with pedestrian or animal, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17754,'V80.19','Rider or occupant injured in collision with pedestrian or animal, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17755,'V80.20','Rider or occupant injured in collision with pedal cycle, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17756,'V80.21','Rider or occupant injured in collision with pedal cycle, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17757,'V80.29','Rider or occupant injured in collision with pedal cycle, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17758,'V80.30','Rider or occupant injured in collision with two- or three-wheeled motor vehicle, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17759,'V80.31','Rider or occupant injured in collision with two- or three-wheeled motor vehicle, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17760,'V80.39','Rider or occupant injured in collision with two- or three-wheeled motor vehicle, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17761,'V80.40','Rider or occupant injured in collision with car, pick-up truck, van, heavy transport vehicle or bus, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17762,'V80.41','Rider or occupant injured in collision with car, pick-up truck, van, heavy transport vehicle or bus, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17763,'V80.49','Rider or occupant injured in collision with car, pick-up truck, van, heavy transport vehicle or bus, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17764,'V80.50','Rider or occupant injured in collision with other specified motor vehicle, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17765,'V80.51','Rider or occupant injured in collision with other specified motor vehicle, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17766,'V80.59','Rider or occupant injured in collision with other specified motor vehicle, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17767,'V80.60','Rider or occupant injured in collision with railway train or railway vehicle, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17768,'V80.61','Rider or occupant injured in collision with railway train or railway vehicle, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17769,'V80.69','Rider or occupant injured in collision with railway train or railway vehicle, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17770,'V80.70','Rider or occupant injured in collision with other nonmotor vehicle, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17771,'V80.71','Rider or occupant injured in collision with other nonmotor vehicle, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17772,'V80.79','Rider or occupant injured in collision with other nonmotor vehicle, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17773,'V80.80','Rider or occupant injured in collision with fixed or stationary object, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17774,'V80.81','Rider or occupant injured in collision with fixed or stationary object, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17775,'V80.89','Rider or occupant injured in collision with fixed or stationary object, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17776,'V80.90','Rider or occupant injured in other and unspecified transport accidents, rider of horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17777,'V80.91','Rider or occupant injured in other and unspecified transport accidents, rider of other animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17778,'V80.99','Rider or occupant injured in other and unspecified transport accidents, occupant of animal-drawn vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17779,'V86.00','Driver of all-terrain or other off-road motor vehicle injured in traffic accident, two-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17780,'V86.01','Driver of all-terrain or other off-road motor vehicle injured in traffic accident, three-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17781,'V86.02','Driver of all-terrain or other off-road motor vehicle injured in traffic accident, four-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17782,'V86.09','Driver of all-terrain or other off-road motor vehicle injured in traffic accident, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17783,'V86.10','Passenger of all-terrain or other off-road motor vehicle injured in traffic accident, two-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17784,'V86.11','Passenger of all-terrain or other off-road motor vehicle injured in traffic accident, three-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17785,'V86.12','Passenger of all-terrain or other off-road motor vehicle injured in traffic accident, four-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17786,'V86.19','Passenger of all-terrain or other off-road motor vehicle injured in traffic accident, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17787,'V86.20','Person on outside of all-terrain or other off-road motor vehicle injured in traffic accident, two-wheeled special all-terrain or other off-road motor vehicle ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17788,'V86.21','Person on outside of all-terrain or other off-road motor vehicle injured in traffic accident, three-wheeled special all-terrain or other off-road motor vehicle ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17789,'V86.22','Person on outside of all-terrain or other off-road motor vehicle injured in traffic accident, four-wheeled special all-terrain or other off-road motor vehicle ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17790,'V86.29','Person on outside of all-terrain or other off-road motor vehicle injured in traffic accident, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17791,'V86.30','Unspecified occupant of all-terrain or other off-road motor vehicle injured in traffic accident, two-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17792,'V86.31','Unspecified occupant of all-terrain or other off-road motor vehicle injured in traffic accident, three-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17793,'V86.32','Unspecified occupant of all-terrain or other off-road motor vehicle injured in traffic accident, four-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17794,'V86.39','Unspecified occupant of all-terrain or other off-road motor vehicle injured in traffic accident, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17795,'V86.40','Person injured while boarding or alighting from all-terrain or other off-road motor vehicle, two-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17796,'V86.41','Person injured while boarding or alighting from all-terrain or other off-road motor vehicle, three-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17797,'V86.42','Person injured while boarding or alighting from all-terrain or other off-road motor vehicle, four-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17798,'V86.49','Person injured while boarding or alighting from all-terrain or other off-road motor vehicle, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17799,'V86.50','Driver of all-terrain or other off-road motor vehicle injured in nontraffic accident, two-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17800,'V86.51','Driver of all-terrain or other off-road motor vehicle injured in nontraffic accident, three-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17801,'V86.52','Driver of all-terrain or other off-road motor vehicle injured in nontraffic accident, four-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17802,'V86.59','Driver of all-terrain or other off-road motor vehicle injured in nontraffic accident, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17803,'V86.60','Passenger of all-terrain or other off-road motor vehicle injured in nontraffic accident, two-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17804,'V86.61','Passenger of all-terrain or other off-road motor vehicle injured in nontraffic accident, three-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17805,'V86.62','Passenger of all-terrain or other off-road motor vehicle injured in nontraffic accident, four-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17806,'V86.69','Passenger of all-terrain or other off-road motor vehicle injured in nontraffic accident, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17807,'V86.70','Person on outside of all-terrain or other off-road motor vehicle injured in nontraffic accident, two-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17808,'V86.71','Person on outside of all-terrain or other off-road motor vehicle injured in nontraffic accident, three-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17809,'V86.72','Person on outside of all-terrain or other off-road motor vehicle injured in nontraffic accident, four-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17810,'V86.79','Person on outside of all-terrain or other off-road motor vehicle injured in nontraffic accident, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17811,'V86.90','Unspecified occupant of all-terrain or other off-road motor vehicle injured in nontraffic accident, two-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17812,'V86.91','Unspecified occupant of all-terrain or other off-road motor vehicle injured in nontraffic accident, three-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17813,'V86.92','Unspecified occupant of all-terrain or other off-road motor vehicle injured in nontraffic accident, four-wheeled special all-terrain or other off-road motor vehicle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17814,'V86.99','Unspecified occupant of all-terrain or other off-road motor vehicle injured in nontraffic accident, special all-terrain or other off-road motor vehicle, unspecified number of wheels',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17815,'V90.0','Accident to watercraft causing drowning and submersion, merchant ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17816,'V90.1','Accident to watercraft causing drowning and submersion, passenger ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17817,'V90.2','Accident to watercraft causing drowning and submersion, fishing boat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17818,'V90.3','Accident to watercraft causing drowning and submersion, other powered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17819,'V90.4','Accident to watercraft causing drowning and submersion, sailboat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17820,'V90.5','Accident to watercraft causing drowning and submersion, canoe or kayak',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17821,'V90.6','Accident to watercraft causing drowning and submersion, inflatable craft (nonpowered)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17822,'V90.7','Accident to watercraft causing drowning and submersion, water-skis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17823,'V90.8','Accident to watercraft causing drowning and submersion, other unpowered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17824,'V90.9','Accident to watercraft causing drowning and submersion, unspecified watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17825,'V91.0','Accident to watercraft causing other injury, merchant ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17826,'V91.1','Accident to watercraft causing other injury, passenger ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17827,'V91.2','Accident to watercraft causing other injury, fishing boat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17828,'V91.3','Accident to watercraft causing other injury, other powered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17829,'V91.4','Accident to watercraft causing other injury, sailboat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17830,'V91.5','Accident to watercraft causing other injury, canoe or kayak',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17831,'V91.6','Accident to watercraft causing other injury, inflatable craft (nonpowered)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17832,'V91.7','Accident to watercraft causing other injury, water-skis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17833,'V91.8','Accident to watercraft causing other injury, other unpowered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17834,'V91.9','Accident to watercraft causing other injury, unspecified watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17835,'V92.0','Water-transport-related drowning and submersion without accident to watercraft, merchant ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17836,'V92.1','Water-transport-related drowning and submersion without accident to watercraft, passenger ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17837,'V92.2','Water-transport-related drowning and submersion without accident to watercraft, fishing boat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17838,'V92.3','Water-transport-related drowning and submersion without accident to watercraft, other powered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17839,'V92.4','Water-transport-related drowning and submersion without accident to watercraft, sailboat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17840,'V92.5','Water-transport-related drowning and submersion without accident to watercraft, canoe or kayak',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17841,'V92.6','Water-transport-related drowning and submersion without accident to watercraft, inflatable craft (nonpowered)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17842,'V92.7','Water-transport-related drowning and submersion without accident to watercraft, water-skis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17843,'V92.8','Water-transport-related drowning and submersion without accident to watercraft, other unpowered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17844,'V92.9','Water-transport-related drowning and submersion without accident to watercraft, unspecified watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17845,'V93.0','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, merchant ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17846,'V93.1','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, passenger ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17847,'V93.2','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, fishing boat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17848,'V93.3','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, other powered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17849,'V93.4','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, sailboat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17850,'V93.5','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, canoe or kayak',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17851,'V93.6','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, inflatable craft (nonpowered)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17852,'V93.7','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, water-skis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17853,'V93.8','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, other unpowered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17854,'V93.9','Accident on board watercraft without accident to watercraft, not causing drowning and submersion, unspecified watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17855,'V94.0','Other and unspecified water transport accidents, merchant ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17856,'V94.1','Other and unspecified water transport accidents, passenger ship',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17857,'V94.2','Other and unspecified water transport accidents, fishing boat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17858,'V94.3','Other and unspecified water transport accidents, other powered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17859,'V94.4','Other and unspecified water transport accidents, sailboat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17860,'V94.5','Other and unspecified water transport accidents, canoe or kayak',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17861,'V94.6','Other and unspecified water transport accidents, inflatable craft (nonpowered)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17862,'V94.7','Other and unspecified water transport accidents, water-skis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17863,'V94.8','Other and unspecified water transport accidents, other unpowered watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17864,'V94.9','Other and unspecified water transport accidents, unspecified watercraft',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17865,'W01.0','Fall on same level from slipping',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17866,'W01.1','Fall on same level from tripping',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17867,'W01.2','Fall on same level from stumbling',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17868,'W02.0','Fall involving roller-skates',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17869,'W02.1','Fall involving skateboard',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17870,'W02.2','Fall involving water ski',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17871,'W02.3','Fall involving snow ski',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17872,'W02.4','Fall involving snow board',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17873,'W02.5','Fall involving ice-skates',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17874,'W02.6','Fall involving scooter, nonpowered',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17875,'W02.7','Fall involving baby carriage',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17876,'W02.8','Fall involving baby walker',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17877,'W02.9','Fall involving other and unspecified pedestrian conveyance',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17878,'W06.0','Fall involving bunk bed',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17879,'W06.1','Fall involving special purpose bed',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17880,'W06.2','Fall involving cot',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17881,'W06.3','Fall involving bassinet',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17882,'W06.4','Fall involving cradle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17883,'W06.5','Fall involving hammock',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17884,'W06.6','Fall involving conventional bed',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17885,'W06.8','Fall involving other specified bed',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17886,'W06.9','Fall involving unspecified bed',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17887,'W07.0','Fall involving rocking chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17888,'W07.1','Fall involving folding chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17889,'W07.2','Fall involving revolving chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17890,'W07.3','Fall involving stool',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17891,'W07.4','Fall involving high-chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17892,'W07.5','Fall involving bath chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17893,'W07.6','Fall involving commode chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17894,'W07.7','Fall involving lift assistance chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17895,'W07.8','Fall involving other specified chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17896,'W07.9','Fall involving unspecified chair',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17897,'W08.0','Fall involving baby change table',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17898,'W08.1','Fall involving baby exerciser',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17899,'W08.2','Fall involving table',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17900,'W08.8','Fall involving other specified furniture',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17901,'W08.9','Fall involving unspecified furniture',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17902,'W09.0','Fall involving tree house',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17903,'W09.1','Fall involving flying fox',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17904,'W09.2','Fall involving playground climbing apparatus',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17905,'W09.3','Fall involving slide',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17906,'W09.4','Fall involving swing',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17907,'W09.5','Fall involving seesaw',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17908,'W09.6','Fall involving trampoline',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17909,'W09.8','Fall involving other specified playground equipment',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17910,'W09.9','Fall involving unspecified playground equipment',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17915,'W13.0','Fall from or through balcony or veranda',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17916,'W13.1','Fall out of or through window',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17917,'W13.2','Fall out of or through glass door',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17918,'W13.3','Fall from roof',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17919,'W13.4','Fall through roof',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17920,'W13.5','Fall from or through floor',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17921,'W13.8','Fall from, out of or through other specified building or structure',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17922,'W13.9','Fall from, out of or through unspecified building or structure',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17934,'W18.0','Fall from bumping against object',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17935,'W18.1','Fall from or off toilet',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17936,'W18.2','Fall in or into bath-tub or shower',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17937,'W18.8','Other specified fall on same level',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17938,'W18.9','Unspecified fall on same level',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17939,'W21.0','Striking against or struck by bat and racquet',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17940,'W21.1','Striking against or struck by ball',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17941,'W21.2','Striking against or struck by object or structure on or near sports area',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17942,'W21.8','Striking against or struck by other sports equipment',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17943,'W21.9','Striking against or struck by unspecified sports equipment',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17944,'W23.0','Caught, crushed, jammed or pinched in or between door',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17945,'W23.8','Caught, crushed, jammed or pinched in or between other objects',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17955,'W30.0','Contact with grain auger, elevator and conveyor',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17956,'W30.1','Contact with harvesting machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17957,'W30.20','Contact with posthole digger',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17958,'W30.21','Contact with slasher',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17959,'W30.22','Contact with seeding and planting implement',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17960,'W30.23','Contact with tillage and cultivating equipment',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17961,'W30.24','Contact with fertiliser spreader',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17962,'W30.28','Contact with other specified equipment towed or powered by tractor',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17963,'W30.29','Contact with unspecified equipment towed or powered by tractor',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17964,'W30.3','Contact with hay baler and haying implements',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17965,'W30.8','Contact with other specified agricultural machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17966,'W30.9','Contact with unspecified agricultural machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17967,'W31.0','Contact with mining and earth drilling machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17968,'W31.1','Contact with metalworking machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17969,'W31.2','Contact with woodworking and forming machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17970,'W31.3','Contact with prime mover',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17971,'W31.4','Contact with earthmoving, scraping and other excavating machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17972,'W31.8','Contact with other specified machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17973,'W31.9','Contact with unspecified machinery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17974,'W34.1','Accidental air rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17975,'W34.2','Accidental shotgun discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17976,'W34.3','Accidental small calibre rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17977,'W34.4','Accidental large calibre rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17978,'W34.9','Accidental discharge from other and unspecified firearms',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17979,'W45.0','Body piercing',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17980,'W45.9  ','Foreign body or object entering through skin',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17981,'W46','Contact with hypodermic needle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17982,'W54.0','Bitten by dog',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17983,'W54.8','Other contact with dog',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17984,'W55.0','Bitten or struck by horse',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17985,'W55.1','Bitten or struck by cat',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17986,'W55.2','Bitten or struck by cattle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17987,'W55.3','Bitten or struck by sheep',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17988,'W55.8','Bitten or stuck by other specified mammal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17989,'W55.9','Bitten or struck by unspecified mammal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17990,'W56.0','Contact with shark',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17991,'W56.8','Contact with other specified marine animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17992,'W56.9','Contact with unspecified marine animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17993,'W59.0','Bitten or crushed by nonvenomous snake',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17994,'W59.1','Bitten or crushed by snake, unknown whether venomous or nonvenomous',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17995,'W59.8','Bitten or crushed by other specified reptile',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17996,'W65.0','Drowning and submersion while in bath-tub',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17997,'W65.1','Drowning and submersion while in indoor spa, Jacuzzi and hot tub',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17998,'W66.0','Drowning and submersion following fall into bath-tub',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(17999,'W66.1','Drowning and submersion following fall into indoor spa, Jacuzzi and hot tub',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18000,'W67.0','Drowning and submersion while in swimming pool',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18001,'W67.1','Drowning and submersion while in outdoor spa, Jacuzzi and hot tub',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18002,'W68.0','Drowning and submersion following fall into swimming-pool',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18003,'W68.1','Drowning and submersion following fall into outdoor spa, Jacuzzi and hot tub',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18009,'X10.0','Contact with hot drink',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18010,'X10.1','Contact with hot food',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18011,'X10.2','Contact with hot fat and cooking oil',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18012,'X11.0','Contact with running hot tap-water',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18013,'X11.1','Contact with contained hot tap-water',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18014,'X11.8','Contact with other specified hot tap-water',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18015,'X11.9','Contact with unspecified hot tap-water',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18016,'X13.0','Contact with steam from motor vehicle radiator',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18017,'X13.1','Contact with steam and hot vapours from food',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18018,'X13.8','Contact with steam and hot vapours from other sources',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18019,'X13.9','Contact with unspecified steam and hot vapours',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18020,'X15.0','Contact with hot stove, oven or cook-top',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18021,'X15.1','Contact with hot saucepan or frying pan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18022,'X15.2','Contact with hot toaster',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18023,'X15.3','Contact with hot kettle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18024,'X15.4','Contact with hot clothes iron or press',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18025,'X15.5','Contact with hot barbeque',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18026,'X15.8','Contact with other specified hot household appliances',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18027,'X15.9','Contact with unspecified hot household appliances',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18028,'X20.00','Contact with brown snake',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18029,'X20.01','Contact with taipan',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18030,'X20.02','Contact with death adder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18031,'X20.03','Contact with black snake',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18032,'X20.04','Contact with tiger snake',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18033,'X20.05','Contact with sea-snake',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18034,'X20.08','Contact with other specified venomous snake',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18035,'X20.09','Contact with unspecified venomous snake',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18036,'X20.1','Contact with venomous lizard',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18037,'X21.0','Contact with funnel web spider',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18038,'X21.1','Contact with red back spider',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18039,'X21.2','Contact with white-tailed and other necrotising spider',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18040,'X21.8','Contact with other specified spider',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18041,'X21.9','Contact with unspecified spider',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18042,'X23.1','Contact with hornets',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18043,'X23.20','Contact with unspecified wasps',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18044,'X23.21','Contact with paper wasps',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18045,'X23.22','Contact with yellow jacket wasps (Vespula species)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18046,'X23.23','Contact with mud wasps',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18047,'X23.29','Contact with other specified wasps',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18048,'X23.30','Contact with unspecified bees',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18049,'X23.31','Contact with bumble bees',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18050,'X23.32','Contact with honey bees',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18051,'X23.33','Contact with native bees',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18052,'X23.39','Contact with other specified bees',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18053,'X25.00','Contact with jumper and bull ant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18054,'X25.01','Contact with fire ant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18055,'X25.02','Contact with green ant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18056,'X25.08','Contact with other specified venomous ant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18057,'X25.09','Contact with venomous ant, unspecified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18058,'X25.1','Contact with venomous tick',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18059,'X25.2','Contact with venomous and urticating caterpillar',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18060,'X25.8','Contact with other venomous arthropod',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18061,'X25.9','Contact with unspecified venomous arthropod',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18062,'X26.00','Contact with box jellyfish',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18063,'X26.01','Contact with Irukandji jellyfish',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18064,'X26.02','Contact with Portuguese Man-o-war and bluebottle',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18065,'X26.08','Contact with other specified jellyfish',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18066,'X26.09','Contact with unspecified jellyfish',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18067,'X26.10','Contact with stonefish',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18068,'X26.18','Contact with other specified stinging fish',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18069,'X26.2','Contact with venomous octopus',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18070,'X26.3','Contact with stingray',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18071,'X26.8','Contact with other specified venomous marine animals and plants',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18072,'X26.9','Contact with unspecified venomous marine animals and plants',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18073,'X27.0','Contact with platypus',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18074,'X27.8','Contact with other and unspecified venomous animals',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18075,'X47.0','Accidental poisoning by and exposure to motor vehicle exhaust',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18076,'X47.1','Accidental poisoning by and exposure to liquefied petroleum gas (LPG)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18077,'X47.2','Accidental poisoning by and exposure to other specified utility gas',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18078,'X47.8','Accidental poisoning by and exposure to other specified gas and vapours',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18079,'X47.9','Accidental poisoning by and exposure to unspecified gas and vapours',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18080,'X67.0','Intentional self-poisoning by and exposure to motor vehicle exhaust',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18081,'X67.1','Intentional self-poisoning by and exposure to liquefied petroleum gas (LPG)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18082,'X67.2','Intentional self-poisoning by and exposure to other specified utility gas',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18083,'X67.8','Intentional self-poisoning by and exposure to other specified gas or vapours',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18084,'X67.9','Intentional self-poisoning by and exposure to unspecified gas or vapours',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18085,'X70.0','Intentional self-harm by hanging',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18086,'X70.1','Intentional self-harm by strangulation',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18087,'X70.2','Intentional self-harm by suffocation',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18088,'X71.0','Intentional self-harm by drowning and submersion in bath-tub',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18089,'X71.1','Intentional self-harm by drowning and submersion in swimming pool',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18090,'X71.2','Intentional self-harm by drowning and submersion in natural water',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18091,'X71.8','Intentional self-harm by drowning and submersion in other specified water',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18092,'X71.9','Intentional self-harm by drowning and submersion in unspecified water',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18093,'X74.1','Intentional self-harm by air rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18094,'X74.2','Intentional self-harm by shotgun discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18095,'X74.3','Intentional self-harm by small calibre rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18096,'X74.4','Intentional self-harm by large calibre rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18097,'X74.9','Intentional self-harm by other and unspecified firearm discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18098,'X78.0','Intentional self-harm by knife',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18099,'X78.1','Intentional self-harm by razor blade',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18100,'X78.2','Intentional self-harm by hypodermic needle and syringe',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18101,'X78.3','Intentional self-harm by glass',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18102,'X78.8','Intentional self-harm by other specified sharp object',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18103,'X78.9','Intentional self-harm by sharp object, unspecified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18109,'X82.0','Intentional self-harm by crashing of car with other motor vehicle, nontraffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18110,'X82.1','Intentional self-harm by crashing of car with fixed or stationary object, nontraffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18111,'X82.2','Intentional self-harm by other specified crashing of motor vehicle, nontraffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18112,'X82.3','Intentional self-harm by unspecified crashing of motor vehicle, nontraffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18113,'X82.4','Intentional self-harm by crashing of car with other motor vehicle, traffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18114,'X82.5','Intentional self-harm by crashing of car with fixed or stationary object, traffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18115,'X82.8','Intentional self-harm by other specified crashing of motor vehicle, traffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18116,'X82.9','Intentional self-harm by unspecified crashing of motor vehicle, traffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18117,'X85.00','Assault by drugs, medicaments and biological substances, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18118,'X85.01','Assault by drugs, medicaments and biological substances, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18119,'X85.02','Assault by drugs, medicaments and biological substances, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18120,'X85.03','Assault by drugs, medicaments and biological substances, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18121,'X85.04','Assault by drugs, medicaments and biological substances, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18122,'X85.05','Assault by drugs, medicaments and biological substances, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18123,'X85.06','Assault by drugs, medicaments and biological substances, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18124,'X85.07','Assault by drugs, medicaments and biological substances, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18125,'X85.08','Assault by drugs, medicaments and biological substances, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18126,'X85.09','Assault by drugs, medicaments and biological substances, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18127,'X86.00','Assault by corrosive substance, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18128,'X86.01','Assault by corrosive substance, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18129,'X86.02','Assault by corrosive substance, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18130,'X86.03','Assault by corrosive substance, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18131,'X86.04','Assault by corrosive substance, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18132,'X86.05','Assault by corrosive substance, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18133,'X86.06','Assault by corrosive substance, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18134,'X86.07','Assault by corrosive substance, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18135,'X86.08','Assault by corrosive substance, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18136,'X86.09','Assault by corrosive substance, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18137,'X87.00','Assault by pesticides, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18138,'X87.01','Assault by pesticides, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18139,'X87.02','Assault by pesticides, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18140,'X87.03','Assault by pesticides, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18141,'X87.04','Assault by pesticides, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18142,'X87.05','Assault by pesticides, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18143,'X87.06','Assault by pesticides, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18144,'X87.07','Assault by pesticides, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18145,'X87.08','Assault by pesticides, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18146,'X87.09','Assault by pesticides, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18147,'X88.00','Assault by gases and vapours, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18148,'X88.01','Assault by gases and vapours, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18149,'X88.02','Assault by gases and vapours, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18150,'X88.03','Assault by gases and vapours, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18151,'X88.04','Assault by gases and vapours, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18152,'X88.05','Assault by gases and vapours, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18153,'X88.06','Assault by gases and vapours, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18154,'X88.07','Assault by gases and vapours, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18155,'X88.08','Assault by gases and vapours, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18156,'X88.09','Assault by gases and vapours, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18157,'X89.00','Assault by other specified chemicals and noxious substances, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18158,'X89.01','Assault by other specified chemicals and noxious substances, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18159,'X89.02','Assault by other specified chemicals and noxious substances, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18160,'X89.03','Assault by other specified chemicals and noxious substances, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18161,'X89.04','Assault by other specified chemicals and noxious substances, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18162,'X89.05','Assault by other specified chemicals and noxious substances, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18163,'X89.06','Assault by other specified chemicals and noxious substances, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18164,'X89.07','Assault by other specified chemicals and noxious substances, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18165,'X89.08','Assault by other specified chemicals and noxious substances, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18166,'X89.09','Assault by other specified chemicals and noxious substances, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18167,'X90.00','Assault by unspecified chemical or noxious substance, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18168,'X90.01','Assault by unspecified chemical or noxious substance, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18169,'X90.02','Assault by unspecified chemical or noxious substance, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18170,'X90.03','Assault by unspecified chemical or noxious substance, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18171,'X90.04','Assault by unspecified chemical or noxious substance, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18172,'X90.05','Assault by unspecified chemical or noxious substance, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18173,'X90.06','Assault by unspecified chemical or noxious substance, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18174,'X90.07','Assault by unspecified chemical or noxious substance, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18175,'X90.08','Assault by unspecified chemical or noxious substance, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18176,'X90.09','Assault by unspecified chemical or noxious substance, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18177,'X91.00','Assault by hanging, strangulation and suffocation, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18178,'X91.01','Assault by hanging, strangulation and suffocation, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18179,'X91.02','Assault by hanging, strangulation and suffocation, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18180,'X91.03','Assault by hanging, strangulation and suffocation, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18181,'X91.04','Assault by hanging, strangulation and suffocation, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18182,'X91.05','Assault by hanging, strangulation and suffocation, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18183,'X91.06','Assault by hanging, strangulation and suffocation, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18184,'X91.07','Assault by hanging, strangulation and suffocation, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18185,'X91.08','Assault by hanging, strangulation and suffocation, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18186,'X91.09','Assault by hanging, strangulation and suffocation, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18187,'X92.00','Assault by drowning and submersion in bath-tub, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18188,'X92.01','Assault by drowning and submersion in bath-tub, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18189,'X92.02','Assault by drowning and submersion in bath-tub, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18190,'X92.03','Assault by drowning and submersion in bath-tub, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18191,'X92.04','Assault by drowning and submersion in bath-tub, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18192,'X92.05','Assault by drowning and submersion in bath-tub, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18193,'X92.06','Assault by drowning and submersion in bath-tub, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18194,'X92.07','Assault by drowning and submersion in bath-tub, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18195,'X92.08','Assault by drowning and submersion in bath-tub, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18196,'X92.09','Assault by drowning and submersion in bath-tub, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18197,'X92.10','Assault by drowning and submersion in swimming pool, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18198,'X92.11','Assault by drowning and submersion in swimming pool, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18199,'X92.12','Assault by drowning and submersion in swimming pool, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18200,'X92.13','Assault by drowning and submersion in swimming pool, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18201,'X92.14','Assault by drowning and submersion in swimming pool, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18202,'X92.15','Assault by drowning and submersion in swimming pool, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18203,'X92.16','Assault by drowning and submersion in swimming pool, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18204,'X92.17','Assault by drowning and submersion in swimming pool, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18205,'X92.18','Assault by drowning and submersion in swimming pool, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18206,'X92.19','Assault by drowning and submersion in swimming pool, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18207,'X92.20','Assault by drowning and submersion in natural water, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18208,'X92.21','Assault by drowning and submersion in natural water, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18209,'X92.22','Assault by drowning and submersion in natural water, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18210,'X92.23','Assault by drowning and submersion in natural water, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18211,'X92.24','Assault by drowning and submersion in natural water, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18212,'X92.25','Assault by drowning and submersion in natural water, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18213,'X92.26','Assault by drowning and submersion in natural water, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18214,'X92.27','Assault by drowning and submersion in natural water, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18215,'X92.28','Assault by drowning and submersion in natural water, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18216,'X92.29','Assault by drowning and submersion in natural water, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18217,'X92.80','Assault by drowning and submersion in other specified water, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18218,'X92.81','Assault by drowning and submersion in other specified water, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18219,'X92.82','Assault by drowning and submersion in other specified water, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18220,'X92.83','Assault by drowning and submersion in other specified water, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18221,'X92.84','Assault by drowning and submersion in other specified water, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18222,'X92.85','Assault by drowning and submersion in other specified water, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18223,'X92.86','Assault by drowning and submersion in other specified water, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18224,'X92.87','Assault by drowning and submersion in other specified water, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18225,'X92.88','Assault by drowning and submersion in other specified water, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18226,'X92.89','Assault by drowning and submersion in other specified water, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18227,'X92.90','Assault by drowning and submersion in unspecified water, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18228,'X92.91','Assault by drowning and submersion in unspecified water, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18229,'X92.92','Assault by drowning and submersion in unspecified water, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18230,'X92.93','Assault by drowning and submersion in unspecified water, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18231,'X92.94','Assault by drowning and submersion in unspecified water, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18232,'X92.95','Assault by drowning and submersion in unspecified water, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18233,'X92.96','Assault by drowning and submersion in unspecified water, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18234,'X92.97','Assault by drowning and submersion in unspecified water, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18235,'X92.98','Assault by drowning and submersion in unspecified water, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18236,'X92.99','Assault by drowning and submersion in unspecified water, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18237,'X93.00','Assault by handgun discharge, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18238,'X93.01','Assault by handgun discharge, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18239,'X93.02','Assault by handgun discharge, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18240,'X93.03','Assault by handgun discharge, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18241,'X93.04','Assault by handgun discharge, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18242,'X93.05','Assault by handgun discharge, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18243,'X93.06','Assault by handgun discharge, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18244,'X93.07','Assault by handgun discharge, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18245,'X93.08','Assault by handgun discharge, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18246,'X93.09','Assault by handgun discharge, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18247,'X95.10','Assault by air rifle discharge, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18248,'X95.11','Assault by air rifle discharge, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18249,'X95.12','Assault by air rifle discharge, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18250,'X95.13','Assault by air rifle discharge, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18251,'X95.14','Assault by air rifle discharge, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18252,'X95.15','Assault by air rifle discharge, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18253,'X95.16','Assault by air rifle discharge, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18254,'X95.17','Assault by air rifle discharge, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18255,'X95.18','Assault by air rifle discharge, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18256,'X95.19','Assault by air rifle discharge, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18257,'X95.20','Assault by shotgun discharge, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18258,'X95.21','Assault by shotgun discharge, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18259,'X95.22','Assault by shotgun discharge, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18260,'X95.23','Assault by shotgun discharge, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18261,'X95.24','Assault by shotgun discharge, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18262,'X95.25','Assault by shotgun discharge, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18263,'X95.26','Assault by shotgun discharge, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18264,'X95.27','Assault by shotgun discharge, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18265,'X95.28','Assault by shotgun discharge, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18266,'X95.29','Assault by shotgun discharge, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18267,'X95.30','Assault by small calibre rifle discharge, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18268,'X95.31','Assault by small calibre rifle discharge, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18269,'X95.32','Assault by small calibre rifle discharge, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18270,'X95.33','Assault by small calibre rifle discharge, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18271,'X95.34','Assault by small calibre rifle discharge, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18272,'X95.35','Assault by small calibre rifle discharge, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18273,'X95.36','Assault by small calibre rifle discharge, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18274,'X95.37','Assault by small calibre rifle discharge, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18275,'X95.38','Assault by small calibre rifle discharge, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18276,'X95.39','Assault by small calibre rifle discharge, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18277,'X95.40','Assault by large calibre rifle discharge, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18278,'X95.41','Assault by large calibre rifle discharge, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18279,'X95.42','Assault by large calibre rifle discharge, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18280,'X95.43','Assault by large calibre rifle discharge, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18281,'X95.44','Assault by large calibre rifle discharge, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18282,'X95.45','Assault by large calibre rifle discharge, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18283,'X95.46','Assault by large calibre rifle discharge, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18284,'X95.47','Assault by large calibre rifle discharge, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18285,'X95.48','Assault by large calibre rifle discharge, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18286,'X95.49','Assault by large calibre rifle discharge, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18287,'X95.90','Assault by other and unspecified firearm discharge, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18288,'X95.91','Assault by other and unspecified firearm discharge, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18289,'X95.92','Assault by other and unspecified firearm discharge, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18290,'X95.93','Assault by other and unspecified firearm discharge, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18291,'X95.94','Assault by other and unspecified firearm discharge, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18292,'X95.95','Assault by other and unspecified firearm discharge, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18293,'X95.96','Assault by other and unspecified firearm discharge, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18294,'X95.97','Assault by other and unspecified firearm discharge, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18295,'X95.98','Assault by other and unspecified firearm discharge, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18296,'X95.99','Assault by other and unspecified firearm discharge, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18297,'X97.00','Assault by smoke, fire and flames, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18298,'X97.01','Assault by smoke, fire and flames, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18299,'X97.02','Assault by smoke, fire and flames, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18300,'X97.03','Assault by smoke, fire and flames, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18301,'X97.04','Assault by smoke, fire and flames, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18302,'X97.05','Assault by smoke, fire and flames, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18303,'X97.06','Assault by smoke, fire and flames, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18304,'X97.07','Assault by smoke, fire and flames, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18305,'X97.08','Assault by smoke, fire and flames, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18306,'X97.09','Assault by smoke, fire and flames, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18307,'X98.00','Assault by steam, hot vapours and hot objects, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18308,'X98.01','Assault by steam, hot vapours and hot objects, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18309,'X98.02','Assault by steam, hot vapours and hot objects, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18310,'X98.03','Assault by steam, hot vapours and hot objects, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18311,'X98.04','Assault by steam, hot vapours and hot objects, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18312,'X98.05','Assault by steam, hot vapours and hot objects, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18313,'X98.06','Assault by steam, hot vapours and hot objects, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18314,'X98.07','Assault by steam, hot vapours and hot objects, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18315,'X98.08','Assault by steam, hot vapours and hot objects, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18316,'X98.09','Assault by steam, hot vapours and hot objects, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18317,'X99.00','Assault by knife, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18318,'X99.01','Assault by knife, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18319,'X99.02','Assault by knife, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18320,'X99.03','Assault by knife, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18321,'X99.04','Assault by knife, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18322,'X99.05','Assault by knife, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18323,'X99.06','Assault by knife, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18324,'X99.07','Assault by knife, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18325,'X99.08','Assault by knife, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18326,'X99.09','Assault by knife, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18327,'X99.10','Assault by razor blade, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18328,'X99.11','Assault by razor blade, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18329,'X99.12','Assault by razor blade, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18330,'X99.13','Assault by razor blade, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18331,'X99.14','Assault by razor blade, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18332,'X99.15','Assault by razor blade, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18333,'X99.16','Assault by razor blade, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18334,'X99.17','Assault by razor blade, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18335,'X99.18','Assault by razor blade, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18336,'X99.19','Assault by razor blade, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18337,'X99.20','Assault by hypodermic needle and syringe, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18338,'X99.21','Assault by hypodermic needle and syringe, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18339,'X99.22','Assault by hypodermic needle and syringe, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18340,'X99.23','Assault by hypodermic needle and syringe, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18341,'X99.24','Assault by hypodermic needle and syringe, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18342,'X99.25','Assault by hypodermic needle and syringe, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18343,'X99.26','Assault by hypodermic needle and syringe, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18344,'X99.27','Assault by hypodermic needle and syringe, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18345,'X99.28','Assault by hypodermic needle and syringe, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18346,'X99.29','Assault by hypodermic needle and syringe, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18347,'X99.30','Assault by glass, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18348,'X99.31','Assault by glass, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18349,'X99.32','Assault by glass, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18350,'X99.33','Assault by glass, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18351,'X99.34','Assault by glass, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18352,'X99.35','Assault by glass, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18353,'X99.36','Assault by glass, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18354,'X99.37','Assault by glass, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18355,'X99.38','Assault by glass, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18356,'X99.39','Assault by glass, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18357,'X99.80','Assault by other specified sharp object, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18358,'X99.81','Assault by other specified sharp object, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18359,'X99.82','Assault by other specified sharp object, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18360,'X99.83','Assault by other specified sharp object, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18361,'X99.84','Assault by other specified sharp object, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18362,'X99.85','Assault by other specified sharp object, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18363,'X99.86','Assault by other specified sharp object, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18364,'X99.87','Assault by other specified sharp object, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18365,'X99.88','Assault by other specified sharp object, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18366,'X99.89','Assault by other specified sharp object, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18367,'X99.90','Assault by sharp object, unspecified, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18368,'X99.91','Assault by sharp object, unspecified, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18369,'X99.92','Assault by sharp object, unspecified, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18370,'X99.93','Assault by sharp object, unspecified, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18371,'X99.94','Assault by sharp object, unspecified, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18372,'X99.95','Assault by sharp object, unspecified, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18373,'X99.96','Assault by sharp object, unspecified, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18374,'X99.97','Assault by sharp object, unspecified, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18375,'X99.98','Assault by sharp object, unspecified, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18376,'X99.99','Assault by sharp object, unspecified, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18377,'Y00.00','Assault by blunt object, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18378,'Y00.01','Assault by blunt object, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18379,'Y00.02','Assault by blunt object, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18380,'Y00.03','Assault by blunt object, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18381,'Y00.04','Assault by blunt object, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18382,'Y00.05','Assault by blunt object, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18383,'Y00.06','Assault by blunt object, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18384,'Y00.07','Assault by blunt object, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18385,'Y00.08','Assault by blunt object, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18386,'Y00.09','Assault by blunt object, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18387,'Y01.00','Assault by pushing from high place, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18388,'Y01.01','Assault by pushing from high place, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18389,'Y01.02','Assault by pushing from high place, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18390,'Y01.03','Assault by pushing from high place, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18391,'Y01.04','Assault by pushing from high place, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18392,'Y01.05','Assault by pushing from high place, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18393,'Y01.06','Assault by pushing from high place, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18394,'Y01.07','Assault by pushing from high place, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18395,'Y01.08','Assault by pushing from high place, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18396,'Y01.09','Assault by pushing from high place, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18397,'Y02.10','Assault by pushing or placing victim before a train, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18398,'Y02.11','Assault by pushing or placing victim before a train, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18399,'Y02.12','Assault by pushing or placing victim before a train, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18400,'Y02.13','Assault by pushing or placing victim before a train, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18401,'Y02.14','Assault by pushing or placing victim before a train, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18402,'Y02.15','Assault by pushing or placing victim before a train, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18403,'Y02.16','Assault by pushing or placing victim before moving object, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18404,'Y02.17','Assault by pushing or placing victim before moving object, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18405,'Y02.18','Assault by pushing or placing victim before a train, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18406,'Y02.19','Assault by pushing or placing victim before a train, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18407,'Y02.20','Assault by pushing or placing victim before a tram, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18408,'Y02.21','Assault by pushing or placing victim before a tram, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18409,'Y02.22','Assault by pushing or placing victim before a tram, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18410,'Y02.23','Assault by pushing or placing victim before a tram, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18411,'Y02.24','Assault by pushing or placing victim before a tram, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18412,'Y02.25','Assault by pushing or placing victim before a tram, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18413,'Y02.26','Assault by pushing or placing victim before a tram, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18414,'Y02.27','Assault by pushing or placing victim before a tram, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18415,'Y02.28','Assault by pushing or placing victim before a tram, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18416,'Y02.29','Assault by pushing or placing victim before a tram, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18417,'Y02.30','Assault by pushing or placing victim before a motor vehicle, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18418,'Y02.31','Assault by pushing or placing victim before a motor vehicle, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18419,'Y02.32','Assault by pushing or placing victim before a motor vehicle, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18420,'Y02.33','Assault by pushing or placing victim before a motor vehicle, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18421,'Y02.34','Assault by pushing or placing victim before a motor vehicle, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18422,'Y02.35','Assault by pushing or placing victim before a motor vehicle, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18423,'Y02.36','Assault by pushing or placing victim before a motor vehicle, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18424,'Y02.37','Assault by pushing or placing victim before a motor vehicle, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18425,'Y02.38','Assault by pushing or placing victim before a motor vehicle, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18426,'Y02.39','Assault by pushing or placing victim before a motor vehicle, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18427,'Y02.80','Assault by pushing or placing victim before other specified moving object, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18428,'Y02.81','Assault by pushing or placing victim before other specified moving object, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18429,'Y02.82','Assault by pushing or placing victim before other specified moving object, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18430,'Y02.83','Assault by pushing or placing victim before other specifiedmoving object, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18431,'Y02.84','Assault by pushing or placing victim before other specified moving object, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18432,'Y02.85','Assault by pushing or placing victim before other specified moving object, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18433,'Y02.86','Assault by pushing or placing victim before other specified moving object, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18434,'Y02.87','Assault by pushing or placing victim before other specified moving object, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18435,'Y02.88','Assault by pushing or placing victim before other specified moving object, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18436,'Y02.89','Assault by pushing or placing victim before other specified moving object, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18437,'Y02.90','Assault by pushing or placing victim before unspecified moving object, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18438,'Y02.91','Assault by pushing or placing victim before unspecified moving object, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18439,'Y02.92','Assault by pushing or placing victim before unspecified moving object, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18440,'Y02.93','Assault by pushing or placing victim before unspecified moving object, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18441,'Y02.94','Assault by pushing or placing victim before unspecified moving object, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18442,'Y02.95','Assault by pushing or placing victim before unspecified moving object, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18443,'Y02.96','Assault by pushing or placing victim before unspecified moving object, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18444,'Y02.97','Assault by pushing or placing victim before unspecified moving object, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18445,'Y02.98','Assault by pushing or placing victim before unspecified moving object, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18446,'Y02.99','Assault by pushing or placing victim before unpecified moving object, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18447,'Y03.00','Assault by crashing of car with other motor vehicle, nontraffic, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18448,'Y03.01','Assault by crashing of car with other motor vehicle, nontraffic, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18449,'Y03.02','Assault by crashing of car with other motor vehicle, nontraffic, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18450,'Y03.03','Assault by crashing of car with other motor vehicle, nontraffic, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18451,'Y03.04','Assault by crashing of car with other motor vehicle, nontraffic, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18452,'Y03.05','Assault by crashing of car with other motor vehicle, nontraffic, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18453,'Y03.06','Assault by crashing of car with other motor vehicle, nontraffic, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18454,'Y03.07','Assault by crashing of car with other motor vehicle, nontraffic, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18455,'Y03.08','Assault by crashing of car with other motor vehicle, nontraffic, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18456,'Y03.09','Assault by crashing of car with other motor vehicle, nontraffic, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18457,'Y03.10','Assault by crashing of car with fixed or stationary object, nontraffic, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18458,'Y03.11','Assault by crashing of car with fixed or stationary object, nontraffic, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18459,'Y03.12','Assault by crashing of car with fixed or stationary object, nontraffic, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18460,'Y03.13','Assault by crashing of car with fixed or stationary object, nontraffic, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18461,'Y03.14','Assault by crashing of car with fixed or stationary object, nontraffic, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18462,'Y03.15','Assault by crashing of car with fixed or stationary object, nontraffic, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18463,'Y03.16','Assault by crashing of car with fixed or stationary object, nontraffic, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18464,'Y03.17','Assault by crashing of car with fixed or stationary object, nontraffic, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18465,'Y03.18','Assault by crashing of car with fixed or stationary object, nontraffic, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18466,'Y03.19','Assault by crashing of car with fixed or stationary object, nontraffic, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18467,'Y03.20','Assault by other specified crashing of motor vehicle, nontraffic, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18468,'Y03.21','Assault by other specified crashing of motor vehicle, nontraffic, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18469,'Y03.22','Assault by other specified crashing of motor vehicle, nontraffic, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18470,'Y03.23','Assault by other specified crashing of motor vehicle, nontraffic, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18471,'Y03.24','Assault by other specified crashing of motor vehicle, nontraffic, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18472,'Y03.25','Assault by other specified crashing of motor vehicle, nontraffic, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18473,'Y03.26','Assault by other specified crashing of motor vehicle, nontraffic, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18474,'Y03.27','Assault by other specified crashing of motor vehicle, nontraffic, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18475,'Y03.28','Assault by other specified crashing of motor vehicle, nontraffic, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18476,'Y03.29','Assault by other specified crashing of motor vehicle, nontraffic, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18477,'Y03.30','Assault by unspecified crashing of motor vehicle, nontraffic, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18478,'Y03.31','Assault by unspecified crashing of motor vehicle, nontraffic, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18479,'Y03.32','Assault by unspecified crashing of motor vehicle, nontraffic, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18480,'Y03.33','Assault by unspecified crashing of motor vehicle, nontraffic, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18481,'Y03.34','Assault by unspecified crashing of motor vehicle, nontraffic, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18482,'Y03.35','Assault by unspecified crashing of motor vehicle, nontraffic, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18483,'Y03.36','Assault by unspecified crashing of motor vehicle, nontraffic, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18484,'Y03.37','Assault by unspecified crashing of motor vehicle, nontraffic, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18485,'Y03.38','Assault by unspecified crashing of motor vehicle, nontraffic, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18486,'Y03.39','Assault by unspecified crashing of motor vehicle, nontraffic, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18487,'Y03.40','Assault by crashing of car with other motor vehicle, traffic, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18488,'Y03.41','Assault by crashing of car with other motor vehicle, traffic, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18489,'Y03.42','Assault by crashing of car with other motor vehicle, traffic, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18490,'Y03.43','Assault by crashing of car with other motor vehicle, traffic, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18491,'Y03.44','Assault by crashing of car with other motor vehicle, traffic, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18492,'Y03.45','Assault by crashing of car with other motor vehicle, traffic, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18493,'Y03.46','Assault by crashing of car with other motor vehicle, traffic, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18494,'Y03.47','Assault by crashing of car with other motor vehicle, traffic, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18495,'Y03.48','Assault by crashing of car with other motor vehicle, traffic, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18496,'Y03.49','Assault by crashing of car with other motor vehicle, traffic, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18497,'Y03.50','Assault by crashing of car with fixed or stationary object, traffic, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18498,'Y03.51','Assault by crashing of car with fixed or stationary object, traffic, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18499,'Y03.52','Assault by crashing of car with fixed or stationary object, traffic, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18500,'Y03.53','Assault by crashing of car with fixed or stationary object, traffic, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18501,'Y03.54','Assault by crashing of car with fixed or stationary object, traffic, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18502,'Y03.55','Assault by crashing of car with fixed or stationary object, traffic, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18503,'Y03.56','Assault by crashing of car with fixed or stationary object, traffic, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18504,'Y03.57','Assault by crashing of car with fixed or stationary object, traffic, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18505,'Y03.58','Assault by crashing of car with fixed or stationary object, traffic, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18506,'Y03.59','Assault by crashing of car with fixed or stationary object, traffic, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18507,'Y03.80','Assault by other specified crashing of motor vehicle, traffic, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18508,'Y03.81','Assault by other specified crashing of motor vehicle, traffic, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18509,'Y03.82','Assault by other specified crashing of motor vehicle, traffic, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18510,'Y03.83','Assault by other specified crashing of motor vehicle, traffic, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18511,'Y03.84','Assault by other specified crashing of motor vehicle, traffic, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18512,'Y03.85','Assault by other specified crashing of motor vehicle, traffic, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18513,'Y03.86','Assault by other specified crashing of motor vehicle, traffic, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18514,'Y03.87','Assault by other specified crashing of motor vehicle, traffic, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18515,'Y03.88','Assault by other specified crashing of motor vehicle, traffic, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18516,'Y03.89','Assault by other specified crashing of motor vehicle, traffic, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18517,'Y03.90','Assault by unspecified crashing of motor vehicle, traffic, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18518,'Y03.91','Assault by unspecified crashing of motor vehicle, traffic, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18519,'Y03.92','Assault by unspecified crashing of motor vehicle, traffic, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18520,'Y03.93','Assault by unspecified crashing of motor vehicle, traffic, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18521,'Y03.94','Assault by unspecified crashing of motor vehicle, traffic, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18522,'Y03.95','Assault by unspecified crashing of motor vehicle, traffic, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18523,'Y03.96','Assault by unspecified crashing of motor vehicle, traffic, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18524,'Y03.97','Assault by unspecified crashing of motor vehicle, traffic, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18525,'Y03.98','Assault by unspecified crashing of motor vehicle, traffic, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18526,'Y03.99','Assault by unspecified crashing of motor vehicle, traffic, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18527,'Y04.00','Assault by bodily force, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18528,'Y04.01','Assault by bodily force, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18529,'Y04.02','Assault by bodily force, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18530,'Y04.03','Assault by bodily force, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18531,'Y04.04','Assault by bodily force, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18532,'Y04.05','Assault by bodily force, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18533,'Y04.06','Assault by bodily force, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18534,'Y04.07','Assault by bodily force, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18535,'Y04.08','Assault by bodily force, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18536,'Y04.09','Assault by bodily force, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18537,'Y05.00','Sexual assault by bodily force, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18538,'Y05.01','Sexual assault by bodily force, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18539,'Y05.02','Sexual assault by bodily force, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18540,'Y05.03','Sexual assault by bodily force, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18541,'Y05.04','Sexual assault by bodily force, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18542,'Y05.05','Sexual assault by bodily force, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18543,'Y05.06','Sexual assault by bodily force, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18544,'Y05.07','Sexual assault by bodily force, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18545,'Y05.08','Sexual assault by bodily force, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18546,'Y05.09','Sexual assault by bodily force, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18547,'Y06.00','Neglect and abandonment, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18548,'Y06.01','Neglect and abandonment, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18549,'Y06.02','Neglect and abandonment, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18550,'Y06.03','Neglect and abandonment, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18551,'Y06.04','Neglect and abandonment, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18552,'Y06.05','Neglect and abandonment, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18553,'Y06.06','Neglect and abandonment, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18554,'Y06.07','Neglect and abandonment, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18555,'Y06.08','Neglect and abandonment, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18556,'Y07.00','Other maltreatment syndromes, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18557,'Y07.01','Other maltreatment syndromes, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18558,'Y07.02','Other maltreatment syndromes, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18559,'Y07.03','Other maltreatment syndromes, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18560,'Y07.04','Other maltreatment syndromes, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18561,'Y07.05','Other maltreatment syndromes, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18562,'Y07.06','Other maltreatment syndromes, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18563,'Y07.07','Other maltreatment syndromes, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18564,'Y07.08','Other maltreatment syndromes, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18565,'Y07.09','Other maltreatment syndromes, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18566,'Y08.00','Assault by other specified means, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18567,'Y08.01','Assault by other specified means, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18568,'Y08.02','Assault by other specified means, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18569,'Y08.03','Assault by other specified means, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18570,'Y08.04','Assault by other specified means, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18571,'Y08.05','Assault by other specified means, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18572,'Y08.06','Assault by other specified means, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18573,'Y08.07','Assault by other specified means, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18574,'Y08.08','Assault by other specified means, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18575,'Y08.09','Assault by other specified means, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18576,'Y09.00','Assault by unspecified means, spouse or domestic partner',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18577,'Y09.01','Assault by unspecified means, parent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18578,'Y09.02','Assault by unspecified means, other family member',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18579,'Y09.03','Assault by unspecified means, carer',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18580,'Y09.04','Assault by unspecified means, acquaintance or friend',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18581,'Y09.05','Assault by unspecified means, official authorities',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18582,'Y09.06','Assault by unspecified means, person unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18583,'Y09.07','Assault by unspecified means, multiple persons unknown to the victim',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18584,'Y09.08','Assault by unspecified means, other specified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18585,'Y09.09','Assault by unspecified means, unspecified person',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18586,'Y17.0','Poisoning by and exposure to motor vehicle exhaust, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18587,'Y17.1','Poisoning by and exposure to liquefied petroleum gas (LPG), undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18588,'Y17.2','Poisoning by and exposure to other specified utility gas, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18589,'Y17.8','Poisoning by and exposure to other specified gas or vapours, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18590,'Y17.9','Poisoning by and exposure to unspecified gas or vapours, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18591,'Y21.0','Drowning and submersion in bath-tub, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18592,'Y21.1','Drowning and submersion in swimming pool, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18593,'Y21.2','Drowning and submersion in natural water, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18594,'Y21.8','Drowning and submersion in other specified water, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18595,'Y21.9','Drowning and submersion in unspecified  water, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18596,'Y24.1','Air rifle discharge, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18597,'Y24.2','Shotgun discharge, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18598,'Y24.3','Small calibre rifle discharge, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18599,'Y24.4','Large calibre rifle discharge, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18600,'Y24.9','Discharge from other and unspecified firearms, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18601,'Y28.0','Contact with knife, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18602,'Y28.1','Contact with razor blade, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18603,'Y28.2','Contact with hypodermic needle and syringe, undetermined intent ',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18604,'Y28.3','Contact with glass, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18605,'Y28.8','Contact with other specified sharp object, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18606,'Y28.9','Contact with unspecified sharp object, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18607,'Y31.0','Falling, lying or running before or into a train, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18608,'Y31.1','Falling, lying or running before or into a tram, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18609,'Y31.2','Falling, lying or running before or into a motor vehicle, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18610,'Y31.8','Falling, lying or running before or into other specified moving object, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18611,'Y31.9','Falling, lying or running before or into unspecified moving object, undetermined intent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18612,'Y32.0','Crashing of car with other motor vehicle, undetermined intent, nontraffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18613,'Y32.1','Crashing of car with fixed or stationary object, undetermined intent, nontraffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18614,'Y32.2','Other specified crashing of motor vehicle, undetermined intent, nontraffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18615,'Y32.3','Unspecified crashing of motor vehicle, undetermined intent, nontraffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18616,'Y32.4','Crashing of car with other motor vehicle, undetermined intent, traffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18617,'Y32.5','Crashing of car with fixed or stationary object, undetermined intent, traffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18618,'Y32.8','Other specified crashing of motor vehicle, undetermined intent, traffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18619,'Y32.9','Unspecified crashing of motor vehicle, undetermined intent, traffic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18620,'Y35.01','Legal intervention involving handgun discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18621,'Y35.02','Legal intervention involving air rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18622,'Y35.03','Legal intervention involving shotgun discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18623,'Y35.04','Legal intervention involving small calibre rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18624,'Y35.05','Legal intervention involving large calibre rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18625,'Y35.09','Legal intervention involving discharge from other and unspecified firearms',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18626,'Y36.41','War operations involving handgun discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18627,'Y36.42','War operations involving air rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18628,'Y36.43','War operations involving shotgun discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18629,'Y36.44','War operations involving small calibre rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18630,'Y36.45','War operations involving large calibre rifle discharge',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18631,'Y36.49','War operations involving discharge from other and unspecified firearms and other forms of conventional warfare',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18632,'Y70.0','Anaesthesiology devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18633,'Y70.1','Anaesthesiology devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18634,'Y70.2','Anaesthesiology devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18635,'Y70.3','Anaesthesiology devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18636,'Y70.8','Anaesthesiology devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18637,'Y71.0','Cardiovascular devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18638,'Y71.1','Cardiovascular devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18639,'Y71.2','Cardiovascular devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18640,'Y71.3','Cardiovascular devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18641,'Y71.8','Cardiovascular devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18642,'Y72.0','Otorhinolaryngological devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18643,'Y72.1','Otorhinolaryngological devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18644,'Y72.2','Otorhinolaryngological devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18645,'Y72.3','Otorhinolaryngological devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18646,'Y72.8','Otorhinolaryngological devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18647,'Y73.0','Gastroenterology and urology devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18648,'Y73.1','Gastroenterology and urology devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18649,'Y73.2','Gastroenterology and urology devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18650,'Y73.3','Gastroenterology and urology devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18651,'Y73.8','Gastroenterology and urology devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18652,'Y74.0','General hospital and personal-use devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18653,'Y74.1','General hospital and personal-use devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18654,'Y74.2','General hospital and personal-use devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18655,'Y74.3','General hospital and personal-use devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18656,'Y74.8','General hospital and personal-use devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18657,'Y75.0','Neurological devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18658,'Y75.1','Neurological devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18659,'Y75.2','Neurological devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18660,'Y75.3','Neurological devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18661,'Y75.8','Neurological devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18662,'Y76.0','Obstetric and gynaecological devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18663,'Y76.1','Obstetric and gynaecological devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18664,'Y76.2','Obstetric and gynaecological devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18665,'Y76.3','Obstetric and gynaecological devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18666,'Y76.8','Obstetric and gynaecological devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18667,'Y77.0','Ophthalmic devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18668,'Y77.1','Ophthalmic devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18669,'Y77.2','Ophthalmic devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18670,'Y77.3','Ophthalmic devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18671,'Y77.8','Ophthalmic devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18672,'Y78.0','Radiological devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18673,'Y78.1','Radiological devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18674,'Y78.2','Radiological devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18675,'Y78.3','Radiological devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18676,'Y78.8','Radiological devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18677,'Y79.0','Orthopaedic devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18678,'Y79.1','Orthopaedic devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18679,'Y79.2','Orthopaedic devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18680,'Y79.3','Orthopaedic devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18681,'Y79.8','Orthopaedic devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18682,'Y80.0','Physical medicine devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18683,'Y80.1','Physical medicine devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18684,'Y80.2','Physical medicine devices associated with adverse incidents, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18685,'Y80.3','Physical medicine devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18686,'Y80.8','Physical medicine devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18687,'Y81.0','General- and plastic-surgery devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18688,'Y81.1','General- and plastic-surgery devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18689,'Y81.2','General- and plastic-surgery devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18690,'Y81.3','General- and plastic-surgery devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18691,'Y81.8','General- and plastic-surgery devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18692,'Y82.0','Other and unspecified medical devices associated with misadventures, diagnostic and monitoring devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18693,'Y82.1','Other and unspecified medical devices associated with misadventures, therapeutic (nonsurgical) and rehabilitative devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18694,'Y82.2','Other and unspecified medical devices associated with misadventures, prosthetic and other implants, materials and accessory devices',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18695,'Y82.3','Other and unspecified medical devices associated with misadventures, surgical instruments, materials and devices (including sutures)',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18696,'Y82.8','Other and unspecified medical devices associated with misadventures, miscellaneous devices, not elsewhere classified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18698,'Z03.70','Observation for unspecified suspected newborn condition',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18699,'Z03.71','Observation for suspected newborn infectious condition',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18700,'Z03.72','Observation for suspected newborn neurological condition',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18701,'Z03.73','Observation for suspected newborn respiratory condition',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18702,'Z03.79','Observation for other suspected newborn condition',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18703,'Z06.31','Penicillin resistant agent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18704,'Z06.32','Methicillin resistant agent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18705,'Z06.39','Agent resistant to other penicillin-related antibiotic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18706,'Z06.41','Vancomycin resistant agent',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18707,'Z06.49','Agent resistant to other vancomycin-related antibiotic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18708,'Z06.8','Agent resistant to multiple antibiotics',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18709,'Z06.90','Agent resistant to unspecified antibiotic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18710,'Z06.99','Agent resistant to other single specified antibiotic',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18711,'Z13.81','Special screening examination for nervous system disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18712,'Z13.82','Special screening examination for respiratory disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18713,'Z13.83','Special screening examination for digestive tract disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18714,'Z13.84','Special screening examination for musculoskeletal disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18715,'Z13.85','Special screening examination for genitourinary disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18716,'Z13.86','Special screening examination for endocrine and metabolic disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18717,'Z13.88','Special screening examination for other specified diseases and disorders',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18718,'Z22.51','Carrier of viral hepatitis B',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18719,'Z22.52','Carrier of viral hepatitis C',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18720,'Z22.59','Carrier of other specified viral hepatitis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18721,'Z35.51','Supervision of primigravida with advanced maternal age',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18722,'Z35.52','Supervision of multigravida with advanced maternal age',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18723,'Z39.00','Postpartum care and examination after delivery, unspecified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18724,'Z39.01','Postpartum care after hospital delivery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18725,'Z39.02','Postpartum care after planned, out of hospital delivery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18726,'Z39.03','Postpartum care after unplanned, out of hospital delivery',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18727,'Z40.00','Prophylactic surgery for risk-factors related to malignant neoplasms, breast',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18728,'Z40.01','Prophylactic surgery for risk-factors related to malignant neoplasms, ovary',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18729,'Z40.08','Prophylactic surgery for risk-factors related to malignant neoplasms, other',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18730,'Z51.60','Desensitisation to allergen, unspecified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18731,'Z51.61','Desensitisation to allergen, stinging insect',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18732,'Z51.62','Desensitisation to allergen, pollen',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18733,'Z51.63','Desensitisation to allergen, dust mite',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18734,'Z51.64','Desensitisation to allergen, animal',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18735,'Z51.69','Desensitisation to other specified allergen',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18736,'Z51.81','Apheresis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18737,'Z51.88','Other specified medical care',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18738,'Z52.00','Whole blood donor',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18739,'Z52.08','Other blood product donor',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18740,'Z58.7','Exposure to tobacco smoke',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18741,'Z63.70','Stressful life events affecting family and household, unspecified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18742,'Z63.71','Alcoholism in family',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18743,'Z63.72','Gambling in family',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18744,'Z63.79','Other stressful life events affecting family and household',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18745,'Z75.10','Person awaiting admission to  acute hospital',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18746,'Z75.11','Person awaiting admission to residential aged care service',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18747,'Z75.12','Person awaiting admission to psychiatric facility/unit',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18748,'Z75.13','Person awaiting admission to rehabilitation facility/unit',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18749,'Z75.14','Person awaiting admission to  palliative care facility/unit',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18750,'Z75.18','Person awaiting admission to other health care facility',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18751,'Z75.19','Person awaiting admission to adequate facility elsewhere, unspecified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18752,'Z86.10','Personal history of unspecified infectious and parasitic disease',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18753,'Z86.11','Personal history of tuberculosis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18754,'Z86.12','Personal history of poliomyelitis',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18755,'Z86.13','Personal history of malaria',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18756,'Z86.18','Personal history of other infectious and parasitic disease',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18757,'Z86.41','Personal history of alcohol use disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18758,'Z86.42','Personal history of drug use disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18759,'Z86.43','Personal history of tobacco use disorder',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18760,'Z87.10','Personal history of unspecified digestive disease',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18761,'Z87.11','Personal history of peptic ulcer disease',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18762,'Z87.12','Personal history of colonic polyps',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18763,'Z87.18','Personal history of other digestive system disease',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18764,'Z92.21','Personal history of long-term (current) use of other medicaments, aspirin',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18765,'Z92.22','Personal history of long-term (current) use of other medicaments, insulin',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18766,'Z92.28','Personal history of long-term (current) use of other medicaments, other',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18767,'Z92.6','Personal history of chemotherapy for neoplastic disease',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18768,'Z96.60','Presence of unspecified joint implant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18769,'Z96.61','Presence of shoulder implant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18770,'Z96.62','Presence of elbow implant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18771,'Z96.63','Presence of wrist implant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18772,'Z96.64','Presence of hip implant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18773,'Z96.65','Presence of knee implant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18774,'Z96.66','Presence of ankle implant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18775,'Z96.68','Presence of other orthopaedic joint implant',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL),(18776,'L93.29','Osteochondritis dissecans, site unspecified',0,NULL,1,'2011-04-05 17:09:43','Nisal De Silva',NULL,NULL);
/*!40000 ALTER TABLE `icd10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection`
--

DROP TABLE IF EXISTS `injection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injection` (
  `injection_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `dosage` varchar(30) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(200) DEFAULT NULL,
  `LastUpDate` datetime DEFAULT NULL,
  `LastUpDateUser` varchar(200) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `route` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`injection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection`
--

LOCK TABLES `injection` WRITE;
/*!40000 ALTER TABLE `injection` DISABLE KEYS */;
INSERT INTO `injection` VALUES (1,'BCG 1 Dose','1ml',NULL,'2017-06-07 00:00:00','Nisal De Silva',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `injection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_externallabresults`
--

DROP TABLE IF EXISTS `lab_externallabresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_externallabresults` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `mainresult` varchar(255) DEFAULT NULL,
  `other_comments` varchar(255) DEFAULT NULL,
  `ftest_id` int(11) DEFAULT NULL,
  `fsubf_id` int(11) DEFAULT NULL,
  `fparentf_id` int(11) DEFAULT NULL,
  `fpatient_id` int(11) DEFAULT NULL,
  `result_finalized_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fadded_user_id` int(11) DEFAULT NULL,
  `flast_updated_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `ExternalLabResults_TestNames` (`ftest_id`),
  KEY `ExternalLabResults_SubTestFields` (`fsubf_id`),
  KEY `ExternalLabResults_ParentTestFields` (`fparentf_id`),
  KEY `ExtenalLabResults_opd_patient` (`fpatient_id`),
  KEY `ExternalLabResults_User1` (`fadded_user_id`),
  KEY `ExternalLabResults_User2` (`flast_updated_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_externallabresults`
--

LOCK TABLES `lab_externallabresults` WRITE;
/*!40000 ALTER TABLE `lab_externallabresults` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_externallabresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_inwardlabrequest`
--

DROP TABLE IF EXISTS `lab_inwardlabrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_inwardlabrequest` (
  `inward_lab_test_request_id` int(11) NOT NULL,
  `bht` varchar(500) NOT NULL,
  PRIMARY KEY (`inward_lab_test_request_id`,`bht`),
  KEY `FK_akv3hlro6s6qhqcnhthvpda0y` (`inward_lab_test_request_id`),
  KEY `FK_a7r6igxrsk46gm69dedp2k40g` (`bht`),
  CONSTRAINT `FK_a7r6igxrsk46gm69dedp2k40g` FOREIGN KEY (`bht`) REFERENCES `ward_admission` (`bht_no`),
  CONSTRAINT `FK_akv3hlro6s6qhqcnhthvpda0y` FOREIGN KEY (`inward_lab_test_request_id`) REFERENCES `lab_labtestrequest` (`lab_test_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_inwardlabrequest`
--

LOCK TABLES `lab_inwardlabrequest` WRITE;
/*!40000 ALTER TABLE `lab_inwardlabrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_inwardlabrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_labdepartments`
--

DROP TABLE IF EXISTS `lab_labdepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_labdepartments` (
  `lab_dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_dept_name` varchar(30) NOT NULL,
  PRIMARY KEY (`lab_dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_labdepartments`
--

LOCK TABLES `lab_labdepartments` WRITE;
/*!40000 ALTER TABLE `lab_labdepartments` DISABLE KEYS */;
INSERT INTO `lab_labdepartments` VALUES (1,'Pathology'),(2,'Microbiology'),(3,'Histopathology'),(4,'Biochemistry'),(5,'Virology');
/*!40000 ALTER TABLE `lab_labdepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_laboratories`
--

DROP TABLE IF EXISTS `lab_laboratories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_laboratories` (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(30) NOT NULL,
  `flab_type_id` int(11) DEFAULT NULL,
  `lab_incharge` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `flab_dept_id` int(11) DEFAULT NULL,
  `lab_dept_count` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `flab_added_user_id` int(11) DEFAULT NULL,
  `flab_last_updated_user_id` int(11) DEFAULT NULL,
  `lab_added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lab_last_updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contact_number_1` varchar(10) NOT NULL,
  `contact_number_2` varchar(10) NOT NULL,
  PRIMARY KEY (`lab_id`),
  KEY `Laboratories_Types` (`flab_type_id`),
  KEY `Laboratories_LabDepartments` (`flab_dept_id`),
  KEY `Laboratories_User1` (`flab_added_user_id`),
  KEY `Laboratories_User2` (`flab_last_updated_user_id`),
  KEY `FK_6gwifxfvjpv583sm3kjwv18t0` (`flab_type_id`),
  KEY `FK_gc3xpbvlmscb2nuft5tw3nocb` (`flab_dept_id`),
  KEY `FK_jc97n60ue2n7uk7qc60b08s5p` (`flab_last_updated_user_id`),
  KEY `FK_hnki2kulgktpdu7gd0ofxkhv4` (`flab_added_user_id`),
  CONSTRAINT `FK_6gwifxfvjpv583sm3kjwv18t0` FOREIGN KEY (`flab_type_id`) REFERENCES `lab_types` (`lab_type_id`),
  CONSTRAINT `FK_gc3xpbvlmscb2nuft5tw3nocb` FOREIGN KEY (`flab_dept_id`) REFERENCES `lab_labdepartments` (`lab_dept_id`),
  CONSTRAINT `FK_hnki2kulgktpdu7gd0ofxkhv4` FOREIGN KEY (`flab_added_user_id`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_jc97n60ue2n7uk7qc60b08s5p` FOREIGN KEY (`flab_last_updated_user_id`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_laboratories`
--

LOCK TABLES `lab_laboratories` WRITE;
/*!40000 ALTER TABLE `lab_laboratories` DISABLE KEYS */;
INSERT INTO `lab_laboratories` VALUES (12,'PCU',1,'Kasun','Homagama',3,2,'pcu@hislis.com',1,1,'2015-07-23 07:59:39','2014-11-20 07:19:06','0112345678','0112345676'),(13,'OPD',1,'Sahan','OPD',4,3,'opd@limishis.com',1,1,'2015-07-23 07:59:44','2015-07-10 04:43:01','0113456784','0113456789'),(14,'Clinic',1,'Yashoda','Clinic',4,2,'clinic@limshims.com',1,1,'2015-07-23 07:59:46','2014-11-20 09:00:21','0112345568','0112345655'),(15,'Inward',1,'Hasangi','Inward',4,2,'inward@hislims.com',1,1,'2015-07-23 07:59:49','2015-07-17 05:45:03','0112345679','0112345615'),(16,'Dengue',3,'Nisal','Colombo 10',5,1,'-',1,1,'2017-06-16 04:34:20','2017-06-16 04:34:20','-','-');
/*!40000 ALTER TABLE `lab_laboratories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_labtestrequest`
--

DROP TABLE IF EXISTS `lab_labtestrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_labtestrequest` (
  `lab_test_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftest_id` int(11) DEFAULT NULL,
  `fpatient_id` int(11) DEFAULT NULL,
  `flab_id` int(11) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `test_request_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test_due_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ftest_request_person` int(11) DEFAULT NULL,
  PRIMARY KEY (`lab_test_request_id`),
  KEY `FK_fcabpd5cy83dlv5vsdk8si7u4` (`ftest_request_person`),
  KEY `FK_ai9lh5x5ghl3279ibak65sox3` (`fpatient_id`),
  KEY `FK_hf633m5rwtd3otja1iypv80gl` (`ftest_id`),
  KEY `FK_skxomul2sbnd1vkr71ej2x500` (`flab_id`),
  CONSTRAINT `FK_ai9lh5x5ghl3279ibak65sox3` FOREIGN KEY (`fpatient_id`) REFERENCES `opd_patient` (`patient_id`),
  CONSTRAINT `FK_fcabpd5cy83dlv5vsdk8si7u4` FOREIGN KEY (`ftest_request_person`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_hf633m5rwtd3otja1iypv80gl` FOREIGN KEY (`ftest_id`) REFERENCES `lab_testnames` (`test_id`),
  CONSTRAINT `FK_skxomul2sbnd1vkr71ej2x500` FOREIGN KEY (`flab_id`) REFERENCES `lab_laboratories` (`lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_labtestrequest`
--

LOCK TABLES `lab_labtestrequest` WRITE;
/*!40000 ALTER TABLE `lab_labtestrequest` DISABLE KEYS */;
INSERT INTO `lab_labtestrequest` VALUES (1,1,1,13,'Test','High','Report Issued','2015-07-30 04:51:20','2015-07-23 01:55:45',1),(2,30,60,13,'Test','Medium','Report Issued','2015-07-29 03:39:03','2015-07-23 22:56:14',1),(3,1,10,13,'qwdw','Medium','Report Issued','2015-07-30 04:59:44','2015-07-30 04:59:44',1),(4,30,1,13,'Test','High','Report Issued','2015-07-29 03:41:17','2015-07-23 01:55:45',1),(5,2,10,13,'Need a Report','High','Report Issued','2015-07-30 05:32:36','2015-07-30 05:32:36',1),(6,30,2,13,'test','High','Report Issued','2015-07-30 05:56:28','2015-08-02 02:51:19',1),(7,1,1,13,'note','High','Report Issued','2015-07-30 08:35:07','2015-07-30 08:35:07',1),(8,1,6,13,'etdt','High','Sample Collected','2015-08-06 08:50:00','2015-08-06 08:50:00',1),(9,1,8,13,'wsarfdwzs','Medium','Sample Collected','2015-08-12 06:34:26','2015-08-12 06:34:26',1),(10,1,10,13,'urgent','High','Sample Collected','2016-03-16 13:27:09','2016-03-16 13:27:09',1),(11,3,10,13,'urgent','High','Sample Collected','2016-03-16 13:28:39','2016-03-16 13:28:39',1),(12,1,10,13,'urgent','High','Report Issued','2016-07-22 09:19:31','2016-03-16 13:30:28',1),(13,1,10,13,'111','Medium','Sample Collected','2016-03-16 13:33:27','2016-03-16 13:33:27',1),(14,1,10,13,'111','Medium','Sample Required','2016-07-22 09:19:35','2016-03-16 13:34:33',1),(15,7,10,13,'right now','low','Sample Collected','2016-03-16 13:36:14','2016-03-16 13:36:14',1),(16,1,10,13,'right now','low','Sample Collected','2016-03-16 13:36:43','2016-03-16 13:36:43',1),(17,1,10,13,'right now','low','Sample Collected','2016-03-16 13:37:38','2016-03-16 13:37:38',1),(18,1,10,13,'right now','High','Sample Required','2016-03-16 13:37:51','2016-03-16 13:37:51',1),(19,2,10,13,'right now','Medium','Sample Required','2016-03-16 13:38:02','2016-03-16 13:38:02',1),(20,1,10,13,'now','High','Report Issued','2016-03-16 13:40:50','2016-03-16 13:40:50',1),(21,1,10,13,'now','High','Sample Required','2016-03-16 13:41:41','2016-03-16 13:41:41',1),(22,2,10,13,'maybe','Medium','Sample Required','2016-03-16 13:43:13','2016-03-16 13:43:13',1),(23,2,10,13,'maybe','Medium','Sample Required','2016-03-16 13:44:00','2016-03-16 13:44:00',1),(24,1,13,13,'aaa','High','Report Issued','2016-07-22 09:07:49','2016-07-22 09:07:49',1),(25,2,7,13,'qeq','High','Report Issued','2016-07-25 07:57:56','2016-07-25 07:57:56',1),(26,30,11,13,'l','High','Sample Required','2016-07-25 08:10:32','2016-07-25 08:10:32',1),(27,30,11,13,'cfg','High','Report Issued','2016-07-25 08:12:51','2016-07-25 08:12:51',1),(28,2,86,13,'868686','High','Sample Required','2017-05-12 05:49:15','2017-05-12 05:49:15',1),(29,2,88,13,'normal','High','Sample Required','2017-05-24 04:54:22','2017-05-24 04:54:22',1),(30,2,88,13,'urgent','High','Sample Required','2017-05-25 07:28:29','2017-05-25 07:28:29',1),(31,45,88,13,'new','High','Report Issued','2017-06-16 04:39:04','2017-06-16 04:39:04',1);
/*!40000 ALTER TABLE `lab_labtestrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_mainresults`
--

DROP TABLE IF EXISTS `lab_mainresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_mainresults` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `mainresult` varchar(255) NOT NULL,
  `ftest_request_id` int(11) DEFAULT NULL,
  `fparentf_id` int(11) DEFAULT NULL,
  `result_finalized_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  KEY `MainResults_LabTestRequest` (`ftest_request_id`),
  KEY `MainResults_ParentTestFields` (`fparentf_id`),
  KEY `FK_f75ngennd1qq79mmfxp3jn95d` (`ftest_request_id`),
  KEY `FK_3npi4tyr9gahbnfcv4cia3nsl` (`fparentf_id`),
  CONSTRAINT `FK_3npi4tyr9gahbnfcv4cia3nsl` FOREIGN KEY (`fparentf_id`) REFERENCES `lab_parenttestfields` (`parent_field_id`),
  CONSTRAINT `FK_f75ngennd1qq79mmfxp3jn95d` FOREIGN KEY (`ftest_request_id`) REFERENCES `lab_labtestrequest` (`lab_test_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_mainresults`
--

LOCK TABLES `lab_mainresults` WRITE;
/*!40000 ALTER TABLE `lab_mainresults` DISABLE KEYS */;
INSERT INTO `lab_mainresults` VALUES (1,'4',1,4,'2015-07-30 04:59:30'),(2,'4',1,7,'2015-07-30 04:59:30'),(3,'4',1,13,'2015-07-30 04:59:30'),(4,'55',1,2,'2015-07-30 04:59:30'),(5,'4',1,6,'2015-07-30 04:59:30'),(6,'4',1,12,'2015-07-30 04:59:30'),(7,'4',1,10,'2015-07-30 04:59:30'),(8,'4',1,3,'2015-07-30 04:59:30'),(9,'4',1,5,'2015-07-30 04:59:30'),(10,'4',1,8,'2015-07-30 04:59:30'),(11,'4',1,11,'2015-07-30 04:59:30'),(12,'4',1,9,'2015-07-30 04:59:30'),(13,'4',1,1,'2015-07-30 04:59:30'),(14,'9',2,17,'2015-07-30 05:00:26'),(15,'9',2,16,'2015-07-30 05:00:26'),(16,'9',2,18,'2015-07-30 05:00:26'),(17,'9',2,19,'2015-07-30 05:00:26'),(18,'9',2,20,'2015-07-30 05:00:26'),(19,'8',3,5,'2015-07-30 05:01:12'),(20,'8',3,11,'2015-07-30 05:01:12'),(21,'8',3,10,'2015-07-30 05:01:12'),(22,'8',3,2,'2015-07-30 05:01:12'),(23,'8',3,4,'2015-07-30 05:01:12'),(24,'8',3,13,'2015-07-30 05:01:12'),(25,'8',3,7,'2015-07-30 05:01:12'),(26,'8',3,12,'2015-07-30 05:01:12'),(27,'8',3,1,'2015-07-30 05:01:12'),(28,'8',3,9,'2015-07-30 05:01:12'),(29,'8',3,3,'2015-07-30 05:01:12'),(30,'8',3,6,'2015-07-30 05:01:12'),(31,'8',3,8,'2015-07-30 05:01:12'),(32,'3',4,19,'2015-07-30 05:22:43'),(33,'20',4,18,'2015-07-30 05:22:43'),(34,'15',4,16,'2015-07-30 05:22:43'),(35,'2',4,20,'2015-07-30 05:22:43'),(36,'14',4,17,'2015-07-30 05:22:43'),(37,'85',5,31,'2015-07-30 05:33:13'),(38,'5',6,19,'2015-07-30 05:57:40'),(39,'8',6,20,'2015-07-30 05:57:40'),(40,'5',6,16,'2015-07-30 05:57:40'),(41,'8',6,17,'2015-07-30 05:57:40'),(42,'13',6,18,'2015-07-30 05:57:40'),(43,'7',7,6,'2015-07-30 08:56:37'),(44,'5',7,11,'2015-07-30 08:56:37'),(45,'5',7,4,'2015-07-30 08:56:37'),(46,'6',7,12,'2015-07-30 08:56:37'),(47,'8',7,3,'2015-07-30 08:56:37'),(48,'6',7,2,'2015-07-30 08:56:37'),(49,'3',7,5,'2015-07-30 08:56:37'),(50,'1',7,7,'2015-07-30 08:56:37'),(51,'2',7,8,'2015-07-30 08:56:37'),(52,'5',7,1,'2015-07-30 08:56:37'),(53,'9',7,13,'2015-07-30 08:56:37'),(54,'8',7,9,'2015-07-30 08:56:37'),(55,'4',7,10,'2015-07-30 08:56:37'),(56,'2',27,19,'2016-07-26 04:34:25'),(57,'2',27,17,'2016-07-26 04:34:25'),(58,'2',27,20,'2016-07-26 04:34:25'),(59,'2',27,18,'2016-07-26 04:34:25'),(60,'2',27,16,'2016-07-26 04:34:25'),(61,'4',25,31,'2016-07-26 04:34:59'),(62,'213',24,2,'2016-07-26 05:12:25'),(63,'132',24,4,'2016-07-26 05:12:25'),(64,'123',24,3,'2016-07-26 05:12:25'),(65,'132',24,9,'2016-07-26 05:12:25'),(66,'321',24,12,'2016-07-26 05:12:25'),(67,'321',24,7,'2016-07-26 05:12:25'),(68,'321',24,5,'2016-07-26 05:12:25'),(69,'321',24,8,'2016-07-26 05:12:25'),(70,'321',24,1,'2016-07-26 05:12:25'),(71,'132',24,13,'2016-07-26 05:12:25'),(72,'321',24,6,'2016-07-26 05:12:25'),(73,'321',24,10,'2016-07-26 05:12:25'),(74,'321',24,11,'2016-07-26 05:12:25'),(75,'321',24,10,'2016-07-26 05:12:26'),(76,'321',24,12,'2016-07-26 05:12:26'),(77,'321',24,1,'2016-07-26 05:12:26'),(78,'213',24,2,'2016-07-26 05:12:26'),(79,'132',24,9,'2016-07-26 05:12:26'),(80,'321',24,6,'2016-07-26 05:12:26'),(81,'321',24,7,'2016-07-26 05:12:26'),(82,'321',24,11,'2016-07-26 05:12:26'),(83,'132',24,4,'2016-07-26 05:12:26'),(84,'321',24,8,'2016-07-26 05:12:26'),(85,'123',24,3,'2016-07-26 05:12:26'),(86,'132',24,13,'2016-07-26 05:12:26'),(87,'321',24,5,'2016-07-26 05:12:26'),(88,'324',20,4,'2016-07-27 05:12:54'),(89,'432',20,6,'2016-07-27 05:12:54'),(90,'432',20,12,'2016-07-27 05:12:54'),(91,'324',20,10,'2016-07-27 05:12:54'),(92,'432',20,9,'2016-07-27 05:12:54'),(93,'432',20,7,'2016-07-27 05:12:54'),(94,'432',20,11,'2016-07-27 05:12:54'),(95,'432',20,8,'2016-07-27 05:12:54'),(96,'324',20,3,'2016-07-27 05:12:54'),(97,'432',20,13,'2016-07-27 05:12:54'),(98,'234',20,1,'2016-07-27 05:12:54'),(99,'324',20,5,'2016-07-27 05:12:54'),(100,'234',20,2,'2016-07-27 05:12:54'),(101,'3214',12,1,'2016-07-27 07:03:20'),(102,'321',12,8,'2016-07-27 07:03:20'),(103,'213',12,7,'2016-07-27 07:03:20'),(104,'23',12,12,'2016-07-27 07:03:20'),(105,'31',12,6,'2016-07-27 07:03:20'),(106,'321',12,10,'2016-07-27 07:03:20'),(107,'32',12,13,'2016-07-27 07:03:20'),(108,'321',12,9,'2016-07-27 07:03:20'),(109,'211',12,4,'2016-07-27 07:03:20'),(110,'32',12,5,'2016-07-27 07:03:20'),(111,'123',12,3,'2016-07-27 07:03:20'),(112,'213',12,2,'2016-07-27 07:03:20'),(113,'32',12,11,'2016-07-27 07:03:20'),(114,'5',31,46,'2017-06-16 04:39:58');
/*!40000 ALTER TABLE `lab_mainresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_opdlabrequest`
--

DROP TABLE IF EXISTS `lab_opdlabrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_opdlabrequest` (
  `opd_lab_test_request_id` int(11) NOT NULL,
  `patient_visit_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`opd_lab_test_request_id`,`patient_visit_id`),
  KEY `OpdLabRequest_Visit` (`patient_visit_id`),
  KEY `FK_ay3c9bh5quf2l0nu83yl10xq1` (`opd_lab_test_request_id`),
  KEY `FK_43di6qfq80bo5l8gfiul3nt99` (`patient_visit_id`),
  CONSTRAINT `FK_43di6qfq80bo5l8gfiul3nt99` FOREIGN KEY (`patient_visit_id`) REFERENCES `opd_patient_visit` (`visit_id`),
  CONSTRAINT `FK_ay3c9bh5quf2l0nu83yl10xq1` FOREIGN KEY (`opd_lab_test_request_id`) REFERENCES `lab_labtestrequest` (`lab_test_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_opdlabrequest`
--

LOCK TABLES `lab_opdlabrequest` WRITE;
/*!40000 ALTER TABLE `lab_opdlabrequest` DISABLE KEYS */;
INSERT INTO `lab_opdlabrequest` VALUES (28,150),(29,152),(30,152),(31,153);
/*!40000 ALTER TABLE `lab_opdlabrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_parenttestfields`
--

DROP TABLE IF EXISTS `lab_parenttestfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_parenttestfields` (
  `parent_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_field_id_name` varchar(5) NOT NULL,
  `parent_field_name` varchar(80) NOT NULL,
  `ftest_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`parent_field_id`),
  UNIQUE KEY `parent_field_name` (`parent_field_name`),
  KEY `ParentTestFields_TestNames` (`ftest_name_id`),
  KEY `FK_lv2by799epg8magdnvm107lwf` (`ftest_name_id`),
  CONSTRAINT `FK_lv2by799epg8magdnvm107lwf` FOREIGN KEY (`ftest_name_id`) REFERENCES `lab_testnames` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_parenttestfields`
--

LOCK TABLES `lab_parenttestfields` WRITE;
/*!40000 ALTER TABLE `lab_parenttestfields` DISABLE KEYS */;
INSERT INTO `lab_parenttestfields` VALUES (1,'PF','RBC',1),(2,'PF','Haemoglobin',1),(3,'PF','PCV',1),(4,'PF','MCV',1),(5,'PF','MCH',1),(6,'PF','MCHC',1),(7,'PF','Platelet Count',1),(8,'PF','Leucocyte Count',1),(9,'PF','Neutrophils',1),(10,'PF','Lymphocytes',1),(11,'PF','Eosinophils',1),(12,'PF','Monocytes',1),(13,'PF','Basophils',1),(14,'PF','Sodium ',10),(15,'PF','Potassium',10),(16,'PF','Total Cholesterol',30),(17,'PF','HDL',30),(18,'PF','LDL',30),(19,'PF','Serum Triglycerides',30),(20,'PF','Cholesterol HDL Ratio',30),(21,'PF','SGPT (Alanine Aminotransferase)',11),(22,'PF','Fat Globules',20),(23,'PF','Reducing Substances ',20),(24,'PF','Fibers	',20),(25,'PF','Amoebae',20),(26,'PF','Ova',20),(27,'PF','Cysts',20),(30,'PF','Pus Cells',20),(31,'PF','Fasting Blood Sugar',2),(32,'PF','blood_p1',32),(42,'PF','p1',40),(43,'PF','p2',40),(44,'PF','tttt',44),(45,'PF','iii',44),(46,'PF','field1',45);
/*!40000 ALTER TABLE `lab_parenttestfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_pculabrequest`
--

DROP TABLE IF EXISTS `lab_pculabrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_pculabrequest` (
  `pcu_lab_test_request_id` int(11) NOT NULL,
  `pcu_patient_id` int(11) NOT NULL,
  PRIMARY KEY (`pcu_lab_test_request_id`,`pcu_patient_id`),
  KEY `PcuLabRequest_Admition` (`pcu_patient_id`),
  KEY `FK_4ghbljhv94tuwy8i3ahis1cia` (`pcu_lab_test_request_id`),
  KEY `FK_pcekoa6kese1m12rpjbrhte4v` (`pcu_patient_id`),
  CONSTRAINT `FK_4ghbljhv94tuwy8i3ahis1cia` FOREIGN KEY (`pcu_lab_test_request_id`) REFERENCES `lab_labtestrequest` (`lab_test_request_id`),
  CONSTRAINT `FK_pcekoa6kese1m12rpjbrhte4v` FOREIGN KEY (`pcu_patient_id`) REFERENCES `pcu_admition` (`admition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_pculabrequest`
--

LOCK TABLES `lab_pculabrequest` WRITE;
/*!40000 ALTER TABLE `lab_pculabrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_pculabrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_reports`
--

DROP TABLE IF EXISTS `lab_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `fpatient_id` int(11) DEFAULT NULL,
  `issued_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ftest_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `Reports_LabTestRequest` (`ftest_request_id`),
  KEY `Reports_opd_patient` (`fpatient_id`),
  KEY `FK_76c4bmqem3b88a67j3kbncot3` (`fpatient_id`),
  KEY `FK_bj17ef1x6m8dfkde2njd6qnwr` (`ftest_request_id`),
  CONSTRAINT `FK_76c4bmqem3b88a67j3kbncot3` FOREIGN KEY (`fpatient_id`) REFERENCES `opd_patient` (`patient_id`),
  CONSTRAINT `FK_bj17ef1x6m8dfkde2njd6qnwr` FOREIGN KEY (`ftest_request_id`) REFERENCES `lab_labtestrequest` (`lab_test_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_reports`
--

LOCK TABLES `lab_reports` WRITE;
/*!40000 ALTER TABLE `lab_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_samplecenters`
--

DROP TABLE IF EXISTS `lab_samplecenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_samplecenters` (
  `sample_center_id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_center_name` varchar(30) NOT NULL,
  `fsample_center_type_id` int(11) DEFAULT NULL,
  `sample_center_incharge` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fsample_center_added_user_id` int(11) DEFAULT NULL,
  `fsample_center_last_updated_user_id` int(11) DEFAULT NULL,
  `sample_center_added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sample_center_last_updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contact_number_1` varchar(10) NOT NULL,
  `contact_number_2` varchar(10) NOT NULL,
  PRIMARY KEY (`sample_center_id`),
  KEY `SampleCenters_SampleCenterTypes` (`fsample_center_type_id`),
  KEY `SampleCenters_User1` (`fsample_center_added_user_id`),
  KEY `SampleCenters_User2` (`fsample_center_last_updated_user_id`),
  KEY `FK_2gc1focao7b1v5v0vp6o4nvuj` (`fsample_center_last_updated_user_id`),
  KEY `FK_3ioqah89ou71mbxn6yyw4xlel` (`fsample_center_added_user_id`),
  KEY `FK_su2envamg2ym9a0y4kenjgs03` (`fsample_center_type_id`),
  CONSTRAINT `FK_2gc1focao7b1v5v0vp6o4nvuj` FOREIGN KEY (`fsample_center_last_updated_user_id`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_3ioqah89ou71mbxn6yyw4xlel` FOREIGN KEY (`fsample_center_added_user_id`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_su2envamg2ym9a0y4kenjgs03` FOREIGN KEY (`fsample_center_type_id`) REFERENCES `lab_samplecentertypes` (`sample_center_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_samplecenters`
--

LOCK TABLES `lab_samplecenters` WRITE;
/*!40000 ALTER TABLE `lab_samplecenters` DISABLE KEYS */;
INSERT INTO `lab_samplecenters` VALUES (1,'Asiri-SampleCollectionCenter',1,'Nirmala','Malabe','asiriSample@asirilab.com',NULL,1,'2017-06-16 04:16:30','2017-06-16 04:16:30','011223456','011223457'),(2,'Asiri Central',2,'Nisal','Colombo','contactus@asiri.lk',NULL,1,'2017-06-16 04:31:48','2017-06-16 04:31:48','0110557898','-');
/*!40000 ALTER TABLE `lab_samplecenters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_samplecentertypes`
--

DROP TABLE IF EXISTS `lab_samplecentertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_samplecentertypes` (
  `sample_center_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_center_type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`sample_center_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_samplecentertypes`
--

LOCK TABLES `lab_samplecentertypes` WRITE;
/*!40000 ALTER TABLE `lab_samplecentertypes` DISABLE KEYS */;
INSERT INTO `lab_samplecentertypes` VALUES (1,'Regional'),(2,'Provincial');
/*!40000 ALTER TABLE `lab_samplecentertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_specimen`
--

DROP TABLE IF EXISTS `lab_specimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_specimen` (
  `specimen_id` int(11) NOT NULL AUTO_INCREMENT,
  `specimen_collected_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `specimen_received_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remarks` varchar(300) DEFAULT NULL,
  `specimen_delivered_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `specimen_stored_destroyed_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stored_location` varchar(40) DEFAULT NULL,
  `stored_or_destroyed` varchar(10) DEFAULT NULL,
  `fspecimen_collected_by` int(11) DEFAULT NULL,
  `fspecimen_receiveded_by` int(11) DEFAULT NULL,
  `fspecimen_delivered_by` int(11) DEFAULT NULL,
  `fretention_type_id` int(11) DEFAULT NULL,
  `fspecimen_type_id` int(11) DEFAULT NULL,
  `flabtest_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`specimen_id`),
  KEY `Specimen_User1` (`fspecimen_collected_by`),
  KEY `Specimen_User2` (`fspecimen_receiveded_by`),
  KEY `Specimen_User3` (`fspecimen_delivered_by`),
  KEY `Specimen_SpecimenRetentionType` (`fretention_type_id`),
  KEY `Specimen_SpecimenType` (`fspecimen_type_id`),
  KEY `LabTestRequest_Id` (`flabtest_request_id`),
  KEY `FK_an8s7nbv4gs2tj1da83fwh75a` (`fretention_type_id`),
  KEY `FK_4axqsyoxg18rns63dcsm3mapr` (`fspecimen_type_id`),
  KEY `FK_tb0v76gvew9ag146goqhw6w7w` (`fspecimen_receiveded_by`),
  KEY `FK_lvwi7vu1u9urk81ygutkkbr80` (`fspecimen_delivered_by`),
  KEY `FK_juno71a8fjat50feo7ybr3toi` (`fspecimen_collected_by`),
  KEY `FK_r41is9ua41hms0hty0na3tj8l` (`flabtest_request_id`),
  CONSTRAINT `FK_4axqsyoxg18rns63dcsm3mapr` FOREIGN KEY (`fspecimen_type_id`) REFERENCES `lab_specimentype` (`specimen_type_id`),
  CONSTRAINT `FK_an8s7nbv4gs2tj1da83fwh75a` FOREIGN KEY (`fretention_type_id`) REFERENCES `lab_specimenretentiontype` (`retention_type_id`),
  CONSTRAINT `FK_juno71a8fjat50feo7ybr3toi` FOREIGN KEY (`fspecimen_collected_by`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_lvwi7vu1u9urk81ygutkkbr80` FOREIGN KEY (`fspecimen_delivered_by`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_r41is9ua41hms0hty0na3tj8l` FOREIGN KEY (`flabtest_request_id`) REFERENCES `lab_labtestrequest` (`lab_test_request_id`),
  CONSTRAINT `FK_tb0v76gvew9ag146goqhw6w7w` FOREIGN KEY (`fspecimen_receiveded_by`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_specimen`
--

LOCK TABLES `lab_specimen` WRITE;
/*!40000 ALTER TABLE `lab_specimen` DISABLE KEYS */;
INSERT INTO `lab_specimen` VALUES (1,'2016-11-06 18:30:00','2016-11-06 18:30:00','sample','2016-11-06 18:30:00','2017-07-06 18:30:00','OPD','stored',1,2,3,1,1,1),(2,'2017-06-06 18:30:00','2017-06-06 18:30:00','aa','2017-06-06 18:30:00','2015-07-07 18:30:00','OPD','stored',1,2,3,1,1,2),(3,'2017-06-06 18:30:00','2017-06-06 18:30:00','aa','2017-06-06 18:30:00','2015-08-07 18:30:00','OPD','stored',1,2,3,1,1,1),(4,'2017-06-06 18:30:00','2017-06-06 18:30:00','gg','2017-06-06 18:30:00','2015-08-07 18:30:00','OPD','stored',1,2,3,1,1,2),(5,'2017-06-06 18:30:00','2017-06-06 18:30:00','ii','2017-06-06 18:30:00','2015-06-07 18:30:00','OPD','stored',1,2,3,1,1,3),(6,'2017-06-06 18:30:00','2017-06-06 18:30:00','test','2017-06-06 18:30:00','2015-08-07 18:30:00','OPD','stored',1,2,3,1,1,4),(7,'2017-06-06 18:30:00','2017-06-06 18:30:00','test','2017-06-06 18:30:00','2017-07-06 18:30:00','OPD','stored',1,2,3,1,1,5),(8,'2017-06-06 18:30:00','2017-06-06 18:30:00','aa','2017-06-06 18:30:00','2015-07-07 18:30:00','OPD','stored',1,2,3,1,1,6),(9,'2017-06-06 18:30:00','2017-06-06 18:30:00','Sample','2017-06-06 18:30:00','2015-08-07 18:30:00','OPD','stored',1,2,3,1,1,7),(10,'2017-02-07 18:30:00','2017-02-07 18:30:00','dd','2017-02-07 18:30:00','2015-03-08 18:30:00','OPD','stored',1,2,3,1,1,8),(11,'2016-05-06 18:30:00','2016-05-06 18:30:00','aa','2016-05-06 18:30:00','2018-05-06 18:30:00','opd','stored',1,2,3,1,1,17),(12,'2017-08-06 18:30:00','2017-08-06 18:30:00','qw4er3wq','2017-08-06 18:30:00','2018-01-06 18:30:00','opd','stored',1,2,3,1,1,16),(13,'2017-07-06 18:30:00','2017-07-06 18:30:00','aa','2017-07-06 18:30:00','2018-02-06 18:30:00','opd','stored',1,2,3,1,1,24),(14,'2018-02-06 18:30:00','2018-02-06 18:30:00','aaa','2018-02-06 18:30:00','2018-06-06 18:30:00','opd','stored',1,2,3,1,1,11),(15,'2018-02-06 18:30:00','2018-02-06 18:30:00','hh','2018-02-06 18:30:00','2018-06-06 18:30:00','opd','stored',1,2,3,1,1,25),(16,'2018-02-06 18:30:00','2018-02-06 18:30:00','ewr','2018-02-06 18:30:00','2016-04-07 18:30:00','ewr','stored',1,2,3,1,2,27),(17,'2018-04-06 18:30:00','2018-04-06 18:30:00','4ewq','2018-04-06 18:30:00','2016-05-07 18:30:00','213wqe','stored',1,2,3,1,1,9),(18,'2017-08-06 18:30:00','2017-08-06 18:30:00','wrwqr','2017-08-06 18:30:00','2016-04-07 18:30:00','qwr','stored',1,2,3,1,1,20),(19,'2017-06-06 18:30:00','2017-06-06 18:30:00','etrw','2017-06-06 18:30:00','2016-05-07 18:30:00','ewrew','stored',1,2,3,1,1,10),(20,'2018-01-06 18:30:00','2018-01-06 18:30:00','wr','2018-01-06 18:30:00','2016-06-07 18:30:00','wer','stored',1,2,3,2,1,12),(21,'2018-01-06 18:30:00','2018-01-06 18:30:00','fdsaf','2018-01-06 18:30:00','2016-04-07 18:30:00','dfs','destroyed',1,2,3,1,1,13),(22,'2018-01-06 18:30:00','2018-01-06 18:30:00','dg','2018-01-06 18:30:00','2016-04-07 18:30:00','gfd','stored',1,2,3,1,1,15),(23,'2019-04-05 18:30:00','2019-04-05 18:30:00','new','2019-04-05 18:30:00','2018-08-05 18:30:00','colombo 10','stored',1,2,3,3,3,31);
/*!40000 ALTER TABLE `lab_specimen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_specimenretentiontype`
--

DROP TABLE IF EXISTS `lab_specimenretentiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_specimenretentiontype` (
  `retention_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `retention_type_name` varchar(40) DEFAULT NULL,
  `duration` varchar(30) DEFAULT NULL,
  `fcategory_id` int(11) DEFAULT NULL,
  `fsub_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`retention_type_id`),
  UNIQUE KEY `retention_type_name` (`retention_type_name`),
  KEY `SpecimenRetentionType_TestCategory` (`fcategory_id`),
  KEY `SpecimenRetentionType_TestSubCategory` (`fsub_category_id`),
  KEY `FK_llchkvmg1lxags8eca9mmyhaa` (`fcategory_id`),
  KEY `FK_f1sjijovthrpy9mxbb1w2f6k7` (`fsub_category_id`),
  CONSTRAINT `FK_f1sjijovthrpy9mxbb1w2f6k7` FOREIGN KEY (`fsub_category_id`) REFERENCES `lab_testsubcategory` (`sub_category_id`),
  CONSTRAINT `FK_llchkvmg1lxags8eca9mmyhaa` FOREIGN KEY (`fcategory_id`) REFERENCES `lab_testcategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_specimenretentiontype`
--

LOCK TABLES `lab_specimenretentiontype` WRITE;
/*!40000 ALTER TABLE `lab_specimenretentiontype` DISABLE KEYS */;
INSERT INTO `lab_specimenretentiontype` VALUES (1,'Blood Fluids','3 days',1,1),(2,'wre','43',2,2),(3,'test Retention Type','1',3,3);
/*!40000 ALTER TABLE `lab_specimenretentiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_specimentype`
--

DROP TABLE IF EXISTS `lab_specimentype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_specimentype` (
  `specimen_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `specimen_type_name` varchar(100) DEFAULT NULL,
  `fcategory_id` int(11) DEFAULT NULL,
  `fsub_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`specimen_type_id`),
  UNIQUE KEY `specimen_type_name` (`specimen_type_name`),
  KEY `SpecimenType_TestCategory` (`fcategory_id`),
  KEY `SpecimenType_TestSubCategory` (`fsub_category_id`),
  KEY `FK_nhbkl09l26i36eyhlsd4gjrlv` (`fcategory_id`),
  KEY `FK_4s5eo9la41a158v95i0cm0xs0` (`fsub_category_id`),
  CONSTRAINT `FK_4s5eo9la41a158v95i0cm0xs0` FOREIGN KEY (`fsub_category_id`) REFERENCES `lab_testsubcategory` (`sub_category_id`),
  CONSTRAINT `FK_nhbkl09l26i36eyhlsd4gjrlv` FOREIGN KEY (`fcategory_id`) REFERENCES `lab_testcategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_specimentype`
--

LOCK TABLES `lab_specimentype` WRITE;
/*!40000 ALTER TABLE `lab_specimentype` DISABLE KEYS */;
INSERT INTO `lab_specimentype` VALUES (1,'Blood Smear',1,1),(2,'wer',2,2),(3,'test Specimen Type',3,3);
/*!40000 ALTER TABLE `lab_specimentype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_subfieldresults`
--

DROP TABLE IF EXISTS `lab_subfieldresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_subfieldresults` (
  `sub_field_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_field_result` varchar(255) DEFAULT NULL,
  `fmresult_id` int(11) DEFAULT NULL,
  `fparentf_id` int(11) DEFAULT NULL,
  `fsubf_id` int(11) DEFAULT NULL,
  `result_finalized_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_field_result_id`),
  KEY `SubFieldResults_MainResults` (`fmresult_id`),
  KEY `SubFieldResults_ParentTestFields` (`fparentf_id`),
  KEY `SubFieldResults_SubTestFields` (`fsubf_id`),
  KEY `FK_ar31mq5y11716ljqcvgedxr0y` (`fmresult_id`),
  KEY `FK_nuuu3ymecu0j3d4ma2fpxi0d7` (`fsubf_id`),
  KEY `FK_tn9659iw120dbddbfjwn27tut` (`fparentf_id`),
  CONSTRAINT `FK_ar31mq5y11716ljqcvgedxr0y` FOREIGN KEY (`fmresult_id`) REFERENCES `lab_mainresults` (`result_id`),
  CONSTRAINT `FK_nuuu3ymecu0j3d4ma2fpxi0d7` FOREIGN KEY (`fsubf_id`) REFERENCES `lab_subtestfields` (`sub_test_field_id`),
  CONSTRAINT `FK_tn9659iw120dbddbfjwn27tut` FOREIGN KEY (`fparentf_id`) REFERENCES `lab_parenttestfields` (`parent_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_subfieldresults`
--

LOCK TABLES `lab_subfieldresults` WRITE;
/*!40000 ALTER TABLE `lab_subfieldresults` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_subfieldresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_subtestfields`
--

DROP TABLE IF EXISTS `lab_subtestfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_subtestfields` (
  `sub_test_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_field_id_name` varchar(5) NOT NULL,
  `sub_test_field_name` varchar(80) NOT NULL,
  `fpar_test_field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sub_test_field_id`),
  UNIQUE KEY `sub_test_field_name` (`sub_test_field_name`),
  KEY `SubTestFields_ParentTestFields` (`fpar_test_field_id`),
  KEY `FK_h7wu10s87xxduuv0mbdgd5r4t` (`fpar_test_field_id`),
  CONSTRAINT `FK_h7wu10s87xxduuv0mbdgd5r4t` FOREIGN KEY (`fpar_test_field_id`) REFERENCES `lab_parenttestfields` (`parent_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_subtestfields`
--

LOCK TABLES `lab_subtestfields` WRITE;
/*!40000 ALTER TABLE `lab_subtestfields` DISABLE KEYS */;
INSERT INTO `lab_subtestfields` VALUES (1,'SF','wer',1),(2,'SF','blood_sub1',32),(3,'SF','sub2',32),(4,'SF','s1',42),(5,'SF','s2',42),(6,'SF','ewtewt',1),(7,'SF','2ewr',44),(8,'SF','subtest field 1',46);
/*!40000 ALTER TABLE `lab_subtestfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_testcategory`
--

DROP TABLE IF EXISTS `lab_testcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_testcategory` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id_name` varchar(5) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_testcategory`
--

LOCK TABLES `lab_testcategory` WRITE;
/*!40000 ALTER TABLE `lab_testcategory` DISABLE KEYS */;
INSERT INTO `lab_testcategory` VALUES (1,'TC','Biochemistry'),(2,'TC','dddd'),(3,'TC','Virology');
/*!40000 ALTER TABLE `lab_testcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_testfieldsrange`
--

DROP TABLE IF EXISTS `lab_testfieldsrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_testfieldsrange` (
  `range_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(10) NOT NULL,
  `minage` int(11) NOT NULL,
  `unit` varchar(15) DEFAULT NULL,
  `min_val` double NOT NULL,
  `max_val` double NOT NULL,
  `max_age` int(11) DEFAULT NULL,
  `fparent_field_id` int(11) DEFAULT NULL,
  `fsub_field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`range_id`),
  KEY `TestFieldsRange_ParentTestFields` (`fparent_field_id`),
  KEY `TestFieldsRange_SubTestFields` (`fsub_field_id`),
  KEY `FK_m8nc3xlba7wkrtttgepvq2xgu` (`fparent_field_id`),
  CONSTRAINT `FK_m8nc3xlba7wkrtttgepvq2xgu` FOREIGN KEY (`fparent_field_id`) REFERENCES `lab_parenttestfields` (`parent_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_testfieldsrange`
--

LOCK TABLES `lab_testfieldsrange` WRITE;
/*!40000 ALTER TABLE `lab_testfieldsrange` DISABLE KEYS */;
INSERT INTO `lab_testfieldsrange` VALUES (1,'Male',25,'10^3u/l',3.5,6,45,1,NULL),(2,'Male',25,'10^3u/l',11,18,45,2,NULL),(3,'Male',25,'10^3u/l',35,55,45,3,NULL),(4,'Male',25,'10^3u/l',80,100,45,4,NULL),(5,'Male',25,'10^3u/l',25,33,45,5,NULL),(6,'Male',25,'10^3u/l',30,38,45,6,NULL),(7,'Male',25,'10^3u/l',150,450,45,7,NULL),(8,'Male',25,'10^3u/l',4,11,45,8,NULL),(9,'Male',25,'%',40,60,45,9,NULL),(10,'Male',35,'%',20,40,65,10,NULL),(11,'Male',35,'%',2,8,65,11,NULL),(12,'Male',35,'%',1,4,65,12,NULL),(13,'Male',35,'%',0.5,1,65,13,NULL),(14,'Female',35,'mg/dl',3.5,6,65,1,NULL),(15,'Female',20,'10^3u/l',11,18,50,2,NULL),(16,'Female',30,'10^3u/l',35,55,55,3,NULL),(17,'Female',25,'10^3u/l',80,100,55,4,NULL),(18,'Female',20,'10^3u/l',25,33,55,5,NULL),(19,'Female',30,'10^3u/l',30,38,50,6,NULL),(20,'Female',20,'10^3u/l',150,450,55,7,NULL),(21,'Female',30,'10^3u/l',4,11,50,8,NULL),(22,'Female',25,'%',40,60,55,9,NULL),(23,'Female',24,'%',20,40,56,10,NULL),(24,'Female',22,'%',2,8,60,11,NULL),(25,'Female',30,'%',1,4,50,12,NULL),(26,'Female',30,'%',0.5,1,45,13,NULL),(27,'Male',30,'mmol/L',135,148,45,14,NULL),(28,'Male',30,'mmol/L',3.5,5.3,55,15,NULL),(29,'Female',20,'mmol/L',135,148,50,14,NULL),(30,'Female',30,'mmol/L',3.5,5.3,55,15,NULL),(31,'Male',30,'mg/dl',70,115,55,31,NULL),(32,'Female',30,'mg/dl',70,115,55,10,NULL),(33,'Male',20,'mg/dl',200,240,45,16,NULL),(34,'Male',20,'mg/dl',35,55,50,17,NULL),(35,'Male',20,'mg/dl',150,190,45,18,NULL),(36,'Male',20,'mg/dl',40,160,50,19,NULL),(37,'Male',20,'mg/dl',2,6,45,20,NULL),(38,'Male',4,'1',4,7,20,32,1),(39,'Male',10,'ml',2,5,40,42,4),(40,'Female',4321,'13',13221,123,4321,1,6),(41,'Female',4321,'13',13221,123,4321,1,6),(42,'Female',4321,'13',13221,123,4321,1,6),(43,'Female',24,'324',324,324,234,44,7),(44,'Female',24,'324',324,324,234,44,7),(45,'Male',30,'%',0.5,34,55,10,NULL),(46,'Female',25,'%',0.5,65,45,11,NULL),(47,'Male',30,'%',0.5,34,55,10,NULL),(48,'Female',25,'%',0.5,65,45,11,NULL),(49,'Male',30,'%',0.5,34,55,10,NULL),(50,'Female',25,'%',0.5,65,45,11,NULL),(51,'Male',30,'%',0.5,34,55,10,NULL),(52,'Female',25,'%',0.5,65,45,11,NULL),(53,'Male',30,'%',0.5,34,55,10,NULL),(54,'Female',25,'%',0.5,65,45,11,NULL),(55,'Male',30,'%',0.5,34,55,10,NULL),(56,'Female',25,'%',0.5,65,45,11,NULL),(57,'Male',30,'%',0.5,34,55,10,NULL),(58,'Female',25,'%',0.5,65,45,11,NULL),(59,'Male',30,'%',0.5,34,55,10,NULL),(60,'Female',25,'%',0.5,65,45,11,NULL),(61,'Male',30,'%',0.5,34,55,10,NULL),(62,'Female',25,'%',0.5,65,45,11,NULL),(63,'Male',30,'%',0.5,34,55,10,NULL),(64,'Female',25,'%',0.5,65,45,11,NULL),(65,'Male',30,'%',0.5,34,55,10,NULL),(66,'Female',25,'%',0.5,65,45,11,NULL),(67,'Male',30,'%',0.5,34,55,10,NULL),(68,'Female',25,'%',0.5,65,45,11,NULL),(69,'Male',30,'%',0.5,34,55,10,NULL),(70,'Female',25,'%',0.5,65,45,11,NULL),(71,'Male',30,'%',0.5,34,55,10,NULL),(72,'Female',25,'%',0.5,65,45,11,NULL),(73,'Male',30,'%',0.5,34,55,10,NULL),(74,'Female',25,'%',0.5,65,45,11,NULL),(75,'Male',30,'%',0.5,34,55,10,NULL),(76,'Female',25,'%',0.5,65,45,11,20),(77,'Male',4,'ml',100,250,10,46,1),(78,'Male',4,'ml',100,250,10,46,8);
/*!40000 ALTER TABLE `lab_testfieldsrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_testnames`
--

DROP TABLE IF EXISTS `lab_testnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_testnames` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id_name` varchar(5) NOT NULL,
  `test_name` varchar(30) NOT NULL,
  `test_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test_last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ftest_category_id` int(11) DEFAULT NULL,
  `ftest_sub_category_id` int(11) DEFAULT NULL,
  `ftest_create_user_id` int(11) DEFAULT NULL,
  `ftest_last_update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_id`),
  UNIQUE KEY `test_name` (`test_name`),
  KEY `TestNames_TestCategory` (`ftest_category_id`),
  KEY `TestNames_TestSubCategory` (`ftest_sub_category_id`),
  KEY `TestNames_User1` (`ftest_create_user_id`),
  KEY `TestNames_User2` (`ftest_last_update_user_id`),
  KEY `FK_e5soo3lejnthx0y99budt9t4l` (`ftest_sub_category_id`),
  KEY `FK_qafuaf33xvyvf7u18mkf0ucay` (`ftest_last_update_user_id`),
  KEY `FK_flyyfs4oswbfhktkt61ru2x8d` (`ftest_category_id`),
  KEY `FK_ekc80kug21k1urfg7jydiyjbd` (`ftest_create_user_id`),
  CONSTRAINT `FK_e5soo3lejnthx0y99budt9t4l` FOREIGN KEY (`ftest_sub_category_id`) REFERENCES `lab_testsubcategory` (`sub_category_id`),
  CONSTRAINT `FK_ekc80kug21k1urfg7jydiyjbd` FOREIGN KEY (`ftest_create_user_id`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_flyyfs4oswbfhktkt61ru2x8d` FOREIGN KEY (`ftest_category_id`) REFERENCES `lab_testcategory` (`category_id`),
  CONSTRAINT `FK_qafuaf33xvyvf7u18mkf0ucay` FOREIGN KEY (`ftest_last_update_user_id`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_testnames`
--

LOCK TABLES `lab_testnames` WRITE;
/*!40000 ALTER TABLE `lab_testnames` DISABLE KEYS */;
INSERT INTO `lab_testnames` VALUES (1,'TN','sam','2016-11-18 07:54:36','2016-11-18 07:54:36',1,1,NULL,1),(2,'TN','Fasting Blood Sugar','2015-07-27 08:46:00','2015-07-25 12:46:31',1,1,1,1),(3,'TN','Random Blood Sugar','2015-07-27 08:45:50','2015-07-25 12:51:10',1,1,1,1),(4,'TN','PPBS','2015-07-27 08:45:42','2015-07-25 12:51:10',1,1,1,1),(5,'TN','Blood Sugs','2016-07-22 09:26:51','2016-07-22 09:26:51',1,1,NULL,1),(6,'TN','Reticulocyte Count','2015-07-27 08:45:28','2015-07-25 12:52:56',1,1,1,1),(7,'TN','PT - INR','2015-07-27 08:50:45','2015-07-25 12:54:19',1,1,1,1),(8,'TN','CSF Full Report','2015-07-27 08:45:11','2015-07-25 12:54:19',1,1,1,1),(9,'TN','Aspiration Fluid Full Report','2015-07-27 08:44:52','2015-07-25 12:55:40',1,1,1,1),(10,'TN','Serum Electrolytes','2015-07-27 08:44:56','2015-07-25 14:16:59',1,1,1,1),(11,'TN','SGOT - SGPT','2015-07-27 08:50:33','2015-07-25 12:57:10',1,1,1,1),(12,'TN','Serum Bilirubin','2015-07-27 08:45:05','2015-07-25 12:57:10',1,1,1,1),(13,'TN','Dengue IgG - IgM Ab','2015-07-27 08:52:18','2015-07-25 14:52:52',1,1,1,1),(14,'TN','Urine Full Report','2015-07-27 08:44:32','2015-07-25 14:52:23',1,1,1,1),(15,'TN','Urine Sugar','2015-07-27 08:44:28','2015-07-25 12:59:26',1,1,1,1),(16,'TN','Urine Bile','2015-07-27 08:44:16','2015-07-25 12:59:26',1,1,1,1),(17,'TN','Urine Ketone Bodies','2015-07-27 08:44:09','2015-07-25 13:01:27',1,1,1,1),(18,'TN','Urine Bence','2015-07-27 08:47:35','2015-07-25 13:01:27',1,1,1,1),(19,'TN','Urine Albumin','2015-07-27 08:43:55','2015-07-25 13:02:43',1,1,1,1),(20,'TN','Stool Full Report','2015-07-27 08:43:49','2015-07-25 13:02:43',1,1,1,1),(21,'TN','Stool Occult Blood','2015-07-27 08:43:40','2015-07-25 13:03:45',1,1,1,1),(22,'TN','Blood Urea','2015-07-27 08:43:34','2015-07-25 13:03:45',1,1,1,1),(23,'TN','Serum Creatinine','2015-07-27 08:43:25','2015-07-25 13:04:50',1,1,1,1),(24,'TN','ESR','2015-07-27 08:43:18','2015-07-25 13:04:50',1,1,1,1),(25,'TN','Anti Streptolysin O Titre','2015-07-27 08:43:11','2015-07-25 14:46:00',1,1,1,1),(26,'TN','Blood For Malarial Parasite','2015-07-27 08:43:03','2015-07-25 14:25:43',1,1,1,1),(27,'TN','Serum Cholesterol ','2015-07-27 08:42:55','2015-07-25 14:28:45',1,1,1,1),(28,'TN','CRP','2015-07-27 08:53:23','2015-07-25 14:45:30',1,1,1,1),(29,'TN','Human Chorionic Gonadotrophin ','2015-07-27 08:42:43','2015-07-25 14:38:18',1,1,1,1),(30,'TN','Lipid Profile','2015-07-27 08:42:37','2015-07-25 14:38:21',1,1,1,1),(31,'TN','WBC - DC','2015-07-27 08:51:50','2015-07-25 14:54:25',1,1,1,1),(32,'TN','blood_test','2016-01-26 05:48:17','2016-01-26 05:48:17',1,1,1,1),(33,'TN','newTest','2016-01-26 05:55:23','2016-01-26 05:55:23',1,1,1,1),(34,'TN','NEW','2016-01-26 05:56:38','2016-01-26 05:56:38',1,1,1,1),(35,'TN','new_test1','2016-01-26 06:01:10','2016-01-26 06:01:10',1,1,1,1),(36,'TN','t1','2016-01-26 06:02:28','2016-01-26 06:02:28',1,1,1,1),(37,'TN','qqqqqqq','2016-01-26 06:05:37','2016-01-26 06:05:37',1,1,1,1),(39,'TN','aaa','2016-01-26 06:09:46','2016-01-26 06:09:46',1,1,1,1),(40,'TN','labTest1','2016-01-26 06:29:10','2016-01-26 06:29:10',1,1,1,1),(41,'TN','test1_new','2016-07-22 09:06:27','2016-07-22 09:06:27',1,1,1,1),(42,'TN','rwqa','2016-07-22 09:22:38','2016-07-22 09:22:38',1,1,1,1),(43,'TN','rrrrrrrrrrrrrrrrrrrrrr','2016-07-27 05:23:16','2016-07-27 05:23:16',1,NULL,1,1),(44,'TN','ppp','2016-07-27 05:23:39','2016-07-27 05:23:39',1,NULL,1,1),(45,'TN','test sample 1','2017-06-16 04:36:12','2017-06-16 04:36:12',3,3,1,1);
/*!40000 ALTER TABLE `lab_testnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_testsubcategory`
--

DROP TABLE IF EXISTS `lab_testsubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_testsubcategory` (
  `sub_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_id_name` varchar(5) NOT NULL,
  `sub_category_name` varchar(30) DEFAULT NULL,
  `fcategory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sub_category_id`),
  UNIQUE KEY `sub_category_name` (`sub_category_name`),
  KEY `TestSubCategory_TestCategory` (`fcategory_id`),
  KEY `FK_jtmrvby6wqcxafkpokn4vmk0n` (`fcategory_id`),
  CONSTRAINT `FK_jtmrvby6wqcxafkpokn4vmk0n` FOREIGN KEY (`fcategory_id`) REFERENCES `lab_testcategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_testsubcategory`
--

LOCK TABLES `lab_testsubcategory` WRITE;
/*!40000 ALTER TABLE `lab_testsubcategory` DISABLE KEYS */;
INSERT INTO `lab_testsubcategory` VALUES (1,'SC','Biochemistry_sub',1),(2,'SC','sub1',2),(3,'SC','VirologyTest',3);
/*!40000 ALTER TABLE `lab_testsubcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_types`
--

DROP TABLE IF EXISTS `lab_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_types` (
  `lab_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_type_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`lab_type_id`),
  UNIQUE KEY `lab_type_name` (`lab_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_types`
--

LOCK TABLES `lab_types` WRITE;
/*!40000 ALTER TABLE `lab_types` DISABLE KEYS */;
INSERT INTO `lab_types` VALUES (2,'External'),(1,'Internal'),(3,'Test');
/*!40000 ALTER TABLE `lab_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveallergies`
--

DROP TABLE IF EXISTS `liveallergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveallergies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allergyname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveallergies`
--

LOCK TABLES `liveallergies` WRITE;
/*!40000 ALTER TABLE `liveallergies` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveallergies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveinjury`
--

DROP TABLE IF EXISTS `liveinjury`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveinjury` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `injuryname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveinjury`
--

LOCK TABLES `liveinjury` WRITE;
/*!40000 ALTER TABLE `liveinjury` DISABLE KEYS */;
/*!40000 ALTER TABLE `liveinjury` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_injection`
--

DROP TABLE IF EXISTS `opd_injection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_injection` (
  `opd_injection_id` int(11) NOT NULL AUTO_INCREMENT,
  `VISITID` int(11) NOT NULL,
  `injection_id` int(11) NOT NULL,
  `order_by_id` int(11) DEFAULT NULL,
  `complete_by_id` int(11) DEFAULT NULL,
  `status` varchar(11) NOT NULL,
  `episode_type` varchar(11) NOT NULL,
  `complete_date` datetime DEFAULT NULL,
  `Remarks` varchar(100) NOT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(200) DEFAULT NULL,
  `LastUpDate` datetime DEFAULT NULL,
  `LastUpDateUser` varchar(200) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`opd_injection_id`),
  KEY `FK_14n0t1mnue3x79q6rbgqsphge` (`VISITID`),
  KEY `FK_owifjeyioq8qplc4f7sy2rbnu` (`injection_id`),
  CONSTRAINT `FK_14n0t1mnue3x79q6rbgqsphge` FOREIGN KEY (`VISITID`) REFERENCES `opd_patient_visit` (`visit_id`),
  CONSTRAINT `FK_owifjeyioq8qplc4f7sy2rbnu` FOREIGN KEY (`injection_id`) REFERENCES `injection` (`injection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_injection`
--

LOCK TABLES `opd_injection` WRITE;
/*!40000 ALTER TABLE `opd_injection` DISABLE KEYS */;
INSERT INTO `opd_injection` VALUES (1,153,1,1,3,'done','OPD','2017-06-07 11:37:24','Nurse','2017-06-07 11:18:03','1','2017-06-07 11:37:24','3',1),(2,153,1,1,3,'done','OPD','2017-06-07 11:42:03','nurse2','2017-06-07 11:37:48','1','2017-06-07 11:42:03','3',1);
/*!40000 ALTER TABLE `opd_injection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient`
--

DROP TABLE IF EXISTS `opd_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_title` varchar(5) NOT NULL,
  `patient_fullname` varchar(100) NOT NULL,
  `patient_personal_username` varchar(50) NOT NULL,
  `patient_NIC` varchar(10) NOT NULL,
  `patient_passport` varchar(10) NOT NULL,
  `patient_HIN` varchar(20) NOT NULL,
  `patient_photo` varchar(100) NOT NULL,
  `patient_DOB` date NOT NULL,
  `patient_telephone` varchar(40) NOT NULL,
  `patient_gender` varchar(10) NOT NULL,
  `patient_civil_status` varchar(20) NOT NULL,
  `patient_preferred_language` varchar(10) NOT NULL,
  `patient_citizenship` varchar(20) NOT NULL,
  `patient_blood` text NOT NULL,
  `patient_address` varchar(500) NOT NULL,
  `patient_contact_p_name` varchar(50) NOT NULL,
  `patient_contact_p_no` varchar(20) NOT NULL,
  `patient_remarks` varchar(500) NOT NULL,
  `patient_create_date` datetime NOT NULL,
  `patient_create_user` int(11) NOT NULL,
  `patient_lastupdate_date` datetime NOT NULL,
  `patient_lastupdate_user` int(11) NOT NULL,
  `patient_active` int(11) NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `patient_create_user` (`patient_create_user`),
  KEY `patient_lastupdate_user` (`patient_lastupdate_user`),
  KEY `patient_create_user_2` (`patient_create_user`),
  KEY `FK_1h0whrsmqauj9odhwgekhug20` (`patient_create_user`),
  KEY `FK_59b635j6pdqfsrn7qlplhpv4s` (`patient_lastupdate_user`),
  CONSTRAINT `FK_1h0whrsmqauj9odhwgekhug20` FOREIGN KEY (`patient_create_user`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_59b635j6pdqfsrn7qlplhpv4s` FOREIGN KEY (`patient_lastupdate_user`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient`
--

LOCK TABLES `opd_patient` WRITE;
/*!40000 ALTER TABLE `opd_patient` DISABLE KEYS */;
INSERT INTO `opd_patient` VALUES (1,'Mr','Kasun Gunathilaka','Kasun','98765433V','98978996N','12340000012','','2014-08-19','2143241341','Male','Single','Sinhala','sri lankan','A','Nugegoda','','','','2014-08-26 10:45:34',5,'2014-08-26 05:10:24',5,1),(2,'Mr.','Ishara Gunathilaka','Ishara','987654322V','','null','','2014-08-19','2143241341','Male','Single','Sinhala',' sri lankan','A+','Nugegoda',' ',' ','','2014-08-26 10:45:34',3,'2015-09-08 14:17:41',3,1),(3,'Dr','Iresh Perera','Fernando','6734864237','4143413414','12340000038','','2014-08-06','345325352','Male','Married','English','sri lankan','','Nugegoda','Iresh','907878798','','2014-08-26 08:23:03',3,'2014-08-26 08:23:03',3,0),(4,'Mr.','Brian Walter','Brian','839133344v','','null','','1989-09-27','0728986544','Male','Single','Tamil','  Sri Lanka','A+','White house,Papiliyana,Nugegoda',' Brian Walter','  071992755','None','2013-08-31 15:35:03',2,'2015-09-08 14:31:17',3,1),(5,'Mr.','Imanka Kodikara','Imee','839133345v','','12340000053','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Imanka',' 071992755','None','2013-08-31 16:21:40',2,'2013-08-31 16:21:40',2,1),(6,'Mr.','Amal Silva','Amal','839133345v','','12340000061','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Amal',' 071992755','None','2013-08-31 16:42:10',2,'2013-08-31 16:42:10',2,1),(7,'Mr.','Saman Silva','Saman','839133345v','','12340000079','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Saman Silva',' 071992755','None','2013-08-31 16:47:48',2,'2013-08-31 16:47:48',2,1),(8,'Mr.','Kamal Silva','Brian','839133345v','','12340000087','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Kamal Silva',' 071992755','None','2013-08-31 16:50:36',2,'2013-08-31 16:50:36',2,1),(9,'Mr.','Akila Perera','Akila','839133345v','','12340000093','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Akila Perera',' 071992755','None','2013-09-01 11:37:32',1,'2013-09-01 11:37:32',1,1),(10,'Mr.','Thanuja Walter','Thanuja','839133345v','','12340000101','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Thanuja Walter',' 071992755','None','2013-11-14 14:14:49',2,'2013-11-14 14:14:49',2,1),(11,'Mr.','Thinuka Hasaranga','Thinuka','839133345v','','12340000119','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Thinuka',' 071992755','None','2013-11-14 14:15:31',2,'2013-11-14 14:15:31',2,1),(12,'Mr.','Nirmana Silva','Nirmana ','839133345v','','12340000127','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Nirmana Silva',' 071992755','None','2013-11-16 14:35:02',2,'2013-11-16 14:35:02',2,1),(13,'Mr.','Ann Jerom','Ann ','839133345v','','12340000135','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Ann',' 071992755','None','2013-11-16 14:36:19',2,'2013-11-16 14:36:19',2,1),(14,'Mr.','Kasun Jerom','Kasun','839133345v','','12340000142','','1989-09-27','0728986544','Male','Single','Tamil',' Sri Lanka','','White house,Papiliyana,Nugegoda','Kasun Jerom',' 071992755','None','2013-11-16 14:36:39',2,'2013-11-16 14:36:39',2,1),(15,'Mr.','Hareen Fernando','Hareen','902313958V','','12340000150','null','1990-12-01','','Male','Single','','     ','','Galle                                   ','     ','     ','','2014-05-30 11:25:41',2,'2014-08-27 12:53:42',2,1),(16,'Mr.','Surath Mendis','Surath','902313958V','','12340000163','null','1990-08-18','','Male','Single','',' ','','Galle',' ',' ','','2014-07-26 14:44:30',2,'2014-07-26 14:44:30',2,1),(17,'Mr.','Udara Deshan ','Udara','952384051V','','12340000172','null','1995-08-18','','Male','Single','',' ','','Homagama ',' ',' ','','2014-07-27 21:07:50',2,'2014-07-27 21:07:50',2,1),(18,'Mr.','Asiri Samarasekara','Asiri','902313858V','','12340000181','null','1990-07-18','','Male','Single','',' ','','Matara, Southern Province, Sri Lanka',' ',' ','','2014-07-28 10:01:32',2,'2014-07-28 10:01:32',2,1),(19,'Mr.','Jhon Fernando','Jhon','601050982V','N8761575','12340000192','null','1960-02-19','0112541667','Male','Married','Sinhala',' Sri Lanka','','Colombo, Western Province, Sri Lanka',' Jhon Fernando',' 011245322','Blind','2014-07-28 15:54:56',2,'2014-07-28 15:54:56',2,1),(20,'Mr.','Rusiru Kothalawala','Rusiru','877761765V','','12340000202','null','1987-10-02','','Male','Single','',' ','','Maharagama, Western Province, Sri Lanka',' ',' ','','2014-07-28 16:04:16',2,'2014-07-28 16:04:16',2,1),(21,'Mr.','Prabhavi Perera','Prabhavi ','912383958V','','12340000212','null','1991-03-07','','Female','Single','',' ','','Galle, Southern Province, Sri Lanka',' ',' ','','2014-08-02 11:13:18',2,'2014-08-02 11:13:18',2,1),(22,'Mr.','Sahan Harinda Nagodawithana','Sahan','902313858V','N3141478','12340000222','null','1990-08-18','0711892494','Male','Single','English',' Sri Lanka','','Milidduwa','Sahan',' 071856511','Good person ','2014-08-02 14:17:25',2,'2014-08-02 14:17:25',2,1),(23,'Mr.','Asiri Pathirana','Asiri','902313858V','','12340000232','null','1990-02-03','','Male','Single','',' ','','Matara, Southern Province, Sri Lanka',' ',' ','','2014-08-03 14:50:24',2,'2014-08-03 14:50:24',2,1),(24,'Mr.','Kasun Mendis','Kasun','902313958V','','12340000245','null','1990-08-18','','Male','Single','',' ','','Galle, Southern Province, Sri Lanka',' ',' ','','2014-08-03 17:21:37',2,'2014-08-03 17:21:37',2,1),(25,'Mr.','Kalpana Silva','Kalpana','903423948V','','12340000252','Koala.jpg','1990-02-03','','Male','Single','Sinhala',' ','','Galle, Southern Province, Sri Lanka',' ',' ','','2014-09-09 16:23:50',2,'2014-09-09 16:23:50',2,1),(26,'Mr.','Panditha De Silva','Panditha','892710325V','','12340000267','Koala.jpg','1989-02-23','','Male','Single','Sinhala',' ','','Malabe Post Office',' ',' ','','2014-09-09 16:27:56',2,'2014-09-09 16:27:56',2,1),(27,'Mr.','Saminda Perera','Saminda','902323958V','','12340000274','DSC_0246.jpg','1990-09-01','','Male','Single','Sinhala',' ','','Nawala',' ',' ','','2014-09-09 16:33:50',2,'2014-09-09 16:33:50',2,1),(28,'Miss.','Pravi Mendis','Pravi','908171799v','','12340000288','null','1990-01-01','','Female','Single','Sinhala',' ','','Kottawa, Pannipitiya, Western Province, Sri Lanka',' ',' ','','2014-09-20 16:34:09',2,'2014-09-20 16:34:09',2,1),(29,'Mr.','Wimarsha Madubashana','Wimarsha ','971252311v','','12340000295','1.jpg','1997-01-01','','Male','Single','Sinhala','  ','','Maharagama                   ','  ','  ','','2014-09-20 21:00:07',2,'2014-09-20 21:15:56',2,1),(30,'Miss.','Thilini Kanchana','Thilini','908171799v','','12340000300','null','1990-01-01','','Female','Single','Sinhala',' ','','Australia',' ',' ','','2014-09-22 20:07:16',2,'2014-09-22 20:07:16',2,1),(31,'Mr.','Thilina Jayasinghe','Thilina','908171799v','','12340000318','null','1990-01-01','','Female','Single','Sinhala',' ','','Argentina',' ',' ','','2014-09-22 20:08:09',2,'2014-09-22 20:08:09',2,1),(32,'Mr.','Asitha Meegama','Asitha','908171799v','','12340000327','null','1990-01-01','','Male','Single','Sinhala',' ','','Argentina',' ',' ','','2014-09-22 20:09:12',2,'2014-09-22 20:09:12',2,1),(33,'Miss.','Praveena Karunarathna','Praveena','908171799v','11','12340000332','15554-you-and-me.jpg','1990-01-01','0711946591','Female','Single','English',' sri lankan','','Kottawa, Pannipitiya, Western Province, Sri Lanka','Praveena','0711946591','Fever','2014-09-22 20:16:30',2,'2014-09-22 20:16:30',2,1),(34,'Mr.','Praveen Jayasinghe','Praveen','908171799v','11','12340000348','null','1990-01-01','','Female','Single','Sinhala',' ','','Pannipitiya',' ',' ','','2014-09-22 20:46:19',2,'2014-09-22 20:46:19',2,1),(35,'Miss.','Thiru Fernando','Thiru','908171799v','','12340000359','null','1990-11-12','','Female','Single','Sinhala','  ','','Kottawa                         ','  ','  ','','2014-09-24 22:40:35',2,'2014-09-24 22:50:12',2,1),(36,'Miss.','Nirupama De Silva','Nirupama','908171799v','','12340000365','null','1990-11-12','','Male','Single','Sinhala',' ','','Pannipitiya',' ',' ','','2014-09-25 09:18:54',2,'2014-09-25 09:18:54',2,1),(37,'Miss.','Indrani Perera ','Indrani','908171799v','','12340000371','null','1990-11-12','','Male','Single','Sinhala',' ','','Malabe, Western Province, Sri Lanka',' ',' ','','2014-09-25 09:32:58',2,'2014-09-25 09:32:58',2,1),(38,'Mr.','Nipuna Silva','Nipuna','902312345V','','12340000385','autosave.jpg','1990-12-12','','Male','Single','Sinhala',' ','','Kaduwela, Western Province, Sri Lanka',' ',' ','','2014-11-08 10:58:45',3,'2014-11-08 10:58:45',3,1),(39,'Mr.','Han Silva','Han','902569865V','','12340000399','null','1990-05-05','','Male','Single','Sinhala',' ','','Galle',' ',' ','','2014-11-11 16:23:04',3,'2014-11-11 16:23:04',3,1),(40,'Mr.','Sunil Perera','Sunil','601554872V','','12340000409','null','1960-12-12','0112457778','Male','Married','Sinhala','  Sri Lanka','','Homagama','Sunil',' 0772647777','Vomit and fever','2014-11-19 22:06:35',3,'2014-11-19 22:17:30',1,1),(41,'Miss.','Rukshani Senarathna','Rukshani','902313958V','','12340000418','proimage.jpg','1990-08-18','','Female','Single','Sinhala',' ','','Galle, Southern Province, Sri Lanka',' ',' ','','2014-11-20 14:23:25',3,'2014-11-20 14:23:25',3,1),(42,'Miss.','Ayanthi Dihara','Ayanthi','983576456v','','12340000425','null','1998-06-24','','Female','Single','Sinhala',' ','','Malabe',' ',' ','','2014-11-20 16:00:17',3,'2014-11-20 16:00:17',3,1),(43,'Mr.','Rasanga Hapuarachchi','Rasanga','902686542V','','12340000439','null','1990-11-25','','Male','Single','Sinhala',' ','','Malabe',' ',' ','','2015-02-02 16:06:39',3,'2015-02-02 16:06:39',3,1),(44,'Mr.','Koliya Pulasinghe','Koliya','600245315V','','12340000447','null','1960-04-05','','Male','Single','Sinhala',' ','','Horana, Western Province, Sri Lanka',' ',' ','','2015-02-06 12:22:42',3,'2015-02-06 12:22:42',3,1),(45,'Mrs.','Chameli Weerasena','Chameli ','910910255V','','12340000455','Koala.jpg','1991-05-01','0112729729','Female','Married','Sinhala',' ','','Malabe, Western Province, Sri Lanka','',' ','Fever','2015-02-07 14:05:28',3,'2015-02-07 14:05:28',3,1),(46,'Mr.','Luke Morphus','Luke','912356945V','','12340000463','Koala.jpg','1991-01-01','','Male','Single','Sinhala',' ','','Kegalle, Sabaragamuwa Province, Sri Lanka',' ',' ','','2015-02-11 18:38:35',3,'2015-02-11 18:38:35',3,1),(47,'Miss.','Anika Morpus','Anika','901254789V','','12340000471','null','1990-01-01','','Female','Single','Sinhala',' ','','Athurugiriya, Colombo, Western Province, Sri Lanka',' ',' ','','2015-06-25 13:41:23',3,'2015-06-25 13:41:23',3,1),(48,'Mr.','Hamesha De Silva','Hamesha','895647213V','','12340000489','null','1989-11-29','','Male','Single','Sinhala',' ','','West Bengal, India',' ',' ','','2015-06-26 16:45:53',3,'2015-06-26 16:45:53',3,1),(49,'Miss.','nimali','thanuja','898342344v','12345555','12340000491','abc.jpg','1989-11-29','0712345678','Female','Single','Sinhala','srilankan','A+','Colombo 03, Colombo, Western Province, Sri Lanka','dilshan','4325434324','daswsr','2015-07-23 14:49:33',3,'2015-07-23 14:49:33',3,1),(50,'Mr.','Rohan','Gamage','898342344v','12345555','12340000509','abc.jpg','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','A+','Colombo, Western Province, Sri Lanka','dilshan','4325434324','','2015-07-23 15:14:53',3,'2015-07-23 15:14:53',3,1),(51,'Mr.','sankalpaaa','udarangaa','898342344v','','null','abc.jpg','1989-11-29','0712345678','Male','Single','Sinhala','  srilankan','A+','Colombo, Western Province, Sri Lanka','  dilshan','  4325434324','wsd','2015-07-23 15:56:08',3,'2015-07-23 16:01:44',3,1),(52,'Mr.','thiru','fonseka','898342344v','12345555','12340000525','null','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','AB','Col TG Jayawardena Mawatha, Colombo, Western Province, Sri Lanka','dilshan','1231231231','','2015-07-23 16:40:27',3,'2015-07-23 16:40:27',3,1),(53,'Mr.','chanka','palliyaguru','898342344v','12345555','12340000533','null','1989-11-29','1231231321','Male','Single','Sinhala','srilankan','AB','Colombo, Western Province, Sri Lanka',' ',' ','','2015-07-23 16:41:26',3,'2015-07-23 16:41:26',3,1),(54,'Mr.','janitha','senevirathna','898342344v','12345555','12340000541','null','1989-11-29','1231231321','Male','Single','Sinhala','srilankan','AB','Colombo, Western Province, Sri Lanka',' ',' ','','2015-07-23 16:42:34',3,'2015-07-23 16:42:34',3,1),(55,'Mr.','sanath','desilva','898342344v','12345555','12340000558','null','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','A+','Colombo, Western Province, Sri Lanka','dilshan','4325434324','wedd','2015-07-24 09:25:43',3,'2015-07-24 09:25:43',3,1),(56,'Mr.','fedew','jayasena','898342344v','12345555','12340000566','null','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','A+','Colombo, Western Province, Sri Lanka','dilshan','1231231231','','2015-07-24 09:26:46',3,'2015-07-24 09:26:46',3,1),(57,'Mr.','sanath','Aththanayaka','898342344v','12345555','12340000574','null','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','A+','Colombo, Western Province, Sri Lanka','dilshan','4325434324','','2015-07-24 09:27:29',3,'2015-07-24 09:27:29',3,1),(58,'Mr.','fedew','jayasena','898342344v','1234','12340000582','abc.jpg','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','A+','Colombo, Western Province, Sri Lanka',' ',' ','','2015-07-24 09:31:10',3,'2015-07-24 09:31:10',3,1),(59,'Mr.','fedew','jayasena','898342344v','12345555','12340000590','abc.jpg','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','A+','Colombo, Western Province, Sri Lanka','dilshan','4325434324','','2015-07-24 09:39:07',3,'2015-07-24 09:39:07',3,1),(60,'Mr.','Mahesh','Gamage','909876543v','12345','12340000608','abc.jpg','1990-09-10','0712345678','Male','Single','Sinhala','srilankan','A+','Colombo, Western Province, Sri Lanka','dilshan','0987654321','','2015-07-24 09:48:17',3,'2015-07-24 09:48:17',3,1),(61,'Mr.','wimarshana','madubashana','909876543v','','null','michael-asmar.jpg','1990-09-10','0712345678','Male','Single','Sinhala',' srilankan','O+','Colombo, Western Province, Sri Lanka',' dilshan',' 0987654321','','2015-07-28 11:24:32',3,'2015-07-28 11:26:06',3,1),(62,'Mr.','Gayan','jayasena','898342344v','12345555','12340000624','michael-asmar.jpg','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','A+','Colombia',' ',' ','','2015-07-30 10:07:02',3,'2015-07-30 10:07:02',3,1),(63,'Mr.','Dinesh','Jayathilaka','901254789V','9018181818','12340000632','null','1990-01-01','','Male','Single','English',' Sri Lnakan','AB','Colombo, Western Province, Sri Lanka',' ',' ','','2015-07-30 11:15:02',3,'2015-07-30 11:15:02',3,1),(64,'Mr.','Dinesh','Nishan','901254789V','','null','photo.jpg.png','1990-01-01','0112700700','Male','Single','Sinhala','    Sri Lnakan','A+','Colombo, Western Province, Sri Lanka','    Jayasena','     0112800800','New patient ','2015-07-30 11:16:50',3,'2015-07-30 11:23:26',3,1),(65,'Miss.','hansi','desilva','901254789V','','12340000657','photo.jpg.png','1990-01-01','0112700700','Male','Single','Sinhala','Sri Lnakan','A+','Colombo, Western Province, Sri Lanka',' ',' ','','2015-07-30 13:20:54',3,'2015-07-30 13:20:54',3,1),(66,'Mr.','Dineshg','desilva','901254789V','','null','mbuntu-6.jpg','1991-01-01','0112700700','Male','Single','Sinhala',' Sri Lnakan','A+','Colombia',' Jayasena',' 0112800800','','2015-08-06 14:14:06',3,'2015-08-06 14:14:34',3,1),(67,'Miss.','sanath','jayasena','898342344v','','12340000673','Profile-Photo-Christos-Mastoras-21.png','1989-11-29','0712345678','Female','Married','Tamil','srilankan','A+','Poland','re','4325434324','hkj','2015-09-14 10:44:04',3,'2015-09-14 10:44:04',3,1),(68,'Mr.','sanath','Aththanayaka','898342344v','','12340000681','d9.png','1989-11-29','0712345678','Male','Single','Sinhala','srilankan','A+','Colombo 03, Colombo, Western Province, Sri Lanka',' ',' ','','2015-09-14 12:44:02',3,'2015-09-14 12:44:02',3,1),(69,'Mr.','Poorna','Poorna','123456789V','','12340000699','null','1991-11-13','0777123456','Male','Single','Sinhala',' Sri lankan','O-','123 Malabe',' ',' ','','2015-11-16 12:26:36',3,'2015-11-16 12:26:36',3,1),(70,'Mr.','Sankalpa Udaranga','','932631993v','','12340000707','null','1993-06-11','0777123654','Male','Married','Sinhala',' Sri Lankan','A+','Mathara',' ',' ','','2015-12-01 10:33:51',3,'2015-12-01 10:33:51',3,1),(74,'Ms','testUpdated','testUpdated','940110000V','98970000N','12340000749','null','0016-06-16','0114909474','Male','single','English','sri lankan','A+','Malabe2','testupdated','077555555','testRemarksUpdated','2017-03-13 14:03:21',1,'2017-03-13 14:03:24',1,1),(86,'Ms','testUpdated','testUpdated','940110000V','98970000N','12340000863','null','1994-06-16','0114909474','Male','single','English','sri lankan','A+','Malabe2','testupdated','077555555','testRemarksUpdated','2017-04-27 14:07:56',1,'2017-04-27 14:07:59',1,1),(87,'Mr.','rtyrtdrt','','911004452V','','12340000871','AT0051.png','2017-05-04','0117744111','Male','Single','Sinhala','s','A+','wsar','','','set','2017-05-09 16:31:42',3,'2017-05-09 16:31:42',3,1),(88,'Mr.','TestPatient','','940110726V','','12340000889','TestPatient_image.png','1994-01-11','0775570647','Male','Single','Sinhala','Sri Lankan','B-','Malabe, -, Western Province, Sri Lanka','','','','2017-05-12 09:43:05',3,'2017-06-16 09:23:34',1,1),(89,'Baby','test','','-','','12340000897','null','2017-04-05','0775570647','Male','false','Sinhala','Sri Lanka','A+','31/4, supreme Citys, Kaduwela, Kaduwela','Nisal','0112407887','','2017-06-01 11:59:05',3,'2017-06-01 13:59:07',3,1);
/*!40000 ALTER TABLE `opd_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_allergy`
--

DROP TABLE IF EXISTS `opd_patient_allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_allergy` (
  `allergy_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `allergy_name` varchar(500) NOT NULL,
  `allergy_status` varchar(500) NOT NULL,
  `allergy_remarks` varchar(500) NOT NULL,
  `allergy_create_date` datetime NOT NULL,
  `allergy_create_user` int(11) NOT NULL,
  `allergy_lastupdate_date` datetime NOT NULL,
  `allergy_lastupdate_user` int(11) NOT NULL,
  `allergy_active` int(11) NOT NULL,
  PRIMARY KEY (`allergy_id`),
  KEY `FK_OPD_Allergy_CreateUser` (`allergy_create_user`),
  KEY `FK_OPD_Allergy_Patient_ID` (`patient_id`),
  KEY `FK_OPD_Allergy_UpdateUser` (`allergy_lastupdate_user`),
  KEY `allergy_create_user` (`allergy_create_user`),
  KEY `allergy_lastupdate_user` (`allergy_lastupdate_user`),
  KEY `FK_nrp98sh75d60hqelh6q539kkt` (`patient_id`),
  KEY `FK_o9kkci9ddum9d0ap707f4bqpv` (`allergy_create_user`),
  KEY `FK_jqxsc3uebkl7dto9fv7hbcwi5` (`allergy_lastupdate_user`),
  CONSTRAINT `FK_jqxsc3uebkl7dto9fv7hbcwi5` FOREIGN KEY (`allergy_lastupdate_user`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_nrp98sh75d60hqelh6q539kkt` FOREIGN KEY (`patient_id`) REFERENCES `opd_patient` (`patient_id`),
  CONSTRAINT `FK_o9kkci9ddum9d0ap707f4bqpv` FOREIGN KEY (`allergy_create_user`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_allergy`
--

LOCK TABLES `opd_patient_allergy` WRITE;
/*!40000 ALTER TABLE `opd_patient_allergy` DISABLE KEYS */;
INSERT INTO `opd_patient_allergy` VALUES (1,1,'Peanut Allergy','Current','rwedg','2015-08-03 16:02:05',3,'2015-07-23 16:02:05',3,1),(2,60,'Peanut Allergy','Past','','2015-07-24 09:49:27',3,'2015-07-24 09:49:27',3,1),(3,61,'Peanut Allergy','Past','','2015-07-28 11:26:19',3,'2015-07-28 11:26:19',3,1),(4,62,'Peanut Allergy','Past','','2015-07-30 10:07:35',3,'2015-07-30 10:07:35',3,1),(5,64,'Headach','Past','first time','2015-07-30 11:17:33',3,'2015-07-30 11:17:33',3,1),(6,1,'peanut','Past','','2015-08-03 15:23:40',1,'2015-08-03 15:23:40',1,1),(7,1,'Headach','Current','ddadadadada','2015-08-03 15:42:18',1,'2015-08-03 15:42:18',1,1),(8,11,'Headach','Past','new','2015-08-04 09:29:26',1,'2015-08-04 09:29:26',1,1),(9,11,'peanut','Past','new','2015-08-04 09:29:39',1,'2015-08-04 09:29:39',1,1),(10,11,'Headach','Past','ABCD','2015-08-04 11:38:23',1,'2015-08-04 11:38:23',1,1),(11,11,'Sick','Past','first time','2015-08-04 16:25:43',1,'2015-08-04 16:25:43',1,1),(12,1,'Caugh','Past','3weeks','2015-08-05 09:00:51',1,'2015-08-05 09:00:51',1,1),(13,11,'Headach','Past','old one','2015-08-05 09:30:24',1,'2015-08-05 09:30:24',1,1),(14,11,'Kneey Ingery','Past','new one','2015-08-05 11:08:32',1,'2015-08-05 11:08:32',1,1),(15,11,'Caugh and Sick','Past','Little one','2015-08-05 11:11:20',1,'2015-08-05 11:11:20',1,1),(16,11,'peanut','Past','fdfdsdfsf','2015-08-05 11:40:47',1,'2015-08-05 11:40:47',1,1),(17,11,'Caughh','Past','','2015-08-05 12:14:56',1,'2015-08-05 12:14:56',1,1),(18,14,'Headach','Past','','2015-08-05 12:30:07',1,'2015-08-05 12:30:07',1,1),(19,14,'Caugh','Past','','2015-08-05 12:33:19',1,'2015-08-05 12:33:19',1,1),(20,10,'Caugh and Sick','Past','','2015-08-05 12:50:05',1,'2015-08-05 12:50:05',1,1),(21,54,'Headach','Past','','2015-08-05 16:38:45',1,'2015-08-05 16:38:45',1,1),(22,14,'peanut','Past','fdfdfdfd','2015-08-06 10:37:01',1,'2015-08-06 10:37:01',1,1),(23,11,'LOL','Past','fdfdgdgd','2015-08-06 11:19:19',3,'2015-08-06 11:19:19',3,1),(24,65,'Caugh and Sick','Past','klklkjl','2015-08-06 11:40:21',1,'2015-08-06 11:40:21',1,1),(25,66,'Headach','Past','','2015-08-06 14:14:44',3,'2015-08-06 14:14:44',3,1),(26,6,'peanut','Past','','2015-08-06 14:18:29',1,'2015-08-06 14:18:29',1,1),(27,8,'Headach','Past','dgf','2015-08-12 12:05:00',1,'2015-08-12 12:05:00',1,1),(28,2,'bingun','Current','dangerous','2015-09-05 14:41:07',3,'2015-09-05 14:41:07',3,1),(29,5,'Peanut Allergy','Past','pp','2015-09-14 09:57:41',1,'2015-09-14 09:57:41',1,1),(30,51,'pplp','Past','','2015-09-14 10:27:27',1,'2015-09-14 10:27:27',1,1),(31,68,'two Allergy','Past','','2015-09-14 12:44:20',3,'2015-09-14 12:44:20',3,1),(32,5,'aaa','Past','','2016-02-24 18:36:05',1,'2016-02-24 18:36:05',1,1),(33,88,'dust','Past','1 year back','2017-06-15 14:15:00',1,'2017-06-15 14:15:00',1,1);
/*!40000 ALTER TABLE `opd_patient_allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_attachment`
--

DROP TABLE IF EXISTS `opd_patient_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `attachment_type` varchar(500) NOT NULL,
  `attachment_attached_by` int(11) NOT NULL,
  `attachment_description` varchar(500) NOT NULL,
  `attachment_name` varchar(500) NOT NULL,
  `attachment_link` varchar(500) NOT NULL,
  `attachment_create_date` datetime NOT NULL,
  `attachment_create_user` int(11) NOT NULL,
  `attachment_last_update_date` datetime NOT NULL,
  `attachment_last_update_user` int(11) NOT NULL,
  `attachment_active` int(11) NOT NULL,
  `attachment_comment` varchar(500) NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `FK_OPD_Attached_by` (`attachment_attached_by`),
  KEY `FK_OPD_Attachment_createUser` (`attachment_create_user`),
  KEY `FK_OPD_Attachment_patient_ID` (`patient_id`),
  KEY `FK_OPD_Attachment_UpdateUser` (`attachment_last_update_user`),
  KEY `attachment_attached_by` (`attachment_attached_by`),
  KEY `FK_j3nboslroc52ic5eechatwjd` (`attachment_attached_by`),
  KEY `FK_2pgw7lffyf402at75s3gffyxk` (`attachment_create_user`),
  KEY `FK_e5e9loxhs04k6p6mdeem7dg3t` (`attachment_last_update_user`),
  KEY `FK_m3hjd4drktdmuxbaofa8fwfif` (`patient_id`),
  CONSTRAINT `FK_2pgw7lffyf402at75s3gffyxk` FOREIGN KEY (`attachment_create_user`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_e5e9loxhs04k6p6mdeem7dg3t` FOREIGN KEY (`attachment_last_update_user`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_j3nboslroc52ic5eechatwjd` FOREIGN KEY (`attachment_attached_by`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_m3hjd4drktdmuxbaofa8fwfif` FOREIGN KEY (`patient_id`) REFERENCES `opd_patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_attachment`
--

LOCK TABLES `opd_patient_attachment` WRITE;
/*!40000 ALTER TABLE `opd_patient_attachment` DISABLE KEYS */;
INSERT INTO `opd_patient_attachment` VALUES (1,60,'null',3,'note','Attachment','/opt/lampp/htdocs/SEP_Project/uploads/proposal1.pdf','2015-07-24 09:50:29',3,'2015-07-24 09:50:29',3,1,'null'),(2,61,'null',3,'','PDF','/opt/lampp/htdocs/SEP_Project/uploads/proposal2.pdf','2015-07-28 11:26:55',3,'2015-07-28 11:26:55',3,1,'null'),(3,62,'null',3,'','kkk','/opt/lampp/htdocs/SEP_Project/uploads/proposal4.pdf','2015-07-30 10:08:03',3,'2015-07-30 10:08:03',3,1,'null'),(4,10,'null',1,'','Attachment','/opt/lampp/htdocs/SEP_Project/uploads/proposal5.pdf','2015-07-30 11:10:00',1,'2015-07-30 11:10:00',1,1,'null'),(5,10,'null',1,'','Attachment','/opt/lampp/htdocs/SEP_Project/uploads/proposal6.pdf','2015-07-30 11:10:53',1,'2015-07-30 11:10:53',1,1,'null'),(6,10,'null',1,'llllllllllllllllllllllllllllll','g','/opt/lampp/htdocs/SEP_Project/uploads/background.jpg','2015-07-30 11:11:20',1,'2015-07-30 11:11:20',1,1,'null'),(7,64,'null',3,'sss','hk','/opt/lampp/htdocs/SEP_Project/uploads/photo.jpg.png','2015-07-30 11:23:16',3,'2015-07-30 11:23:16',3,1,'null'),(8,11,'null',1,'ssss','sss','/opt/lampp/htdocs/SEP_Project/uploads/Screenshot_from_2015-07-30_11:46:42.png','2015-08-04 10:43:27',1,'2015-08-04 10:43:27',1,1,'null'),(9,11,'null',1,'Today one','New Image','/opt/lampp/htdocs/SEP_Project/uploads/mbuntu-default.jpg','2015-08-05 09:20:10',1,'2015-08-05 09:20:10',1,1,'null'),(10,66,'null',3,'',' vcb','/opt/lampp/htdocs/SEP_Project/uploads/mbuntu-7.jpg','2015-08-06 14:15:00',3,'2015-08-06 14:15:00',3,1,'null'),(11,6,'null',1,'','hcvch','/opt/lampp/htdocs/SEP_Project/uploads/mbuntu-6.jpg','2015-08-06 14:18:53',1,'2015-08-06 14:18:53',1,1,'null'),(23,60,'opdnewfile',3,'opdnewnote','opdpatientfile','/opt/lampp/htdocs/SEP_Project/uploads/proposal5.pdf','2017-04-27 10:59:52',3,'2017-04-27 10:59:52',1,1,'good'),(24,60,'opdnewfile',3,'opdnewnote','opdpatientfile','/opt/lampp/htdocs/SEP_Project/uploads/proposal5.pdf','2017-04-27 11:06:52',3,'2017-04-27 11:06:52',1,1,'good'),(25,60,'opdnewfile',3,'opdnewnote','opdpatientfile','/opt/lampp/htdocs/SEP_Project/uploads/proposal5.pdf','2017-04-27 11:32:21',3,'2017-04-27 11:32:21',1,1,'good'),(26,60,'opdnewfile',3,'opdnewnote','opdpatientfile','/opt/lampp/htdocs/SEP_Project/uploads/proposal5.pdf','2017-04-27 14:08:01',3,'2017-04-27 14:08:01',1,1,'good'),(27,88,'null',1,'new','image','C:/xampp/htdocs/SEP_Project/uploads/forward_disabled.png','2017-06-16 14:36:39',1,'2017-06-16 14:36:39',1,1,'null');
/*!40000 ALTER TABLE `opd_patient_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_examination`
--

DROP TABLE IF EXISTS `opd_patient_examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_examination` (
  `examination_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `examination_date` datetime NOT NULL,
  `examination_weight` double NOT NULL,
  `examination_height` double NOT NULL,
  `examination_bmi` double NOT NULL,
  `examination_sysBP` double NOT NULL,
  `examination_diastBP` double NOT NULL,
  `examination_temprature` double NOT NULL,
  `examination_create_date` datetime NOT NULL,
  `examination_create_user` int(11) NOT NULL,
  `examination_lastupdate_date` datetime NOT NULL,
  `examination_lastupdate_user` int(11) NOT NULL,
  `examination_active` int(11) NOT NULL,
  PRIMARY KEY (`examination_id`),
  KEY `FK_OPD_Patient_Examination_VisitID` (`visit_id`),
  KEY `FK_650njfqoy8x7mxs1yj7wm499i` (`visit_id`),
  KEY `FK_ftsqmwhu2ngvdmp0ufntwfm7o` (`examination_create_user`),
  KEY `FK_irhqyrmcrgc70fu4y1nmfayvy` (`examination_lastupdate_user`),
  CONSTRAINT `FK_650njfqoy8x7mxs1yj7wm499i` FOREIGN KEY (`visit_id`) REFERENCES `opd_patient_visit` (`visit_id`),
  CONSTRAINT `FK_ftsqmwhu2ngvdmp0ufntwfm7o` FOREIGN KEY (`examination_create_user`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_irhqyrmcrgc70fu4y1nmfayvy` FOREIGN KEY (`examination_lastupdate_user`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_examination`
--

LOCK TABLES `opd_patient_examination` WRITE;
/*!40000 ALTER TABLE `opd_patient_examination` DISABLE KEYS */;
INSERT INTO `opd_patient_examination` VALUES (1,1,'2015-08-03 15:15:44',30,120,20.833333333333336,51,31,96.01,'2015-07-23 15:15:44',1,'2015-07-23 15:15:44',1,1),(2,5,'2015-07-23 15:57:07',20,130,11.834319526627217,50,32,96.01,'2015-07-23 15:57:07',1,'2015-07-23 15:57:07',1,1),(3,7,'2015-07-24 09:42:57',0.09,15.09,3.952428569734673,52,31,96.02,'2015-07-24 09:42:57',1,'2015-07-24 09:42:57',1,1),(4,9,'2015-07-24 09:54:11',52,180,16.049382716049383,53,34,96.02,'2015-07-24 09:54:11',1,'2015-07-24 09:54:11',1,1),(5,14,'2015-07-24 10:19:08',45,150,20,53,33,96.02,'2015-07-24 10:19:08',1,'2015-07-24 10:19:08',1,1),(6,16,'2015-07-27 09:07:10',50,160,19.531249999999996,53,33,96.04,'2015-07-27 09:07:10',1,'2015-07-27 09:07:10',1,1),(7,17,'2015-07-27 11:56:17',40,180,12.345679012345679,54,35,96.05,'2015-07-27 11:56:17',1,'2015-07-27 11:56:17',1,1),(8,19,'2015-07-28 11:30:18',50,140,25.510204081632658,53,32,96.02,'2015-07-28 11:30:18',1,'2015-07-28 11:30:18',1,1),(9,21,'2015-07-28 12:09:55',45,160,17.578124999999996,54,33,96.05,'2015-07-28 12:09:55',1,'2015-07-28 12:09:55',1,1),(10,27,'2015-07-30 10:21:29',50,180,15.432098765432098,52,32,96.02,'2015-07-30 10:21:29',1,'2015-07-30 10:21:29',1,1),(11,32,'2015-07-30 11:03:49',54,166,19.5964581216432,53,30,98,'2015-07-30 11:03:49',1,'2015-07-30 11:03:49',1,1),(12,36,'2015-07-30 14:02:51',50,180,15.432098765432098,53,32,96.03,'2015-07-30 14:02:51',1,'2015-07-30 14:02:51',1,1),(13,51,'2015-08-05 11:54:00',45,150,20,52,32,96.02,'2015-08-05 11:54:00',1,'2015-08-05 11:54:00',1,1),(14,67,'2015-08-06 14:16:10',50,180,15.432098765432098,52,32,96,'2015-08-06 14:16:10',1,'2015-08-06 14:16:10',1,1),(15,71,'2015-08-12 12:04:06',45,180,13.888888888888888,55,34,96.02,'2015-08-12 12:04:06',1,'2015-08-12 12:04:06',1,1),(16,80,'2015-09-18 13:26:55',0.05,15.02,2.21630812711325,51,31,96.02,'2015-09-18 13:26:55',1,'2015-09-18 13:26:55',1,1),(29,149,'2017-05-04 13:21:38',45,150,20,75,115,98,'2017-05-04 13:21:38',1,'2017-05-04 13:21:38',1,1),(30,152,'2017-05-24 11:39:00',45,120,31.25,120,80,98,'2017-05-24 11:39:00',1,'2017-05-24 11:39:00',1,1),(31,152,'2017-05-25 13:01:42',54,120,37.5,120,80,98.6,'2017-05-25 13:01:42',1,'2017-05-25 13:01:42',1,1),(32,152,'2017-05-25 13:07:19',54,120,37.5,120,80,98.6,'2017-05-25 13:07:19',1,'2017-05-25 13:07:19',1,1),(33,152,'2017-05-25 13:11:21',54,120,37.5,120,80,98.6,'2017-05-25 13:11:21',1,'2017-05-25 13:11:21',1,1);
/*!40000 ALTER TABLE `opd_patient_examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_history`
--

DROP TABLE IF EXISTS `opd_patient_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `history_category` varchar(500) NOT NULL,
  `history_record` varchar(500) NOT NULL,
  `history_create_date` datetime NOT NULL,
  `history_create_user` int(11) NOT NULL,
  `history_lastupdate_date` datetime NOT NULL,
  `history_lastupdate_user` int(11) NOT NULL,
  `history_active` int(11) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `FK_OPD_History_CreateUser` (`history_create_user`),
  KEY `FK_OPD_History_Patient_ID` (`patient_id`),
  KEY `FK_OPD_History_UpdateUser` (`history_lastupdate_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_history`
--

LOCK TABLES `opd_patient_history` WRITE;
/*!40000 ALTER TABLE `opd_patient_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `opd_patient_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_queue`
--

DROP TABLE IF EXISTS `opd_patient_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_queue` (
  `queue_token_no` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `queue_assign_time` datetime NOT NULL,
  `queue_assign_by` int(11) NOT NULL,
  `queue_assign_to` int(11) NOT NULL,
  `queue_status` varchar(500) NOT NULL,
  `queue_remarks` varchar(500) NOT NULL,
  PRIMARY KEY (`queue_assign_time`),
  KEY `FK_OPD_Queue_AssignBy` (`queue_assign_by`),
  KEY `FK_OPD_Queue_AssignTo` (`queue_assign_to`),
  KEY `FK_OPD_Queue_Paient_ID` (`patient_id`),
  KEY `FK_ey1vwb0ikfxx1g1wjswgvi9e` (`patient_id`),
  KEY `FK_24hdcb6badrbcutdkj556fpi1` (`queue_assign_by`),
  CONSTRAINT `FK_24hdcb6badrbcutdkj556fpi1` FOREIGN KEY (`queue_assign_by`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_ey1vwb0ikfxx1g1wjswgvi9e` FOREIGN KEY (`patient_id`) REFERENCES `opd_patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_queue`
--

LOCK TABLES `opd_patient_queue` WRITE;
/*!40000 ALTER TABLE `opd_patient_queue` DISABLE KEYS */;
INSERT INTO `opd_patient_queue` VALUES (1,1,'2015-07-23 12:18:50',3,1,'Delete','Knee Injury'),(2,50,'2015-07-23 15:15:07',3,1,'Delete',''),(3,51,'2015-07-23 15:56:20',3,1,'Delete',''),(4,1,'2015-07-23 16:30:36',3,1,'Delete',''),(1,57,'2015-07-24 09:44:33',3,1,'Delete',''),(2,60,'2015-07-24 09:48:45',3,1,'Delete',''),(3,7,'2015-07-24 10:00:17',3,1,'Delete',''),(4,60,'2015-07-24 10:03:29',3,1,'Delete',''),(5,57,'2015-07-24 10:03:50',3,1,'Delete',''),(6,60,'2015-07-24 10:18:07',3,1,'Delete',''),(1,60,'2015-07-27 09:03:30',3,1,'Delete',''),(2,57,'2015-07-27 09:04:43',3,1,'Delete',''),(3,54,'2015-07-27 11:40:11',3,1,'Delete',''),(4,53,'2015-07-27 11:53:16',3,1,'Delete',''),(1,61,'2015-07-28 11:28:26',3,1,'Delete',''),(2,8,'2015-07-28 12:09:22',3,1,'Delete',''),(3,15,'2015-07-28 12:11:25',3,1,'Delete',''),(4,7,'2015-07-28 14:48:46',3,1,'Delete',''),(5,6,'2015-07-28 15:03:01',3,1,'Delete',''),(6,4,'2015-07-28 15:36:13',3,1,'Delete',''),(1,14,'2015-07-30 08:41:06',3,1,'Delete',''),(2,6,'2015-07-30 08:50:24',3,1,'Delete','adadada'),(3,62,'2015-07-30 10:07:08',3,1,'Delete',''),(4,10,'2015-07-30 10:29:06',3,1,'Delete',''),(5,64,'2015-07-30 11:17:06',3,1,'Delete',''),(6,4,'2015-07-30 11:33:50',3,1,'Delete','d'),(7,65,'2015-07-30 13:23:34',3,1,'Delete',''),(8,2,'2015-07-30 14:59:18',3,1,'Delete',''),(1,1,'2015-08-03 16:25:13',3,1,'Delete',''),(2,11,'2015-08-03 16:26:07',3,1,'Delete',''),(1,14,'2015-08-05 12:29:37',3,1,'Delete',''),(2,34,'2015-08-05 12:31:38',3,1,'Delete',''),(3,14,'2015-08-05 12:32:40',3,1,'Delete',''),(4,10,'2015-08-05 12:49:19',3,1,'Delete',''),(5,54,'2015-08-05 16:37:56',3,1,'Delete',''),(6,62,'2015-08-05 16:40:19',3,1,'Delete',''),(1,66,'2015-08-06 14:15:22',3,1,'Delete',''),(2,6,'2015-08-06 14:17:45',3,1,'Delete',''),(1,6,'2015-08-10 15:47:05',3,1,'Delete',''),(1,11,'2015-08-14 10:25:28',3,5,'Delete',''),(2,8,'2015-08-14 10:25:40',3,19,'Delete',''),(3,4,'2015-08-14 10:39:52',3,5,'Delete',''),(4,7,'2015-08-14 15:30:26',3,5,'Delete',''),(5,15,'2015-08-14 15:31:02',3,7,'Delete',''),(6,12,'2015-08-14 15:31:37',3,5,'Delete',''),(1,5,'2015-08-19 09:20:46',3,1,'Delete',''),(1,10,'2015-08-21 09:16:40',3,1,'Delete',''),(1,68,'2015-09-14 12:44:09',3,5,'Delete',''),(1,3,'2015-09-18 09:16:51',3,1,'Delete',''),(1,4,'2015-10-26 15:48:28',3,7,'Delete',''),(1,6,'2015-11-09 15:32:35',3,1,'Delete',''),(1,14,'2015-11-12 08:44:21',3,5,'Delete',''),(2,51,'2015-12-01 15:23:48',3,5,'Delete',''),(2,9,'2015-12-01 15:24:08',3,1,'Delete',''),(2,9,'2015-12-10 10:23:36',3,7,'Delete',''),(1,6,'2016-02-09 16:54:49',3,1,'Delete',''),(1,5,'2016-02-24 18:34:44',3,1,'Delete',''),(1,10,'2016-03-04 17:36:25',3,1,'Delete',''),(1,13,'2016-07-22 14:37:14',3,1,'Delete',''),(1,13,'2016-07-25 13:25:07',3,5,'Delete',''),(2,12,'2016-07-25 13:30:25',3,6,'Waiting',''),(3,15,'2016-07-25 13:30:52',3,6,'Waiting',''),(2,11,'2016-07-25 13:33:15',3,5,'In',''),(2,8,'2016-07-25 13:41:55',3,7,'Delete',''),(2,8,'2016-07-27 12:03:33',3,7,'Delete','wqewqeq'),(2,14,'2016-07-27 12:03:55',3,6,'Waiting','123'),(2,4,'2016-07-27 12:05:13',3,6,'In','sdfs'),(2,74,'2017-04-18 14:29:43',3,5,'In',''),(1,86,'2017-04-28 11:02:48',3,1,'Delete',''),(5,89,'2017-06-20 14:09:39',3,7,'Delete',''),(3,86,'2017-06-20 14:10:49',3,7,'Delete',''),(1,88,'2017-06-20 14:12:49',3,1,'In','');
/*!40000 ALTER TABLE `opd_patient_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_record`
--

DROP TABLE IF EXISTS `opd_patient_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `record_type` int(11) NOT NULL,
  `record_text` varchar(500) NOT NULL,
  `record_visibility` varchar(500) NOT NULL,
  `record_completed` int(11) NOT NULL,
  `record_create_user` int(11) NOT NULL,
  `record_create_date` datetime NOT NULL,
  `record_last_update_user` int(11) NOT NULL,
  `record_last_update_date` datetime NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `FK_OPD_Record_CreateUser` (`record_create_user`),
  KEY `FK_OPD_Record_patient_ID` (`patient_id`),
  KEY `FK_OPD_Record_UpdateUser` (`record_last_update_user`),
  KEY `FK_4j1oyjps896aqhjy61f5taqyk` (`patient_id`),
  KEY `FK_7rxvtj03lq1o55cq9dvn5lof` (`record_create_user`),
  KEY `FK_h49l64ytx3krdafq1u8e1rhct` (`record_last_update_user`),
  CONSTRAINT `FK_4j1oyjps896aqhjy61f5taqyk` FOREIGN KEY (`patient_id`) REFERENCES `opd_patient` (`patient_id`),
  CONSTRAINT `FK_7rxvtj03lq1o55cq9dvn5lof` FOREIGN KEY (`record_create_user`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_h49l64ytx3krdafq1u8e1rhct` FOREIGN KEY (`record_last_update_user`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_record`
--

LOCK TABLES `opd_patient_record` WRITE;
/*!40000 ALTER TABLE `opd_patient_record` DISABLE KEYS */;
INSERT INTO `opd_patient_record` VALUES (1,6,0,'              notes','all',0,1,'2015-07-30 10:25:03',1,'2015-07-30 10:25:03'),(2,1,0,'Need to check the blood preasure            ','me',0,1,'2015-07-30 11:28:39',1,'2015-07-30 11:28:39'),(3,1,1,'Check the ECG              ','me',0,1,'2015-07-30 11:28:53',1,'2015-07-30 11:28:53'),(4,1,0,'ewsdfdfdsf              ','me',0,1,'2015-08-03 16:26:15',1,'2015-08-03 16:26:15'),(5,11,0,'           fcb','all',0,1,'2015-08-03 16:26:50',1,'2015-08-03 16:26:50'),(6,1,0,'              xdf','all',0,1,'2015-08-03 16:34:38',1,'2015-08-03 16:34:38'),(7,11,1,'              gdc','all',0,1,'2015-08-04 09:13:45',1,'2015-08-04 09:13:45'),(8,11,0,'hhhh              ','all',0,1,'2015-08-04 09:19:29',1,'2015-08-04 09:19:29'),(9,11,1,'ddddd              ','all',0,1,'2015-08-04 09:19:48',1,'2015-08-04 09:19:48'),(10,11,0,'kkkk              ','all',0,1,'2015-08-04 09:21:29',1,'2015-08-04 09:21:29'),(11,11,1,'gggg              ','all',0,1,'2015-08-04 10:18:15',1,'2015-08-04 10:18:15'),(12,11,1,'ABC','all',0,1,'2015-08-04 10:20:31',1,'2015-08-04 10:20:31'),(13,6,0,'              cch','all',0,1,'2015-08-06 14:18:13',1,'2015-08-06 14:18:13'),(14,6,1,'              jbv j','all',0,1,'2015-08-06 14:20:30',1,'2015-08-06 14:20:30'),(15,10,1,'              Get Blood Test','me',0,1,'2015-08-21 09:21:04',1,'2015-08-21 09:21:04'),(16,10,0,'              fgcgc','all',0,1,'2015-08-21 10:06:46',1,'2015-08-21 10:06:46'),(17,10,1,'       dqawszdw       ','all',0,1,'2015-08-21 10:07:26',1,'2015-08-21 10:07:26'),(18,10,0,'              fcdx c','all',0,1,'2015-08-21 10:07:55',1,'2015-08-21 10:07:55'),(19,10,1,'              bfc b','all',0,1,'2015-08-21 10:08:14',1,'2015-08-21 10:08:14'),(20,60,0,'              dsadqdwqdwqd','all',0,1,'2015-11-12 15:28:15',1,'2015-11-12 15:28:15'),(21,88,0,'new patient 2          ','all',0,1,'2017-05-23 12:49:38',1,'2017-05-23 13:04:29'),(22,88,0,'new patient record','all',0,1,'2017-05-23 13:01:57',1,'2017-05-23 13:01:57');
/*!40000 ALTER TABLE `opd_patient_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_visit`
--

DROP TABLE IF EXISTS `opd_patient_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_date` datetime NOT NULL,
  `visit_complaint` varchar(500) NOT NULL,
  `visit_doctor` int(11) NOT NULL,
  `visit_remarks` varchar(500) NOT NULL,
  `visit_create_user` int(11) NOT NULL,
  `visit_last_update_date` datetime NOT NULL,
  `visit_last_update_user` int(11) NOT NULL,
  `visit_type` varchar(255) NOT NULL,
  `visit_active` int(11) NOT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `FK_OPD_Visit_ceateUser` (`visit_create_user`),
  KEY `FK_OPD_Visit_DoctorID` (`visit_doctor`),
  KEY `FK_OPD_Visit_patient_ID` (`patient_id`),
  KEY `FK_OPD_Visit_UpdateUser` (`visit_last_update_user`),
  KEY `FK_9un4ffakpl3cxfna707egprct` (`patient_id`),
  KEY `FK_kmk2a45fxdk8c6e2i08wo1cqm` (`visit_doctor`),
  KEY `FK_aevlvvlfmh7k5w3jptfmlr835` (`visit_create_user`),
  KEY `FK_msalj69m497vubf79ar87ju9g` (`visit_last_update_user`),
  CONSTRAINT `FK_9un4ffakpl3cxfna707egprct` FOREIGN KEY (`patient_id`) REFERENCES `opd_patient` (`patient_id`),
  CONSTRAINT `FK_aevlvvlfmh7k5w3jptfmlr835` FOREIGN KEY (`visit_create_user`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_kmk2a45fxdk8c6e2i08wo1cqm` FOREIGN KEY (`visit_doctor`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_msalj69m497vubf79ar87ju9g` FOREIGN KEY (`visit_last_update_user`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_visit`
--

LOCK TABLES `opd_patient_visit` WRITE;
/*!40000 ALTER TABLE `opd_patient_visit` DISABLE KEYS */;
INSERT INTO `opd_patient_visit` VALUES (1,1,'2015-08-03 12:19:20','Knee Injury',1,'Knee Injury                            ',1,'2015-07-23 12:19:20',1,'OPD',0),(2,1,'2015-07-23 12:51:46','Knee Injury',1,'Knee Injury',1,'2015-07-23 12:51:46',1,'OPD',0),(3,1,'2015-07-23 13:32:49','Neck Injury',1,'Knee Injury                                                        ',1,'2015-07-23 13:33:50',1,'OPD',0),(4,50,'2015-07-23 15:15:23','rasangi',1,'                            ',1,'2015-07-23 15:15:23',1,'OPD',0),(5,51,'2015-07-23 15:56:45','lol',1,'                                                        ',1,'2015-09-14 10:26:36',1,'OPD',0),(6,1,'2015-07-23 16:30:50','BCD',1,'                            ',1,'2015-07-23 16:30:50',1,'OPD',0),(7,1,'2015-07-24 09:42:32','sahan',1,'                            ',1,'2015-07-24 09:42:32',1,'OPD',0),(8,57,'2015-07-24 09:51:59','sahan',1,'                            ',1,'2015-07-24 09:51:59',1,'OPD',0),(9,60,'2015-07-24 09:52:22','Knee Injury',1,'note',1,'2015-07-24 09:52:22',1,'OPD',0),(10,7,'2015-07-24 10:00:33','headach',1,'                            ',1,'2015-07-24 10:00:33',1,'OPD',0),(11,7,'2015-07-24 10:02:46','Knee Injury',1,'                            ',1,'2015-07-24 10:02:46',1,'OPD',0),(12,60,'2015-07-24 10:04:04','Knee Injury',1,'                            ',1,'2015-07-24 10:04:04',1,'OPD',0),(13,57,'2015-07-24 10:05:19','sahan',1,'                            ',1,'2015-07-24 10:05:19',1,'OPD',0),(14,60,'2015-07-24 10:18:18','Knee Injury',1,'                            ',1,'2015-07-24 10:18:18',1,'OPD',0),(15,60,'2015-07-24 16:41:42','Knee Injury',1,'                            ',1,'2015-07-24 16:41:42',1,'OPD',0),(16,57,'2015-07-24 16:42:51','Knee Injury',1,'                            ',1,'2015-07-24 16:42:51',1,'OPD',0),(17,53,'2015-07-27 23:51:43','rasangi',1,'                            ',1,'2015-07-27 23:51:43',1,'OPD',0),(18,53,'2015-07-27 23:55:33','rasangi',1,'                            ',1,'2015-07-27 23:55:33',1,'OPD',0),(19,61,'2015-07-28 11:29:55','Knee Injury',1,'                            ',1,'2015-07-28 11:29:55',1,'OPD',0),(20,61,'2015-07-28 12:05:52','Knee Injury',1,'                            ',1,'2015-07-28 12:05:52',1,'OPD',0),(21,8,'2015-07-28 12:09:32','Knee Injury',1,'                            ',1,'2015-07-28 12:09:32',1,'OPD',0),(22,15,'2015-07-28 14:48:26','rasangi',1,'                            ',1,'2015-07-28 14:48:26',1,'OPD',0),(23,7,'2015-07-28 15:03:23','rasangi',1,'                            ',1,'2015-07-28 15:03:23',1,'OPD',0),(24,14,'2015-07-29 17:07:05','Knee Injury',1,'                            ',1,'2015-07-29 17:07:05',1,'OPD',0),(25,6,'2015-07-29 17:07:23','Knee Injury',1,'                            ',1,'2015-07-29 17:07:23',1,'OPD',0),(26,6,'2015-07-29 17:13:08','Knee Injury',1,'sdsdsadasdsadsadsafd',1,'2015-07-29 17:13:08',1,'OPD',0),(27,62,'2015-07-30 10:20:12','Knee Injury',1,'                            ',1,'2015-07-30 10:20:12',1,'OPD',0),(28,6,'2015-07-30 10:23:22','Knee Injury',1,'                            ',1,'2015-07-30 10:23:22',1,'OPD',0),(29,6,'2015-07-30 10:25:29','Knee Injury',1,'                            ',1,'2015-07-30 10:25:29',1,'OPD',0),(30,10,'2015-07-30 10:29:20','Knee Injury',1,'                            ',1,'2015-07-30 10:29:20',1,'OPD',0),(31,10,'2015-07-30 10:56:45','Knee Injury',1,'                            ',1,'2015-07-30 10:56:45',1,'OPD',0),(32,10,'2015-07-30 11:01:20','Headach',1,'For the first time                             ',1,'2015-07-30 11:01:20',1,'OPD',0),(33,10,'2015-07-30 11:19:32','Knee Injury',1,'                            ',1,'2015-07-30 11:19:32',1,'OPD',0),(34,65,'2015-07-30 13:44:22','Knee Injury',1,'                            ',1,'2015-07-30 13:44:22',1,'OPD',0),(35,65,'2015-07-30 13:44:22','Knee Injury cougf',1,'                            ',1,'2015-07-30 13:44:22',1,'OPD',0),(36,1,'2015-07-30 13:53:04','Knee Injury',1,'                            ',1,'2015-07-30 13:53:04',1,'OPD',0),(37,1,'2015-07-30 14:05:36','Knee Injury',1,'                            ',1,'2015-07-30 14:05:36',1,'OPD',0),(38,4,'2015-07-30 14:07:13','Knee Injury',1,'                            ',1,'2015-07-30 14:07:13',1,'OPD',0),(39,4,'2015-07-30 14:09:28','Knee Injury',1,'                            ',1,'2015-07-30 14:09:28',1,'OPD',0),(40,4,'2015-07-30 14:15:12','Knee Injury',1,'                            ',1,'2015-07-30 14:15:12',1,'OPD',0),(41,50,'2015-07-30 14:55:33','Knee Injury',1,'                            ',1,'2015-07-30 14:55:33',1,'OPD',0),(42,50,'2015-07-30 14:56:08','Knee Injury',1,'                            ',1,'2015-07-30 14:56:08',1,'OPD',0),(43,2,'2015-07-30 14:59:27','wasantha',1,'                            ',1,'2015-07-30 14:59:27',1,'OPD',0),(44,11,'2015-08-03 17:12:26','Knee Injury',1,'                            ',1,'2015-08-03 17:12:26',1,'OPD',0),(45,11,'2015-08-04 11:34:55','Knee Injury',1,' new one                           ',1,'2015-08-04 11:34:55',1,'OPD',0),(46,11,'2015-08-04 11:38:35','Knee Injury',1,'BBBBBBB                            ',1,'2015-08-04 11:38:35',1,'OPD',0),(47,11,'2015-08-04 16:06:15','Knee Injury',1,'                            ',1,'2015-08-04 16:06:15',1,'OPD',0),(48,1,'2015-08-04 16:18:25','EFG',1,'  6y6yty                          ',1,'2015-08-04 16:18:25',1,'OPD',0),(49,11,'2015-08-05 11:32:24','ABC',1,'                            ',1,'2015-08-05 11:32:24',1,'OPD',0),(50,11,'2015-08-05 11:41:01','EFG',1,'ffdfsfdsf',1,'2015-08-05 11:41:01',1,'OPD',0),(51,11,'2015-08-05 11:53:33','ABC',1,'                            ',1,'2015-08-05 11:53:33',1,'OPD',0),(52,11,'2015-08-05 12:14:36','ABC',1,'                            ',1,'2015-08-05 12:14:36',1,'OPD',0),(53,11,'2015-08-05 12:15:07','ABC',1,'                            ',1,'2015-08-05 12:15:07',1,'OPD',0),(54,14,'2015-08-05 12:30:14','ABC',1,'                            ',1,'2015-08-05 12:30:14',1,'OPD',0),(55,14,'2015-08-05 12:33:29','ABC',1,'                            ',1,'2015-08-05 12:33:29',1,'OPD',0),(56,11,'2015-08-05 12:42:17','Knee Injury',1,' fdsfds                           ',1,'2015-08-05 12:42:17',1,'OPD',0),(57,10,'2015-08-05 12:49:44','ABC',1,'                            ',1,'2015-08-05 12:49:44',1,'OPD',0),(58,10,'2015-08-05 12:50:19','ABC',1,'                            ',1,'2015-08-05 12:50:19',1,'OPD',0),(59,10,'2015-08-05 13:04:50','ABC',1,'                            ',1,'2015-08-05 13:04:50',1,'OPD',0),(60,34,'2015-08-05 14:00:59','BCD',1,'                            ',1,'2015-08-05 14:00:59',1,'OPD',0),(61,34,'2015-08-05 14:00:59','ABC',1,'                            ',1,'2015-08-05 14:00:59',1,'OPD',0),(62,14,'2015-08-05 14:12:41','BCD',1,'                            ',1,'2015-08-05 14:12:41',1,'OPD',0),(63,14,'2015-08-05 14:22:39','BCD',1,'                            ',1,'2015-08-05 14:22:39',1,'OPD',0),(64,54,'2015-08-05 16:38:10','ABC',1,'                            ',1,'2015-08-05 16:38:10',1,'OPD',0),(65,14,'2015-08-06 11:08:05','Pissu',1,'sdsdddada                            ',1,'2015-08-06 11:08:05',1,'OPD',0),(66,62,'2015-08-06 12:05:35','Knee Injury',1,'dfdffd',1,'2015-08-06 12:05:35',1,'OPD',0),(67,66,'2015-08-06 14:15:44','ABC',1,'                            ',1,'2015-08-06 14:15:44',1,'OPD',0),(68,6,'2015-08-06 14:19:14','ABC',1,'                            ',1,'2015-08-06 14:19:14',1,'OPD',0),(69,6,'2015-08-10 15:48:08','Knee Injury',1,'                            ',1,'2015-08-10 15:48:08',1,'OPD',0),(70,6,'2015-08-10 15:50:26','Knee Injury',1,'                            ',1,'2015-08-10 15:50:26',1,'OPD',0),(71,8,'2015-08-12 12:01:39','Knee Injury',1,'                            ',1,'2015-08-12 12:01:39',1,'OPD',0),(72,8,'2015-08-12 12:05:19','Knee Injury',1,'                            ',1,'2015-08-12 12:05:19',1,'OPD',0),(73,8,'2015-08-13 15:03:14','Knee Injury',1,'                            ',1,'2015-08-13 15:03:14',1,'OPD',0),(74,5,'2015-08-19 09:21:10','Knee Injury',1,'                            ',1,'2015-08-19 09:21:10',1,'OPD',0),(75,5,'2015-08-19 09:27:44','Knee Injury',1,'                            ',1,'2015-08-19 09:27:44',1,'OPD',0),(76,10,'2015-08-21 09:18:19','Knee Injury',1,'                            ',1,'2015-08-21 09:18:19',1,'OPD',0),(77,5,'2015-09-14 09:56:39','rasangi',1,'iji',1,'2015-09-14 09:56:39',1,'OPD',0),(78,10,'2015-09-14 10:02:40','wqe',1,'                            qew',1,'2015-09-14 10:02:40',1,'OPD',0),(79,68,'2015-09-14 12:45:51','BCD',1,'                            asdsad',1,'2015-09-14 12:45:51',1,'OPD',0),(80,3,'2015-09-18 13:25:38','ABC',1,'                            ',1,'2015-09-18 13:25:38',1,'OPD',0),(81,4,'2015-10-26 15:50:02','Knee Injury',1,'                            ',1,'2015-10-26 15:50:02',1,'OPD',0),(82,68,'2015-10-26 15:51:19','Knee Injury',1,'                            ',1,'2015-10-26 15:51:19',1,'OPD',0),(83,6,'2015-11-09 15:35:21','Knee Injury',1,'                            ',1,'2015-11-09 15:35:21',1,'OPD',0),(84,14,'2015-11-12 08:46:37','Knee Injury',1,'                            ',1,'2015-11-12 08:46:37',1,'OPD',0),(85,9,'2016-01-18 10:28:24','Knee Injury',1,'                            ',1,'2016-01-18 10:28:24',1,'OPD',0),(86,6,'2016-02-09 16:58:44','Knee Injury',1,'                            ',1,'2016-02-09 16:58:44',1,'OPD',0),(87,5,'2016-02-24 18:35:01','Knee Injury',1,'                            ',1,'2016-02-24 18:35:01',1,'OPD',0),(88,5,'2016-02-24 18:36:12','Knee Injury',1,'                            ',1,'2016-02-24 18:36:12',1,'OPD',0),(89,10,'2016-03-04 17:36:40','Knee Injury',1,'                            ',1,'2016-03-04 17:36:40',1,'OPD',0),(90,10,'2016-03-04 17:41:52','Knee Injury',1,'                            ',1,'2016-03-04 17:41:52',1,'OPD',0),(91,10,'2016-03-16 17:38:09','knee',1,'                            ',1,'2016-03-16 17:38:09',1,'OPD',0),(92,10,'2016-03-16 17:41:00','Knee Injury',1,'                            ',1,'2016-03-16 17:41:00',1,'OPD',0),(93,10,'2016-03-16 17:55:11','knee',1,'                            ',1,'2016-03-16 17:55:11',1,'OPD',0),(94,10,'2016-03-16 17:58:02','Knee Injury',1,'                            ',1,'2016-03-16 17:58:02',1,'OPD',0),(95,10,'2016-03-16 18:21:46','knee',1,'                            ',1,'2016-03-16 18:21:46',1,'OPD',0),(96,10,'2016-03-16 18:22:31','knee',1,'                            ',1,'2016-03-16 18:22:31',1,'OPD',0),(97,10,'2016-03-16 18:22:31','knee',1,'                            ',1,'2016-03-16 18:22:31',1,'OPD',0),(98,10,'2016-03-16 18:38:08','Knee Injury',1,'                            ',1,'2016-03-16 18:38:08',1,'OPD',0),(99,10,'2016-03-16 18:45:35','knee',1,'                            ',1,'2016-03-16 18:45:35',1,'OPD',0),(100,10,'2016-03-16 19:05:38','knee',1,'                            ',1,'2016-03-16 19:05:38',1,'OPD',0),(101,10,'2016-03-16 19:09:59','knee',1,'                            ',1,'2016-03-16 19:09:59',1,'OPD',0),(102,10,'2016-03-16 19:12:41','knee',1,'                            ',1,'2016-03-16 19:12:41',1,'OPD',0),(103,10,'2016-03-16 19:14:23','knee',1,'                            ',1,'2016-03-16 19:14:23',1,'OPD',0),(104,13,'2016-07-22 14:39:06','knee',1,'                            ',1,'2016-07-22 14:39:06',1,'OPD',0),(105,15,'2016-07-25 13:28:10','wqe',7,'wqe                            ',7,'2016-07-25 13:28:10',7,'OPD',0),(106,11,'2016-07-25 13:28:49','dsf',5,'                            adsa',5,'2016-07-25 13:28:49',5,'OPD',0),(107,7,'2016-07-25 13:29:04','asda',5,'                         asdsa   ',5,'2016-07-25 13:29:04',5,'OPD',0),(108,7,'2016-07-25 13:29:24','asd',5,'                            asd',5,'2016-07-25 13:29:24',5,'OPD',0),(109,12,'2016-07-25 13:30:14','wqe',5,'ewq                            ',5,'2016-07-25 13:30:14',5,'OPD',0),(110,68,'2016-07-25 13:30:26','qe',5,'                            qwe',5,'2016-07-25 13:30:26',5,'OPD',0),(111,11,'2016-07-25 13:35:18','we',1,'23ewr',1,'2016-07-25 13:35:18',1,'OPD',0),(112,11,'2016-07-25 13:44:27','werwq',1,'                            rqwr',1,'2016-07-25 13:44:27',1,'OPD',0),(113,4,'2016-07-27 12:07:27','wqe',1,'ds',1,'2016-07-27 12:07:27',1,'OPD',0),(114,8,'2016-07-27 12:13:04','knee',1,'wqe',1,'2016-07-27 12:13:04',1,'OPD',0),(115,8,'2016-07-27 12:14:50','wqe',1,'asdad',1,'2016-07-27 12:14:50',1,'OPD',0),(120,74,'2017-04-18 14:29:58','cold',1,'                            ',1,'2017-04-18 14:29:58',1,'OPD',0),(149,86,'2017-05-04 13:10:09','fever',1,'                            ',1,'2017-05-04 13:10:09',1,'OPD',0),(150,86,'2017-05-05 10:19:43','testtoday',1,'                            ',1,'2017-05-05 10:19:43',1,'OPD',0),(151,86,'2017-05-15 15:33:12','newtest',1,'                            ',1,'2017-05-15 15:33:12',1,'OPD',0),(152,88,'2017-05-15 15:36:43','nothing',1,'hi                               ',1,'2017-05-25 12:51:05',1,'OPD',0),(153,88,'2017-06-01 15:39:31','Fever, Feeling ill, ',1,'                            ',1,'2017-06-01 15:39:31',1,'OPD',0),(154,88,'2017-06-22 11:21:31','Head injury other, ',1,'                            ',1,'2017-06-22 11:21:31',1,'Other',0);
/*!40000 ALTER TABLE `opd_patient_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_prescription`
--

DROP TABLE IF EXISTS `opd_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_prescription` (
  `prescription_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) DEFAULT NULL,
  `prescription_prescribed_by` int(11) DEFAULT NULL,
  `prescription_date` date DEFAULT NULL,
  `prescription_status` varchar(500) DEFAULT NULL,
  `prescription_create_date` date DEFAULT NULL,
  `prescription_create_user` int(11) DEFAULT NULL,
  `prescription_last_update_date` date DEFAULT NULL,
  `prescription_last_update_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `visit_id` (`visit_id`),
  KEY `FK_4u5k12qf5hd4cq2xs7su7nexe` (`visit_id`),
  CONSTRAINT `FK_4u5k12qf5hd4cq2xs7su7nexe` FOREIGN KEY (`visit_id`) REFERENCES `opd_patient_visit` (`visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_prescription`
--

LOCK TABLES `opd_prescription` WRITE;
/*!40000 ALTER TABLE `opd_prescription` DISABLE KEYS */;
INSERT INTO `opd_prescription` VALUES (1,3,1,'2015-07-23','1','2015-07-23',1,'2015-07-23',1),(2,6,1,'2015-07-23','0','2015-07-23',1,'2015-07-23',1),(3,10,1,'2015-07-24','0','2015-07-24',1,'2015-07-24',1),(4,12,1,'2015-07-24','0','2015-07-24',1,'2015-07-24',1),(5,16,1,'2015-07-27','0','2015-07-27',1,'2015-07-27',1),(6,27,1,'2015-07-30','1','2015-07-30',1,'2015-07-30',1),(7,32,1,'2015-07-30','0','2015-07-30',1,'2015-07-30',1),(8,32,1,'2015-07-30','1','2015-07-30',1,'2015-07-30',1),(9,36,1,'2015-07-30','0','2015-07-30',1,'2015-07-30',1),(10,39,1,'2015-07-30','1','2015-07-30',1,'2015-07-30',1),(11,40,1,'2015-07-30','0','2015-07-30',1,'2015-07-30',1),(12,68,1,'2015-08-06','0','2015-08-06',1,'2015-08-06',1),(13,78,1,'2015-09-14','0','2015-09-14',1,'2015-09-14',1),(14,82,1,'2015-10-26','0','2015-10-26',1,'2015-10-26',1),(15,84,1,'2015-11-12','0','2015-11-12',1,'2015-11-12',1),(16,85,1,'2016-01-18','0','2016-01-18',1,'2016-01-18',1),(17,86,1,'2016-02-09','0','2016-02-09',1,'2016-02-09',1),(18,87,1,'2016-02-24','0','2016-02-24',1,'2016-02-24',1),(19,90,1,'2016-03-04','0','2016-03-04',1,'2016-03-04',1),(20,111,1,'2016-07-25','1','2016-07-25',1,'2016-07-25',1),(21,111,1,'2016-07-25','0','2016-07-25',1,'2016-07-25',1),(22,111,2,'2016-07-25','0','2016-07-25',2,'2016-07-25',2),(23,111,2,'2016-07-25','0','2016-07-25',2,'2016-07-25',2),(24,115,1,'2016-07-27','1','2016-07-27',1,'2016-07-27',1),(42,149,1,'2017-04-27','1','2017-04-27',1,'2017-04-27',1),(43,149,1,'2017-05-04','1','2017-05-04',1,'2017-05-04',1),(44,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(45,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(46,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(47,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(48,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(49,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(50,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(51,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(52,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(53,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(54,149,1,'2017-05-04','0','2017-05-04',1,'2017-05-04',1),(55,150,1,'2017-05-05','0','2017-05-05',1,'2017-05-05',1),(56,150,1,'2017-05-05','0','2017-05-05',1,'2017-05-05',1),(57,150,1,'2017-05-05','0','2017-05-05',1,'2017-05-05',1),(58,150,1,'2017-05-05','0','2017-05-05',1,'2017-05-05',1),(59,150,1,'2017-05-08','0','2017-05-08',1,'2017-05-08',1),(60,150,1,'2017-05-15','0','2017-05-15',1,'2017-05-15',1),(61,152,1,'2017-05-15','1','2017-05-15',1,'2017-05-15',1),(62,152,1,'2017-05-16','1','2017-05-16',1,'2017-05-16',1),(63,152,1,'2017-05-17','1','2017-05-17',1,'2017-05-17',1),(64,152,1,'2017-05-18','1','2017-05-18',1,'2017-05-18',1),(65,152,1,'2017-05-22','1','2017-05-22',1,'2017-05-22',1),(66,152,1,'2017-05-22','1','2017-05-22',1,'2017-05-22',1),(67,152,1,'2017-05-22','0','2017-05-22',1,'2017-05-22',1),(68,152,1,'2017-05-22','1','2017-05-22',1,'2017-05-22',1),(69,152,1,'2017-05-23','1','2017-05-23',1,'2017-05-23',1),(70,152,1,'2017-05-23','1','2017-05-23',1,'2017-05-23',1),(71,152,1,'2017-05-29','0','2017-05-29',1,'2017-05-29',1),(72,152,1,'2017-05-29','0','2017-05-29',1,'2017-05-29',1),(73,152,1,'2017-05-29','0','2017-05-29',1,'2017-05-29',1),(74,152,1,'2017-05-29','0','2017-05-29',1,'2017-05-29',1),(75,152,1,'2017-05-29','0','2017-05-29',1,'2017-05-29',1),(76,152,1,'2017-05-29','0','2017-05-29',1,'2017-05-29',1),(77,152,1,'2017-05-29','0','2017-05-29',1,'2017-05-29',1),(78,152,1,'2017-05-30','0','2017-05-30',1,'2017-05-30',1),(88,153,1,'2017-06-09','0','2017-06-09',1,'2017-06-09',1),(89,153,1,'2017-06-09','0','2017-06-09',1,'2017-06-09',1),(90,153,1,'2017-06-14','1','2017-06-14',1,'2017-06-14',1),(91,153,1,'2017-06-14','0','2017-06-14',1,'2017-06-14',1);
/*!40000 ALTER TABLE `opd_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_prescription_item`
--

DROP TABLE IF EXISTS `opd_prescription_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_prescription_item` (
  `prescription_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) DEFAULT NULL,
  `prescription_item_drug_id` int(11) NOT NULL,
  `prescription_item_frequency` varchar(500) DEFAULT NULL,
  `prescription_item_dosage` varchar(500) DEFAULT NULL,
  `prescription_item_period` varchar(500) DEFAULT NULL,
  `prescription_item_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`prescription_item_id`),
  KEY `prescription_id` (`prescription_id`),
  KEY `FK_cn19uqnn8uvj4c977uf873o6k` (`prescription_id`),
  KEY `FK_n068c6w0upg76c1pwh33nwg3k` (`prescription_item_drug_id`),
  CONSTRAINT `FK_cn19uqnn8uvj4c977uf873o6k` FOREIGN KEY (`prescription_id`) REFERENCES `opd_prescription` (`prescription_id`),
  CONSTRAINT `FK_n068c6w0upg76c1pwh33nwg3k` FOREIGN KEY (`prescription_item_drug_id`) REFERENCES `pharm_drug` (`drug_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_prescription_item`
--

LOCK TABLES `opd_prescription_item` WRITE;
/*!40000 ALTER TABLE `opd_prescription_item` DISABLE KEYS */;
INSERT INTO `opd_prescription_item` VALUES (1,1,1,'Twice a Day','2','For 5 day',20),(2,3,2,'Twice a Day','1','For 2 day',4),(3,4,2,'Twice a Day','1','For 2 day',4),(4,5,1,'Twice a Day','1','For 2 day',4),(5,6,1,'Twice a Day','1','For 2 day',4),(6,7,12,' Thrice a Day','1','For 5 day',0),(7,8,12,' Thrice a Day','1','For 5 day',0),(8,8,1,'Twice a Day','2','For 4 day',16),(9,9,1,'Twice a Day','1','For 4 day',8),(10,9,1,'Once a Day','2','For 1 day',2),(11,10,1,'Twice a Day','1','For 4 day',8),(12,11,1,'Twice a Day','1','For 2 day',4),(13,12,1,'Twice a Day','1','For 4 day',8),(14,13,12,'Twice a Day','1','For 4 day',8),(15,14,2,'Twice a Day','1','For 2 day',4),(16,15,2,' Thrice a Day','2','For 5 day',0),(17,16,1,'Twice a Day','1','For 4 day',8),(18,17,1,'Twice a Day','1','For 4 day',8),(19,18,2,'Once a Day','2','For 2 day',4),(20,19,1,' Thrice a Day','1','For 5 day',0),(21,20,1,' Thrice a Day','2','For 4 day',0),(22,21,1,' Thrice a Day','2','For 4 day',0),(23,21,2,'Twice a Day','1','For 2 day',4),(24,22,1,' Thrice a Day','2','For 4 day',0),(25,22,2,'Twice a Day','1','For 2 day',4),(26,23,1,' Thrice a Day','2','For 4 day',0),(27,23,2,'Twice a Day','1','For 2 day',4),(95,42,12,'4','3','For 5 day',60),(96,42,1,'2','1','For 5 day',10),(97,42,12,'4','3','For 5 day',60),(98,42,12,'4','3','For 5 day',60),(99,42,12,'3','3','For 4 day',36),(100,42,12,'4','2','For 5 day',40),(101,43,2,'3','1','For 4 day',12),(102,44,2,'3','2','For 4 day',24),(103,45,12,'4','2','For 4 day',32),(104,46,12,'4','2','For 4 day',32),(105,47,12,'2','2','For 4 day',16),(106,48,12,'2','2','For 4 day',16),(107,49,12,'2','2','For 4 day',16),(108,49,2,'3','3','For 4 day',36),(109,49,12,'2','2','For 4 day',16),(110,50,12,'4','3','For 5 day',60),(111,50,1,'3','2','For 5 day',30),(112,51,2,'2','1','For 4 day',8),(113,52,1,'2','1','For 4 day',8),(114,52,12,'3','1','For 4 day',12),(115,52,8,'3','2','For 4 day',24),(116,52,8,'3','2','For 4 day',24),(117,52,8,'3','2','For 4 day',24),(118,53,1,'3','2','For 2 day',12),(119,53,11,'2','1','For 2 day',4),(120,53,16,'3','1','For 5 day',15),(121,54,3,'3','2','For 4 day',24),(122,54,12,'4','3','For 4 day',48),(123,55,12,'3','1','For 4 day',12),(124,56,39,'2','2','For 2 day',8),(125,57,2,'3','2','For 4 day',24),(126,57,39,'1','1','For 4 day',4),(127,58,11,'2','2','For 4 day',16),(128,59,12,'2','1','For 4 day',8),(129,59,39,'2','1','For 4 day',8),(130,60,8,'3','1','For 4 day',12),(131,60,2,'3','2','For 4 day',24),(132,61,12,'4','1 ml','For 4 day',16),(133,62,12,'2','3','For 2 day',0),(134,63,67,'2','1 ml','For 5 day',10),(135,64,67,'3','2 ml','For 4 day',24),(139,65,12,'2','1','For 4 day',0),(140,65,67,'3','1.5 ml','For 4 day',18),(141,66,67,'4','2.5 ml','For 1 week',70),(145,67,14,'3','1','For 5 day',0),(151,68,67,'4','2 ml','For 5 day',40),(152,68,20,'4','1/2','For 1 week',0),(153,68,50,'3','1','For 1 week',0),(154,69,12,'bid','1','For 2 day',4),(155,70,12,'s.o.s.:10','1','For 2 day',20),(156,71,8,'bid','1','For 5 day',10),(157,71,39,'t.d.s.','2','For 4 day',24),(158,72,53,'q.d.s.','3','For 5 day',60),(159,73,54,'bid','1','For 2 day',4),(160,73,14,'o.d.','2','For 2 day',4),(161,74,53,'bid','2','For 4 day',16),(162,74,14,'q.d.s.','2','For 2 weeks',0),(163,74,14,'q.d.s.','1','For 5 day',20),(164,74,14,'q.d.s.','2','For 2 weeks',0),(165,74,39,'bid','1','For 5 day',0),(166,75,49,'q.d.s.','2','For 2 weeks',112),(167,76,14,'bid','1','For 2 weeks',28),(168,76,39,'q.d.s.','3','For 5 days',60),(169,76,14,'q.d.s.','2','For 2 weeks',112),(170,77,50,'t.d.s.','2','For 3 weeks',126),(171,78,13,'t.d.s.','1','For 5 days',15),(187,88,67,'t.d.s.','1.5 ml','For 4 days',18),(188,89,11,'bid','1','For 5 days',10),(189,89,67,'bid','1.5 ml','For 2 days',6),(190,90,50,'t.d.s.','1','For 2 days',6),(191,90,53,'t.d.s.','3','For 5 days',45),(192,90,12,'bid','2','For 2 days',8),(193,91,12,'t.d.s.','2','For 4 days',24),(194,91,67,'t.d.s.','1.5 ml','For 4 days',18);
/*!40000 ALTER TABLE `opd_prescription_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_question`
--

DROP TABLE IF EXISTS `opd_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) NOT NULL,
  `question_text` varchar(500) NOT NULL,
  `question_answer_type` varchar(500) NOT NULL,
  `question_answer_value` varchar(500) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `FK_OPD_QuestionnaireID` (`questionnaire_id`),
  KEY `FK_9i3232gb0p4fu3p0tgyuo87b6` (`questionnaire_id`),
  CONSTRAINT `FK_9i3232gb0p4fu3p0tgyuo87b6` FOREIGN KEY (`questionnaire_id`) REFERENCES `opd_questionnaire` (`questionnaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_question`
--

LOCK TABLES `opd_question` WRITE;
/*!40000 ALTER TABLE `opd_question` DISABLE KEYS */;
INSERT INTO `opd_question` VALUES (1,6,'ew','text',' '),(2,17,'null wage','text',' '),(4,18,'wenna ba','text',' ');
/*!40000 ALTER TABLE `opd_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_questionanswer`
--

DROP TABLE IF EXISTS `opd_questionanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_questionanswer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_set_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_text` varchar(500) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `FK_OPD_QuestionID` (`question_id`),
  KEY `FK_OPD_Question_AnswerSet_ID` (`answer_set_id`),
  KEY `FK_4sj65rv2mpfqmufc2adg5iryi` (`answer_set_id`),
  KEY `FK_68jij3gow2e81u2hrhiv40apn` (`question_id`),
  CONSTRAINT `FK_4sj65rv2mpfqmufc2adg5iryi` FOREIGN KEY (`answer_set_id`) REFERENCES `opd_questionanswerset` (`answer_setid`),
  CONSTRAINT `FK_68jij3gow2e81u2hrhiv40apn` FOREIGN KEY (`question_id`) REFERENCES `opd_question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_questionanswer`
--

LOCK TABLES `opd_questionanswer` WRITE;
/*!40000 ALTER TABLE `opd_questionanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `opd_questionanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_questionanswerset`
--

DROP TABLE IF EXISTS `opd_questionanswerset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_questionanswerset` (
  `answer_setid` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `questionnaire_id` int(11) NOT NULL,
  `answerSet_create_user` int(11) NOT NULL,
  `answerSet_Create_date` datetime NOT NULL,
  `answerSet_lastupdate_user` int(11) NOT NULL,
  `answerSet_lastupdate_date` datetime NOT NULL,
  PRIMARY KEY (`answer_setid`),
  KEY `visit_id` (`visit_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `answerSet_lastupdate_user` (`answerSet_lastupdate_user`),
  KEY `answerSet_lastupdate_date` (`answerSet_lastupdate_date`),
  KEY `FK_f63oj3n4xc5o1gxlfywux057c` (`visit_id`),
  KEY `FK_paqdky8s173epjmeb7haihsxr` (`questionnaire_id`),
  CONSTRAINT `FK_f63oj3n4xc5o1gxlfywux057c` FOREIGN KEY (`visit_id`) REFERENCES `opd_patient_visit` (`visit_id`),
  CONSTRAINT `FK_paqdky8s173epjmeb7haihsxr` FOREIGN KEY (`questionnaire_id`) REFERENCES `opd_questionnaire` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_questionanswerset`
--

LOCK TABLES `opd_questionanswerset` WRITE;
/*!40000 ALTER TABLE `opd_questionanswerset` DISABLE KEYS */;
/*!40000 ALTER TABLE `opd_questionanswerset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_questionnaire`
--

DROP TABLE IF EXISTS `opd_questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_questionnaire` (
  `questionnaire_id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_name` varchar(500) NOT NULL,
  `questionnaire_relateTo` varchar(500) NOT NULL,
  `questionnaire_remarks` varchar(500) NOT NULL,
  `questionnaire_create_date` datetime NOT NULL,
  `questionnaire_create_user` int(11) NOT NULL,
  `questionnaire_lastupdate_date` datetime NOT NULL,
  `questionnaire_lastupdate_user` int(11) NOT NULL,
  `questionnaire_active` int(11) NOT NULL,
  PRIMARY KEY (`questionnaire_id`),
  KEY `FK_OPD_Question_CreateUser` (`questionnaire_create_user`),
  KEY `FK_OPD_Question_UpdateUser` (`questionnaire_lastupdate_user`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_questionnaire`
--

LOCK TABLES `opd_questionnaire` WRITE;
/*!40000 ALTER TABLE `opd_questionnaire` DISABLE KEYS */;
INSERT INTO `opd_questionnaire` VALUES (1,'opdquestion','opd','opdquestionnaire','2017-03-13 12:38:51',3,'2017-03-13 12:38:51',3,1),(2,'opdquestion','opd','opdquestionnaire','2017-03-13 12:40:48',3,'2017-03-13 12:40:48',3,1),(3,'opdquestion','opd','opdquestionnaire','2017-03-13 12:45:16',3,'2017-03-13 12:45:16',3,1),(4,'opdquestion','opd','opdquestionnaire','2017-03-13 14:03:29',3,'2017-03-13 14:03:29',3,1),(5,'opdquestion','opd','opdquestionnaire','2017-04-21 13:21:52',3,'2017-04-21 13:21:52',3,1),(6,'opdquestion','opd','opdquestionnaire                        ','2017-04-21 13:29:58',3,'2017-05-04 13:23:15',1,1),(7,'opdquestion','opd','opdquestionnaire','2017-04-21 13:46:51',3,'2017-04-21 13:46:51',3,1),(8,'opdquestion','opd','opdquestionnaire','2017-04-21 14:14:04',3,'2017-04-21 14:14:04',3,1),(9,'opdquestion','opd','opdquestionnaire','2017-04-21 14:16:14',3,'2017-04-21 14:16:14',3,1),(10,'new2','opd','new','2017-04-21 14:25:52',3,'2017-05-08 09:33:20',1,1),(11,'opdquestion','opd','opdquestionnaire','2017-04-27 08:54:55',3,'2017-04-27 08:54:55',3,1),(12,'opdquestion','opd','opdquestionnaire','2017-04-27 09:17:11',3,'2017-04-27 09:17:11',3,1),(13,'opdquestion','opd','opdquestionnaire','2017-04-27 10:59:59',3,'2017-04-27 10:59:59',3,1),(14,'opdquestion','opd','opdquestionnaire','2017-04-27 11:06:56',3,'2017-04-27 11:06:56',3,1),(15,'opdquestion','opd','opdquestionnaire','2017-04-27 11:32:25',3,'2017-04-27 11:32:25',3,1),(16,'opdquestion','opd','opdquestionnaire','2017-04-27 14:08:18',3,'2017-04-27 14:08:18',3,1),(17,'newquestion','opd','no questions','2017-05-05 14:48:25',1,'2017-05-05 14:48:25',1,1),(18,'new wage','opd','na paranai','2017-05-05 14:49:14',1,'2017-05-05 14:49:44',1,1);
/*!40000 ALTER TABLE `opd_questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_treatment`
--

DROP TABLE IF EXISTS `opd_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_treatment` (
  `OPDTREATMENTID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(200) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(200) DEFAULT NULL,
  `LastUpDate` datetime DEFAULT NULL,
  `LastUpDateUser` varchar(200) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `TREATMENTID` int(11) NOT NULL,
  `VISITID` int(11) NOT NULL,
  PRIMARY KEY (`OPDTREATMENTID`),
  KEY `FK_irvo8s8gh26pgymlee8la2epq` (`TREATMENTID`),
  KEY `FK_rw3tets7qpl6javh9g62uto29` (`VISITID`),
  CONSTRAINT `FK_irvo8s8gh26pgymlee8la2epq` FOREIGN KEY (`TREATMENTID`) REFERENCES `treatment` (`TREATMENTID`),
  CONSTRAINT `FK_rw3tets7qpl6javh9g62uto29` FOREIGN KEY (`VISITID`) REFERENCES `opd_patient_visit` (`visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_treatment`
--

LOCK TABLES `opd_treatment` WRITE;
/*!40000 ALTER TABLE `opd_treatment` DISABLE KEYS */;
INSERT INTO `opd_treatment` VALUES (1,'done','wqeqw','2017-06-05 15:20:04','1','2017-06-06 11:56:19','3',1,1,153),(2,'pending','new treatment','2017-06-06 12:03:07','1','2017-06-06 12:03:39','3',1,4,153);
/*!40000 ALTER TABLE `opd_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_admition`
--

DROP TABLE IF EXISTS `pcu_admition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_admition` (
  `admition_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `admition_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`admition_id`),
  KEY `FK_jr1i7yvays4valeqv5uoyesf7` (`patient_id`),
  KEY `FK_8f8xvyweo6u0wxcseamd9822l` (`created_by`),
  KEY `FK_n6k17vo8sbr3xurr8uvdkpo3u` (`modified_by`),
  CONSTRAINT `FK_8f8xvyweo6u0wxcseamd9822l` FOREIGN KEY (`created_by`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_jr1i7yvays4valeqv5uoyesf7` FOREIGN KEY (`patient_id`) REFERENCES `opd_patient` (`patient_id`),
  CONSTRAINT `FK_n6k17vo8sbr3xurr8uvdkpo3u` FOREIGN KEY (`modified_by`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_admition`
--

LOCK TABLES `pcu_admition` WRITE;
/*!40000 ALTER TABLE `pcu_admition` DISABLE KEYS */;
INSERT INTO `pcu_admition` VALUES (2,7,'2017-01-10','1',1,'2017-01-10 00:00:00',1,'2017-01-18 00:00:00');
/*!40000 ALTER TABLE `pcu_admition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_expireditems`
--

DROP TABLE IF EXISTS `pcu_expireditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_expireditems` (
  `s_number` int(11) NOT NULL,
  `batch_no` int(11) NOT NULL,
  `quantity` float DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`s_number`,`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_expireditems`
--

LOCK TABLES `pcu_expireditems` WRITE;
/*!40000 ALTER TABLE `pcu_expireditems` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_expireditems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_itembatch`
--

DROP TABLE IF EXISTS `pcu_itembatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_itembatch` (
  `batch_id` int(11) NOT NULL,
  `recieved_date` date DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_itembatch`
--

LOCK TABLES `pcu_itembatch` WRITE;
/*!40000 ALTER TABLE `pcu_itembatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_itembatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_itembatchrelation`
--

DROP TABLE IF EXISTS `pcu_itembatchrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_itembatchrelation` (
  `s_number` int(11) NOT NULL,
  `batch_no` int(11) NOT NULL,
  `quantity` float DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`s_number`,`batch_no`),
  KEY `FK_PCU_ItemBatchRelation_PCU_ItemBatch` (`batch_no`),
  KEY `FK_hhx1jvy83929s4p2xq0t8egsi` (`s_number`),
  KEY `FK_rdl1dwsabomhon97uivluu9tr` (`batch_no`),
  CONSTRAINT `FK_hhx1jvy83929s4p2xq0t8egsi` FOREIGN KEY (`s_number`) REFERENCES `pcu_items` (`s_number`),
  CONSTRAINT `FK_rdl1dwsabomhon97uivluu9tr` FOREIGN KEY (`batch_no`) REFERENCES `pcu_itembatch` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_itembatchrelation`
--

LOCK TABLES `pcu_itembatchrelation` WRITE;
/*!40000 ALTER TABLE `pcu_itembatchrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_itembatchrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_items`
--

DROP TABLE IF EXISTS `pcu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_items` (
  `s_number` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `remark` text,
  `last_stock_recieved` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `measurement` varchar(20) DEFAULT NULL,
  `reorder_level` float DEFAULT NULL,
  PRIMARY KEY (`s_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_items`
--

LOCK TABLES `pcu_items` WRITE;
/*!40000 ALTER TABLE `pcu_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_itemstockday`
--

DROP TABLE IF EXISTS `pcu_itemstockday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_itemstockday` (
  `date` date NOT NULL,
  `stock` float NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_itemstockday`
--

LOCK TABLES `pcu_itemstockday` WRITE;
/*!40000 ALTER TABLE `pcu_itemstockday` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_itemstockday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_manualdispense`
--

DROP TABLE IF EXISTS `pcu_manualdispense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_manualdispense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admition_id` int(11) NOT NULL DEFAULT '0',
  `s_number` int(11) NOT NULL DEFAULT '0',
  `dispensed_date` date DEFAULT NULL,
  `dispensed_by` int(11) DEFAULT NULL,
  `quanity` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_manualdispense`
--

LOCK TABLES `pcu_manualdispense` WRITE;
/*!40000 ALTER TABLE `pcu_manualdispense` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_manualdispense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_nursenote`
--

DROP TABLE IF EXISTS `pcu_nursenote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_nursenote` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `pcu_patient_id` int(11) NOT NULL,
  `note_details` text NOT NULL,
  `note_by` int(11) NOT NULL,
  `note_time` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK_a3qko5uyform7fknc9ugrrl4r` (`pcu_patient_id`),
  KEY `FK_p9vumkg2k50tdmnrlqdlbjxjj` (`note_by`),
  KEY `FK_8i6lhskt22r8l6ehgtvrcmc06` (`modified_by`),
  CONSTRAINT `FK_8i6lhskt22r8l6ehgtvrcmc06` FOREIGN KEY (`modified_by`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_a3qko5uyform7fknc9ugrrl4r` FOREIGN KEY (`pcu_patient_id`) REFERENCES `pcu_admition` (`admition_id`),
  CONSTRAINT `FK_p9vumkg2k50tdmnrlqdlbjxjj` FOREIGN KEY (`note_by`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_nursenote`
--

LOCK TABLES `pcu_nursenote` WRITE;
/*!40000 ALTER TABLE `pcu_nursenote` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_nursenote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_patientsymtoms`
--

DROP TABLE IF EXISTS `pcu_patientsymtoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_patientsymtoms` (
  `symtoms_id` int(11) NOT NULL AUTO_INCREMENT,
  `pcu_patient_id` int(11) NOT NULL,
  `symtoms_details` varchar(225) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`symtoms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_patientsymtoms`
--

LOCK TABLES `pcu_patientsymtoms` WRITE;
/*!40000 ALTER TABLE `pcu_patientsymtoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_patientsymtoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_prescription`
--

DROP TABLE IF EXISTS `pcu_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_prescription` (
  `prescription_id` int(11) NOT NULL AUTO_INCREMENT,
  `pcu_patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `prescription_details` text NOT NULL,
  `prescription_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `FK_j408kk6bpbqnr0i2wwi4d4tk5` (`pcu_patient_id`),
  KEY `FK_f5wtn9ou0q4mca3cci4vkdl47` (`created_by`),
  KEY `FK_8q6kl376ps1sde03vw81n9khe` (`modified_by`),
  CONSTRAINT `FK_8q6kl376ps1sde03vw81n9khe` FOREIGN KEY (`modified_by`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_f5wtn9ou0q4mca3cci4vkdl47` FOREIGN KEY (`created_by`) REFERENCES `admin_user` (`user_id`),
  CONSTRAINT `FK_j408kk6bpbqnr0i2wwi4d4tk5` FOREIGN KEY (`pcu_patient_id`) REFERENCES `pcu_admition` (`admition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_prescription`
--

LOCK TABLES `pcu_prescription` WRITE;
/*!40000 ALTER TABLE `pcu_prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_prescriptiondispense`
--

DROP TABLE IF EXISTS `pcu_prescriptiondispense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_prescriptiondispense` (
  `prescription_id` int(11) NOT NULL DEFAULT '0',
  `s_number` int(11) NOT NULL DEFAULT '0',
  `dispensed_date` date DEFAULT NULL,
  `dispensed_by` int(11) DEFAULT NULL,
  `quanity` float DEFAULT NULL,
  PRIMARY KEY (`prescription_id`,`s_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_prescriptiondispense`
--

LOCK TABLES `pcu_prescriptiondispense` WRITE;
/*!40000 ALTER TABLE `pcu_prescriptiondispense` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcu_prescriptiondispense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_prescriptionitems`
--

DROP TABLE IF EXISTS `pcu_prescriptionitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_prescriptionitems` (
  `prescription_id` int(11) NOT NULL DEFAULT '0',
  `s_number` int(11) NOT NULL DEFAULT '0',
  `period_in_hours` float DEFAULT NULL,
  `frequency_of_drug` float DEFAULT NULL,
  `quanity` float DEFAULT NULL,
  `started_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`prescription_id`,`s_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_prescriptionitems`
--

LOCK TABLES `pcu_prescriptionitems` WRITE;
/*!40000 ALTER TABLE `pcu_prescriptionitems` DISABLE KEYS */;
INSERT INTO `pcu_prescriptionitems` VALUES (1,1,2,2,2,'2014-08-14','2014-08-15','DISPENSED'),(2,2,2,2,1,'2014-08-20','2014-08-30','pending'),(2,3,2,2,4,'2014-08-27','2014-08-20','pending'),(4,2,2,3,1,'2014-08-12','2014-08-28','pending');
/*!40000 ALTER TABLE `pcu_prescriptionitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcu_requesteditems`
--

DROP TABLE IF EXISTS `pcu_requesteditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcu_requesteditems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_number` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `requested_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `s_number_UNIQUE` (`s_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcu_requesteditems`
--

LOCK TABLES `pcu_requesteditems` WRITE;
/*!40000 ALTER TABLE `pcu_requesteditems` DISABLE KEYS */;
INSERT INTO `pcu_requesteditems` VALUES (1,1,100,3,'2014-08-21','PENDING'),(2,2,100,1,'2014-08-26','PENDING'),(3,3,100,0,'2014-08-26','PENDING');
/*!40000 ALTER TABLE `pcu_requesteditems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pcu_viewinventory`
--

DROP TABLE IF EXISTS `pcu_viewinventory`;
/*!50001 DROP VIEW IF EXISTS `pcu_viewinventory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pcu_viewinventory` AS SELECT 
 1 AS `s_number`,
 1 AS `name`,
 1 AS `remark`,
 1 AS `last_stock_recieved`,
 1 AS `reorder_level`,
 1 AS `tot_qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pharm_asst_stock`
--

DROP TABLE IF EXISTS `pharm_asst_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_asst_stock` (
  `drug_srno` int(11) NOT NULL,
  `drug_name` varchar(500) NOT NULL,
  `drugQty` int(5) NOT NULL,
  `requestedUserID` int(3) DEFAULT NULL,
  `updatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`drug_srno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_asst_stock`
--

LOCK TABLES `pharm_asst_stock` WRITE;
/*!40000 ALTER TABLE `pharm_asst_stock` DISABLE KEYS */;
INSERT INTO `pharm_asst_stock` VALUES (1,'Methyldopa',0,4,'2016-07-27 06:49:54'),(2,'Captopril',630,4,'2017-05-04 09:05:37'),(12,'Asprin',304,4,'2017-06-14 06:21:05'),(67,'adasd 200ml',100,4,'2017-06-09 05:17:13');
/*!40000 ALTER TABLE `pharm_asst_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_department`
--

DROP TABLE IF EXISTS `pharm_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_department` (
  `department_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_department`
--

LOCK TABLES `pharm_department` WRITE;
/*!40000 ALTER TABLE `pharm_department` DISABLE KEYS */;
INSERT INTO `pharm_department` VALUES ('Clinic Pharmacy'),('IPD Pharmacy'),('LAB Pharmacy'),('OPD Pharmacy');
/*!40000 ALTER TABLE `pharm_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_dispensedrug`
--

DROP TABLE IF EXISTS `pharm_dispensedrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_dispensedrug` (
  `dispense_drugs_id` int(11) NOT NULL AUTO_INCREMENT,
  `dispense_drugs_srno` int(11) NOT NULL,
  `dispense_drugs_name` varchar(500) NOT NULL,
  `dispense_drugs_batchno` varchar(500) NOT NULL DEFAULT '',
  `dispense_drugs_userid` int(11) NOT NULL,
  `dispense_drugs_dispensedate` datetime DEFAULT NULL,
  `dispense_drugs_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`dispense_drugs_id`),
  KEY `FK_3gi09fgst6pj957ks414p3cct` (`dispense_drugs_srno`),
  CONSTRAINT `FK_3gi09fgst6pj957ks414p3cct` FOREIGN KEY (`dispense_drugs_srno`) REFERENCES `pharm_drug` (`drug_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_dispensedrug`
--

LOCK TABLES `pharm_dispensedrug` WRITE;
/*!40000 ALTER TABLE `pharm_dispensedrug` DISABLE KEYS */;
INSERT INTO `pharm_dispensedrug` VALUES (26,2,'Captopril','',4,'2015-06-29 10:33:13',8),(27,2,'Captopril','',4,'2015-06-29 10:41:12',4),(28,12,'Asprin','',4,'2015-06-29 10:41:42',1),(29,12,'Asprin','',4,'2015-06-29 10:50:52',4),(30,1,'Methyldopa','',4,'2015-07-10 10:01:43',0),(31,2,'Captopril','',1,'2015-07-11 11:04:58',0),(32,1,'Methyldopa','',4,'2015-07-11 12:37:28',1),(33,2,'Captopril','',1,'2015-07-11 14:35:48',4),(34,2,'Captopril','',4,'2015-07-18 11:23:36',0),(35,1,'Methyldopa','',2,'2015-07-21 14:19:32',16),(36,1,'Methyldopa','',4,'2015-07-23 13:35:01',20),(37,1,'Methyldopa','',4,'2015-07-30 10:21:18',4),(38,12,'Asprin','',4,'2015-07-30 11:05:33',0),(39,1,'Methyldopa','',4,'2015-07-30 11:05:33',16),(40,1,'Methyldopa','',4,'2015-07-30 14:10:40',8),(41,1,'Methyldopa','',4,'2016-07-25 13:39:17',0),(42,1,'Methyldopa','',4,'2016-07-27 12:19:54',0),(55,2,'Captopril','',4,'2017-05-04 14:35:37',12),(56,67,'adasd 200ml','',4,'2017-05-17 10:43:03',10),(57,67,'adasd 200ml','',4,'2017-05-17 10:50:01',10),(58,67,'adasd 200ml','',4,'2017-05-17 10:53:19',10),(59,67,'adasd 200ml','',4,'2017-05-17 11:06:59',10),(60,67,'adasd 200ml','',4,'2017-05-17 11:15:50',10),(61,67,'adasd 200ml','',4,'2017-05-17 11:20:42',10),(62,67,'adasd 200ml','',4,'2017-05-17 11:23:21',10),(63,67,'adasd 200ml','',4,'2017-05-17 11:26:25',10),(64,67,'adasd 200ml','',4,'2017-05-18 09:58:27',10),(65,67,'adasd 200ml','',4,'2017-05-18 09:59:45',24),(66,67,'adasd 200ml','',4,'2017-05-18 12:59:32',24),(67,67,'adasd 200ml','',4,'2017-05-22 14:59:17',40),(68,67,'adasd 200ml','',4,'2017-05-22 15:13:21',40),(69,12,'Asprin','',4,'2017-05-23 10:14:40',4),(70,12,'Asprin','',4,'2017-05-23 10:32:12',4),(71,12,'Asprin','',4,'2017-05-23 10:40:19',20),(72,67,'adasd 200ml','',4,'2017-06-09 10:43:26',18),(73,67,'adasd 200ml','',4,'2017-06-09 10:47:00',18),(74,67,'adasd 200ml','',4,'2017-06-09 10:47:13',6),(75,12,'Asprin','',4,'2017-06-14 11:51:05',8);
/*!40000 ALTER TABLE `pharm_dispensedrug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_dosage`
--

DROP TABLE IF EXISTS `pharm_dosage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_dosage` (
  `dosage_id` int(11) NOT NULL AUTO_INCREMENT,
  `dosage` varchar(50) NOT NULL,
  `dosage_status` int(11) NOT NULL,
  PRIMARY KEY (`dosage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_dosage`
--

LOCK TABLES `pharm_dosage` WRITE;
/*!40000 ALTER TABLE `pharm_dosage` DISABLE KEYS */;
INSERT INTO `pharm_dosage` VALUES (1,'1',0),(2,'1',0),(3,'2',0),(4,'3',1),(5,'1/2',0),(6,'5',0),(7,'1 ml',0),(8,'1.5 ml',0),(9,'2 ml',0),(10,'2.5 ml',0),(11,'4 ml',0),(12,'5 ml',0),(13,'7.5 ml',0),(14,'10 ml',0);
/*!40000 ALTER TABLE `pharm_dosage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_drug`
--

DROP TABLE IF EXISTS `pharm_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_drug` (
  `drug_srno` int(11) NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(500) NOT NULL,
  `drug_remarks` varchar(500) NOT NULL,
  `drug_create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `drug_create_user` int(11) NOT NULL DEFAULT '2',
  `drug_lastupdate_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `drug_lastupdate_user` int(11) NOT NULL,
  `drug_active` tinyint(1) NOT NULL,
  `drug_unit` varchar(500) NOT NULL,
  `drug_categoryid` int(11) NOT NULL,
  `drug_price` double NOT NULL,
  `drug_quantity` int(11) NOT NULL,
  `drug_statusreorder` int(11) NOT NULL,
  `drug_statusdanger` int(11) NOT NULL,
  PRIMARY KEY (`drug_srno`),
  KEY `drug_categoryid` (`drug_categoryid`),
  KEY `FK_dp7xqvqbt9s7ps1rc9uu4v218` (`drug_categoryid`),
  CONSTRAINT `FK_dp7xqvqbt9s7ps1rc9uu4v218` FOREIGN KEY (`drug_categoryid`) REFERENCES `pharm_drugcategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_drug`
--

LOCK TABLES `pharm_drug` WRITE;
/*!40000 ALTER TABLE `pharm_drug` DISABLE KEYS */;
INSERT INTO `pharm_drug` VALUES (1,'Methyldopa','New Arrival','2013-07-11 06:05:34',1,'2016-07-27 06:49:54',4,1,'Tab',1,6,0,100,25),(2,'Captopril','','2014-11-16 05:50:53',2,'2017-05-04 09:05:15',4,1,'Tab',1,35,632,100,25),(3,'Panadol','New Arrival','2013-07-18 10:04:54',1,'2014-07-27 15:41:32',4,1,'Tab',1,1.73,1807,100,25),(5,'Pindolol Tablet 5mg','New Arrival','2013-07-19 06:23:28',1,'2013-08-20 18:30:00',1,1,'Tab',1,6.7,400,100,25),(6,'Propranolol Tablet 10mg','New Arrival','2013-07-19 06:26:21',1,'2014-08-26 04:53:40',4,1,'Tab',1,0.1568,20,100,25),(7,'Enalapril','New Arrival','2013-07-31 12:36:55',1,'2013-08-29 18:30:00',1,1,'Tab',1,12,0,100,25),(8,'Afrin','','2014-11-17 05:26:51',2,'2014-11-17 05:26:51',2,1,'Amp',2,31.1,0,200,25),(11,' Ampicillin ','ftdt','2016-07-25 08:06:02',2,'2016-07-25 08:06:02',2,1,'Spray',1,130,34,1000,500),(12,'Asprin','','2013-08-18 17:30:54',0,'2017-06-14 06:21:05',4,0,'Tab',1,123,1840,500,100),(13,' Ampicillin 250mg','New','2013-08-20 11:31:43',0,'2014-09-09 11:14:00',0,0,'Amp',1,13,2000,3000,200),(14,' Ampicillin 250mg','New Arrival','2013-08-22 04:21:59',0,'2014-09-09 11:14:00',0,0,'Cap',1,10,0,1000,200),(15,'Asprin 500mg','','2014-11-16 05:49:03',2,'2014-11-16 05:49:03',2,0,'Spray',1,200,0,32,20),(16,'Losartan','New','2013-08-22 07:24:16',1,'2013-08-22 07:24:16',0,0,'Tab',1,10,0,1000,200),(17,'Metformin 50mg','New','2013-08-22 07:27:54',1,'2013-08-22 07:27:54',0,0,'Tab',1,10,2000,1000,200),(20,'Metformin 25mg','New','2013-08-22 07:55:29',1,'2013-08-22 07:55:29',0,0,'Tab',1,20,0,3000,300),(21,'Metformin 10mg','New','2013-08-22 08:18:36',1,'2013-08-22 08:18:36',0,0,'Tab',1,10,1000,2000,200),(22,'Atorvastatin 5mg','New','2013-08-22 09:11:41',1,'2013-08-22 09:11:41',0,0,'Tab',1,10,0,1000,400),(24,'Atorvastatin 10mg','New','2013-08-22 09:12:04',1,'2013-08-22 09:12:04',0,0,'Tab',1,10,0,1000,400),(38,'Afrin Test','','2013-10-29 09:36:38',5,'2014-08-26 10:14:21',4,0,'Amp',3,3.01,0,2000,200),(39,'Afrin Latest','New','2013-10-29 09:36:15',5,'2014-08-26 10:14:30',4,0,'Amp',3,5.01,884,1000,200),(48,'Pethidine hydrochloride Injection 50mg Ampoule','New','2014-11-20 10:37:31',2,'2014-11-20 10:37:31',0,0,'Amp',1,48.13,1000,1000,200),(49,'Pethidine Hydrochloride Injection 75mg Ampoule','New','2014-11-20 10:37:31',2,'2014-11-20 10:37:31',0,0,'Amp',1,91.99,20,1000,200),(50,'Acitretin (Soriatane) 50mg','','2014-11-20 10:37:58',2,'2014-11-20 10:37:58',2,0,'Tab',1,45.65,0,2000,200),(51,'Codeine Phosphate injection 60mg/ml','New','2014-11-20 10:37:31',2,'2014-11-20 10:37:31',0,0,'Amp',1,250,1200,1000,200),(52,'Fentanyl Injection 100mcg in 2ml Ampoule','','2016-07-25 08:06:36',2,'2016-07-25 08:06:36',2,0,'Amp',1,134.34,1500,1000,20000),(53,'Amlodipine Besylate tablet 5mg','','2016-07-25 08:06:47',2,'2016-07-25 08:06:47',2,0,'Tab',1,0.44,5000,1000,200999),(54,'Diltiazem tablet 30mg','New','2014-11-20 10:37:31',2,'2014-11-20 10:37:31',0,0,'Tab',1,0.4,1200,1000,200),(55,'Nifedipine Slow Release Tablet 20mg','New','2014-11-20 10:37:31',2,'2014-11-20 10:37:31',0,0,'Tab',1,0.13,2000,1000,200),(62,'test','test','2017-04-26 06:18:10',2,'2017-04-26 06:18:10',2,0,'test',1,10,0,50,10),(63,'test','test','2017-05-08 04:25:22',2,'2017-05-08 04:25:22',2,0,'tablet',1,10,0,50,10),(64,'asd','asd','2017-05-16 06:12:29',2,'2017-05-16 06:12:29',2,0,'Tab',1,122,0,122,1),(67,'adasd 200ml','asd','2017-05-16 09:25:15',2,'2017-06-09 05:17:13',4,0,'Liquid',1,2,150,50,12),(68,'Panadol_test','','2017-06-30 08:41:40',2,'2017-06-30 08:41:40',2,0,'Tablet',1,100,0,5,50),(69,'Asprin_test','N/A','2017-06-30 08:41:40',2,'2017-06-30 08:41:40',2,0,'Liquid',1,150,0,5,50),(70,'Panadol_test','','2017-06-30 08:41:53',2,'2017-06-30 08:41:53',2,0,'Tablet',1,100,0,5,50),(71,'Asprin_test','N/A','2017-06-30 08:41:53',2,'2017-06-30 08:41:53',2,0,'Liquid',1,150,0,5,50),(72,'Panadol_test','','2017-06-30 08:42:30',2,'2017-06-30 08:42:30',2,0,'Tablet',1,100,0,5,50),(73,'Asprin_test','N/A','2017-06-30 08:42:30',2,'2017-06-30 08:42:30',2,0,'Liquid',1,150,0,5,50);
/*!40000 ALTER TABLE `pharm_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_drugcategory`
--

DROP TABLE IF EXISTS `pharm_drugcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_drugcategory` (
  `category_id` int(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(500) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_drugcategory`
--

LOCK TABLES `pharm_drugcategory` WRITE;
/*!40000 ALTER TABLE `pharm_drugcategory` DISABLE KEYS */;
INSERT INTO `pharm_drugcategory` VALUES (1,'Narcotics'),(2,'Drugs used in the treatment of injections'),(3,'Drugs used in the treatment of Cardiovascular system'),(4,'Drugs acting on the central nervous system'),(5,'Drugs affecting nutrition & blood'),(6,'Drugs used in the treatment of diseases of the respiratory system'),(7,'Immunological product and vaccines'),(8,'Drugs used in the treatment of the endocrine system'),(9,'Drugs acting on the gastrointestinal system'),(10,'Drugs acting on eye');
/*!40000 ALTER TABLE `pharm_drugcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_drugdosage`
--

DROP TABLE IF EXISTS `pharm_drugdosage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_drugdosage` (
  `drugdosage_id` int(11) NOT NULL,
  `drugdosage_srno` int(11) NOT NULL,
  PRIMARY KEY (`drugdosage_id`,`drugdosage_srno`),
  KEY `FK_i0kbt8d3cc9oepqy71pjqmtco` (`drugdosage_id`),
  KEY `FK_huk8j2fqc4963r33d4dy3din7` (`drugdosage_srno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_drugdosage`
--

LOCK TABLES `pharm_drugdosage` WRITE;
/*!40000 ALTER TABLE `pharm_drugdosage` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharm_drugdosage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_drugfrequency`
--

DROP TABLE IF EXISTS `pharm_drugfrequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_drugfrequency` (
  `drugfrequency_id` int(11) NOT NULL,
  `drugfrequency_srno` int(11) NOT NULL,
  KEY `FK_hhvrufgfel8mui6y8yfukiru8` (`drugfrequency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_drugfrequency`
--

LOCK TABLES `pharm_drugfrequency` WRITE;
/*!40000 ALTER TABLE `pharm_drugfrequency` DISABLE KEYS */;
INSERT INTO `pharm_drugfrequency` VALUES (1,36),(3,16),(3,17),(2,20),(3,21),(2,22),(2,24),(2,25),(3,26),(3,27),(3,29),(3,30),(1,37);
/*!40000 ALTER TABLE `pharm_drugfrequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_drugmanufacturer`
--

DROP TABLE IF EXISTS `pharm_drugmanufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_drugmanufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`manufacturer_id`),
  UNIQUE KEY `UK_1ek0jyr42gekdsca0shecjhrn` (`manufacturer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_drugmanufacturer`
--

LOCK TABLES `pharm_drugmanufacturer` WRITE;
/*!40000 ALTER TABLE `pharm_drugmanufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharm_drugmanufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_drugrequests`
--

DROP TABLE IF EXISTS `pharm_drugrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_drugrequests` (
  `request_drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_drug_srno` int(11) NOT NULL,
  `request_drug_name` varchar(500) DEFAULT NULL,
  `request_drug_batchno` varchar(500) DEFAULT NULL,
  `request_drug_department` varchar(500) NOT NULL DEFAULT 'OPD Pharmacy',
  `request_drug_date` datetime DEFAULT NULL,
  `request_drug_process_date` datetime DEFAULT NULL,
  `request_drug_quantity` int(11) DEFAULT NULL,
  `request_drug_processed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`request_drug_id`),
  KEY `request_drug_srno` (`request_drug_srno`),
  KEY `FK_rel8b29v7nk7dhqhvtgri4rir` (`request_drug_srno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_drugrequests`
--

LOCK TABLES `pharm_drugrequests` WRITE;
/*!40000 ALTER TABLE `pharm_drugrequests` DISABLE KEYS */;
INSERT INTO `pharm_drugrequests` VALUES (1,67,NULL,NULL,'OPD Pharmacy','2017-05-17 10:13:18',NULL,100,1),(2,67,NULL,NULL,'OPD Pharmacy','2017-05-17 10:51:04',NULL,300,1),(3,67,NULL,NULL,'OPD Pharmacy','2017-05-17 10:52:15',NULL,100,1),(4,67,NULL,NULL,'OPD Pharmacy','2017-06-15 09:48:14',NULL,10,1),(5,67,NULL,NULL,'OPD Pharmacy','2017-06-15 09:53:18',NULL,14,1),(6,67,NULL,NULL,'OPD Pharmacy','2017-06-15 11:11:28',NULL,100,0);
/*!40000 ALTER TABLE `pharm_drugrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_drugssupplied`
--

DROP TABLE IF EXISTS `pharm_drugssupplied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_drugssupplied` (
  `drug_supplied_srno` int(11) NOT NULL,
  `drug_supplied_name` varchar(500) NOT NULL,
  `drug_supplied_batchno` varchar(500) NOT NULL,
  `drug_supplied_qty` int(11) DEFAULT NULL,
  `drug_supplied_manufactrure` varchar(500) DEFAULT NULL,
  `drug_supplied_manufact_date` datetime DEFAULT NULL,
  `drug_supplied_expirydate` datetime DEFAULT NULL,
  `drug_supplied_create_date` datetime DEFAULT NULL,
  `drug_supplied_create_user` int(11) DEFAULT NULL,
  `drug_supplied_lastupdate_date` datetime DEFAULT NULL,
  `drug_supplied_lastupdate_user` int(11) DEFAULT NULL,
  `drug_supplied_status` varchar(500) NOT NULL,
  PRIMARY KEY (`drug_supplied_srno`,`drug_supplied_batchno`),
  KEY `drug_supplied_srno` (`drug_supplied_srno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_drugssupplied`
--

LOCK TABLES `pharm_drugssupplied` WRITE;
/*!40000 ALTER TABLE `pharm_drugssupplied` DISABLE KEYS */;
INSERT INTO `pharm_drugssupplied` VALUES (1,'Methyldopa Tablet 250mg','B01',1000,'','2013-06-25 13:00:00','2013-07-26 11:37:03','2013-07-11 11:37:03',1,'2013-08-08 11:37:03',1,''),(1,'Methyldopa Tablet 250mg','B22',1200,'','2013-06-20 05:14:00','2014-06-20 11:37:03','2013-07-19 11:04:11',1,'2013-08-08 11:37:03',1,''),(1,'Methyldopa Tablet 250mg','B35',1000,'','2013-06-20 05:08:00','2014-06-30 11:37:03','2013-07-19 11:12:24',1,'2013-08-08 11:37:03',1,''),(2,'Captopril Tablet 25mg','B01',1000,'','2012-06-28 05:21:00','2013-07-25 11:37:03','2013-07-11 11:36:46',1,'2013-08-08 11:37:03',1,''),(2,'Captopril','b09',2,NULL,'2017-01-01 00:00:00','2017-01-01 00:00:00','2017-05-15 16:00:20',1,NULL,0,'Enabled'),(2,'Captopril Tablet 25mg','B22',1200,'','2013-06-20 05:24:00','2014-06-20 11:37:03','2013-07-19 11:01:20',1,'2013-08-08 11:37:03',1,''),(3,'Panadol','B06',1000,'','2012-06-28 06:15:00','2014-06-25 11:37:03','2013-07-19 11:24:57',1,'2013-08-08 11:37:03',1,''),(3,'Panadol','B07',1000,'','2012-06-28 10:15:00','2014-06-25 11:37:03','2013-07-19 11:28:02',1,'2013-08-08 11:37:03',1,''),(3,'Panadol','B08',1000,'','2012-06-28 07:14:00','2014-06-25 11:37:03','2013-07-19 11:35:07',1,'2013-08-08 11:37:03',1,''),(3,'Panadol','B09',1000,'','2012-06-28 08:18:00','2014-06-25 11:37:03','2013-07-19 11:37:41',1,'2013-08-08 11:37:03',1,''),(3,'Panadol','B10',1000,'','2012-06-28 05:25:00','2014-06-25 11:37:03','2013-07-19 11:48:30',1,'2013-08-08 11:37:03',1,''),(3,'Panadol','B1289',1000,'','2013-07-26 04:16:00','2013-11-15 11:37:03','2013-08-19 09:35:20',1,'2013-11-15 11:37:03',0,''),(5,'Pindolol Tablet 5mg','B02',1500,'','2013-06-25 11:37:03','2014-06-25 11:37:03','2013-07-19 12:03:15',1,'2013-08-08 11:37:03',1,''),(6,'Propranolol Tablet 10mg','B01',1000,'','2013-08-16 11:37:03','2013-08-31 11:37:03','2013-07-19 11:57:36',1,'2013-08-08 11:37:03',1,''),(6,'Propranolol Tablet 10mg','B11',1000,'','2013-06-17 11:37:03','2013-08-31 11:37:03','2013-07-24 15:50:19',1,'2013-08-08 11:37:03',1,''),(11,'Asprin','B01',1500,'','2013-08-15 11:37:03','2013-08-31 11:37:03','2013-08-11 15:26:52',1,'2017-05-08 10:40:15',1,''),(11,'Asprin','B05',8,NULL,'2013-12-29 00:00:00','2013-12-29 00:00:00','2014-11-18 09:57:37',1,NULL,0,'Enabled'),(11,'Asprin','S001',6,NULL,'2013-12-29 00:00:00','2013-12-29 00:00:00','2014-11-18 10:06:36',1,NULL,0,'Enabled'),(11,'Asprin','S004',8,NULL,'2013-12-29 00:00:00','2013-12-29 00:00:00','2014-11-18 10:15:51',1,NULL,0,'Enabled'),(12,'Asprin','b02',1000,NULL,'2017-01-01 00:00:00','2017-01-01 00:00:00','2017-05-08 10:45:48',1,NULL,0,'Enabled'),(13,'TestDrug100','B01',2000,'','2013-08-15 11:37:03','2013-08-15 11:37:03','2013-08-20 17:13:54',1,'2013-08-20 17:13:54',0,''),(17,'TestDrug20000','B10',2000,'','2013-04-20 11:37:03','2015-04-20 11:37:03','2013-08-22 13:13:29',1,'2013-08-20 17:13:54',0,''),(21,'NewDrug2','B01',1000,'','2013-04-10 11:37:03','2015-04-10 11:37:03','2013-08-22 13:49:14',1,'2013-08-20 17:13:54',0,''),(25,'TestDrug2015','B01',1000,'','2013-05-20 11:37:03','2014-05-20 00:00:00','2013-08-22 15:14:14',1,'2013-08-20 17:13:54',0,''),(26,'TestDrug2016','B01',2000,'','2013-06-10 00:00:00','2014-06-20 00:00:00','2013-08-22 15:21:09',1,'2013-08-20 17:13:54',0,''),(26,'TestDrug2016','B03',3000,'','2013-04-20 00:00:00','2014-04-20 00:00:00','2013-08-22 15:23:41',1,'2013-08-20 17:13:54',0,''),(30,'TestDrug2021','B02',2000,'','2013-06-20 00:00:00','2014-06-20 00:00:00','2013-08-22 15:27:15',1,'2013-08-20 17:13:54',0,''),(39,'Afrin Latest','B01',1000,'','2011-04-19 00:00:00','2015-06-28 00:00:00','2013-10-29 15:07:25',1,'2013-10-29 15:08:17',0,'Enabled'),(67,'adasd 200ml','B01',200,NULL,'2017-06-27 00:00:00','2018-06-27 00:00:00','2017-06-27 15:29:28',1,'2017-06-28 10:13:38',0,'Enabled');
/*!40000 ALTER TABLE `pharm_drugssupplied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_email`
--

DROP TABLE IF EXISTS `pharm_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_email` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_drug_id` int(11) NOT NULL,
  `email_content` text NOT NULL,
  `email_send_date` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  KEY `FK_27h82ug5u7eh6lurieyjpm4cc` (`email_drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_email`
--

LOCK TABLES `pharm_email` WRITE;
/*!40000 ALTER TABLE `pharm_email` DISABLE KEYS */;
INSERT INTO `pharm_email` VALUES (1,1,'                            \r\nDear Officer,\r\nThe Quantities of the below Drugs are Low.\r\nName     : Methyldopa\r\nCatagary :Narcotics\r\nPrice(Rs)    :6.0\r\nQuantity in Hand :0\r\nPlease be kind enough to send us new stocks\r\n\r\n\r\nBest Regards,\r\nChief Pharmasist\r\n                        ','2017-05-08 09:57:29'),(2,1,'                            \r\nDear Officer,\r\nThe Quantities of the below Drugs are Low.\r\nName     : Methyldopa\r\nCatagary :Narcotics\r\nPrice(Rs)    :6.0\r\nQuantity in Hand :0\r\nPlease be kind enough to send us new stocks\r\n\r\n\r\nBest Regards,\r\nChief Pharmasist\r\n                        ','2017-05-16 08:59:53'),(3,1,'                            \r\nDear Officer,\r\nThe Quantities of the below Drugs are Low.\r\nName     : Methyldopa\r\nCatagary :Narcotics\r\nPrice(Rs)    :6.0\r\nQuantity in Hand :0\r\nPlease be kind enough to send us new stocks\r\n\r\n\r\nBest Regards,\r\nChief Pharmasist\r\n                        ','2017-06-15 11:31:25');
/*!40000 ALTER TABLE `pharm_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharm_frequency`
--

DROP TABLE IF EXISTS `pharm_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharm_frequency` (
  `frequency_id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` varchar(500) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`frequency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharm_frequency`
--

LOCK TABLES `pharm_frequency` WRITE;
/*!40000 ALTER TABLE `pharm_frequency` DISABLE KEYS */;
INSERT INTO `pharm_frequency` VALUES (1,'o.d.','1'),(2,'bid','2'),(3,'t.d.s.','3'),(4,'q.d.s.','4'),(5,'5 Times a Day','5'),(6,'s.o.s.','-1'),(13,'t.i.w.','3/7'),(14,'8H','3'),(15,'6H','4'),(16,'mane.','1'),(17,'noct.','1');
/*!40000 ALTER TABLE `pharm_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment` (
  `TREATMENTID` int(11) NOT NULL AUTO_INCREMENT,
  `Treatment` longtext,
  `Remarks` longtext,
  `Type` longtext,
  `CreateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(200) DEFAULT NULL,
  `LastUpDate` datetime DEFAULT NULL,
  `LastUpDateUser` varchar(200) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`TREATMENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,'Dressing','','OPD',NULL,'Nisal De Silva',NULL,'',1),(2,'Shortwave diathermy','','OPD',NULL,'Nisal De Silva',NULL,'',1),(3,'Hot wax bath to hands','','OPD',NULL,'Nisal De Silva',NULL,'',1),(4,'Eye exercises','both eyes','OPD',NULL,'Nisal De Silva',NULL,'',1),(5,'Collect laboratory sample','','OPD',NULL,'Nisal De Silva',NULL,'',1),(6,'extraction','extract 45','OPD',NULL,'Nisal De Silva',NULL,'',1),(7,'Medication','','OPD',NULL,'Nisal De Silva',NULL,'',1),(8,'Baby feeding advice','','OPD',NULL,'Nisal De Silva',NULL,'',1);
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `village`
--

DROP TABLE IF EXISTS `village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `village` (
  `VGEID` int(11) NOT NULL AUTO_INCREMENT,
  `Province` varchar(50) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  `DSDivision` varchar(50) DEFAULT NULL,
  `GNDivision` varchar(50) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(200) DEFAULT NULL,
  `LastUpDate` datetime DEFAULT NULL,
  `LastUpDateUser` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`VGEID`)
) ENGINE=InnoDB AUTO_INCREMENT=13832 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `village`
--

LOCK TABLES `village` WRITE;
/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` VALUES (12189,NULL,'Kurunegala   ','Alawwa   ','Udakekulawala',1,NULL,NULL,NULL,NULL,NULL),(12190,NULL,'Galle   ','Ambalangoda   ','Udakerewa',1,NULL,NULL,NULL,NULL,NULL),(12191,NULL,'Badulla   ','Lunugala   ','Udakiruwa',1,NULL,NULL,NULL,NULL,NULL),(12192,NULL,'Badulla   ','Hali-Ela   ','Udakohovila',1,NULL,NULL,NULL,NULL,NULL),(12193,NULL,'Kurunegala   ','Mawathagama   ','Udakottamulla',1,NULL,NULL,NULL,NULL,NULL),(12194,NULL,'Kandy   ','Udadumbara   ','Udakumbura',1,NULL,NULL,NULL,NULL,NULL),(12195,NULL,'Kandy   ','Thumpane   ','Udalagama',1,NULL,NULL,NULL,NULL,NULL),(12196,NULL,'Galle   ','Nagoda   ','Udalamatta East',1,NULL,NULL,NULL,NULL,NULL),(12197,NULL,'Galle   ','Nagoda   ','Udalamatta North',1,NULL,NULL,NULL,NULL,NULL),(12198,NULL,'Galle   ','Nagoda   ','Udalamatta South',1,NULL,NULL,NULL,NULL,NULL),(12199,NULL,'Nuwara Eliya   ','Hanguranketha   ','Udalumada',1,NULL,NULL,NULL,NULL,NULL),(12200,NULL,'Nuwara Eliya   ','Walapane   ','Udamadura',1,NULL,NULL,NULL,NULL,NULL),(12201,NULL,'Nuwara Eliya   ','Walapane   ','Udamadura North',1,NULL,NULL,NULL,NULL,NULL),(12202,NULL,'Kandy   ','Pathahewaheta   ','Udamailapitiya North',1,NULL,NULL,NULL,NULL,NULL),(12203,NULL,'Kandy   ','Pathahewaheta   ','Udamailapitiya South',1,NULL,NULL,NULL,NULL,NULL),(12204,NULL,'Moneragala   ','Bibile   ','Udamallehewa',1,NULL,NULL,NULL,NULL,NULL),(12205,NULL,'Gampaha   ','Dompe   ','Udamapitigama',1,NULL,NULL,NULL,NULL,NULL),(12206,NULL,'Gampaha   ','Dompe   ','Udamapitigama South',1,NULL,NULL,NULL,NULL,NULL),(12207,NULL,'Gampaha   ','Attanagalla   ','Udammita',1,NULL,NULL,NULL,NULL,NULL),(12208,NULL,'Gampaha   ','Katana   ','Udammita North',1,NULL,NULL,NULL,NULL,NULL),(12209,NULL,'Gampaha   ','Katana   ','Udammita South',1,NULL,NULL,NULL,NULL,NULL),(12210,NULL,'Kandy   ','Harispattuwa   ','Udamulla',1,NULL,NULL,NULL,NULL,NULL),(12211,NULL,'Kurunegala   ','Mawathagama   ','Udanagama',1,NULL,NULL,NULL,NULL,NULL),(12212,NULL,'Ampara   ','Samanthurai   ','Udanga 01',1,NULL,NULL,NULL,NULL,NULL),(12213,NULL,'Ampara   ','Samanthurai   ','Udanga 02',1,NULL,NULL,NULL,NULL,NULL),(12214,NULL,'Matale   ','Ukuwela   ','Udangamuwa',1,NULL,NULL,NULL,NULL,NULL),(12215,NULL,'Gampaha   ','Katana   ','Udangawa',1,NULL,NULL,NULL,NULL,NULL),(12216,NULL,'Kurunegala   ','Ambanpola   ','Udangawa',1,NULL,NULL,NULL,NULL,NULL),(12217,NULL,'Kegalle   ','Rambukkana   ','Udanvita',1,NULL,NULL,NULL,NULL,NULL),(12218,NULL,'Badulla   ','Lunugala   ','Udapanguwa',1,NULL,NULL,NULL,NULL,NULL),(12219,NULL,'Badulla   ','Uva-Paranagama   ','Udaperuwa',1,NULL,NULL,NULL,NULL,NULL),(12220,NULL,'Badulla   ','Bandarawela   ','Udaperuwa',1,NULL,NULL,NULL,NULL,NULL),(12221,NULL,'Kandy   ','Udadumbara   ','Udapitawala',1,NULL,NULL,NULL,NULL,NULL),(12222,NULL,'Kandy   ','Thumpane   ','Udapitiya',1,NULL,NULL,NULL,NULL,NULL),(12223,NULL,'Kurunegala   ','Polgahawela   ','Udapola',1,NULL,NULL,NULL,NULL,NULL),(12224,NULL,'Kegalle   ','Deraniyagala   ','Udapola',1,NULL,NULL,NULL,NULL,NULL),(12225,NULL,'Kegalle   ','Bulathkohupitiya   ','Udapotha',1,NULL,NULL,NULL,NULL,NULL),(12226,NULL,'Puttalam   ','Mundalama   ','Udappuwa',1,NULL,NULL,NULL,NULL,NULL),(12227,NULL,'Puttalam   ','Mundalama   ','Udappuwa',1,NULL,NULL,NULL,NULL,NULL),(12228,NULL,'Nuwara Eliya   ','Walapane   ','Udapussellawa North',1,NULL,NULL,NULL,NULL,NULL),(12229,NULL,'Nuwara Eliya   ','Walapane   ','Udapussellawa South',1,NULL,NULL,NULL,NULL,NULL),(12230,NULL,'Ratnapura   ','Weligepola   ','Udaranwala',1,NULL,NULL,NULL,NULL,NULL),(12231,NULL,'Kandy   ','Yatinuwara   ','Udarathmeewala',1,NULL,NULL,NULL,NULL,NULL),(12232,NULL,'Matale   ','Yatawatta   ','Udasgiriya',1,NULL,NULL,NULL,NULL,NULL),(12233,NULL,'Puttalam   ','Wennappuwa   ','Udasirigama',1,NULL,NULL,NULL,NULL,NULL),(12234,NULL,'Kandy   ','Pathadumbara   ','Udathalavinna',1,NULL,NULL,NULL,NULL,NULL),(12235,NULL,'Kandy   ','Pathadumbara   ','Udathalavinna Madige',1,NULL,NULL,NULL,NULL,NULL),(12236,NULL,'Kurunegala   ','Ibbagamuwa   ','Udathammita',1,NULL,NULL,NULL,NULL,NULL),(12237,NULL,'Kandy   ','Medadumbara   ','Udathenna',1,NULL,NULL,NULL,NULL,NULL),(12238,NULL,'Matale   ','Ukuwela   ','Udathenna',1,NULL,NULL,NULL,NULL,NULL),(12239,NULL,'Ratnapura   ','Pelmadulla   ','Udathula',1,NULL,NULL,NULL,NULL,NULL),(12240,NULL,'Gampaha   ','Attanagalla   ','Udathuththiripitiya',1,NULL,NULL,NULL,NULL,NULL),(12241,NULL,'Kandy   ','Minipe   ','Udattawa',1,NULL,NULL,NULL,NULL,NULL),(12242,NULL,'Kandy   ','Minipe   ','Udattawa North',1,NULL,NULL,NULL,NULL,NULL),(12243,NULL,'Kegalle   ','Warakapola   ','Udawaka',1,NULL,NULL,NULL,NULL,NULL),(12244,NULL,'Ratnapura   ','Embilipitiya   ','Udawalawa',1,NULL,NULL,NULL,NULL,NULL),(12245,NULL,'Ratnapura   ','Embilipitiya   ','Udawalawa Track 2',1,NULL,NULL,NULL,NULL,NULL),(12246,NULL,'Nuwara Eliya   ','Hanguranketha   ','Udawatta East',1,NULL,NULL,NULL,NULL,NULL),(12247,NULL,'Nuwara Eliya   ','Hanguranketha   ','Udawatta Kumbura',1,NULL,NULL,NULL,NULL,NULL),(12248,NULL,'Nuwara Eliya   ','Hanguranketha   ','Udawatta North',1,NULL,NULL,NULL,NULL,NULL),(12249,NULL,'Nuwara Eliya   ','Hanguranketha   ','Udawatta West',1,NULL,NULL,NULL,NULL,NULL),(12250,NULL,'Gampaha   ','Mirigama   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12251,NULL,'Gampaha   ','Dompe   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12252,NULL,'Kalutara   ','Agalawatta   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12253,NULL,'Kandy   ','Udadumbara   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12254,NULL,'Kandy   ','Minipe   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12255,NULL,'Kandy   ','Medadumbara   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12256,NULL,'Nuwara Eliya   ','Hanguranketha   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12257,NULL,'Nuwara Eliya   ','Walapane   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12258,NULL,'Kurunegala   ','Ibbagamuwa   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12259,NULL,'Kurunegala   ','Bingiriya   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12260,NULL,'Badulla   ','Badulla   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12261,NULL,'Ratnapura   ','Opanayaka   ','Udawela',1,NULL,NULL,NULL,NULL,NULL),(12262,NULL,'Kandy   ','Yatinuwara   ','Udawela Nadithalawa',1,NULL,NULL,NULL,NULL,NULL),(12263,NULL,'Polonnaruwa   ','Thamankaduwa   ','Udawela New Town',1,NULL,NULL,NULL,NULL,NULL),(12264,NULL,'Kandy   ','Yatinuwara   ','Udawela Pahalagama',1,NULL,NULL,NULL,NULL,NULL),(12265,NULL,'Kandy   ','Yatinuwara   ','Udawela Pallemaditta',1,NULL,NULL,NULL,NULL,NULL),(12266,NULL,'Nuwara Eliya   ','Hanguranketha   ','Udawela Pathana',1,NULL,NULL,NULL,NULL,NULL),(12267,NULL,'Kurunegala   ','Narammala   ','Udawelawatta',1,NULL,NULL,NULL,NULL,NULL),(12268,NULL,'Kandy   ','Pathahewaheta   ','Udawelawatta Janapadaya',1,NULL,NULL,NULL,NULL,NULL),(12269,NULL,'Kandy   ','Akurana   ','Udaweliketiya',1,NULL,NULL,NULL,NULL,NULL),(12270,NULL,'Galle   ','Nagoda   ','Udawelivitithalawa',1,NULL,NULL,NULL,NULL,NULL),(12271,NULL,'Galle   ','Nagoda   ','Udawelivitithalawa East',1,NULL,NULL,NULL,NULL,NULL),(12272,NULL,'Galle   ','Nagoda   ','Udawelivitiya',1,NULL,NULL,NULL,NULL,NULL),(12273,NULL,'Galle   ','Nagoda   ','Udawelivitiya West',1,NULL,NULL,NULL,NULL,NULL),(12274,NULL,'Hambantota   ','Katuwana   ','Udawelmulla',1,NULL,NULL,NULL,NULL,NULL),(12275,NULL,'Kandy   ','Minipe   ','Udayagala',1,NULL,NULL,NULL,NULL,NULL),(12276,NULL,'Hambantota   ','Angunakolapelessa   ','Udayala',1,NULL,NULL,NULL,NULL,NULL),(12277,NULL,'Ampara   ','Uhana   ','Udayapura',1,NULL,NULL,NULL,NULL,NULL),(12278,NULL,'Mullaitivu   ','Puthukudiyiruppu   ','Udayarkattu',1,NULL,NULL,NULL,NULL,NULL),(12279,NULL,'Gampaha   ','Negombo   ','Udayarthoppuwa',1,NULL,NULL,NULL,NULL,NULL),(12280,NULL,'Gampaha   ','Negombo   ','Udayarthoppuwa South',1,NULL,NULL,NULL,NULL,NULL),(12281,NULL,'Hambantota   ','Thissamaharama   ','Uddhagandara',1,NULL,NULL,NULL,NULL,NULL),(12282,NULL,'Kurunegala   ','Kuliyapitiya West   ','Udihitimulla',1,NULL,NULL,NULL,NULL,NULL),(12283,NULL,'Kandy   ','Medadumbara   ','Udispattuwa',1,NULL,NULL,NULL,NULL,NULL),(12284,NULL,'Kandy   ','Udapalatha   ','Udovita',1,NULL,NULL,NULL,NULL,NULL),(12285,NULL,'Galle   ','Yakkalamulla   ','Udubettawa',1,NULL,NULL,NULL,NULL,NULL),(12286,NULL,'Galle   ','Yakkalamulla   ','Udubettawa West',1,NULL,NULL,NULL,NULL,NULL),(12287,NULL,'Kandy   ','Doluwa   ','Ududeniya',1,NULL,NULL,NULL,NULL,NULL),(12288,NULL,'Kandy   ','Pathahewaheta   ','Ududeniya',1,NULL,NULL,NULL,NULL,NULL),(12289,NULL,'Matale   ','Naula   ','Ududeniya',1,NULL,NULL,NULL,NULL,NULL),(12290,NULL,'Kandy   ','Pathahewaheta   ','Ududeniya Madihe',1,NULL,NULL,NULL,NULL,NULL),(12291,NULL,'Kalutara   ','Bulathsinhala   ','Udugahalakanda',1,NULL,NULL,NULL,NULL,NULL),(12292,NULL,'Ratnapura   ','Ayagama   ','Udugala',1,NULL,NULL,NULL,NULL,NULL),(12293,NULL,'Ratnapura   ','Ayagama   ','Udugala North',1,NULL,NULL,NULL,NULL,NULL),(12294,NULL,'Hambantota   ','Beliatta   ','Udugalmotegama',1,NULL,NULL,NULL,NULL,NULL),(12295,NULL,'Gampaha   ','Mirigama   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12296,NULL,'Gampaha   ','Dompe   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12297,NULL,'Kalutara   ','Walallavita   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12298,NULL,'Matale   ','Matale   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12299,NULL,'Galle   ','Nagoda   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12300,NULL,'Kurunegala   ','Weerambugedara   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12301,NULL,'Kurunegala   ','Pannala   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12302,NULL,'Kegalle   ','Rambukkana   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12303,NULL,'Kegalle   ','Galigamuwa   ','Udugama',1,NULL,NULL,NULL,NULL,NULL),(12304,NULL,'Galle   ','Nagoda   ','Udugama Central',1,NULL,NULL,NULL,NULL,NULL),(12305,NULL,'Galle   ','Nagoda   ','Udugama East',1,NULL,NULL,NULL,NULL,NULL),(12306,NULL,'Kegalle   ','Rambukkana   ','Udugama Gondewala',1,NULL,NULL,NULL,NULL,NULL),(12307,NULL,'Galle   ','Nagoda   ','Udugama North',1,NULL,NULL,NULL,NULL,NULL),(12308,NULL,'Galle   ','Nagoda   ','Udugama South',1,NULL,NULL,NULL,NULL,NULL),(12309,NULL,'Galle   ','Nagoda   ','Udugama West',1,NULL,NULL,NULL,NULL,NULL),(12310,NULL,'Kurunegala   ','Katupotha   ','Udugampolagedara',1,NULL,NULL,NULL,NULL,NULL),(12311,NULL,'Gampaha   ','Attanagalla   ','Udugoda',1,NULL,NULL,NULL,NULL,NULL),(12312,NULL,'Kandy   ','Panvila   ','Udugoda',1,NULL,NULL,NULL,NULL,NULL),(12313,NULL,'Gampaha   ','Attanagalla   ','Udugoda West',1,NULL,NULL,NULL,NULL,NULL),(12314,NULL,'Galle   ','Hikkaduwa   ','Uduhalpitiya',1,NULL,NULL,NULL,NULL,NULL),(12315,NULL,'Badulla   ','Uva-Paranagama   ','Uduhawara',1,NULL,NULL,NULL,NULL,NULL),(12316,NULL,'Matara   ','Welipitiya   ','Udukawa North',1,NULL,NULL,NULL,NULL,NULL),(12317,NULL,'Matara   ','Welipitiya   ','Udukawa South',1,NULL,NULL,NULL,NULL,NULL),(12318,NULL,'Kurunegala   ','Polgahawela   ','Udukedeniya',1,NULL,NULL,NULL,NULL,NULL),(12319,NULL,'Hambantota   ','Weeraketiya   ','Udukirivila',1,NULL,NULL,NULL,NULL,NULL),(12320,NULL,'Badulla   ','Ella   ','Udukumbalwela',1,NULL,NULL,NULL,NULL,NULL),(12321,NULL,'Kegalle   ','Kegalle   ','Udumagama',1,NULL,NULL,NULL,NULL,NULL),(12322,NULL,'Galle   ','Yakkalamulla   ','Udumalagala',1,NULL,NULL,NULL,NULL,NULL),(12323,NULL,'Ratnapura   ','Eheliyagoda   ','Udumatta',1,NULL,NULL,NULL,NULL,NULL),(12324,NULL,'Colombo   ','Kaduwela   ','Udumulla',1,NULL,NULL,NULL,NULL,NULL),(12325,NULL,'Colombo   ','Padukka   ','Udumulla',1,NULL,NULL,NULL,NULL,NULL),(12326,NULL,'Galle   ','Hikkaduwa   ','Udumulla',1,NULL,NULL,NULL,NULL,NULL),(12327,NULL,'Moneragala   ','Madulla   ','Udumulla',1,NULL,NULL,NULL,NULL,NULL),(12328,NULL,'Colombo   ','Kolonnawa   ','Udumulla North',1,NULL,NULL,NULL,NULL,NULL),(12329,NULL,'Colombo   ','Kolonnawa   ','Udumulla South',1,NULL,NULL,NULL,NULL,NULL),(12330,NULL,'Kurunegala   ','Rasnayakapura   ','Udunowa',1,NULL,NULL,NULL,NULL,NULL),(12331,NULL,'Badulla   ','Welimada   ','Udupeella',1,NULL,NULL,NULL,NULL,NULL),(12332,NULL,'Matara   ','Hakmana   ','Udupeellegoda East',1,NULL,NULL,NULL,NULL,NULL),(12333,NULL,'Matara   ','Hakmana   ','Udupeellegoda West',1,NULL,NULL,NULL,NULL,NULL),(12334,NULL,'Jaffna   ','Vadamaradchi South-West (Karaveddy)   ','Udupiddy',1,NULL,NULL,NULL,NULL,NULL),(12335,NULL,'Jaffna   ','Vadamaradchi South-West (Karaveddy)   ','Udupiddy North',1,NULL,NULL,NULL,NULL,NULL),(12336,NULL,'Jaffna   ','Vadamaradchi South-West (Karaveddy)   ','Udupiddy South',1,NULL,NULL,NULL,NULL,NULL),(12337,NULL,'Matale   ','Ukuwela   ','Udupihilla',1,NULL,NULL,NULL,NULL,NULL),(12338,NULL,'Gampaha   ','Mahara   ','Udupila East',1,NULL,NULL,NULL,NULL,NULL),(12339,NULL,'Gampaha   ','Mahara   ','Udupila North',1,NULL,NULL,NULL,NULL,NULL),(12340,NULL,'Gampaha   ','Mahara   ','Udupila South',1,NULL,NULL,NULL,NULL,NULL),(12341,NULL,'Matale   ','Ukuwela   ','Udupitiya',1,NULL,NULL,NULL,NULL,NULL),(12342,NULL,'Matara   ','Akuressa   ','Udupitiya',1,NULL,NULL,NULL,NULL,NULL),(12343,NULL,'Matale   ','Pallepola   ','Udurampelessa',1,NULL,NULL,NULL,NULL,NULL),(12344,NULL,'Kandy   ','Pathadumbara   ','Udurawana',1,NULL,NULL,NULL,NULL,NULL),(12345,NULL,'Jaffna   ','Vadamaradchi East (Maruthnkerny)   ','Uduthurai',1,NULL,NULL,NULL,NULL,NULL),(12346,NULL,'Gampaha   ','Mirigama   ','Uduulla',1,NULL,NULL,NULL,NULL,NULL),(12347,NULL,'Jaffna   ','Valikamam South (Uduvil)   ','Uduvil Centre',1,NULL,NULL,NULL,NULL,NULL),(12348,NULL,'Jaffna   ','Valikamam South (Uduvil)   ','Uduvil Centre North',1,NULL,NULL,NULL,NULL,NULL),(12349,NULL,'Jaffna   ','Valikamam South (Uduvil)   ','Uduvil North',1,NULL,NULL,NULL,NULL,NULL),(12350,NULL,'Jaffna   ','Valikamam South (Uduvil)   ','Uduvil South  East',1,NULL,NULL,NULL,NULL,NULL),(12351,NULL,'Jaffna   ','Valikamam South (Uduvil)   ','Uduvil South West',1,NULL,NULL,NULL,NULL,NULL),(12352,NULL,'Hambantota   ','Thissamaharama   ','Uduvila',1,NULL,NULL,NULL,NULL,NULL),(12353,NULL,'Hambantota   ','Tangalle   ','Uduvilagoda',1,NULL,NULL,NULL,NULL,NULL),(12354,NULL,'Kandy   ','Thumpane   ','Uduwa',1,NULL,NULL,NULL,NULL,NULL),(12355,NULL,'Kegalle   ','Bulathkohupitiya   ','Uduwa',1,NULL,NULL,NULL,NULL,NULL),(12356,NULL,'Matara   ','Thihagoda   ','Uduwa East',1,NULL,NULL,NULL,NULL,NULL),(12357,NULL,'Kalutara   ','Horana   ','Uduwa North',1,NULL,NULL,NULL,NULL,NULL),(12358,NULL,'Kalutara   ','Horana   ','Uduwa South',1,NULL,NULL,NULL,NULL,NULL),(12359,NULL,'Matara   ','Thihagoda   ','Uduwa West',1,NULL,NULL,NULL,NULL,NULL),(12360,NULL,'Ratnapura   ','Eheliyagoda   ','Uduwaka',1,NULL,NULL,NULL,NULL,NULL),(12361,NULL,'Colombo   ','Homagama   ','Uduwana',1,NULL,NULL,NULL,NULL,NULL),(12362,NULL,'Badulla   ','Hali-Ela   ','Uduwara',1,NULL,NULL,NULL,NULL,NULL),(12363,NULL,'Kalutara   ','Millaniya   ','Uduwara East',1,NULL,NULL,NULL,NULL,NULL),(12364,NULL,'Kalutara   ','Millaniya   ','Uduwara North',1,NULL,NULL,NULL,NULL,NULL),(12365,NULL,'Kalutara   ','Millaniya   ','Uduwara South',1,NULL,NULL,NULL,NULL,NULL),(12366,NULL,'Kalutara   ','Millaniya   ','Uduwara West',1,NULL,NULL,NULL,NULL,NULL),(12367,NULL,'Galle   ','Hikkaduwa   ','Uduwaragoda North',1,NULL,NULL,NULL,NULL,NULL),(12368,NULL,'Galle   ','Hikkaduwa   ','Uduwaragoda South',1,NULL,NULL,NULL,NULL,NULL),(12369,NULL,'Kandy   ','Harispattuwa   ','Uduwawala East',1,NULL,NULL,NULL,NULL,NULL),(12370,NULL,'Kandy   ','Harispattuwa   ','Uduwawala North',1,NULL,NULL,NULL,NULL,NULL),(12371,NULL,'Kandy   ','Harispattuwa   ','Uduwawala West',1,NULL,NULL,NULL,NULL,NULL),(12372,NULL,'Kandy   ','Pathahewaheta   ','Uduwela Pallegama East',1,NULL,NULL,NULL,NULL,NULL),(12373,NULL,'Kandy   ','Pathahewaheta   ','Uduwela Pallegama South',1,NULL,NULL,NULL,NULL,NULL),(12374,NULL,'Kandy   ','Pathahewaheta   ','Uduwela Pallegama West',1,NULL,NULL,NULL,NULL,NULL),(12375,NULL,'Kandy   ','Pathahewaheta   ','Uduwela Udagama East',1,NULL,NULL,NULL,NULL,NULL),(12376,NULL,'Kandy   ','Pathahewaheta   ','Uduwela Udagama West',1,NULL,NULL,NULL,NULL,NULL),(12377,NULL,'Kandy   ','Ganga Ihala Korale   ','Uduwella',1,NULL,NULL,NULL,NULL,NULL),(12378,NULL,'Galle   ','Yakkalamulla   ','Uduwella',1,NULL,NULL,NULL,NULL,NULL),(12379,NULL,'Matale   ','Wilgamuwa   ','Uduwelwala',1,NULL,NULL,NULL,NULL,NULL),(12380,NULL,'Kurunegala   ','Mahawa   ','Uduweriya',1,NULL,NULL,NULL,NULL,NULL),(12381,NULL,'Kegalle   ','Aranayaka   ','Uduwewala',1,NULL,NULL,NULL,NULL,NULL),(12382,NULL,'Kegalle   ','Dehiovita   ','Uduwila',1,NULL,NULL,NULL,NULL,NULL),(12383,NULL,'Colombo   ','Dehiwala-Mount Lavinia   ','Udyanaya',1,NULL,NULL,NULL,NULL,NULL),(12384,NULL,'Kandy   ','Akurana   ','Uggala',1,NULL,NULL,NULL,NULL,NULL),(12385,NULL,'Kandy   ','Poojapitiya   ','Uggala Janapadaya',1,NULL,NULL,NULL,NULL,NULL),(12386,NULL,'Kalutara   ','Kalutara   ','Uggalbada East',1,NULL,NULL,NULL,NULL,NULL),(12387,NULL,'Kalutara   ','Kalutara   ','Uggalbada West',1,NULL,NULL,NULL,NULL,NULL),(12388,NULL,'Gampaha   ','Minuwangoda   ','Uggalboda',1,NULL,NULL,NULL,NULL,NULL),(12389,NULL,'Gampaha   ','Minuwangoda   ','Uggalboda West',1,NULL,NULL,NULL,NULL,NULL),(12390,NULL,'Ratnapura   ','Balangoda   ','Uggalkalthota Left Bank',1,NULL,NULL,NULL,NULL,NULL),(12391,NULL,'Ratnapura   ','Balangoda   ','Uggalkalthota Left Bank South',1,NULL,NULL,NULL,NULL,NULL),(12392,NULL,'Colombo   ','Padukka   ','Uggalla',1,NULL,NULL,NULL,NULL,NULL),(12393,NULL,'Kandy   ','Harispattuwa   ','Uggalla',1,NULL,NULL,NULL,NULL,NULL),(12394,NULL,'Kurunegala   ','Mawathagama   ','Uggalpaya',1,NULL,NULL,NULL,NULL,NULL),(12395,NULL,'Matara   ','Athuraliya   ','Uggashena',1,NULL,NULL,NULL,NULL,NULL),(12396,NULL,'Kandy   ','Harispattuwa   ','Uguressapitiya',1,NULL,NULL,NULL,NULL,NULL),(12397,NULL,'Ampara   ','Uhana   ','Uhana',1,NULL,NULL,NULL,NULL,NULL),(12398,NULL,'Ampara   ','Uhana   ','Uhana Thissapura East',1,NULL,NULL,NULL,NULL,NULL),(12399,NULL,'Ampara   ','Uhana   ','Uhana Thissapura West',1,NULL,NULL,NULL,NULL,NULL),(12400,NULL,'Galle   ','Niyagama   ','Uhanovita',1,NULL,NULL,NULL,NULL,NULL),(12401,NULL,'Hambantota   ','Ambalantota   ','Uhapitagoda',1,NULL,NULL,NULL,NULL,NULL),(12402,NULL,'Kurunegala   ','Weerambugedara   ','Uhumeeya',1,NULL,NULL,NULL,NULL,NULL),(12403,NULL,'Kandy   ','Poojapitiya   ','Ukgahakumbura',1,NULL,NULL,NULL,NULL,NULL),(12404,NULL,'Anuradhapura   ','Mihinthale   ','Ukkulankulama',1,NULL,NULL,NULL,NULL,NULL),(12405,NULL,'Galle   ','Nagoda   ','Ukovita',1,NULL,NULL,NULL,NULL,NULL),(12406,NULL,'Galle   ','Nagoda   ','Ukovita North',1,NULL,NULL,NULL,NULL,NULL),(12407,NULL,'Ampara   ','Damana   ','Uksiripura',1,NULL,NULL,NULL,NULL,NULL),(12408,NULL,'Nuwara Eliya   ','Walapane   ','Ukuthule',1,NULL,NULL,NULL,NULL,NULL),(12409,NULL,'Nuwara Eliya   ','Walapane   ','Ukuthule East',1,NULL,NULL,NULL,NULL,NULL),(12410,NULL,'Matale   ','Ukuwela   ','Ukuwela',1,NULL,NULL,NULL,NULL,NULL),(12411,NULL,'Colombo   ','Hanwella   ','Ukwatta',1,NULL,NULL,NULL,NULL,NULL),(12412,NULL,'Kalutara   ','Dodangoda   ','Ukwatta',1,NULL,NULL,NULL,NULL,NULL),(12413,NULL,'Galle   ','Galle Four Gravets   ','Ukwatta East',1,NULL,NULL,NULL,NULL,NULL),(12414,NULL,'Galle   ','Galle Four Gravets   ','Ukwatta West',1,NULL,NULL,NULL,NULL,NULL),(12415,NULL,'Gampaha   ','Biyagama   ','Ulahitiwala',1,NULL,NULL,NULL,NULL,NULL),(12416,NULL,'Hambantota   ','Katuwana   ','Ulahitiyawa',1,NULL,NULL,NULL,NULL,NULL),(12417,NULL,'Hambantota   ','Katuwana   ','Ulahitiyawa East',1,NULL,NULL,NULL,NULL,NULL),(12418,NULL,'Hambantota   ','Katuwana   ','Ulahitiyawa West',1,NULL,NULL,NULL,NULL,NULL),(12419,NULL,'Kandy   ','Ganga Ihala Korale   ','Ulapane North',1,NULL,NULL,NULL,NULL,NULL),(12420,NULL,'Kandy   ','Ganga Ihala Korale   ','Ulapane South',1,NULL,NULL,NULL,NULL,NULL),(12421,NULL,'Badulla   ','Mahiyanganaya   ','Ulhitiya',1,NULL,NULL,NULL,NULL,NULL),(12422,NULL,'Puttalam   ','Wennappuwa   ','Ulhitiyawa North',1,NULL,NULL,NULL,NULL,NULL),(12423,NULL,'Puttalam   ','Wennappuwa   ','Ulhitiyawa South',1,NULL,NULL,NULL,NULL,NULL),(12424,NULL,'Puttalam   ','Wennappuwa   ','Ulhitiyawa West',1,NULL,NULL,NULL,NULL,NULL),(12425,NULL,'Polonnaruwa   ','Hingurakgoda   ','Ulkatupotha',1,NULL,NULL,NULL,NULL,NULL),(12426,NULL,'Kandy   ','Harispattuwa   ','Ulladupitiya East',1,NULL,NULL,NULL,NULL,NULL),(12427,NULL,'Kandy   ','Harispattuwa   ','Ulladupitiya West',1,NULL,NULL,NULL,NULL,NULL),(12428,NULL,'Matara   ','Kamburupitiya   ','Ullala East',1,NULL,NULL,NULL,NULL,NULL),(12429,NULL,'Matara   ','Kamburupitiya   ','Ullala Masmulla',1,NULL,NULL,NULL,NULL,NULL),(12430,NULL,'Matara   ','Kamburupitiya   ','Ullala West',1,NULL,NULL,NULL,NULL,NULL),(12431,NULL,'Kurunegala   ','Mahawa   ','Ullalapola',1,NULL,NULL,NULL,NULL,NULL),(12432,NULL,'Gampaha   ','Divulapitiya   ','Ullapola East',1,NULL,NULL,NULL,NULL,NULL),(12433,NULL,'Gampaha   ','Divulapitiya   ','Ullapola West',1,NULL,NULL,NULL,NULL,NULL),(12434,NULL,'Ratnapura   ','Kolonna   ','Ullinduwawa',1,NULL,NULL,NULL,NULL,NULL),(12435,NULL,'Kurunegala   ','Galgamuwa   ','Ulpathagama',1,NULL,NULL,NULL,NULL,NULL),(12436,NULL,'Anuradhapura   ','Palagala   ','Ulpathagama',1,NULL,NULL,NULL,NULL,NULL),(12437,NULL,'Kandy   ','Kandy Four Gravets and Gangawata Korale   ','Ulpathakumbura',1,NULL,NULL,NULL,NULL,NULL),(12438,NULL,'Matale   ','Rattota   ','Ulpathapitiya',1,NULL,NULL,NULL,NULL,NULL),(12439,NULL,'Matale   ','Ukuwela   ','Ulpathapitiya',1,NULL,NULL,NULL,NULL,NULL),(12440,NULL,'Anuradhapura   ','Galenbindunuwewa   ','Ulpathgama',1,NULL,NULL,NULL,NULL,NULL),(12441,NULL,'Polonnaruwa   ','Hingurakgoda   ','Ulpathwewa',1,NULL,NULL,NULL,NULL,NULL),(12442,NULL,'Polonnaruwa   ','Dimbulagala   ','Ulpathwewa',1,NULL,NULL,NULL,NULL,NULL),(12443,NULL,'Kandy   ','Minipe   ','Ulpothagama',1,NULL,NULL,NULL,NULL,NULL),(12444,NULL,'Badulla   ','Uva-Paranagama   ','Ulugala',1,NULL,NULL,NULL,NULL,NULL),(12445,NULL,'Moneragala   ','Buttala   ','Ulugala',1,NULL,NULL,NULL,NULL,NULL),(12446,NULL,'Anuradhapura   ','Nuwaragam Palatha Central   ','Ulukkulama',1,NULL,NULL,NULL,NULL,NULL),(12447,NULL,'Ratnapura   ','Imbulpe   ','Ulupitiya',1,NULL,NULL,NULL,NULL,NULL),(12448,NULL,'Galle   ','Bope-Poddala   ','Uluvitike',1,NULL,NULL,NULL,NULL,NULL),(12449,NULL,'Badulla   ','Uva-Paranagama   ','Uma Ela',1,NULL,NULL,NULL,NULL,NULL),(12450,NULL,'Mannar   ','Nanaddan   ','Umanagiri',1,NULL,NULL,NULL,NULL,NULL),(12451,NULL,'Badulla   ','Haputale   ','Umankandura',1,NULL,NULL,NULL,NULL,NULL),(12452,NULL,'Polonnaruwa   ','Hingurakgoda   ','Unagalavehera East',1,NULL,NULL,NULL,NULL,NULL),(12453,NULL,'Polonnaruwa   ','Thamankaduwa   ','Unagalavehera South',1,NULL,NULL,NULL,NULL,NULL),(12454,NULL,'Polonnaruwa   ','Hingurakgoda   ','Unagalavehera West',1,NULL,NULL,NULL,NULL,NULL),(12455,NULL,'Anuradhapura   ','Medawachchiya   ','Unagasewewa',1,NULL,NULL,NULL,NULL,NULL),(12456,NULL,'Galle   ','Karandeniya   ','Unagaswela',1,NULL,NULL,NULL,NULL,NULL),(12457,NULL,'Nuwara Eliya   ','Walapane   ','Unagolla',1,NULL,NULL,NULL,NULL,NULL),(12458,NULL,'Kurunegala   ','Rasnayakapura   ','Unagolla',1,NULL,NULL,NULL,NULL,NULL),(12459,NULL,'Badulla   ','Hali-Ela   ','Unagolla',1,NULL,NULL,NULL,NULL,NULL),(12460,NULL,'Anuradhapura   ','Kekirawa   ','Unagollewa',1,NULL,NULL,NULL,NULL,NULL),(12461,NULL,'Hambantota   ','Tangalle   ','Unakooruwa East',1,NULL,NULL,NULL,NULL,NULL),(12462,NULL,'Hambantota   ','Tangalle   ','Unakooruwa West',1,NULL,NULL,NULL,NULL,NULL),(12463,NULL,'Kurunegala   ','Kuliyapitiya West   ','Unaleeya',1,NULL,NULL,NULL,NULL,NULL),(12464,NULL,'Kandy   ','Udapalatha   ','Unambuwa',1,NULL,NULL,NULL,NULL,NULL),(12465,NULL,'Nuwara Eliya   ','Hanguranketha   ','Unanthenna',1,NULL,NULL,NULL,NULL,NULL),(12466,NULL,'Galle   ','Nagoda   ','Unanvitiya',1,NULL,NULL,NULL,NULL,NULL),(12467,NULL,'Galle   ','Nagoda   ','Unanvitiya East',1,NULL,NULL,NULL,NULL,NULL),(12468,NULL,'Ampara   ','Padiyathalawa   ','Unapana',1,NULL,NULL,NULL,NULL,NULL),(12469,NULL,'Badulla   ','Uva-Paranagama   ','Unapana',1,NULL,NULL,NULL,NULL,NULL),(12470,NULL,'Moneragala   ','Buttala   ','Unawatuna',1,NULL,NULL,NULL,NULL,NULL),(12471,NULL,'Galle   ','Habaraduwa   ','Unawatuna Central',1,NULL,NULL,NULL,NULL,NULL),(12472,NULL,'Galle   ','Habaraduwa   ','Unawatuna East',1,NULL,NULL,NULL,NULL,NULL),(12473,NULL,'Galle   ','Habaraduwa   ','Unawatuna West',1,NULL,NULL,NULL,NULL,NULL),(12474,NULL,'Matale   ','Yatawatta   ','Unaweruwa',1,NULL,NULL,NULL,NULL,NULL),(12475,NULL,'Vavuniya   ','Vavuniya North   ','Unchalkaddy',1,NULL,NULL,NULL,NULL,NULL),(12476,NULL,'Kegalle   ','Kegalle   ','Undugoda',1,NULL,NULL,NULL,NULL,NULL),(12477,NULL,'Anuradhapura   ','Palagala   ','Undurawa Halmilla Wewa',1,NULL,NULL,NULL,NULL,NULL),(12478,NULL,'Colombo   ','Homagama   ','Undurugoda',1,NULL,NULL,NULL,NULL,NULL),(12479,NULL,'Anuradhapura   ','Kekirawa   ','Unduruwa',1,NULL,NULL,NULL,NULL,NULL),(12480,NULL,'Matara   ','Thihagoda   ','Unella',1,NULL,NULL,NULL,NULL,NULL),(12481,NULL,'Matara   ','Malimbada   ','Uninduwela',1,NULL,NULL,NULL,NULL,NULL),(12482,NULL,'Vavuniya   ','Vengalacheddikulam   ','Unit 2 Pavatkulam',1,NULL,NULL,NULL,NULL,NULL),(12483,NULL,'Vavuniya   ','Vengalacheddikulam   ','Unit 4 Pavatkulam',1,NULL,NULL,NULL,NULL,NULL),(12484,NULL,'Vavuniya   ','Vengalacheddikulam   ','Unit 5 Pavatkulam',1,NULL,NULL,NULL,NULL,NULL),(12485,NULL,'Vavuniya   ','Vengalacheddikulam   ','Unit 9 Pavatkulam',1,NULL,NULL,NULL,NULL,NULL),(12486,NULL,'Gampaha   ','Minuwangoda   ','Unnaruwa',1,NULL,NULL,NULL,NULL,NULL),(12487,NULL,'Batticaloa   ','Manmunai West   ','Unnichchi',1,NULL,NULL,NULL,NULL,NULL),(12488,NULL,'Nuwara Eliya   ','Kothmale   ','Unugaloya',1,NULL,NULL,NULL,NULL,NULL),(12489,NULL,'Kandy   ','Pathahewaheta   ','Unuvinna East',1,NULL,NULL,NULL,NULL,NULL),(12490,NULL,'Kandy   ','Pathahewaheta   ','Unuvinna West',1,NULL,NULL,NULL,NULL,NULL),(12491,NULL,'Ampara   ','Mahaoya   ','Unuwathura Bubula',1,NULL,NULL,NULL,NULL,NULL),(12492,NULL,'Batticaloa   ','Koralai Pattu North   ','Uooriyankaddu',1,NULL,NULL,NULL,NULL,NULL),(12493,NULL,'Puttalam   ','Anamaduwa   ','Uppalawatta',1,NULL,NULL,NULL,NULL,NULL),(12494,NULL,'Trincomalee   ','Kinniya   ','Upparu',1,NULL,NULL,NULL,NULL,NULL),(12495,NULL,'Trincomalee   ','Seruvila   ','Uppooral',1,NULL,NULL,NULL,NULL,NULL),(12496,NULL,'Mannar   ','Mannar Town   ','Uppukkulam North',1,NULL,NULL,NULL,NULL,NULL),(12497,NULL,'Mannar   ','Mannar Town   ','Uppukulam South',1,NULL,NULL,NULL,NULL,NULL),(12498,NULL,'Trincomalee   ','Trincomalee Town and Gravets   ','Uppuveli',1,NULL,NULL,NULL,NULL,NULL),(12499,NULL,'Anuradhapura   ','Galenbindunuwewa   ','Upuldeniya',1,NULL,NULL,NULL,NULL,NULL),(12500,NULL,'Galle   ','Habaraduwa   ','Uragasgoda',1,NULL,NULL,NULL,NULL,NULL),(12501,NULL,'Galle   ','Karandeniya   ','Uragasmanhandiya East',1,NULL,NULL,NULL,NULL,NULL),(12502,NULL,'Galle   ','Karandeniya   ','Uragasmanhandiya North',1,NULL,NULL,NULL,NULL,NULL),(12503,NULL,'Galle   ','Karandeniya   ','Uragasmanhandiya South',1,NULL,NULL,NULL,NULL,NULL),(12504,NULL,'Kalutara   ','Walallavita   ','Uragoda East',1,NULL,NULL,NULL,NULL,NULL),(12505,NULL,'Kalutara   ','Walallavita   ','Uragoda West',1,NULL,NULL,NULL,NULL,NULL),(12506,NULL,'Galle   ','Nagoda   ','Urala Central',1,NULL,NULL,NULL,NULL,NULL),(12507,NULL,'Galle   ','Nagoda   ','Urala East',1,NULL,NULL,NULL,NULL,NULL),(12508,NULL,'Galle   ','Nagoda   ','Urala North',1,NULL,NULL,NULL,NULL,NULL),(12509,NULL,'Galle   ','Nagoda   ','Urala Pahala',1,NULL,NULL,NULL,NULL,NULL),(12510,NULL,'Galle   ','Nagoda   ','Urala South',1,NULL,NULL,NULL,NULL,NULL),(12511,NULL,'Puttalam   ','Madampe   ','Uraliya',1,NULL,NULL,NULL,NULL,NULL),(12512,NULL,'Puttalam   ','Madampe   ','Uraliyagara',1,NULL,NULL,NULL,NULL,NULL),(12513,NULL,'Badulla   ','Rideemaliyadda   ','Uraniya',1,NULL,NULL,NULL,NULL,NULL),(12514,NULL,'Gampaha   ','Divulapitiya   ','Urapana',1,NULL,NULL,NULL,NULL,NULL),(12515,NULL,'Gampaha   ','Attanagalla   ','Urapola',1,NULL,NULL,NULL,NULL,NULL),(12516,NULL,'Kandy   ','Yatinuwara   ','Urapola',1,NULL,NULL,NULL,NULL,NULL),(12517,NULL,'Matara   ','Kamburupitiya   ','Urapola East',1,NULL,NULL,NULL,NULL,NULL),(12518,NULL,'Matara   ','Kamburupitiya   ','Urapola West',1,NULL,NULL,NULL,NULL,NULL),(12519,NULL,'Kurunegala   ','Bingiriya   ','Urapotta',1,NULL,NULL,NULL,NULL,NULL),(12520,NULL,'Kegalle   ','Kegalle   ','Uraulla',1,NULL,NULL,NULL,NULL,NULL),(12521,NULL,'Moneragala   ','Bibile   ','Uravula',1,NULL,NULL,NULL,NULL,NULL),(12522,NULL,'Ratnapura   ','Weligepola   ','Urawala',1,NULL,NULL,NULL,NULL,NULL),(12523,NULL,'Galle   ','Hikkaduwa   ','Urawatta',1,NULL,NULL,NULL,NULL,NULL),(12524,NULL,'Jaffna   ','Valikamam East (Kopay)   ','Urelu',1,NULL,NULL,NULL,NULL,NULL),(12525,NULL,'Anuradhapura   ','Padaviya   ','Urewa',1,NULL,NULL,NULL,NULL,NULL),(12526,NULL,'Kilinochchi   ','Kandavalai   ','Uriyan',1,NULL,NULL,NULL,NULL,NULL),(12527,NULL,'Puttalam   ','Anamaduwa   ','Uriyawa',1,NULL,NULL,NULL,NULL,NULL),(12528,NULL,'Matara   ','Pasgoda   ','Urubokka',1,NULL,NULL,NULL,NULL,NULL),(12529,NULL,'Puttalam   ','Chilaw   ','Urudayandaluwa',1,NULL,NULL,NULL,NULL,NULL),(12530,NULL,'Kalutara   ','Ingiriya   ','Urugala East',1,NULL,NULL,NULL,NULL,NULL),(12531,NULL,'Kalutara   ','Ingiriya   ','Urugala West',1,NULL,NULL,NULL,NULL,NULL),(12532,NULL,'Matara   ','Dickwella   ','Urugamuwa',1,NULL,NULL,NULL,NULL,NULL),(12533,NULL,'Matara   ','Dickwella   ','Urugamuwa Central',1,NULL,NULL,NULL,NULL,NULL),(12534,NULL,'Matara   ','Dickwella   ','Urugamuwa East',1,NULL,NULL,NULL,NULL,NULL),(12535,NULL,'Matara   ','Dickwella   ','Urugamuwa North',1,NULL,NULL,NULL,NULL,NULL),(12536,NULL,'Matara   ','Dickwella   ','Urugamuwa South',1,NULL,NULL,NULL,NULL,NULL),(12537,NULL,'Matara   ','Dickwella   ','Urugamuwa West',1,NULL,NULL,NULL,NULL,NULL),(12538,NULL,'Kandy   ','Udunuwara   ','Urulewatta',1,NULL,NULL,NULL,NULL,NULL),(12539,NULL,'Matale   ','Yatawatta   ','Urulewatta',1,NULL,NULL,NULL,NULL,NULL),(12540,NULL,'Kegalle   ','Bulathkohupitiya   ','Urumeewala',1,NULL,NULL,NULL,NULL,NULL),(12541,NULL,'Jaffna   ','Valikamam East (Kopay)   ','Urumpirai East',1,NULL,NULL,NULL,NULL,NULL),(12542,NULL,'Jaffna   ','Valikamam East (Kopay)   ','Urumpirai North',1,NULL,NULL,NULL,NULL,NULL),(12543,NULL,'Jaffna   ','Valikamam East (Kopay)   ','Urumpirai South',1,NULL,NULL,NULL,NULL,NULL),(12544,NULL,'Jaffna   ','Valikamam East (Kopay)   ','Urumpirai West',1,NULL,NULL,NULL,NULL,NULL),(12545,NULL,'Matara   ','Athuraliya   ','Urumutta',1,NULL,NULL,NULL,NULL,NULL),(12546,NULL,'Matara   ','Athuraliya   ','Urumutta South',1,NULL,NULL,NULL,NULL,NULL),(12547,NULL,'Kilinochchi   ','Karachchi   ','Uruthirapuram',1,NULL,NULL,NULL,NULL,NULL),(12548,NULL,'Matara   ','Welipitiya   ','Uruvitiya',1,NULL,NULL,NULL,NULL,NULL),(12549,NULL,'Gampaha   ','Mahara   ','Uruwala East',1,NULL,NULL,NULL,NULL,NULL),(12550,NULL,'Gampaha   ','Mahara   ','Uruwala West',1,NULL,NULL,NULL,NULL,NULL),(12551,NULL,'Matara   ','Kotapola   ','Usamalagoda',1,NULL,NULL,NULL,NULL,NULL),(12552,NULL,'Jaffna   ','Thenmaradchi (Chavakachcheri)   ','Usan',1,NULL,NULL,NULL,NULL,NULL),(12553,NULL,'Galle   ','Niyagama   ','Usbim Colony',1,NULL,NULL,NULL,NULL,NULL),(12554,NULL,'Moneragala   ','Thanamalvila   ','Usgala',1,NULL,NULL,NULL,NULL,NULL),(12555,NULL,'Anuradhapura   ','Galnewa   ','Usgala Halmillewa',1,NULL,NULL,NULL,NULL,NULL),(12556,NULL,'Kurunegala   ','Galgamuwa   ','Usgala Siyambalagamuwa',1,NULL,NULL,NULL,NULL,NULL),(12557,NULL,'Kalutara   ','Kalutara   ','Usgodella',1,NULL,NULL,NULL,NULL,NULL),(12558,NULL,'Galle   ','Hikkaduwa   ','Usmudulawa',1,NULL,NULL,NULL,NULL,NULL),(12559,NULL,'Moneragala   ','Bibile   ','Ussagala',1,NULL,NULL,NULL,NULL,NULL),(12560,NULL,'Matale   ','Naula   ','Ussanttawa',1,NULL,NULL,NULL,NULL,NULL),(12561,NULL,'Kegalle   ','Aranayaka   ','Ussapitiya',1,NULL,NULL,NULL,NULL,NULL),(12562,NULL,'Kurunegala   ','Ibbagamuwa   ','Ussawa',1,NULL,NULL,NULL,NULL,NULL),(12563,NULL,'Colombo   ','Moratuwa   ','Uswatta',1,NULL,NULL,NULL,NULL,NULL),(12564,NULL,'Gampaha   ','Ja-Ela   ','Uswatta',1,NULL,NULL,NULL,NULL,NULL),(12565,NULL,'Kalutara   ','Kalutara   ','Uswatta',1,NULL,NULL,NULL,NULL,NULL),(12566,NULL,'Gampaha   ','Wattala   ','Uswetakeiyawa',1,NULL,NULL,NULL,NULL,NULL),(12567,NULL,'Hambantota   ','Angunakolapelessa   ','Uswewa',1,NULL,NULL,NULL,NULL,NULL),(12568,NULL,'Batticaloa   ','Koralai Pattu West (Oddamavadi)   ','Uththuchenai',1,NULL,NULL,NULL,NULL,NULL),(12569,NULL,'Kalutara   ','Walallavita   ','Uthumgama',1,NULL,NULL,NULL,NULL,NULL),(12570,NULL,'Kurunegala   ','Polpithigama   ','Uthuruwella',1,NULL,NULL,NULL,NULL,NULL),(12571,NULL,'Gampaha   ','Mirigama   ','Uthuwambogahawatta',1,NULL,NULL,NULL,NULL,NULL),(12572,NULL,'Kegalle   ','Mawanella   ','Uthuwankanda',1,NULL,NULL,NULL,NULL,NULL),(12573,NULL,'Anuradhapura   ','Thirappane   ','Uttimaduwa',1,NULL,NULL,NULL,NULL,NULL),(12574,NULL,'Anuradhapura   ','Thirappane   ','Uttupitiya',1,NULL,NULL,NULL,NULL,NULL),(12575,NULL,'Moneragala   ','Wellawaya   ','Uva Kudaoya',1,NULL,NULL,NULL,NULL,NULL),(12576,NULL,'Badulla   ','Hali-Ela   ','Uva Mahawela',1,NULL,NULL,NULL,NULL,NULL),(12577,NULL,'Badulla   ','Rideemaliyadda   ','Uva Thissapura',1,NULL,NULL,NULL,NULL,NULL),(12578,NULL,'Matara   ','Kotapola   ','Uvaragala',1,NULL,NULL,NULL,NULL,NULL),(12579,NULL,'Badulla   ','Haldummulla   ','Uvathenna',1,NULL,NULL,NULL,NULL,NULL),(12580,NULL,'Ratnapura   ','Kahawatta   ','Uwa Hawpe',1,NULL,NULL,NULL,NULL,NULL),(12581,NULL,'Colombo   ','Moratuwa   ','Uyana North',1,NULL,NULL,NULL,NULL,NULL),(12582,NULL,'Colombo   ','Moratuwa   ','Uyana South',1,NULL,NULL,NULL,NULL,NULL),(12583,NULL,'Kurunegala   ','Mallawapitiya   ','Uyandana',1,NULL,NULL,NULL,NULL,NULL),(12584,NULL,'Kurunegala   ','Ganewatta   ','Uyangalla',1,NULL,NULL,NULL,NULL,NULL),(12585,NULL,'Kalutara   ','Panadura   ','Uyankele',1,NULL,NULL,NULL,NULL,NULL),(12586,NULL,'Kandy   ','Harispattuwa   ','Uyanwatta',1,NULL,NULL,NULL,NULL,NULL),(12587,NULL,'Matara   ','Matara Four Gravets   ','Uyanwatta',1,NULL,NULL,NULL,NULL,NULL),(12588,NULL,'Matara   ','Matara Four Gravets   ','Uyanwatta North',1,NULL,NULL,NULL,NULL,NULL),(12589,NULL,'Kegalle   ','Mawanella   ','Uyanwtta',1,NULL,NULL,NULL,NULL,NULL),(12590,NULL,'Jaffna   ','Valikamam South-West (Sandilipay)   ','Uyarappulam',1,NULL,NULL,NULL,NULL,NULL),(12591,NULL,'Mannar   ','Mannar Town   ','Uyilankulam',1,NULL,NULL,NULL,NULL,NULL),(12592,NULL,'Mullaitivu   ','Thunukkai   ','Uyilankulam',1,NULL,NULL,NULL,NULL,NULL),(12593,NULL,'Mannar   ','Mannar Town   ','Uyirtharayankulam',1,NULL,NULL,NULL,NULL,NULL),(12594,NULL,'Ampara   ','Alayadiwembu   ','Vachchikuda',1,NULL,NULL,NULL,NULL,NULL),(12595,NULL,'Jaffna   ','Valikamam South-West (Sandilipay)   ','Vadaliadaippu',1,NULL,NULL,NULL,NULL,NULL),(12596,NULL,'Batticaloa   ','Koralai Pattu West (Oddamavadi)   ','Vadamunai',1,NULL,NULL,NULL,NULL,NULL),(12597,NULL,'Kilinochchi   ','Karachchi   ','Vaddakachchi',1,NULL,NULL,NULL,NULL,NULL),(12598,NULL,'Mannar   ','Manthai West   ','Vaddakandal',1,NULL,NULL,NULL,NULL,NULL),(12599,NULL,'Batticaloa   ','Koralai Pattu North   ','Vaddavaan',1,NULL,NULL,NULL,NULL,NULL),(12600,NULL,'Ampara   ','Pothuvil   ','Vaddively',1,NULL,NULL,NULL,NULL,NULL),(12601,NULL,'Batticaloa   ','Koralai Pattu West (Oddamavadi)   ','Vahaneri',1,NULL,NULL,NULL,NULL,NULL),(12602,NULL,'Vavuniya   ','Vavuniya   ','Vairavapuliyankulam',1,NULL,NULL,NULL,NULL,NULL),(12603,NULL,'Batticaloa   ','Koralai Pattu North   ','Vakarai Centre',1,NULL,NULL,NULL,NULL,NULL),(12604,NULL,'Batticaloa   ','Koralai Pattu North   ','Vakarai North',1,NULL,NULL,NULL,NULL,NULL),(12605,NULL,'Batticaloa   ','Koralai Pattu (Valachchenai)   ','Valaichenai Muslim 4',1,NULL,NULL,NULL,NULL,NULL),(12606,NULL,'Batticaloa   ','Koralai Pattu (Valachchenai)   ','Valaichenai Muslim 5 North',1,NULL,NULL,NULL,NULL,NULL),(12607,NULL,'Batticaloa   ','Koralai Pattu (Valachchenai)   ','Valaichenai Muslim 5 South',1,NULL,NULL,NULL,NULL,NULL),(12608,NULL,'Batticaloa   ','Koralai Pattu (Valachchenai)   ','Valaichenai Tamil',1,NULL,NULL,NULL,NULL,NULL),(12609,NULL,'Trincomalee   ','Kuchchaveli   ','Valaiyoothu',1,NULL,NULL,NULL,NULL,NULL),(12610,NULL,'Jaffna   ','Valikamam East (Kopay)   ','Valalai',1,NULL,NULL,NULL,NULL,NULL),(12611,NULL,'Ampara   ','Samanthurai   ','Valathapitty 01',1,NULL,NULL,NULL,NULL,NULL),(12612,NULL,'Ampara   ','Samanthurai   ','Valathapitty 02',1,NULL,NULL,NULL,NULL,NULL),(12613,NULL,'Mannar   ','Nanaddan   ','Valkaipaddankandal',1,NULL,NULL,NULL,NULL,NULL),(12614,NULL,'Jaffna   ','Vadamaradchi North (Point Pedro)   ','Vallipuram',1,NULL,NULL,NULL,NULL,NULL),(12615,NULL,'Jaffna   ','Vadamaradchi North (Point Pedro)   ','Valvettithurai North Centre',1,NULL,NULL,NULL,NULL,NULL),(12616,NULL,'Jaffna   ','Vadamaradchi North (Point Pedro)   ','Valvettithurai North East',1,NULL,NULL,NULL,NULL,NULL),(12617,NULL,'Jaffna   ','Vadamaradchi North (Point Pedro)   ','Valvettithurai North West',1,NULL,NULL,NULL,NULL,NULL),(12618,NULL,'Jaffna   ','Vadamaradchi North (Point Pedro)   ','Valvettithurai South East',1,NULL,NULL,NULL,NULL,NULL),(12619,NULL,'Jaffna   ','Vadamaradchi North (Point Pedro)   ','Valvettithurai South West',1,NULL,NULL,NULL,NULL,NULL),(12620,NULL,'Jaffna   ','Vadamaradchi South-West (Karaveddy)   ','Valvetty',1,NULL,NULL,NULL,NULL,NULL),(12621,NULL,'Jaffna   ','Vadamaradchi South-West (Karaveddy)   ','Valvetty Centre',1,NULL,NULL,NULL,NULL,NULL),(12622,NULL,'Batticaloa   ','Porativu Pattu   ','Vammiyadiyoottu',1,NULL,NULL,NULL,NULL,NULL),(12623,NULL,'Nuwara Eliya   ','Ambagamuwa   ','Vanaraja',1,NULL,NULL,NULL,NULL,NULL),(12624,NULL,'Puttalam   ','Vanathavilluwa   ','Vanathawilluwa North',1,NULL,NULL,NULL,NULL,NULL),(12625,NULL,'Puttalam   ','Vanathavilluwa   ','Vanathawilluwa South',1,NULL,NULL,NULL,NULL,NULL),(12626,NULL,'Mannar   ','Nanaddan   ','Vanchiankulam',1,NULL,NULL,NULL,NULL,NULL),(12627,NULL,'Trincomalee   ','Kantalai   ','Vandrasapura Unit 14',1,NULL,NULL,NULL,NULL,NULL),(12628,NULL,'Trincomalee   ','Kantalai   ','Vandrasapura Unit 15',1,NULL,NULL,NULL,NULL,NULL),(12629,NULL,'Trincomalee   ','Kantalai   ','Vandrasapura Unit 16',1,NULL,NULL,NULL,NULL,NULL),(12630,NULL,'Trincomalee   ','Kantalai   ','Vanela East',1,NULL,NULL,NULL,NULL,NULL),(12631,NULL,'Trincomalee   ','Kantalai   ','Vanela West',1,NULL,NULL,NULL,NULL,NULL),(12632,NULL,'Mannar   ','Nanaddan   ','Vankalai East',1,NULL,NULL,NULL,NULL,NULL),(12633,NULL,'Mannar   ','Nanaddan   ','Vankalai North',1,NULL,NULL,NULL,NULL,NULL),(12634,NULL,'Mannar   ','Nanaddan   ','Vankalai West',1,NULL,NULL,NULL,NULL,NULL),(12635,NULL,'Mannar   ','Mannar Town   ','Vannamoddai',1,NULL,NULL,NULL,NULL,NULL),(12636,NULL,'Jaffna   ','Jaffna   ','Vannarpannai',1,NULL,NULL,NULL,NULL,NULL),(12637,NULL,'Jaffna   ','Nallur   ','Vannarponnai NE (North)',1,NULL,NULL,NULL,NULL,NULL),(12638,NULL,'Jaffna   ','Nallur   ','Vannarponnai NE (South)',1,NULL,NULL,NULL,NULL,NULL),(12639,NULL,'Jaffna   ','Nallur   ','Vannarponnai NW (North)',1,NULL,NULL,NULL,NULL,NULL),(12640,NULL,'Jaffna   ','Nallur   ','Vannarponnai NW (West)',1,NULL,NULL,NULL,NULL,NULL),(12641,NULL,'Kilinochchi   ','Karachchi   ','Vannerikulam',1,NULL,NULL,NULL,NULL,NULL),(12642,NULL,'Batticaloa   ','Porativu Pattu   ','Vanninagar',1,NULL,NULL,NULL,NULL,NULL),(12643,NULL,'Mullaitivu   ','Manthai East   ','Vannivilankulam',1,NULL,NULL,NULL,NULL,NULL),(12644,NULL,'Batticaloa   ','Eravur Pattu   ','Vantharumoolai East',1,NULL,NULL,NULL,NULL,NULL),(12645,NULL,'Batticaloa   ','Eravur Pattu   ','Vantharumoolai West',1,NULL,NULL,NULL,NULL,NULL),(12646,NULL,'Jaffna   ','Thenmaradchi (Chavakachcheri)   ','Varani North',1,NULL,NULL,NULL,NULL,NULL),(12647,NULL,'Jaffna   ','Thenmaradchi (Chavakachcheri)   ','Varani-Iyattalai',1,NULL,NULL,NULL,NULL,NULL),(12648,NULL,'Ampara   ','Eragama   ','Varipathanchenai 01',1,NULL,NULL,NULL,NULL,NULL),(12649,NULL,'Ampara   ','Eragama   ','Varipathanchenai 02',1,NULL,NULL,NULL,NULL,NULL),(12650,NULL,'Ampara   ','Eragama   ','Varipathanchenai 03',1,NULL,NULL,NULL,NULL,NULL),(12651,NULL,'Trincomalee   ','Trincomalee Town and Gravets   ','Varothayanagar',1,NULL,NULL,NULL,NULL,NULL),(12652,NULL,'Jaffna   ','Valikamam North (Tellipallai)   ','Varuthalaivilan',1,NULL,NULL,NULL,NULL,NULL),(12653,NULL,'Jaffna   ','Valikamam East (Kopay)   ','Vatharavattai',1,NULL,NULL,NULL,NULL,NULL),(12654,NULL,'Jaffna   ','Vadamaradchi East (Maruthnkerny)   ','Vathirayan',1,NULL,NULL,NULL,NULL,NULL),(12655,NULL,'Puttalam   ','Vanathavilluwa   ','Vattakandal',1,NULL,NULL,NULL,NULL,NULL),(12656,NULL,'Batticaloa   ','Manmunai West   ','Vavunativu',1,NULL,NULL,NULL,NULL,NULL),(12657,NULL,'Mullaitivu   ','Manthai East   ','Vavunikulam',1,NULL,NULL,NULL,NULL,NULL),(12658,NULL,'Vavuniya   ','Vavuniya   ','Vavuniya Town',1,NULL,NULL,NULL,NULL,NULL),(12659,NULL,'Vavuniya   ','Vavuniya   ','Vavuniya Town North',1,NULL,NULL,NULL,NULL,NULL),(12660,NULL,'Jaffna   ','Valikamam North (Tellipallai)   ','Vayavilan East',1,NULL,NULL,NULL,NULL,NULL),(12661,NULL,'Jaffna   ','Valikamam North (Tellipallai)   ','Vayavilan West',1,NULL,NULL,NULL,NULL,NULL),(12662,NULL,'Batticaloa   ','Manmunai Pattu (Araipattai)   ','Vedarkudiyiruppu',1,NULL,NULL,NULL,NULL,NULL),(12663,NULL,'Mannar   ','Manthai West   ','Veddayarmurrippu',1,NULL,NULL,NULL,NULL,NULL),(12664,NULL,'Jaffna   ','Valikamam West (Chankanai)   ','Vedducoddai  West',1,NULL,NULL,NULL,NULL,NULL),(12665,NULL,'Jaffna   ','Valikamam West (Chankanai)   ','Vedducoddai East',1,NULL,NULL,NULL,NULL,NULL),(12666,NULL,'Jaffna   ','Valikamam West (Chankanai)   ','Vedducoddai North',1,NULL,NULL,NULL,NULL,NULL),(12667,NULL,'Jaffna   ','Valikamam West (Chankanai)   ','Vedducoddai South',1,NULL,NULL,NULL,NULL,NULL),(12668,NULL,'Jaffna   ','Valikamam West (Chankanai)   ','Vedducoddai South West (North)',1,NULL,NULL,NULL,NULL,NULL),(12669,NULL,'Vavuniya   ','Vavuniya North   ','Vedivaithakallu',1,NULL,NULL,NULL,NULL,NULL),(12670,NULL,'Batticaloa   ','Manmunai North   ','Veechikalmunai',1,NULL,NULL,NULL,NULL,NULL),(12671,NULL,'Kalutara   ','Bandaragama   ','Veedagama East',1,NULL,NULL,NULL,NULL,NULL),(12672,NULL,'Kalutara   ','Bandaragama   ','Veedagama West',1,NULL,NULL,NULL,NULL,NULL),(12673,NULL,'Hambantota   ','Mundalama   ','Veedapola',1,NULL,NULL,NULL,NULL,NULL),(12674,NULL,'Puttalam   ','Mahawewa   ','Veehena',1,NULL,NULL,NULL,NULL,NULL),(12675,NULL,'Ampara   ','Samanthurai   ','Veeramunai 01',1,NULL,NULL,NULL,NULL,NULL),(12676,NULL,'Ampara   ','Samanthurai   ','Veeramunai 02',1,NULL,NULL,NULL,NULL,NULL),(12677,NULL,'Ampara   ','Samanthurai   ','Veeramunai 03',1,NULL,NULL,NULL,NULL,NULL),(12678,NULL,'Ampara   ','Samanthurai   ','Veeramunai 04',1,NULL,NULL,NULL,NULL,NULL),(12679,NULL,'Batticaloa   ','Porativu Pattu   ','Veeranchenai',1,NULL,NULL,NULL,NULL,NULL),(12680,NULL,'Trincomalee   ','Kuchchaveli   ','Veerancholai',1,NULL,NULL,NULL,NULL,NULL),(12681,NULL,'Kurunegala   ','Kurunegala   ','Veherabenda',1,NULL,NULL,NULL,NULL,NULL),(12682,NULL,'Matale   ','Wilgamuwa   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12683,NULL,'Hambantota   ','Lunugamvehera   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12684,NULL,'Ampara   ','Damana   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12685,NULL,'Anuradhapura   ','Rajanganaya   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12686,NULL,'Anuradhapura   ','Thambuttegama   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12687,NULL,'Polonnaruwa   ','Medirigiriya   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12688,NULL,'Polonnaruwa   ','Dimbulagala   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12689,NULL,'Moneragala   ','Moneragala   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12690,NULL,'Moneragala   ','Buttala   ','Veheragala',1,NULL,NULL,NULL,NULL,NULL),(12691,NULL,'Polonnaruwa   ','Dimbulagala   ','Veheragama',1,NULL,NULL,NULL,NULL,NULL),(12692,NULL,'Ampara   ','Uhana   ','Veheragama East',1,NULL,NULL,NULL,NULL,NULL),(12693,NULL,'Ampara   ','Uhana   ','Veheragama West',1,NULL,NULL,NULL,NULL,NULL),(12694,NULL,'Colombo   ','Kolonnawa   ','Veheragoda',1,NULL,NULL,NULL,NULL,NULL),(12695,NULL,'Kurunegala   ','Ehetuwewa   ','Veheragodayaya',1,NULL,NULL,NULL,NULL,NULL),(12696,NULL,'Matara   ','Matara Four Gravets   ','Veherahena',1,NULL,NULL,NULL,NULL,NULL),(12697,NULL,'Moneragala   ','Wellawaya   ','Veherayaya',1,NULL,NULL,NULL,NULL,NULL),(12698,NULL,'Moneragala   ','Wellawaya   ','Veherayaya Colony',1,NULL,NULL,NULL,NULL,NULL),(12699,NULL,'Jaffna   ','Island South (Velanai)   ','Velanai East',1,NULL,NULL,NULL,NULL,NULL),(12700,NULL,'Jaffna   ','Island South (Velanai)   ','Velanai East Centre',1,NULL,NULL,NULL,NULL,NULL),(12701,NULL,'Jaffna   ','Island South (Velanai)   ','Velanai North',1,NULL,NULL,NULL,NULL,NULL),(12702,NULL,'Jaffna   ','Island South (Velanai)   ','Velanai North East',1,NULL,NULL,NULL,NULL,NULL),(12703,NULL,'Jaffna   ','Island South (Velanai)   ','Velanai South',1,NULL,NULL,NULL,NULL,NULL),(12704,NULL,'Jaffna   ','Island South (Velanai)   ','Velanai South East',1,NULL,NULL,NULL,NULL,NULL),(12705,NULL,'Jaffna   ','Island South (Velanai)   ','Velanai West',1,NULL,NULL,NULL,NULL,NULL),(12706,NULL,'Jaffna   ','Island South (Velanai)   ','Velanai West Centre',1,NULL,NULL,NULL,NULL,NULL),(12707,NULL,'Vavuniya   ','Vavuniya   ','Velankulam',1,NULL,NULL,NULL,NULL,NULL),(12708,NULL,'Ampara   ','Uhana   ','Velikahagolla',1,NULL,NULL,NULL,NULL,NULL),(12709,NULL,'Vavuniya   ','Vavuniya   ','Velikulam',1,NULL,NULL,NULL,NULL,NULL),(12710,NULL,'Jaffna   ','Thenmaradchi (Chavakachcheri)   ','Vellampokkady',1,NULL,NULL,NULL,NULL,NULL),(12711,NULL,'Mullaitivu   ','Maritimepattu   ','Vellamullivaikkal',1,NULL,NULL,NULL,NULL,NULL),(12712,NULL,'Mannar   ','Manthai West   ','Vellankulam',1,NULL,NULL,NULL,NULL,NULL),(12713,NULL,'Batticaloa   ','Porativu Pattu   ','Vellaveli',1,NULL,NULL,NULL,NULL,NULL),(12714,NULL,'Trincomalee   ','Kuchchaveli   ','Veloor',1,NULL,NULL,NULL,NULL,NULL),(12715,NULL,'Nuwara Eliya   ','Ambagamuwa   ','Venture',1,NULL,NULL,NULL,NULL,NULL),(12716,NULL,'Mannar   ','Musalai   ','Veppankulam',1,NULL,NULL,NULL,NULL,NULL),(12717,NULL,'Batticaloa   ','Eravur Pattu   ','Veppavedduwan',1,NULL,NULL,NULL,NULL,NULL),(12718,NULL,'Ampara   ','Uhana   ','Verenketagoda',1,NULL,NULL,NULL,NULL,NULL),(12719,NULL,'Trincomalee   ','Verugal (Echchilampattai)   ','Verugal',1,NULL,NULL,NULL,NULL,NULL),(12720,NULL,'Trincomalee   ','Verugal (Echchilampattai)   ','Verugal Mugathuvaram',1,NULL,NULL,NULL,NULL,NULL),(12721,NULL,'Anuradhapura   ','Galnewa   ','Verunkulama',1,NULL,NULL,NULL,NULL,NULL),(12722,NULL,'Jaffna   ','Vadamaradchi East (Maruthnkerny)   ','Vetrilaikerny',1,NULL,NULL,NULL,NULL,NULL),(12723,NULL,'Batticaloa   ','Manmunai North   ','Vettukkadu',1,NULL,NULL,NULL,NULL,NULL),(12724,NULL,'Ampara   ','Pothuvil   ','Victor Estate 1',1,NULL,NULL,NULL,NULL,NULL),(12725,NULL,'Ampara   ','Pothuvil   ','Victor Estate 2',1,NULL,NULL,NULL,NULL,NULL),(12726,NULL,'Kandy   ','Medadumbara   ','Victoria',1,NULL,NULL,NULL,NULL,NULL),(12727,NULL,'Mannar   ','Manthai West   ','Vidalaiteevu Central',1,NULL,NULL,NULL,NULL,NULL),(12728,NULL,'Mannar   ','Manthai West   ','Vidalaiteevu East',1,NULL,NULL,NULL,NULL,NULL),(12729,NULL,'Mannar   ','Manthai West   ','Vidalaiteevu North',1,NULL,NULL,NULL,NULL,NULL),(12730,NULL,'Mannar   ','Manthai West   ','Vidalaiteevu West',1,NULL,NULL,NULL,NULL,NULL),(12731,NULL,'Jaffna   ','Thenmaradchi (Chavakachcheri)   ','Vidaththalpalai',1,NULL,NULL,NULL,NULL,NULL),(12732,NULL,'Nuwara Eliya   ','Ambagamuwa   ','Vidulipura North',1,NULL,NULL,NULL,NULL,NULL),(12733,NULL,'Nuwara Eliya   ','Ambagamuwa   ','Vidulipura South',1,NULL,NULL,NULL,NULL,NULL),(12734,NULL,'Badulla   ','Welimada   ','Vidurupola',1,NULL,NULL,NULL,NULL,NULL),(12735,NULL,'Kalutara   ','Kalutara   ','Vidyasara',1,NULL,NULL,NULL,NULL,NULL),(12736,NULL,'Hambantota   ','Tangalle   ','Vigamuwa',1,NULL,NULL,NULL,NULL,NULL),(12737,NULL,'Gampaha   ','Minuwangoda   ','Vigoda',1,NULL,NULL,NULL,NULL,NULL),(12738,NULL,'Kandy   ','Harispattuwa   ','Viguhumpola',1,NULL,NULL,NULL,NULL,NULL),(12739,NULL,'Colombo   ','Ratmalana   ','Vihara',1,NULL,NULL,NULL,NULL,NULL),(12740,NULL,'Anuradhapura   ','Nuwaragam Palatha Central   ','Vihara Kalanchiya',1,NULL,NULL,NULL,NULL,NULL),(12741,NULL,'Gampaha   ','Dompe   ','Vihara Kumbura',1,NULL,NULL,NULL,NULL,NULL),(12742,NULL,'Anuradhapura   ','Nuwaragam Palatha Central   ','Vihara Palugama',1,NULL,NULL,NULL,NULL,NULL),(12743,NULL,'Matale   ','Matale   ','Vihara Road',1,NULL,NULL,NULL,NULL,NULL),(12744,NULL,'Hambantota   ','Sooriyawewa   ','Viharagala',1,NULL,NULL,NULL,NULL,NULL),(12745,NULL,'Badulla   ','Haldummulla   ','Viharagala',1,NULL,NULL,NULL,NULL,NULL),(12746,NULL,'Kalutara   ','Palindanuwara   ','Viharagama',1,NULL,NULL,NULL,NULL,NULL),(12747,NULL,'Kandy   ','Udunuwara   ','Viharagama',1,NULL,NULL,NULL,NULL,NULL),(12748,NULL,'Matale   ','Wilgamuwa   ','Viharagama',1,NULL,NULL,NULL,NULL,NULL),(12749,NULL,'Matale   ','Rattota   ','Viharagama',1,NULL,NULL,NULL,NULL,NULL),(12750,NULL,'Kurunegala   ','Nikaweratiya   ','Viharagama',1,NULL,NULL,NULL,NULL,NULL),(12751,NULL,'Puttalam   ','Anamaduwa   ','Viharagama',1,NULL,NULL,NULL,NULL,NULL),(12752,NULL,'Polonnaruwa   ','Medirigiriya   ','Viharagama',1,NULL,NULL,NULL,NULL,NULL),(12753,NULL,'Galle   ','Balapitiya   ','Viharagoda',1,NULL,NULL,NULL,NULL,NULL),(12754,NULL,'Matara   ','Kotapola   ','Viharahena',1,NULL,NULL,NULL,NULL,NULL),(12755,NULL,'Kalutara   ','Beruwala   ','Viharakanada',1,NULL,NULL,NULL,NULL,NULL),(12756,NULL,'Kegalle   ','Dehiovita   ','Viharakanda',1,NULL,NULL,NULL,NULL,NULL),(12757,NULL,'Badulla   ','Haputale   ','Viharakele',1,NULL,NULL,NULL,NULL,NULL),(12758,NULL,'Hambantota   ','Thissamaharama   ','Viharamahadevipura',1,NULL,NULL,NULL,NULL,NULL),(12759,NULL,'Moneragala   ','Moneragala   ','Viharamulla',1,NULL,NULL,NULL,NULL,NULL),(12760,NULL,'Ratnapura   ','Imbulpe   ','Viharawela',1,NULL,NULL,NULL,NULL,NULL),(12761,NULL,'Ampara   ','Thirukkovil   ','Vijayanagapuram 1',1,NULL,NULL,NULL,NULL,NULL),(12762,NULL,'Ampara   ','Thirukkovil   ','Vijayanagapuram 2',1,NULL,NULL,NULL,NULL,NULL),(12763,NULL,'Ampara   ','Thirukkovil   ','Vijayanagapuram 3',1,NULL,NULL,NULL,NULL,NULL),(12764,NULL,'Ampara   ','Thirukkovil   ','Vijayanagapuram 4',1,NULL,NULL,NULL,NULL,NULL),(12765,NULL,'Gampaha   ','Mirigama   ','Vijayarajadahana',1,NULL,NULL,NULL,NULL,NULL),(12766,NULL,'Hambantota   ','Thissamaharama   ','Vijithapura',1,NULL,NULL,NULL,NULL,NULL),(12767,NULL,'Anuradhapura   ','Ipalogama   ','Vijithapura',1,NULL,NULL,NULL,NULL,NULL),(12768,NULL,'Kurunegala   ','Ehetuwewa   ','Vikadenigama',1,NULL,NULL,NULL,NULL,NULL),(12769,NULL,'Ratnapura   ','Balangoda   ','Vikiliya',1,NULL,NULL,NULL,NULL,NULL),(12770,NULL,'Ratnapura   ','Eheliyagoda   ','Vikumsihagama',1,NULL,NULL,NULL,NULL,NULL),(12771,NULL,'Batticaloa   ','Manmunai West   ','Vilaavedduwan',1,NULL,NULL,NULL,NULL,NULL),(12772,NULL,'Matara   ','Akuressa   ','Vilagama',1,NULL,NULL,NULL,NULL,NULL),(12773,NULL,'Kurunegala   ','Wariyapola   ','Vilakatupotha',1,NULL,NULL,NULL,NULL,NULL),(12774,NULL,'Kandy   ','Medadumbara   ','Vilamuna',1,NULL,NULL,NULL,NULL,NULL),(12775,NULL,'Kandy   ','Akurana   ','Vilana Pallegama',1,NULL,NULL,NULL,NULL,NULL),(12776,NULL,'Kandy   ','Akurana   ','Vilana Udagama',1,NULL,NULL,NULL,NULL,NULL),(12777,NULL,'Batticaloa   ','Porativu Pattu   ','Vilanthoddam',1,NULL,NULL,NULL,NULL,NULL),(12778,NULL,'Moneragala   ','Siyambalanduwa   ','Vilaoya',1,NULL,NULL,NULL,NULL,NULL),(12779,NULL,'Mannar   ','Madhu   ','Vilaththikulam',1,NULL,NULL,NULL,NULL,NULL),(12780,NULL,'Kurunegala   ','Bingiriya   ','Vilattawa Pahala',1,NULL,NULL,NULL,NULL,NULL),(12781,NULL,'Kurunegala   ','Mahawa   ','Vilawa',1,NULL,NULL,NULL,NULL,NULL),(12782,NULL,'Colombo   ','Dehiwala-Mount Lavinia   ','Vilawala',1,NULL,NULL,NULL,NULL,NULL),(12783,NULL,'Kurunegala   ','Kurunegala   ','Vilbawa',1,NULL,NULL,NULL,NULL,NULL),(12784,NULL,'Galle   ','Ambalangoda   ','Vilegoda',1,NULL,NULL,NULL,NULL,NULL),(12785,NULL,'Matara   ','Welipitiya   ','Vilegoda',1,NULL,NULL,NULL,NULL,NULL),(12786,NULL,'Ratnapura   ','Eheliyagoda   ','Vilegoda',1,NULL,NULL,NULL,NULL,NULL),(12787,NULL,'Ratnapura   ','Eheliyagoda   ','Vilegoda East',1,NULL,NULL,NULL,NULL,NULL),(12788,NULL,'Kalutara   ','Kalutara   ','Vilegoda North',1,NULL,NULL,NULL,NULL,NULL),(12789,NULL,'Kalutara   ','Kalutara   ','Vilegoda South',1,NULL,NULL,NULL,NULL,NULL),(12790,NULL,'Anuradhapura   ','Horowpothana   ','Vilewewa',1,NULL,NULL,NULL,NULL,NULL),(12791,NULL,'Kurunegala   ','Alawwa   ','Vilgamuwa',1,NULL,NULL,NULL,NULL,NULL),(12792,NULL,'Kurunegala   ','Alawwa   ','Vilgamuwa Watta',1,NULL,NULL,NULL,NULL,NULL),(12793,NULL,'Kurunegala   ','Kurunegala   ','Vilgoda',1,NULL,NULL,NULL,NULL,NULL),(12794,NULL,'Matale   ','Dambulla   ','Vilhatha',1,NULL,NULL,NULL,NULL,NULL),(12795,NULL,'Gampaha   ','Mahara   ','Vilimbula North',1,NULL,NULL,NULL,NULL,NULL),(12796,NULL,'Gampaha   ','Mahara   ','Vilimbula South',1,NULL,NULL,NULL,NULL,NULL),(12797,NULL,'Ampara   ','Samanthurai   ','Vilinayadi 01',1,NULL,NULL,NULL,NULL,NULL),(12798,NULL,'Ampara   ','Samanthurai   ','Vilinayadi 02',1,NULL,NULL,NULL,NULL,NULL),(12799,NULL,'Ampara   ','Samanthurai   ','Vilinayadi 03',1,NULL,NULL,NULL,NULL,NULL),(12800,NULL,'Kurunegala   ','Pannala   ','Villiyagala',1,NULL,NULL,NULL,NULL,NULL),(12801,NULL,'Colombo   ','Moratuwa   ','Villorawatta East',1,NULL,NULL,NULL,NULL,NULL),(12802,NULL,'Colombo   ','Moratuwa   ','Villorawatta West',1,NULL,NULL,NULL,NULL,NULL),(12803,NULL,'Trincomalee   ','Trincomalee Town and Gravets   ','Villundy',1,NULL,NULL,NULL,NULL,NULL),(12804,NULL,'Matara   ','Athuraliya   ','Vilpita East 1',1,NULL,NULL,NULL,NULL,NULL),(12805,NULL,'Matara   ','Athuraliya   ','Vilpita East 11',1,NULL,NULL,NULL,NULL,NULL),(12806,NULL,'Matara   ','Athuraliya   ','Vilpita West',1,NULL,NULL,NULL,NULL,NULL),(12807,NULL,'Kegalle   ','Aranayaka   ','Vilpola',1,NULL,NULL,NULL,NULL,NULL),(12808,NULL,'Gampaha   ','Mirigama   ','Vilwatta',1,NULL,NULL,NULL,NULL,NULL),(12809,NULL,'Badulla   ','Badulla   ','Vineethagama',1,NULL,NULL,NULL,NULL,NULL),(12810,NULL,'Kurunegala   ','Kobeigane   ','Vinikuliya',1,NULL,NULL,NULL,NULL,NULL),(12811,NULL,'Batticaloa   ','Porativu Pattu   ','Vipulananthapuram',1,NULL,NULL,NULL,NULL,NULL),(12812,NULL,'Anuradhapura   ','Medawachchiya   ','Viralmurippuwa',1,NULL,NULL,NULL,NULL,NULL),(12813,NULL,'Puttalam   ','Mundalama   ','Viruthodai',1,NULL,NULL,NULL,NULL,NULL),(12814,NULL,'Gampaha   ','Ja-Ela   ','Vishakawatta',1,NULL,NULL,NULL,NULL,NULL),(12815,NULL,'Colombo   ','Kesbewa   ','Vishwakalawa',1,NULL,NULL,NULL,NULL,NULL),(12816,NULL,'Jaffna   ','Valikamam North (Tellipallai)   ','Vithahapuram',1,NULL,NULL,NULL,NULL,NULL),(12817,NULL,'Ratnapura   ','Ayagama   ','Vithanagama',1,NULL,NULL,NULL,NULL,NULL),(12818,NULL,'Hambantota   ','Tangalle   ','Vitharandeniya North',1,NULL,NULL,NULL,NULL,NULL),(12819,NULL,'Hambantota   ','Tangalle   ','Vitharandeniya South',1,NULL,NULL,NULL,NULL,NULL),(12820,NULL,'Batticaloa   ','Porativu Pattu   ','Vivekananthapuram',1,NULL,NULL,NULL,NULL,NULL),(12821,NULL,'Badulla   ','Badulla   ','Viyadiguna',1,NULL,NULL,NULL,NULL,NULL),(12822,NULL,'Ratnapura   ','Eheliyagoda   ','Viyalagoda',1,NULL,NULL,NULL,NULL,NULL),(12823,NULL,'Galle   ','Benthota   ','Viyandoowa',1,NULL,NULL,NULL,NULL,NULL),(12824,NULL,'Jaffna   ','Vadamaradchi North (Point Pedro)   ','Viyaparimoolai',1,NULL,NULL,NULL,NULL,NULL),(12825,NULL,'Badulla   ','Uva-Paranagama   ','Voldmar',1,NULL,NULL,NULL,NULL,NULL),(12826,NULL,'Kurunegala   ','Polgahawela   ','Wadakada',1,NULL,NULL,NULL,NULL,NULL),(12827,NULL,'Puttalam   ','Anamaduwa   ','Wadatta',1,NULL,NULL,NULL,NULL,NULL),(12828,NULL,'Kurunegala   ','Alawwa   ','Wadawa',1,NULL,NULL,NULL,NULL,NULL),(12829,NULL,'Nuwara Eliya   ','Hanguranketha   ','Wadawala',1,NULL,NULL,NULL,NULL,NULL),(12830,NULL,'Kandy   ','Udadumbara   ','Wadawalakanda',1,NULL,NULL,NULL,NULL,NULL),(12831,NULL,'Kegalle   ','Warakapola   ','Waddeniya',1,NULL,NULL,NULL,NULL,NULL),(12832,NULL,'Kalutara   ','Panadura   ','Wadduwa East',1,NULL,NULL,NULL,NULL,NULL),(12833,NULL,'Kalutara   ','Panadura   ','Wadduwa South',1,NULL,NULL,NULL,NULL,NULL),(12834,NULL,'Kalutara   ','Panadura   ','Wadduwa West',1,NULL,NULL,NULL,NULL,NULL),(12835,NULL,'Matale   ','Ukuwela   ','Wademada',1,NULL,NULL,NULL,NULL,NULL),(12836,NULL,'Hambantota   ','Tangalle   ','Wadigala',1,NULL,NULL,NULL,NULL,NULL),(12837,NULL,'Puttalam   ','Anamaduwa   ','Wadigamangawa',1,NULL,NULL,NULL,NULL,NULL),(12838,NULL,'Anuradhapura   ','Horowpothana   ','Wadigawewa',1,NULL,NULL,NULL,NULL,NULL),(12839,NULL,'Polonnaruwa   ','Medirigiriya   ','Wadigawewa',1,NULL,NULL,NULL,NULL,NULL),(12840,NULL,'Ampara   ','Damana   ','Wadinagala',1,NULL,NULL,NULL,NULL,NULL),(12841,NULL,'Hambantota   ','Beliatta   ','Wadiya',1,NULL,NULL,NULL,NULL,NULL),(12842,NULL,'Kandy   ','Delthota   ','Wadiyagoda',1,NULL,NULL,NULL,NULL,NULL),(12843,NULL,'Kurunegala   ','Mawathagama   ','Wadiyagoda',1,NULL,NULL,NULL,NULL,NULL),(12844,NULL,'Kegalle   ','Mawanella   ','Wadiyathenna',1,NULL,NULL,NULL,NULL,NULL),(12845,NULL,'Kalutara   ','Dodangoda   ','Wadugama',1,NULL,NULL,NULL,NULL,NULL),(12846,NULL,'Kurunegala   ','Galgamuwa   ','Wadugama',1,NULL,NULL,NULL,NULL,NULL),(12847,NULL,'Kurunegala   ','Kuliyapitiya West   ','Wadugedara',1,NULL,NULL,NULL,NULL,NULL),(12848,NULL,'Galle   ','Habaraduwa   ','Wadugegoda',1,NULL,NULL,NULL,NULL,NULL),(12849,NULL,'Colombo   ','Kolonnawa   ','Wadulla',1,NULL,NULL,NULL,NULL,NULL),(12850,NULL,'Gampaha   ','Minuwangoda   ','Wadumulla',1,NULL,NULL,NULL,NULL,NULL),(12851,NULL,'Galle   ','Balapitiya   ','Wadumulla',1,NULL,NULL,NULL,NULL,NULL),(12852,NULL,'Kurunegala   ','Panduwasnuwara   ','Wadumunna',1,NULL,NULL,NULL,NULL,NULL),(12853,NULL,'Kurunegala   ','Ibbagamuwa   ','Wadupola',1,NULL,NULL,NULL,NULL,NULL),(12854,NULL,'Kegalle   ','Kegalle   ','Wadupola',1,NULL,NULL,NULL,NULL,NULL),(12855,NULL,'Kurunegala   ','Ambanpola   ','Waduressa',1,NULL,NULL,NULL,NULL,NULL),(12856,NULL,'Kurunegala   ','Nikaweratiya   ','Waduressa',1,NULL,NULL,NULL,NULL,NULL),(12857,NULL,'Kurunegala   ','Kobeigane   ','Waduressa',1,NULL,NULL,NULL,NULL,NULL),(12858,NULL,'Kurunegala   ','Rideegama   ','Waduressa',1,NULL,NULL,NULL,NULL,NULL),(12859,NULL,'Kegalle   ','Rambukkana   ','Waduwadeniya',1,NULL,NULL,NULL,NULL,NULL),(12860,NULL,'Kurunegala   ','Ganewatta   ','Waduwawa',1,NULL,NULL,NULL,NULL,NULL),(12861,NULL,'Kurunegala   ','Alawwa   ','Waduwawa',1,NULL,NULL,NULL,NULL,NULL),(12862,NULL,'Kegalle   ','Mawanella   ','Waduwawala',1,NULL,NULL,NULL,NULL,NULL),(12863,NULL,'Galle   ','Welivitiya-Divithura   ','Waduwelipitiya North',1,NULL,NULL,NULL,NULL,NULL),(12864,NULL,'Galle   ','Welivitiya-Divithura   ','Waduwelipitiya South',1,NULL,NULL,NULL,NULL,NULL),(12865,NULL,'Colombo   ','Padukka   ','Waga East',1,NULL,NULL,NULL,NULL,NULL),(12866,NULL,'Colombo   ','Padukka   ','Waga North',1,NULL,NULL,NULL,NULL,NULL),(12867,NULL,'Colombo   ','Padukka   ','Waga South',1,NULL,NULL,NULL,NULL,NULL),(12868,NULL,'Colombo   ','Padukka   ','Waga West',1,NULL,NULL,NULL,NULL,NULL),(12869,NULL,'Kalutara   ','Ingiriya   ','Wagawatta',1,NULL,NULL,NULL,NULL,NULL),(12870,NULL,'Hambantota   ','Tangalle   ','Wagegoda',1,NULL,NULL,NULL,NULL,NULL),(12871,NULL,'Nuwara Eliya   ','Ambagamuwa   ','Waggama',1,NULL,NULL,NULL,NULL,NULL),(12872,NULL,'Anuradhapura   ','Horowpothana   ','Wagollakada',1,NULL,NULL,NULL,NULL,NULL),(12873,NULL,'Kurunegala   ','Pannala   ','Waguruwela',1,NULL,NULL,NULL,NULL,NULL),(12874,NULL,'Moneragala   ','Buttala   ','Waguruwela',1,NULL,NULL,NULL,NULL,NULL),(12875,NULL,'Matale   ','Galewela   ','Wahakotte',1,NULL,NULL,NULL,NULL,NULL),(12876,NULL,'Kegalle   ','Ruwanwella   ','Wahakula',1,NULL,NULL,NULL,NULL,NULL),(12877,NULL,'Matara   ','Welipitiya   ','Wahala Kananke North',1,NULL,NULL,NULL,NULL,NULL),(12878,NULL,'Matara   ','Welipitiya   ','Wahala Kananke South',1,NULL,NULL,NULL,NULL,NULL),(12879,NULL,'Anuradhapura   ','Horowpothana   ','Wahalkada D 1',1,NULL,NULL,NULL,NULL,NULL),(12880,NULL,'Anuradhapura   ','Horowpothana   ','Wahalkada D 2',1,NULL,NULL,NULL,NULL,NULL),(12881,NULL,'Anuradhapura   ','Rambewa   ','Wahamalgolewa Track 5',1,NULL,NULL,NULL,NULL,NULL),(12882,NULL,'Anuradhapura   ','Rambewa   ','Wahamalgollewa',1,NULL,NULL,NULL,NULL,NULL),(12883,NULL,'Anuradhapura   ','Rambewa   ','Wahamalgollewa Track 3 A',1,NULL,NULL,NULL,NULL,NULL),(12884,NULL,'Gampaha   ','Dompe   ','Waharaka',1,NULL,NULL,NULL,NULL,NULL),(12885,NULL,'Kegalle   ','Ruwanwella   ','Waharaka',1,NULL,NULL,NULL,NULL,NULL),(12886,NULL,'Kegalle   ','Aranayaka   ','Waharakgoda',1,NULL,NULL,NULL,NULL,NULL),(12887,NULL,'Hambantota   ','Beliatta   ','Waharakgoda North',1,NULL,NULL,NULL,NULL,NULL),(12888,NULL,'Hambantota   ','Beliatta   ','Waharakgoda South',1,NULL,NULL,NULL,NULL,NULL),(12889,NULL,'Kegalle   ','Rambukkana   ','Wahawa',1,NULL,NULL,NULL,NULL,NULL),(12890,NULL,'Kandy   ','Udapalatha   ','Wahugapitiya',1,NULL,NULL,NULL,NULL,NULL),(12891,NULL,'Kurunegala   ','Kuliyapitiya West   ','Wahumuwa',1,NULL,NULL,NULL,NULL,NULL),(12892,NULL,'Puttalam   ','Wennappuwa   ','Waikkala North',1,NULL,NULL,NULL,NULL,NULL),(12893,NULL,'Puttalam   ','Wennappuwa   ','Waikkala South',1,NULL,NULL,NULL,NULL,NULL),(12894,NULL,'Puttalam   ','Arachchikattuwa   ','Wairankattuwa',1,NULL,NULL,NULL,NULL,NULL),(12895,NULL,'Hambantota   ','Angunakolapelessa   ','Wakamulla',1,NULL,NULL,NULL,NULL,NULL),(12896,NULL,'Kegalle   ','Aranayaka   ','Wakirigala',1,NULL,NULL,NULL,NULL,NULL),(12897,NULL,'Kurunegala   ','Kuliyapitiya East   ','Wakkunewala',1,NULL,NULL,NULL,NULL,NULL),(12898,NULL,'Galle   ','Bope-Poddala   ','Wakwella',1,NULL,NULL,NULL,NULL,NULL),(12899,NULL,'Kegalle   ','Galigamuwa   ','Walagama',1,NULL,NULL,NULL,NULL,NULL),(12900,NULL,'Anuradhapura   ','Thirappane   ','Walagambahuwa',1,NULL,NULL,NULL,NULL,NULL),(12901,NULL,'Kurunegala   ','Galgamuwa   ','Walagambapura',1,NULL,NULL,NULL,NULL,NULL),(12902,NULL,'Kurunegala   ','Polgahawela   ','Walagammulla',1,NULL,NULL,NULL,NULL,NULL),(12903,NULL,'Galle   ','Balapitiya   ','Walagedara',1,NULL,NULL,NULL,NULL,NULL),(12904,NULL,'Kalutara   ','Mathugama   ','Walagedara North',1,NULL,NULL,NULL,NULL,NULL),(12905,NULL,'Kandy   ','Udunuwara   ','Walagedara North',1,NULL,NULL,NULL,NULL,NULL),(12906,NULL,'Kalutara   ','Mathugama   ','Walagedara South',1,NULL,NULL,NULL,NULL,NULL),(12907,NULL,'Kandy   ','Udunuwara   ','Walagedara South',1,NULL,NULL,NULL,NULL,NULL),(12908,NULL,'Matara   ','Athuraliya   ','Walagepiyadda',1,NULL,NULL,NULL,NULL,NULL),(12909,NULL,'Galle   ','Akmeemana   ','Walahanduwa',1,NULL,NULL,NULL,NULL,NULL),(12910,NULL,'Anuradhapura   ','Horowpothana   ','Walahaviddawewa',1,NULL,NULL,NULL,NULL,NULL),(12911,NULL,'Kandy   ','Akurana   ','Walahena',1,NULL,NULL,NULL,NULL,NULL),(12912,NULL,'Puttalam   ','Madampe   ','Walahena',1,NULL,NULL,NULL,NULL,NULL),(12913,NULL,'Kalutara   ','Palindanuwara   ','Walakada',1,NULL,NULL,NULL,NULL,NULL),(12914,NULL,'Ratnapura   ','Kolonna   ','Walakada',1,NULL,NULL,NULL,NULL,NULL),(12915,NULL,'Galle   ','Ambalangoda   ','Walakanda',1,NULL,NULL,NULL,NULL,NULL),(12916,NULL,'Matara   ','Kirinda Puhulwella   ','Walakanda  East',1,NULL,NULL,NULL,NULL,NULL),(12917,NULL,'Matara   ','Kirinda Puhulwella   ','Walakanda South',1,NULL,NULL,NULL,NULL,NULL),(12918,NULL,'Matara   ','Kirinda Puhulwella   ','Walakanda West',1,NULL,NULL,NULL,NULL,NULL),(12919,NULL,'Kandy   ','Pathadumbara   ','Walala',1,NULL,NULL,NULL,NULL,NULL),(12920,NULL,'Nuwara Eliya   ','Hanguranketha   ','Walalawela',1,NULL,NULL,NULL,NULL,NULL),(12921,NULL,'Ratnapura   ','Embilipitiya   ','Walalgoda',1,NULL,NULL,NULL,NULL,NULL),(12922,NULL,'Kegalle   ','Rambukkana   ','Walalgoda',1,NULL,NULL,NULL,NULL,NULL),(12923,NULL,'Kurunegala   ','Ambanpola   ','Walaliya',1,NULL,NULL,NULL,NULL,NULL),(12924,NULL,'Kurunegala   ','Katupotha   ','Walaliya',1,NULL,NULL,NULL,NULL,NULL),(12925,NULL,'Gampaha   ','Attanagalla   ','Walaliyadda',1,NULL,NULL,NULL,NULL,NULL),(12926,NULL,'Kalutara   ','Walallavita   ','Walallavita East',1,NULL,NULL,NULL,NULL,NULL),(12927,NULL,'Kalutara   ','Walallavita   ','Walallavita South',1,NULL,NULL,NULL,NULL,NULL),(12928,NULL,'Kalutara   ','Panadura   ','Walana',1,NULL,NULL,NULL,NULL,NULL),(12929,NULL,'Matara   ','Weligama   ','Walana',1,NULL,NULL,NULL,NULL,NULL),(12930,NULL,'Kalutara   ','Panadura   ','Walana North',1,NULL,NULL,NULL,NULL,NULL),(12931,NULL,'Kalutara   ','Panadura   ','Walana South',1,NULL,NULL,NULL,NULL,NULL),(12932,NULL,'Gampaha   ','Katana   ','Walanagoda',1,NULL,NULL,NULL,NULL,NULL),(12933,NULL,'Ratnapura   ','Kuruvita   ','Walandura',1,NULL,NULL,NULL,NULL,NULL),(12934,NULL,'Kalutara   ','Panadura   ','Walapala',1,NULL,NULL,NULL,NULL,NULL),(12935,NULL,'Kalutara   ','Panadura   ','Walapala Pattiya',1,NULL,NULL,NULL,NULL,NULL),(12936,NULL,'Nuwara Eliya   ','Walapane   ','Walapane',1,NULL,NULL,NULL,NULL,NULL),(12937,NULL,'Gampaha   ','Dompe   ','Walaramba',1,NULL,NULL,NULL,NULL,NULL),(12938,NULL,'Matara   ','Dickwella   ','Walasgala East',1,NULL,NULL,NULL,NULL,NULL),(12939,NULL,'Matara   ','Dickwella   ','Walasgala West',1,NULL,NULL,NULL,NULL,NULL),(12940,NULL,'Hambantota   ','Mundalama   ','Walasmulla East',1,NULL,NULL,NULL,NULL,NULL),(12941,NULL,'Hambantota   ','Mundalama   ','Walasmulla North',1,NULL,NULL,NULL,NULL,NULL),(12942,NULL,'Hambantota   ','Mundalama   ','Walasmulla South',1,NULL,NULL,NULL,NULL,NULL),(12943,NULL,'Hambantota   ','Mundalama   ','Walasmulla West',1,NULL,NULL,NULL,NULL,NULL),(12944,NULL,'Matale   ','Galewela   ','Walaswewa',1,NULL,NULL,NULL,NULL,NULL),(12945,NULL,'Kurunegala   ','Galgamuwa   ','Walaswewa',1,NULL,NULL,NULL,NULL,NULL),(12946,NULL,'Kurunegala   ','Kobeigane   ','Walaswewa',1,NULL,NULL,NULL,NULL,NULL),(12947,NULL,'Anuradhapura   ','Galnewa   ','Walaswewa',1,NULL,NULL,NULL,NULL,NULL),(12948,NULL,'Kalutara   ','Beruwala   ','Walathara',1,NULL,NULL,NULL,NULL,NULL),(12949,NULL,'Kurunegala   ','Ehetuwewa   ','Walathwewa',1,NULL,NULL,NULL,NULL,NULL),(12950,NULL,'Ratnapura   ','Eheliyagoda   ','Walavita',1,NULL,NULL,NULL,NULL,NULL),(12951,NULL,'Hambantota   ','Hambantota   ','Walawa',1,NULL,NULL,NULL,NULL,NULL),(12952,NULL,'Galle   ','Bope-Poddala   ','Walawatta',1,NULL,NULL,NULL,NULL,NULL),(12953,NULL,'Matale   ','Yatawatta   ','Walawela',1,NULL,NULL,NULL,NULL,NULL),(12954,NULL,'Hambantota   ','Ambalantota   ','Walawewatta East',1,NULL,NULL,NULL,NULL,NULL),(12955,NULL,'Hambantota   ','Ambalantota   ','Walawewatta West',1,NULL,NULL,NULL,NULL,NULL),(12956,NULL,'Colombo   ','Hanwella   ','Walawwatta',1,NULL,NULL,NULL,NULL,NULL),(12957,NULL,'Gampaha   ','Mirigama   ','Walawwatta',1,NULL,NULL,NULL,NULL,NULL),(12958,NULL,'Galle   ','Galle Four Gravets   ','Walawwatta',1,NULL,NULL,NULL,NULL,NULL),(12959,NULL,'Anuradhapura   ','Ipalogama   ','Walawwegama',1,NULL,NULL,NULL,NULL,NULL),(12960,NULL,'Gampaha   ','Mirigama   ','Walbothale',1,NULL,NULL,NULL,NULL,NULL),(12961,NULL,'Matara   ','Devinuwara   ','Walbulugahahena',1,NULL,NULL,NULL,NULL,NULL),(12962,NULL,'Kandy   ','Poojapitiya   ','Waldeniya',1,NULL,NULL,NULL,NULL,NULL),(12963,NULL,'Kegalle   ','Kegalle   ','Waldeniya',1,NULL,NULL,NULL,NULL,NULL),(12964,NULL,'Ratnapura   ','Imbulpe   ','Waleboda North',1,NULL,NULL,NULL,NULL,NULL),(12965,NULL,'Kandy   ','Udunuwara   ','Walgama',1,NULL,NULL,NULL,NULL,NULL),(12966,NULL,'Matara   ','Matara Four Gravets   ','Walgama',1,NULL,NULL,NULL,NULL,NULL),(12967,NULL,'Kegalle   ','Rambukkana   ','Walgama',1,NULL,NULL,NULL,NULL,NULL),(12968,NULL,'Gampaha   ','Biyagama   ','Walgama East',1,NULL,NULL,NULL,NULL,NULL),(12969,NULL,'Matara   ','Matara Four Gravets   ','Walgama Meda',1,NULL,NULL,NULL,NULL,NULL),(12970,NULL,'Kalutara   ','Bandaragama   ','Walgama North',1,NULL,NULL,NULL,NULL,NULL),(12971,NULL,'Matara   ','Matara Four Gravets   ','Walgama North',1,NULL,NULL,NULL,NULL,NULL),(12972,NULL,'Kalutara   ','Bandaragama   ','Walgama South',1,NULL,NULL,NULL,NULL,NULL),(12973,NULL,'Matara   ','Matara Four Gravets   ','Walgama South',1,NULL,NULL,NULL,NULL,NULL),(12974,NULL,'Gampaha   ','Biyagama   ','Walgama West',1,NULL,NULL,NULL,NULL,NULL),(12975,NULL,'Hambantota   ','Tangalle   ','Walgameliya',1,NULL,NULL,NULL,NULL,NULL),(12976,NULL,'Gampaha   ','Attanagalla   ','Walgammulla',1,NULL,NULL,NULL,NULL,NULL),(12977,NULL,'Hambantota   ','Katuwana   ','Walgammulla',1,NULL,NULL,NULL,NULL,NULL),(12978,NULL,'Kegalle   ','Ruwanwella   ','Walgampatha',1,NULL,NULL,NULL,NULL,NULL),(12979,NULL,'Kandy   ','Yatinuwara   ','Walgampaya',1,NULL,NULL,NULL,NULL,NULL),(12980,NULL,'Ampara   ','Uhana   ','Walgampura',1,NULL,NULL,NULL,NULL,NULL),(12981,NULL,'Matale   ','Dambulla   ','Walgamwewa',1,NULL,NULL,NULL,NULL,NULL),(12982,NULL,'Kandy   ','Yatinuwara   ','Walgowwagoda',1,NULL,NULL,NULL,NULL,NULL),(12983,NULL,'Badulla   ','Haldummulla   ','Walhaputhenna',1,NULL,NULL,NULL,NULL,NULL),(12984,NULL,'Galle   ','Karandeniya   ','Walinguruketiya',1,NULL,NULL,NULL,NULL,NULL),(12985,NULL,'Kandy   ','Ganga Ihala Korale   ','Wallahagoda',1,NULL,NULL,NULL,NULL,NULL),(12986,NULL,'Ratnapura   ','Opanayaka   ','Wallaketiya',1,NULL,NULL,NULL,NULL,NULL),(12987,NULL,'Galle   ','Elpitiya   ','Wallambagala',1,NULL,NULL,NULL,NULL,NULL),(12988,NULL,'Galle   ','Elpitiya   ','Wallambagala North',1,NULL,NULL,NULL,NULL,NULL),(12989,NULL,'Matara   ','Weligama   ','Walliwala East',1,NULL,NULL,NULL,NULL,NULL),(12990,NULL,'Matara   ','Weligama   ','Walliwala South',1,NULL,NULL,NULL,NULL,NULL),(12991,NULL,'Matara   ','Weligama   ','Walliwala West',1,NULL,NULL,NULL,NULL,NULL),(12992,NULL,'Matale   ','Matale   ','Walliwela',1,NULL,NULL,NULL,NULL,NULL),(12993,NULL,'Matale   ','Pallepola   ','Walmoruwa',1,NULL,NULL,NULL,NULL,NULL),(12994,NULL,'Matara   ','Matara Four Gravets   ','Walpala',1,NULL,NULL,NULL,NULL,NULL),(12995,NULL,'Kandy   ','Pathadumbara   ','Walpaladeniya',1,NULL,NULL,NULL,NULL,NULL),(12996,NULL,'Kandy   ','Hatharaliyadda   ','Walpalagolla East',1,NULL,NULL,NULL,NULL,NULL),(12997,NULL,'Kandy   ','Hatharaliyadda   ','Walpalagolla North',1,NULL,NULL,NULL,NULL,NULL),(12998,NULL,'Kandy   ','Hatharaliyadda   ','Walpalagolla South',1,NULL,NULL,NULL,NULL,NULL),(12999,NULL,'Kurunegala   ','Mahawa   ','Walpaluwa',1,NULL,NULL,NULL,NULL,NULL),(13000,NULL,'Kurunegala   ','Wariyapola   ','Walpaluwa',1,NULL,NULL,NULL,NULL,NULL),(13001,NULL,'Puttalam   ','Mahakumbukkadawala   ','Walpaluwa',1,NULL,NULL,NULL,NULL,NULL),(13002,NULL,'Colombo   ','Homagama   ','Walpita',1,NULL,NULL,NULL,NULL,NULL),(13003,NULL,'Gampaha   ','Divulapitiya   ','Walpita',1,NULL,NULL,NULL,NULL,NULL),(13004,NULL,'Kalutara   ','Madurawela   ','Walpita',1,NULL,NULL,NULL,NULL,NULL),(13005,NULL,'Galle   ','Baddegama   ','Walpita North',1,NULL,NULL,NULL,NULL,NULL),(13006,NULL,'Galle   ','Baddegama   ','Walpita South',1,NULL,NULL,NULL,NULL,NULL),(13007,NULL,'Kurunegala   ','Udubaddawa   ','Walpitagama',1,NULL,NULL,NULL,NULL,NULL),(13008,NULL,'Gampaha   ','Minuwangoda   ','Walpitamulla',1,NULL,NULL,NULL,NULL,NULL),(13009,NULL,'Colombo   ','Kaduwela   ','Walpola',1,NULL,NULL,NULL,NULL,NULL),(13010,NULL,'Gampaha   ','Katana   ','Walpola',1,NULL,NULL,NULL,NULL,NULL),(13011,NULL,'Gampaha   ','Attanagalla   ','Walpola',1,NULL,NULL,NULL,NULL,NULL),(13012,NULL,'Gampaha   ','Dompe   ','Walpola',1,NULL,NULL,NULL,NULL,NULL),(13013,NULL,'Matale   ','Yatawatta   ','Walpola',1,NULL,NULL,NULL,NULL,NULL),(13014,NULL,'Kurunegala   ','Bamunakotuwa   ','Walpola',1,NULL,NULL,NULL,NULL,NULL),(13015,NULL,'Anuradhapura   ','Medawachchiya   ','Walpola',1,NULL,NULL,NULL,NULL,NULL),(13016,NULL,'Kegalle   ','Dehiovita   ','Walpola',1,NULL,NULL,NULL,NULL,NULL),(13017,NULL,'Gampaha   ','Ja-Ela   ','Walpola East',1,NULL,NULL,NULL,NULL,NULL),(13018,NULL,'Gampaha   ','Ja-Ela   ','Walpola West',1,NULL,NULL,NULL,NULL,NULL),(13019,NULL,'Kurunegala   ','Mallawapitiya   ','Walpolakanda North',1,NULL,NULL,NULL,NULL,NULL),(13020,NULL,'Kurunegala   ','Mallawapitiya   ','Walpolakanda South',1,NULL,NULL,NULL,NULL,NULL),(13021,NULL,'Nuwara Eliya   ','Nuwara Eliya   ','Waltrim Watta',1,NULL,NULL,NULL,NULL,NULL),(13022,NULL,'Anuradhapura   ','Palagala   ','Wambatuwewa',1,NULL,NULL,NULL,NULL,NULL),(13023,NULL,'Matale   ','Naula   ','Wambatuyaya',1,NULL,NULL,NULL,NULL,NULL),(13024,NULL,'Kandy   ','Delthota   ','Wanahapuwa',1,NULL,NULL,NULL,NULL,NULL),(13025,NULL,'Kandy   ','Udapalatha   ','Wanahapuwa',1,NULL,NULL,NULL,NULL,NULL),(13026,NULL,'Gampaha   ','Dompe   ','Wanaluwawa North',1,NULL,NULL,NULL,NULL,NULL),(13027,NULL,'Gampaha   ','Dompe   ','Wanaluwawa South',1,NULL,NULL,NULL,NULL,NULL),(13028,NULL,'Anuradhapura   ','Thirappane   ','Wanamal Uyana',1,NULL,NULL,NULL,NULL,NULL),(13029,NULL,'Matale   ','Rattota   ','Wanaraniya',1,NULL,NULL,NULL,NULL,NULL),(13030,NULL,'Matale   ','Wilgamuwa   ','Wanarawa',1,NULL,NULL,NULL,NULL,NULL),(13031,NULL,'Matara   ','Pitabeddara   ','Wanasinkanda',1,NULL,NULL,NULL,NULL,NULL),(13032,NULL,'Colombo   ','Thimbirigasyaya   ','Wanathamulla',1,NULL,NULL,NULL,NULL,NULL),(13033,NULL,'Gampaha   ','Kelaniya   ','Wanawasala East',1,NULL,NULL,NULL,NULL,NULL),(13034,NULL,'Gampaha   ','Kelaniya   ','Wanawasala West',1,NULL,NULL,NULL,NULL,NULL),(13035,NULL,'Galle   ','Akmeemana   ','Wanchawala',1,NULL,NULL,NULL,NULL,NULL),(13036,NULL,'Galle   ','Balapitiya   ','Wandadoowa',1,NULL,NULL,NULL,NULL,NULL),(13037,NULL,'Kalutara   ','Agalawatta   ','Wandurabba',1,NULL,NULL,NULL,NULL,NULL),(13038,NULL,'Kurunegala   ','Kurunegala   ','Wanduragala',1,NULL,NULL,NULL,NULL,NULL),(13039,NULL,'Galle   ','Baddegama   ','Wanduramba',1,NULL,NULL,NULL,NULL,NULL),(13040,NULL,'Galle   ','Baddegama   ','Wanduramba South',1,NULL,NULL,NULL,NULL,NULL),(13041,NULL,'Gampaha   ','Attanagalla   ','Wanduramulla',1,NULL,NULL,NULL,NULL,NULL),(13042,NULL,'Kalutara   ','Bandaragama   ','Wanduramulla East',1,NULL,NULL,NULL,NULL,NULL),(13043,NULL,'Kalutara   ','Bandaragama   ','Wanduramulla West',1,NULL,NULL,NULL,NULL,NULL),(13044,NULL,'Kurunegala   ','Bingiriya   ','Wandurassa',1,NULL,NULL,NULL,NULL,NULL),(13045,NULL,'Gampaha   ','Mirigama   ','Wandurawa',1,NULL,NULL,NULL,NULL,NULL),(13046,NULL,'Kurunegala   ','Polpithigama   ','Wanduressa',1,NULL,NULL,NULL,NULL,NULL),(13047,NULL,'Kurunegala   ','Wariyapola   ','Wanduressa',1,NULL,NULL,NULL,NULL,NULL),(13048,NULL,'Kurunegala   ','Wariyapola   ','Wanduressa Welgala',1,NULL,NULL,NULL,NULL,NULL),(13049,NULL,'Hambantota   ','Ambalantota   ','Wanduruppa',1,NULL,NULL,NULL,NULL,NULL),(13050,NULL,'Badulla   ','Welimada   ','Wangiyakumbura',1,NULL,NULL,NULL,NULL,NULL),(13051,NULL,'Gampaha   ','Minuwangoda   ','Wankepumulla',1,NULL,NULL,NULL,NULL,NULL),(13052,NULL,'Kurunegala   ','Polpithigama   ','Wanlipitiya',1,NULL,NULL,NULL,NULL,NULL),(13053,NULL,'Anuradhapura   ','Galenbindunuwewa   ','Wannamkulama',1,NULL,NULL,NULL,NULL,NULL),(13054,NULL,'Anuradhapura   ','Thirappane   ','Wannamkulama',1,NULL,NULL,NULL,NULL,NULL),(13055,NULL,'Anuradhapura   ','Thirappane   ','Wannammaduwa',1,NULL,NULL,NULL,NULL,NULL),(13056,NULL,'Puttalam   ','Kalpitiya   ','Wanni Mundalama',1,NULL,NULL,NULL,NULL,NULL),(13057,NULL,'Kurunegala   ','Kobeigane   ','Wannigama',1,NULL,NULL,NULL,NULL,NULL),(13058,NULL,'Kurunegala   ','Giribawa   ','Wannikudawewa',1,NULL,NULL,NULL,NULL,NULL),(13059,NULL,'Anuradhapura   ','Nuwaragam Palatha East   ','Wannikulama kotasa 1',1,NULL,NULL,NULL,NULL,NULL),(13060,NULL,'Anuradhapura   ','Nuwaragam Palatha East   ','Wannikulama kotasa 2',1,NULL,NULL,NULL,NULL,NULL),(13061,NULL,'Anuradhapura   ','Nuwaragam Palatha East   ','Wannikulama kotasa 3',1,NULL,NULL,NULL,NULL,NULL),(13062,NULL,'Anuradhapura   ','Nuwaragam Palatha East   ','Wannikulama kotasa 4',1,NULL,NULL,NULL,NULL,NULL),(13063,NULL,'Anuradhapura   ','Nuwaragam Palatha East   ','Wannikulama kotasa 5',1,NULL,NULL,NULL,NULL,NULL),(13064,NULL,'Anuradhapura   ','Nuwaragam Palatha East   ','Wannikulama kotasa 6',1,NULL,NULL,NULL,NULL,NULL),(13065,NULL,'Anuradhapura   ','Nuwaragam Palatha East   ','Wannithammennawa',1,NULL,NULL,NULL,NULL,NULL),(13066,NULL,'Ratnapura   ','Nivithigala   ','Wanniyawatta',1,NULL,NULL,NULL,NULL,NULL),(13067,NULL,'Gampaha   ','Divulapitiya   ','Waradala',1,NULL,NULL,NULL,NULL,NULL),(13068,NULL,'Kurunegala   ','Kurunegala   ','Waraddana',1,NULL,NULL,NULL,NULL,NULL),(13069,NULL,'Kurunegala   ','Mawathagama   ','Waraddana',1,NULL,NULL,NULL,NULL,NULL),(13070,NULL,'Kandy   ','Medadumbara   ','Waradiwela',1,NULL,NULL,NULL,NULL,NULL),(13071,NULL,'Moneragala   ','Badalkumbura   ','Waradola',1,NULL,NULL,NULL,NULL,NULL),(13072,NULL,'Moneragala   ','Siyambalanduwa   ','Waragama',1,NULL,NULL,NULL,NULL,NULL),(13073,NULL,'Kurunegala   ','Ambanpola   ','Waragammana',1,NULL,NULL,NULL,NULL,NULL),(13074,NULL,'Kandy   ','Akurana   ','Waragashinna',1,NULL,NULL,NULL,NULL,NULL),(13075,NULL,'Kegalle   ','Rambukkana   ','Waragoda',1,NULL,NULL,NULL,NULL,NULL),(13076,NULL,'Kandy   ','Minipe   ','Waragolla',1,NULL,NULL,NULL,NULL,NULL),(13077,NULL,'Galle   ','Benthota   ','Warahena',1,NULL,NULL,NULL,NULL,NULL),(13078,NULL,'Badulla   ','Hali-Ela   ','Warakadanda',1,NULL,NULL,NULL,NULL,NULL),(13079,NULL,'Kandy   ','Poojapitiya   ','Warakadeniya',1,NULL,NULL,NULL,NULL,NULL),(13080,NULL,'Kandy   ','Udunuwara   ','Warakagoda',1,NULL,NULL,NULL,NULL,NULL),(13081,NULL,'Kalutara   ','Madurawela   ','Warakagoda East',1,NULL,NULL,NULL,NULL,NULL),(13082,NULL,'Kalutara   ','Madurawela   ','Warakagoda North',1,NULL,NULL,NULL,NULL,NULL),(13083,NULL,'Kalutara   ','Madurawela   ','Warakagoda South',1,NULL,NULL,NULL,NULL,NULL),(13084,NULL,'Kalutara   ','Madurawela   ','Warakagoda West',1,NULL,NULL,NULL,NULL,NULL),(13085,NULL,'Galle   ','Benthota   ','Warakamulla',1,NULL,NULL,NULL,NULL,NULL),(13086,NULL,'Matale   ','Ukuwela   ','Warakamura',1,NULL,NULL,NULL,NULL,NULL),(13087,NULL,'Gampaha   ','Kelaniya   ','Warakanatta',1,NULL,NULL,NULL,NULL,NULL),(13088,NULL,'Kegalle   ','Mawanella   ','Warakapana',1,NULL,NULL,NULL,NULL,NULL),(13089,NULL,'Galle   ','Baddegama   ','Warakapitikanda',1,NULL,NULL,NULL,NULL,NULL),(13090,NULL,'Matara   ','Welipitiya   ','Warakapitiya East',1,NULL,NULL,NULL,NULL,NULL),(13091,NULL,'Matara   ','Welipitiya   ','Warakapitiya North',1,NULL,NULL,NULL,NULL,NULL),(13092,NULL,'Matara   ','Welipitiya   ','Warakapitiya South',1,NULL,NULL,NULL,NULL,NULL),(13093,NULL,'Kegalle   ','Warakapola   ','Warakapola',1,NULL,NULL,NULL,NULL,NULL),(13094,NULL,'Kalutara   ','Mathugama   ','Warakatholla',1,NULL,NULL,NULL,NULL,NULL),(13095,NULL,'Kandy   ','Pasbage Korale   ','Warakawa',1,NULL,NULL,NULL,NULL,NULL),(13096,NULL,'Kurunegala   ','Rideegama   ','Warakawehera',1,NULL,NULL,NULL,NULL,NULL),(13097,NULL,'Matara   ','Kotapola   ','Waralla',1,NULL,NULL,NULL,NULL,NULL),(13098,NULL,'Gampaha   ','Mahara   ','Warapalana',1,NULL,NULL,NULL,NULL,NULL),(13099,NULL,'Kalutara   ','Beruwala   ','Warapitiya',1,NULL,NULL,NULL,NULL,NULL),(13100,NULL,'Matale   ','Rattota   ','Warapitiya',1,NULL,NULL,NULL,NULL,NULL),(13101,NULL,'Nuwara Eliya   ','Hanguranketha   ','Warapitiya',1,NULL,NULL,NULL,NULL,NULL),(13102,NULL,'Hambantota   ','Mundalama   ','Warapitiya',1,NULL,NULL,NULL,NULL,NULL),(13103,NULL,'Polonnaruwa   ','Dimbulagala   ','Warapitiya',1,NULL,NULL,NULL,NULL,NULL),(13104,NULL,'Kandy   ','Harispattuwa   ','Waratenna',1,NULL,NULL,NULL,NULL,NULL),(13105,NULL,'Kurunegala   ','Giribawa   ','Warawewa',1,NULL,NULL,NULL,NULL,NULL),(13106,NULL,'Ratnapura   ','Godakawela   ','Warayaya',1,NULL,NULL,NULL,NULL,NULL),(13107,NULL,'Ratnapura   ','Pelmadulla   ','Warigama',1,NULL,NULL,NULL,NULL,NULL),(13108,NULL,'Kandy   ','Doluwa   ','Wariyagala',1,NULL,NULL,NULL,NULL,NULL),(13109,NULL,'Matale   ','Ukuwela   ','Wariyapola',1,NULL,NULL,NULL,NULL,NULL),(13110,NULL,'Kurunegala   ','Wariyapola   ','Wariyapola',1,NULL,NULL,NULL,NULL,NULL),(13111,NULL,'Matale   ','Ukuwela   ','Wariyapola Watta',1,NULL,NULL,NULL,NULL,NULL),(13112,NULL,'Galle   ','Neluwa   ','Warukandeniya',1,NULL,NULL,NULL,NULL,NULL),(13113,NULL,'Moneragala   ','Wellawaya   ','Warunagama',1,NULL,NULL,NULL,NULL,NULL),(13114,NULL,'Badulla   ','Kandaketiya   ','Wasanagama',1,NULL,NULL,NULL,NULL,NULL),(13115,NULL,'Moneragala   ','Badalkumbura   ','Wasipotha',1,NULL,NULL,NULL,NULL,NULL),(13116,NULL,'Kurunegala   ','Nikaweratiya   ','Wasiwewe',1,NULL,NULL,NULL,NULL,NULL),(13117,NULL,'Gampaha   ','Attanagalla   ','Wataddara',1,NULL,NULL,NULL,NULL,NULL),(13118,NULL,'Nuwara Eliya   ','Kothmale   ','Wataddara',1,NULL,NULL,NULL,NULL,NULL),(13119,NULL,'Gampaha   ','Attanagalla   ','Wataddara South',1,NULL,NULL,NULL,NULL,NULL),(13120,NULL,'Gampaha   ','Attanagalla   ','Wataddara West',1,NULL,NULL,NULL,NULL,NULL),(13121,NULL,'Kandy   ','Udunuwara   ','Watadeniya',1,NULL,NULL,NULL,NULL,NULL),(13122,NULL,'Kandy   ','Poojapitiya   ','Watagalathenna',1,NULL,NULL,NULL,NULL,NULL),(13123,NULL,'Badulla   ','Bandarawela   ','Watagamuwa',1,NULL,NULL,NULL,NULL,NULL),(13124,NULL,'Badulla   ','Haldummulla   ','Watagamuwa',1,NULL,NULL,NULL,NULL,NULL),(13125,NULL,'Matara   ','Thihagoda   ','Watagedara',1,NULL,NULL,NULL,NULL,NULL),(13126,NULL,'Matara   ','Thihagoda   ','Watagedara East',1,NULL,NULL,NULL,NULL,NULL),(13127,NULL,'Matara   ','Welipitiya   ','Watagedaramulla',1,NULL,NULL,NULL,NULL,NULL),(13128,NULL,'Kandy   ','Poojapitiya   ','Watagoda',1,NULL,NULL,NULL,NULL,NULL),(13129,NULL,'Matale   ','Ukuwela   ','Watagoda',1,NULL,NULL,NULL,NULL,NULL),(13130,NULL,'Nuwara Eliya   ','Nuwara Eliya   ','Watagoda',1,NULL,NULL,NULL,NULL,NULL),(13131,NULL,'Badulla   ','Meegahakivula   ','Watagommana',1,NULL,NULL,NULL,NULL,NULL),(13132,NULL,'Kandy   ','Ganga Ihala Korale   ','Watakedeniya',1,NULL,NULL,NULL,NULL,NULL),(13133,NULL,'Kandy   ','Panvila   ','Watakele',1,NULL,NULL,NULL,NULL,NULL),(13134,NULL,'Kandy   ','Delthota   ','Watakepotha',1,NULL,NULL,NULL,NULL,NULL),(13135,NULL,'Nuwara Eliya   ','Walapane   ','Watambe',1,NULL,NULL,NULL,NULL,NULL),(13136,NULL,'Kandy   ','Medadumbara   ','Watapana',1,NULL,NULL,NULL,NULL,NULL),(13137,NULL,'Ratnapura   ','Nivithigala   ','Watapotha',1,NULL,NULL,NULL,NULL,NULL),(13138,NULL,'Kandy   ','Kandy Four Gravets and Gangawata Korale   ','Watapuluwa',1,NULL,NULL,NULL,NULL,NULL),(13139,NULL,'Kandy   ','Kandy Four Gravets and Gangawata Korale   ','Watapuluwa South',1,NULL,NULL,NULL,NULL,NULL),(13140,NULL,'Kandy   ','Kandy Four Gravets and Gangawata Korale   ','Watapuluwa West',1,NULL,NULL,NULL,NULL,NULL),(13141,NULL,'Colombo   ','Ratmalana   ','Watarappala',1,NULL,NULL,NULL,NULL,NULL),(13142,NULL,'Kurunegala   ','Mawathagama   ','Watareka',1,NULL,NULL,NULL,NULL,NULL),(13143,NULL,'Galle   ','Bope-Poddala   ','Watareka East',1,NULL,NULL,NULL,NULL,NULL),(13144,NULL,'Colombo   ','Homagama   ','Watareka North',1,NULL,NULL,NULL,NULL,NULL),(13145,NULL,'Colombo   ','Homagama   ','Watareka South',1,NULL,NULL,NULL,NULL,NULL),(13146,NULL,'Gampaha   ','Dompe   ','Watawala',1,NULL,NULL,NULL,NULL,NULL),(13147,NULL,'Nuwara Eliya   ','Ambagamuwa   ','Watawala',1,NULL,NULL,NULL,NULL,NULL),(13148,NULL,'Ratnapura   ','Balangoda   ','Watawala',1,NULL,NULL,NULL,NULL,NULL),(13149,NULL,'Moneragala   ','Madulla   ','Watawanagama',1,NULL,NULL,NULL,NULL,NULL),(13150,NULL,'Nuwara Eliya   ','Hanguranketha   ','Watesthenna',1,NULL,NULL,NULL,NULL,NULL),(13151,NULL,'Galle   ','Imaduwa   ','Wathawana',1,NULL,NULL,NULL,NULL,NULL),(13152,NULL,'Galle   ','Yakkalamulla   ','Wathogala',1,NULL,NULL,NULL,NULL,NULL),(13153,NULL,'Galle   ','Balapitiya   ','Wathugedara',1,NULL,NULL,NULL,NULL,NULL),(13154,NULL,'Galle   ','Balapitiya   ','Wathugedara South',1,NULL,NULL,NULL,NULL,NULL),(13155,NULL,'Kurunegala   ','Katupotha   ','Wathukana',1,NULL,NULL,NULL,NULL,NULL),(13156,NULL,'Hambantota   ','Katuwana   ','Wathukanda',1,NULL,NULL,NULL,NULL,NULL),(13157,NULL,'Matara   ','Kirinda Puhulwella   ','Wathukolakanda East',1,NULL,NULL,NULL,NULL,NULL),(13158,NULL,'Matara   ','Kirinda Puhulwella   ','Wathukolakanda North',1,NULL,NULL,NULL,NULL,NULL),(13159,NULL,'Nuwara Eliya   ','Walapane   ','Wathulanda East',1,NULL,NULL,NULL,NULL,NULL),(13160,NULL,'Nuwara Eliya   ','Walapane   ','Wathulanda West',1,NULL,NULL,NULL,NULL,NULL),(13161,NULL,'Kandy   ','Medadumbara   ','Wathuliyadda',1,NULL,NULL,NULL,NULL,NULL),(13162,NULL,'Kandy   ','Pathahewaheta   ','Wathuliyadda',1,NULL,NULL,NULL,NULL,NULL),(13163,NULL,'Colombo   ','Ratmalana   ','Wathumulla',1,NULL,NULL,NULL,NULL,NULL),(13164,NULL,'Gampaha   ','Minuwangoda   ','Wathumulla',1,NULL,NULL,NULL,NULL,NULL),(13165,NULL,'Nuwara Eliya   ','Walapane   ','Wathumulla',1,NULL,NULL,NULL,NULL,NULL),(13166,NULL,'Gampaha   ','Attanagalla   ','Wathupitiwala',1,NULL,NULL,NULL,NULL,NULL),(13167,NULL,'Ratnapura   ','Nivithigala   ','Wathupitiya',1,NULL,NULL,NULL,NULL,NULL),(13168,NULL,'Kandy   ','Udunuwara   ','Wathupola',1,NULL,NULL,NULL,NULL,NULL),(13169,NULL,'Puttalam   ','Pallama   ','Wathupola',1,NULL,NULL,NULL,NULL,NULL),(13170,NULL,'Kegalle   ','Kegalle   ','Wathura',1,NULL,NULL,NULL,NULL,NULL),(13171,NULL,'Kandy   ','Yatinuwara   ','Wathurakumbura',1,NULL,NULL,NULL,NULL,NULL),(13172,NULL,'Ratnapura   ','Kalawana   ','Wathurawa',1,NULL,NULL,NULL,NULL,NULL),(13173,NULL,'Galle   ','Balapitiya   ','Wathurawela',1,NULL,NULL,NULL,NULL,NULL),(13174,NULL,'Galle   ','Balapitiya   ','Wathuregama',1,NULL,NULL,NULL,NULL,NULL),(13175,NULL,'Gampaha   ','Dompe   ','Wathurugama',1,NULL,NULL,NULL,NULL,NULL),(13176,NULL,'Galle   ','Elpitiya   ','Wathuruvila',1,NULL,NULL,NULL,NULL,NULL),(13177,NULL,'Kandy   ','Harispattuwa   ','Wathuwala',1,NULL,NULL,NULL,NULL,NULL),(13178,NULL,'Kurunegala   ','Udubaddawa   ','Wathuwatta',1,NULL,NULL,NULL,NULL,NULL),(13179,NULL,'Ratnapura   ','Kuruvita   ','Wathuyaya',1,NULL,NULL,NULL,NULL,NULL),(13180,NULL,'Gampaha   ','Minuwangoda   ','Watinapaha',1,NULL,NULL,NULL,NULL,NULL),(13181,NULL,'Gampaha   ','Minuwangoda   ','Watinapaha South',1,NULL,NULL,NULL,NULL,NULL),(13182,NULL,'Kalutara   ','Dodangoda   ','Wattahena',1,NULL,NULL,NULL,NULL,NULL),(13183,NULL,'Galle   ','Niyagama   ','Wattahena',1,NULL,NULL,NULL,NULL,NULL),(13184,NULL,'Puttalam   ','Chilaw   ','Wattakkalliya',1,NULL,NULL,NULL,NULL,NULL),(13185,NULL,'Gampaha   ','Wattala   ','Wattala',1,NULL,NULL,NULL,NULL,NULL),(13186,NULL,'Kalutara   ','Panadura   ','Wattalpola',1,NULL,NULL,NULL,NULL,NULL),(13187,NULL,'Kalutara   ','Kalutara   ','Wattamulla',1,NULL,NULL,NULL,NULL,NULL),(13188,NULL,'Kandy   ','Udunuwara   ','Wattappola',1,NULL,NULL,NULL,NULL,NULL),(13189,NULL,'Kandy   ','Kandy Four Gravets and Gangawata Korale   ','Wattaranthenna',1,NULL,NULL,NULL,NULL,NULL),(13190,NULL,'Kandy   ','Pathadumbara   ','Wattegama',1,NULL,NULL,NULL,NULL,NULL),(13191,NULL,'Matara   ','Dickwella   ','Wattegama',1,NULL,NULL,NULL,NULL,NULL),(13192,NULL,'Moneragala   ','Siyambalanduwa   ','Wattegama',1,NULL,NULL,NULL,NULL,NULL),(13193,NULL,'Kandy   ','Pathadumbara   ','Wattegama North',1,NULL,NULL,NULL,NULL,NULL),(13194,NULL,'Matara   ','Dickwella   ','Wattegama North',1,NULL,NULL,NULL,NULL,NULL),(13195,NULL,'Matara   ','Dickwella   ','Wattegama South',1,NULL,NULL,NULL,NULL,NULL),(13196,NULL,'Gampaha   ','Minuwangoda   ','Wattegedara',1,NULL,NULL,NULL,NULL,NULL),(13197,NULL,'Matale   ','Yatawatta   ','Wattegedara',1,NULL,NULL,NULL,NULL,NULL),(13198,NULL,'Matale   ','Ukuwela   ','Wattegedara',1,NULL,NULL,NULL,NULL,NULL),(13199,NULL,'Kurunegala   ','Mallawapitiya   ','Wattegedara',1,NULL,NULL,NULL,NULL,NULL),(13200,NULL,'Kurunegala   ','Pannala   ','Wattegedara',1,NULL,NULL,NULL,NULL,NULL),(13201,NULL,'Kegalle   ','Aranayaka   ','Wattegedara',1,NULL,NULL,NULL,NULL,NULL),(13202,NULL,'Kegalle   ','Deraniyagala   ','Wattegedera',1,NULL,NULL,NULL,NULL,NULL),(13203,NULL,'Kandy   ','Udapalatha   ','Wattehena',1,NULL,NULL,NULL,NULL,NULL),(13204,NULL,'Galle   ','Yakkalamulla   ','Wattehena',1,NULL,NULL,NULL,NULL,NULL),(13205,NULL,'Hambantota   ','Mundalama   ','Wattehengoda',1,NULL,NULL,NULL,NULL,NULL),(13206,NULL,'Badulla   ','Soranathota   ','Wattekele',1,NULL,NULL,NULL,NULL,NULL),(13207,NULL,'Gampaha   ','Divulapitiya   ','Wattemulla',1,NULL,NULL,NULL,NULL,NULL),(13208,NULL,'Anuradhapura   ','Kebithigollewa   ','Wattewewa',1,NULL,NULL,NULL,NULL,NULL),(13209,NULL,'Matara   ','Pitabeddara   ','Waturakumbura',1,NULL,NULL,NULL,NULL,NULL),(13210,NULL,'Kandy   ','Kundasale   ','Wavinna',1,NULL,NULL,NULL,NULL,NULL),(13211,NULL,'Ampara   ','Ampara   ','Wavinna North',1,NULL,NULL,NULL,NULL,NULL),(13212,NULL,'Ampara   ','Ampara   ','Wavinna South',1,NULL,NULL,NULL,NULL,NULL),(13213,NULL,'Matale   ','Dambulla   ','Wavul Ambe',1,NULL,NULL,NULL,NULL,NULL),(13214,NULL,'Galle   ','Baddegama   ','Wavulagala',1,NULL,NULL,NULL,NULL,NULL),(13215,NULL,'Galle   ','Hikkaduwa   ','Wavulagoda East',1,NULL,NULL,NULL,NULL,NULL),(13216,NULL,'Galle   ','Hikkaduwa   ','Wavulagoda West',1,NULL,NULL,NULL,NULL,NULL),(13217,NULL,'Matara   ','Kirinda Puhulwella   ','Wavulanbokka',1,NULL,NULL,NULL,NULL,NULL),(13218,NULL,'Matale   ','Naula   ','Wavunnawa',1,NULL,NULL,NULL,NULL,NULL),(13219,NULL,'Matara   ','Devinuwara   ','Wawwa',1,NULL,NULL,NULL,NULL,NULL),(13220,NULL,'Hambantota   ','Okewela   ','Wawwa',1,NULL,NULL,NULL,NULL,NULL),(13221,NULL,'Anuradhapura   ','Palugaswewa   ','Wayaulpatha',1,NULL,NULL,NULL,NULL,NULL),(13222,NULL,'Gampaha   ','Mahara   ','Webada East',1,NULL,NULL,NULL,NULL,NULL),(13223,NULL,'Gampaha   ','Mahara   ','Webada North',1,NULL,NULL,NULL,NULL,NULL),(13224,NULL,'Gampaha   ','Mahara   ','Webada South',1,NULL,NULL,NULL,NULL,NULL),(13225,NULL,'Gampaha   ','Mahara   ','Webada West',1,NULL,NULL,NULL,NULL,NULL),(13226,NULL,'Gampaha   ','Mirigama   ','Webadamulla',1,NULL,NULL,NULL,NULL,NULL),(13227,NULL,'Gampaha   ','Attanagalla   ','Wedagama',1,NULL,NULL,NULL,NULL,NULL),(13228,NULL,'Gampaha   ','Dompe   ','Wedagama',1,NULL,NULL,NULL,NULL,NULL),(13229,NULL,'Gampaha   ','Kelaniya   ','Wedamulla',1,NULL,NULL,NULL,NULL,NULL),(13230,NULL,'Nuwara Eliya   ','Kothmale   ','Wedamulla',1,NULL,NULL,NULL,NULL,NULL),(13231,NULL,'Kurunegala   ','Bamunakotuwa   ','Wedanda',1,NULL,NULL,NULL,NULL,NULL),(13232,NULL,'Kalutara   ','Walallavita   ','Wedawatta',1,NULL,NULL,NULL,NULL,NULL),(13233,NULL,'Ratnapura   ','Kalawana   ','Weddagala East',1,NULL,NULL,NULL,NULL,NULL),(13234,NULL,'Ratnapura   ','Kalawana   ','Weddagala West',1,NULL,NULL,NULL,NULL,NULL),(13235,NULL,'Polonnaruwa   ','Medirigiriya   ','Wedehapura',1,NULL,NULL,NULL,NULL,NULL),(13236,NULL,'Kurunegala   ','Alawwa   ','Wedeniya',1,NULL,NULL,NULL,NULL,NULL),(13237,NULL,'Polonnaruwa   ','Medirigiriya   ','Wedikachchiya',1,NULL,NULL,NULL,NULL,NULL),(13238,NULL,'Colombo   ','Ratmalana   ','Wedikanda',1,NULL,NULL,NULL,NULL,NULL),(13239,NULL,'Kurunegala   ','Ehetuwewa   ','Wedinigama',1,NULL,NULL,NULL,NULL,NULL),(13240,NULL,'Anuradhapura   ','Ipalogama   ','Wedinigama',1,NULL,NULL,NULL,NULL,NULL),(13241,NULL,'Hambantota   ','Sooriyawewa   ','Wediwewa',1,NULL,NULL,NULL,NULL,NULL),(13242,NULL,'Hambantota   ','Mundalama   ','Weedikanda',1,NULL,NULL,NULL,NULL,NULL),(13243,NULL,'Gampaha   ','Gampaha   ','Weediyawatta',1,NULL,NULL,NULL,NULL,NULL),(13244,NULL,'Gampaha   ','Minuwangoda   ','Weediyawatta East',1,NULL,NULL,NULL,NULL,NULL),(13245,NULL,'Gampaha   ','Minuwangoda   ','Weediyawatta West',1,NULL,NULL,NULL,NULL,NULL),(13246,NULL,'Polonnaruwa   ','Thamankaduwa   ','Weera Pedesa',1,NULL,NULL,NULL,NULL,NULL),(13247,NULL,'Kurunegala   ','Polgahawela   ','Weeragala',1,NULL,NULL,NULL,NULL,NULL),(13248,NULL,'Kegalle   ','Yatiyanthota   ','Weeragalla',1,NULL,NULL,NULL,NULL,NULL),(13249,NULL,'Polonnaruwa   ','Hingurakgoda   ','Weeragama',1,NULL,NULL,NULL,NULL,NULL),(13250,NULL,'Hambantota   ','Angunakolapelessa   ','Weeragaswewa',1,NULL,NULL,NULL,NULL,NULL),(13251,NULL,'Ampara   ','Uhana   ','Weeragoda North',1,NULL,NULL,NULL,NULL,NULL),(13252,NULL,'Ampara   ','Uhana   ','Weeragoda South',1,NULL,NULL,NULL,NULL,NULL),(13253,NULL,'Hambantota   ','Thissamaharama   ','Weerahela',1,NULL,NULL,NULL,NULL,NULL),(13254,NULL,'Puttalam   ','Nattandiya   ','Weerahena East',1,NULL,NULL,NULL,NULL,NULL),(13255,NULL,'Puttalam   ','Nattandiya   ','Weerahena West',1,NULL,NULL,NULL,NULL,NULL),(13256,NULL,'Kalutara   ','Walallavita   ','Weerakanda',1,NULL,NULL,NULL,NULL,NULL),(13257,NULL,'Puttalam   ','Chilaw   ','Weerakelewatta',1,NULL,NULL,NULL,NULL,NULL),(13258,NULL,'Hambantota   ','Weeraketiya   ','Weeraketiya East',1,NULL,NULL,NULL,NULL,NULL),(13259,NULL,'Hambantota   ','Weeraketiya   ','Weeraketiya West',1,NULL,NULL,NULL,NULL,NULL),(13260,NULL,'Hambantota   ','Katuwana   ','Weerakkuttigoda',1,NULL,NULL,NULL,NULL,NULL),(13261,NULL,'Badulla   ','Haldummulla   ','Weerakoongama',1,NULL,NULL,NULL,NULL,NULL),(13262,NULL,'Puttalam   ','Arachchikattuwa   ','Weerakumandaluwa',1,NULL,NULL,NULL,NULL,NULL),(13263,NULL,'Polonnaruwa   ','Dimbulagala   ','Weeralanda',1,NULL,NULL,NULL,NULL,NULL),(13264,NULL,'Kurunegala   ','Weerambugedara   ','Weerambugedara',1,NULL,NULL,NULL,NULL,NULL),(13265,NULL,'Polonnaruwa   ','Dimbulagala   ','Weerana',1,NULL,NULL,NULL,NULL,NULL),(13266,NULL,'Gampaha   ','Attanagalla   ','Weerangula',1,NULL,NULL,NULL,NULL,NULL),(13267,NULL,'Gampaha   ','Attanagalla   ','Weerangula South',1,NULL,NULL,NULL,NULL,NULL),(13268,NULL,'Galle   ','Thawalama   ','Weerapana East',1,NULL,NULL,NULL,NULL,NULL),(13269,NULL,'Galle   ','Thawalama   ','Weerapana North',1,NULL,NULL,NULL,NULL,NULL),(13270,NULL,'Galle   ','Thawalama   ','Weerapana South',1,NULL,NULL,NULL,NULL,NULL),(13271,NULL,'Galle   ','Thawalama   ','Weerapana West',1,NULL,NULL,NULL,NULL,NULL),(13272,NULL,'Puttalam   ','Chilaw   ','Weerapandiyana',1,NULL,NULL,NULL,NULL,NULL),(13273,NULL,'Kurunegala   ','Giribawa   ','Weerapokuna',1,NULL,NULL,NULL,NULL,NULL),(13274,NULL,'Kurunegala   ','Bingiriya   ','Weerapokuna',1,NULL,NULL,NULL,NULL,NULL),(13275,NULL,'Nuwara Eliya   ','Kothmale   ','Weerapura',1,NULL,NULL,NULL,NULL,NULL),(13276,NULL,'Puttalam   ','Karuwalagaswewa   ','Weerapura',1,NULL,NULL,NULL,NULL,NULL),(13277,NULL,'Puttalam   ','Mundalama   ','Weerapura',1,NULL,NULL,NULL,NULL,NULL),(13278,NULL,'Polonnaruwa   ','Lankapura   ','Weerapura',1,NULL,NULL,NULL,NULL,NULL),(13279,NULL,'Nuwara Eliya   ','Kothmale   ','Weerasekarapura',1,NULL,NULL,NULL,NULL,NULL),(13280,NULL,'Anuradhapura   ','Horowpothana   ','Weerasole',1,NULL,NULL,NULL,NULL,NULL),(13281,NULL,'Gampaha   ','Mirigama   ','Weerasooriyakanda',1,NULL,NULL,NULL,NULL,NULL),(13282,NULL,'Hambantota   ','Lunugamvehera   ','Weeravil Ara',1,NULL,NULL,NULL,NULL,NULL),(13283,NULL,'Hambantota   ','Lunugamvehera   ','Weeravila',1,NULL,NULL,NULL,NULL,NULL),(13284,NULL,'Hambantota   ','Sooriyawewa   ','Weeriyagama',1,NULL,NULL,NULL,NULL,NULL),(13285,NULL,'Kandy   ','Medadumbara   ','Wegala',1,NULL,NULL,NULL,NULL,NULL),(13286,NULL,'Kegalle   ','Bulathkohupitiya   ','Wegalla',1,NULL,NULL,NULL,NULL,NULL),(13287,NULL,'Nuwara Eliya   ','Hanguranketha   ','Wegama',1,NULL,NULL,NULL,NULL,NULL),(13288,NULL,'Kurunegala   ','Rideegama   ','Wegama',1,NULL,NULL,NULL,NULL,NULL),(13289,NULL,'Badulla   ','Hali-Ela   ','Wegama',1,NULL,NULL,NULL,NULL,NULL),(13290,NULL,'Moneragala   ','Bibile   ','Wegama',1,NULL,NULL,NULL,NULL,NULL),(13291,NULL,'Moneragala   ','Bibile   ','Wegama South',1,NULL,NULL,NULL,NULL,NULL),(13292,NULL,'Kegalle   ','Mawanella   ','Weganthale',1,NULL,NULL,NULL,NULL,NULL),(13293,NULL,'Ratnapura   ','Imbulpe   ','Wegapitiya',1,NULL,NULL,NULL,NULL,NULL),(13294,NULL,'Kurunegala   ','Galgamuwa   ','Wegedara',1,NULL,NULL,NULL,NULL,NULL),(13295,NULL,'Kandy   ','Harispattuwa   ','Wegiriya',1,NULL,NULL,NULL,NULL,NULL),(13296,NULL,'Kandy   ','Udunuwara   ','Wegiriya East',1,NULL,NULL,NULL,NULL,NULL),(13297,NULL,'Kandy   ','Udunuwara   ','Wegiriya West',1,NULL,NULL,NULL,NULL,NULL),(13298,NULL,'Matale   ','Galewela   ','Wegodapola',1,NULL,NULL,NULL,NULL,NULL),(13299,NULL,'Kurunegala   ','Ganewatta   ','Wegolla',1,NULL,NULL,NULL,NULL,NULL),(13300,NULL,'Kurunegala   ','Maspotha   ','Wegolla',1,NULL,NULL,NULL,NULL,NULL),(13301,NULL,'Gampaha   ','Minuwangoda   ','Wegowwa East',1,NULL,NULL,NULL,NULL,NULL),(13302,NULL,'Gampaha   ','Minuwangoda   ','Wegowwa South',1,NULL,NULL,NULL,NULL,NULL),(13303,NULL,'Matara   ','Dickwella   ','Wehella',1,NULL,NULL,NULL,NULL,NULL),(13304,NULL,'Matara   ','Dickwella   ','Wehella North',1,NULL,NULL,NULL,NULL,NULL),(13305,NULL,'Matara   ','Dickwella   ','Wehella South',1,NULL,NULL,NULL,NULL,NULL),(13306,NULL,'Kurunegala   ','Kurunegala   ','Wehera East',1,NULL,NULL,NULL,NULL,NULL),(13307,NULL,'Kurunegala   ','Kurunegala   ','Wehera West',1,NULL,NULL,NULL,NULL,NULL),(13308,NULL,'Matale   ','Ukuwela   ','Wehigala',1,NULL,NULL,NULL,NULL,NULL),(13309,NULL,'Galle   ','Niyagama   ','Weihena',1,NULL,NULL,NULL,NULL,NULL),(13310,NULL,'Galle   ','Baddegama   ','Weihena',1,NULL,NULL,NULL,NULL,NULL),(13311,NULL,'Gampaha   ','Divulapitiya   ','Wekada',1,NULL,NULL,NULL,NULL,NULL),(13312,NULL,'Matara   ','Weligama   ','Wekada',1,NULL,NULL,NULL,NULL,NULL),(13313,NULL,'Kalutara   ','Panadura   ','Wekada East',1,NULL,NULL,NULL,NULL,NULL),(13314,NULL,'Kalutara   ','Panadura   ','Wekada North',1,NULL,NULL,NULL,NULL,NULL),(13315,NULL,'Kalutara   ','Panadura   ','Wekada West',1,NULL,NULL,NULL,NULL,NULL),(13316,NULL,'Colombo   ','Colombo   ','Wekanda',1,NULL,NULL,NULL,NULL,NULL),(13317,NULL,'Hambantota   ','Weeraketiya   ','Wekandawala North',1,NULL,NULL,NULL,NULL,NULL),(13318,NULL,'Hambantota   ','Weeraketiya   ','Wekandawala South',1,NULL,NULL,NULL,NULL,NULL),(13319,NULL,'Colombo   ','Kaduwela   ','Wekewatta',1,NULL,NULL,NULL,NULL,NULL),(13320,NULL,'Moneragala   ','Badalkumbura   ','Wekumbura',1,NULL,NULL,NULL,NULL,NULL),(13321,NULL,'Matara   ','Malimbada   ','Weladagoda',1,NULL,NULL,NULL,NULL,NULL),(13322,NULL,'Kandy   ','Medadumbara   ','Weladaramba',1,NULL,NULL,NULL,NULL,NULL),(13323,NULL,'Ratnapura   ','Kahawatta   ','Weladura',1,NULL,NULL,NULL,NULL,NULL),(13324,NULL,'Kandy   ','Hatharaliyadda   ','Welagama',1,NULL,NULL,NULL,NULL,NULL),(13325,NULL,'Gampaha   ','Divulapitiya   ','Welagana',1,NULL,NULL,NULL,NULL,NULL),(13326,NULL,'Gampaha   ','Attanagalla   ','Welagedara',1,NULL,NULL,NULL,NULL,NULL),(13327,NULL,'Kurunegala   ','Rideegama   ','Welagedara',1,NULL,NULL,NULL,NULL,NULL),(13328,NULL,'Kandy   ','Udunuwara   ','Welamboda',1,NULL,NULL,NULL,NULL,NULL),(13329,NULL,'Badulla   ','Uva-Paranagama   ','Welamedagama',1,NULL,NULL,NULL,NULL,NULL),(13330,NULL,'Matale   ','Dambulla   ','Welamitiyawa',1,NULL,NULL,NULL,NULL,NULL),(13331,NULL,'Nuwara Eliya   ','Hanguranketha   ','Welampagoda',1,NULL,NULL,NULL,NULL,NULL),(13332,NULL,'Badulla   ','Rideemaliyadda   ','Welampele',1,NULL,NULL,NULL,NULL,NULL),(13333,NULL,'Anuradhapura   ','Horowpothana   ','Welangahaupatha',1,NULL,NULL,NULL,NULL,NULL),(13334,NULL,'Matale   ','Rattota   ','Welangahawatta',1,NULL,NULL,NULL,NULL,NULL),(13335,NULL,'Kegalle   ','Dehiovita   ','Welangalla',1,NULL,NULL,NULL,NULL,NULL),(13336,NULL,'Ratnapura   ','Balangoda   ','Welange',1,NULL,NULL,NULL,NULL,NULL),(13337,NULL,'Matale   ','Dambulla   ','Welangolla',1,NULL,NULL,NULL,NULL,NULL),(13338,NULL,'Kurunegala   ','Polpithigama   ','Welangolla',1,NULL,NULL,NULL,NULL,NULL),(13339,NULL,'Badulla   ','Haputale   ','Welanhinna',1,NULL,NULL,NULL,NULL,NULL),(13340,NULL,'Ratnapura   ','Imbulpe   ','Welanhinna',1,NULL,NULL,NULL,NULL,NULL),(13341,NULL,'Badulla   ','Haldummulla   ','Welanwita',1,NULL,NULL,NULL,NULL,NULL),(13342,NULL,'Badulla   ','Kandaketiya   ','Welaoya',1,NULL,NULL,NULL,NULL,NULL),(13343,NULL,'Kandy   ','Medadumbara   ','Welapahala',1,NULL,NULL,NULL,NULL,NULL),(13344,NULL,'Nuwara Eliya   ','Hanguranketha   ','Welapahala',1,NULL,NULL,NULL,NULL,NULL),(13345,NULL,'Kalutara   ','Kalutara   ','Welapura',1,NULL,NULL,NULL,NULL,NULL),(13346,NULL,'Kandy   ','Kandy Four Gravets and Gangawata Korale   ','Welata',1,NULL,NULL,NULL,NULL,NULL),(13347,NULL,'Gampaha   ','Mirigama   ','Welavilamulla',1,NULL,NULL,NULL,NULL,NULL),(13348,NULL,'Gampaha   ','Mirigama   ','Welavilamulla North',1,NULL,NULL,NULL,NULL,NULL),(13349,NULL,'Kurunegala   ','Wariyapola   ','Welawa',1,NULL,NULL,NULL,NULL,NULL),(13350,NULL,'Kandy   ','Pathahewaheta   ','Welegama',1,NULL,NULL,NULL,NULL,NULL),(13351,NULL,'Gampaha   ','Kelaniya   ','Welegoda',1,NULL,NULL,NULL,NULL,NULL),(13352,NULL,'Matara   ','Matara Four Gravets   ','Welegoda East',1,NULL,NULL,NULL,NULL,NULL),(13353,NULL,'Matara   ','Matara Four Gravets   ','Welegoda West',1,NULL,NULL,NULL,NULL,NULL),(13354,NULL,'Ratnapura   ','Balangoda   ','Welekumbura',1,NULL,NULL,NULL,NULL,NULL),(13355,NULL,'Hambantota   ','Mundalama   ','Welendagoda',1,NULL,NULL,NULL,NULL,NULL),(13356,NULL,'Galle   ','Yakkalamulla   ','Welendawa',1,NULL,NULL,NULL,NULL,NULL),(13357,NULL,'Ratnapura   ','Kolonna   ','Welewathugoda',1,NULL,NULL,NULL,NULL,NULL),(13358,NULL,'Colombo   ','Kolonnawa   ','Welewatta',1,NULL,NULL,NULL,NULL,NULL),(13359,NULL,'Puttalam   ','Nawagattegama   ','Welewewa North',1,NULL,NULL,NULL,NULL,NULL),(13360,NULL,'Puttalam   ','Nawagattegama   ','Welewewa South',1,NULL,NULL,NULL,NULL,NULL),(13361,NULL,'Kandy   ','Minipe   ','Welgahawadiya',1,NULL,NULL,NULL,NULL,NULL),(13362,NULL,'Kandy   ','Poojapitiya   ','Welgala',1,NULL,NULL,NULL,NULL,NULL),(13363,NULL,'Kandy   ','Minipe   ','Welgala',1,NULL,NULL,NULL,NULL,NULL),(13364,NULL,'Kurunegala   ','Ibbagamuwa   ','Welgala',1,NULL,NULL,NULL,NULL,NULL),(13365,NULL,'Gampaha   ','Dompe   ','Welgama',1,NULL,NULL,NULL,NULL,NULL),(13366,NULL,'Badulla   ','Passara   ','Welgolla',1,NULL,NULL,NULL,NULL,NULL),(13367,NULL,'Kegalle   ','Warakapola   ','Welhella',1,NULL,NULL,NULL,NULL,NULL),(13368,NULL,'Gampaha   ','Minuwangoda   ','Welhena',1,NULL,NULL,NULL,NULL,NULL),(13369,NULL,'Galle   ','Habaraduwa   ','Welhengoda',1,NULL,NULL,NULL,NULL,NULL),(13370,NULL,'Polonnaruwa   ','Lankapura   ','Weli Ela',1,NULL,NULL,NULL,NULL,NULL),(13371,NULL,'Moneragala   ','Sevanagala   ','Weliara',1,NULL,NULL,NULL,NULL,NULL),(13372,NULL,'Badulla   ','Badulla   ','Welibissa',1,NULL,NULL,NULL,NULL,NULL),(13373,NULL,'Badulla   ','Haldummulla   ','Welibissa',1,NULL,NULL,NULL,NULL,NULL),(13374,NULL,'Kurunegala   ','Polpithigama   ','Welidalla',1,NULL,NULL,NULL,NULL,NULL),(13375,NULL,'Matale   ','Ukuwela   ','Weligala',1,NULL,NULL,NULL,NULL,NULL),(13376,NULL,'Kandy   ','Poojapitiya   ','Weligalla',1,NULL,NULL,NULL,NULL,NULL),(13377,NULL,'Kandy   ','Udunuwara   ','Weligalla',1,NULL,NULL,NULL,NULL,NULL),(13378,NULL,'Kegalle   ','Mawanella   ','Weligalla',1,NULL,NULL,NULL,NULL,NULL),(13379,NULL,'Kandy   ','Pasbage Korale   ','Weligampala',1,NULL,NULL,NULL,NULL,NULL),(13380,NULL,'Gampaha   ','Ja-Ela   ','Weligampitiya North',1,NULL,NULL,NULL,NULL,NULL),(13381,NULL,'Gampaha   ','Ja-Ela   ','Weligampitiya South',1,NULL,NULL,NULL,NULL,NULL),(13382,NULL,'Kegalle   ','Rambukkana   ','Weligamuwa',1,NULL,NULL,NULL,NULL,NULL),(13383,NULL,'Kandy   ','Udapalatha   ','Weliganga',1,NULL,NULL,NULL,NULL,NULL),(13384,NULL,'Hambantota   ','Lunugamvehera   ','Weligatta',1,NULL,NULL,NULL,NULL,NULL),(13385,NULL,'Ratnapura   ','Weligepola   ','Weligepola',1,NULL,NULL,NULL,NULL,NULL),(13386,NULL,'Kurunegala   ','Polgahawela   ','Weligodapitiya',1,NULL,NULL,NULL,NULL,NULL),(13387,NULL,'Kandy   ','Hatharaliyadda   ','Weligodapola',1,NULL,NULL,NULL,NULL,NULL),(13388,NULL,'Kandy   ','Pasbage Korale   ','Weligodawatta',1,NULL,NULL,NULL,NULL,NULL),(13389,NULL,'Anuradhapura   ','Kahatagasdigiliya   ','Weligollewa',1,NULL,NULL,NULL,NULL,NULL),(13390,NULL,'Kegalle   ','Yatiyanthota   ','Welihelathenna',1,NULL,NULL,NULL,NULL,NULL),(13391,NULL,'Matale   ','Dambulla   ','Welihena',1,NULL,NULL,NULL,NULL,NULL),(13392,NULL,'Galle   ','Akmeemana   ','Welihena',1,NULL,NULL,NULL,NULL,NULL),(13393,NULL,'Matara   ','Athuraliya   ','Welihena',1,NULL,NULL,NULL,NULL,NULL),(13394,NULL,'Puttalam   ','Chilaw   ','Welihena',1,NULL,NULL,NULL,NULL,NULL),(13395,NULL,'Gampaha   ','Katana   ','Welihena North',1,NULL,NULL,NULL,NULL,NULL),(13396,NULL,'Gampaha   ','Katana   ','Welihena South',1,NULL,NULL,NULL,NULL,NULL),(13397,NULL,'Colombo   ','Kaduwela   ','Welihinda',1,NULL,NULL,NULL,NULL,NULL),(13398,NULL,'Gampaha   ','Gampaha   ','Welikada',1,NULL,NULL,NULL,NULL,NULL),(13399,NULL,'Nuwara Eliya   ','Hanguranketha   ','Welikada',1,NULL,NULL,NULL,NULL,NULL),(13400,NULL,'Colombo   ','Sri Jayawardanapura Kotte   ','Welikada East',1,NULL,NULL,NULL,NULL,NULL),(13401,NULL,'Colombo   ','Sri Jayawardanapura Kotte   ','Welikada North',1,NULL,NULL,NULL,NULL,NULL),(13402,NULL,'Colombo   ','Sri Jayawardanapura Kotte   ','Welikada West',1,NULL,NULL,NULL,NULL,NULL),(13403,NULL,'Badulla   ','Welimada   ','Welikadagama',1,NULL,NULL,NULL,NULL,NULL),(13404,NULL,'Gampaha   ','Wattala   ','Welikadamulla',1,NULL,NULL,NULL,NULL,NULL),(13405,NULL,'Gampaha   ','Attanagalla   ','Welikadamulla',1,NULL,NULL,NULL,NULL,NULL),(13406,NULL,'Kalutara   ','Millaniya   ','Welikala',1,NULL,NULL,NULL,NULL,NULL),(13407,NULL,'Kurunegala   ','Rideegama   ','Welikanda',1,NULL,NULL,NULL,NULL,NULL),(13408,NULL,'Polonnaruwa   ','Welikanda   ','Welikanda',1,NULL,NULL,NULL,NULL,NULL),(13409,NULL,'Colombo   ','Hanwella   ','Welikanna',1,NULL,NULL,NULL,NULL,NULL),(13410,NULL,'Kurunegala   ','Alawwa   ','Welikare',1,NULL,NULL,NULL,NULL,NULL),(13411,NULL,'Badulla   ','Hali-Ela   ','Welikemulla',1,NULL,NULL,NULL,NULL,NULL),(13412,NULL,'Kalutara   ','Madurawela   ','Weliketella',1,NULL,NULL,NULL,NULL,NULL),(13413,NULL,'Kandy   ','Medadumbara   ','Weliketiya',1,NULL,NULL,NULL,NULL,NULL),(13414,NULL,'Galle   ','Akmeemana   ','Weliketiya',1,NULL,NULL,NULL,NULL,NULL),(13415,NULL,'Matara   ','Akuressa   ','Weliketiya',1,NULL,NULL,NULL,NULL,NULL),(13416,NULL,'Gampaha   ','Dompe   ','Weliketiyawatta',1,NULL,NULL,NULL,NULL,NULL),(13417,NULL,'Galle   ','Imaduwa   ','Welikonda',1,NULL,NULL,NULL,NULL,NULL),(13418,NULL,'Kurunegala   ','Mawathagama   ','Welikumbura',1,NULL,NULL,NULL,NULL,NULL),(13419,NULL,'Kurunegala   ','Narammala   ','Welikumbura',1,NULL,NULL,NULL,NULL,NULL),(13420,NULL,'Badulla   ','Welimada   ','Welimada Town',1,NULL,NULL,NULL,NULL,NULL),(13421,NULL,'Badulla   ','Welimada   ','Welimadawatta',1,NULL,NULL,NULL,NULL,NULL),(13422,NULL,'Ratnapura   ','Pelmadulla   ','Welimaluwa',1,NULL,NULL,NULL,NULL,NULL),(13423,NULL,'Kalutara   ','Mathugama   ','Welimanana',1,NULL,NULL,NULL,NULL,NULL),(13424,NULL,'Anuradhapura   ','Horowpothana   ','Welimuwapothana',1,NULL,NULL,NULL,NULL,NULL),(13425,NULL,'Nuwara Eliya   ','Ambagamuwa   ','Welioya',1,NULL,NULL,NULL,NULL,NULL),(13426,NULL,'Hambantota   ','Ambalantota   ','Welipatanvila',1,NULL,NULL,NULL,NULL,NULL),(13427,NULL,'Galle   ','Galle Four Gravets   ','Welipatha',1,NULL,NULL,NULL,NULL,NULL),(13428,NULL,'Ratnapura   ','Balangoda   ','Welipathayaya',1,NULL,NULL,NULL,NULL,NULL),(13429,NULL,'Puttalam   ','Arachchikattuwa   ','Welipelessa',1,NULL,NULL,NULL,NULL,NULL),(13430,NULL,'Kalutara   ','Mathugama   ','Welipenna East-North',1,NULL,NULL,NULL,NULL,NULL),(13431,NULL,'Kalutara   ','Mathugama   ','Welipenna East-South',1,NULL,NULL,NULL,NULL,NULL),(13432,NULL,'Kalutara   ','Mathugama   ','Welipenna West',1,NULL,NULL,NULL,NULL,NULL),(13433,NULL,'Colombo   ','Kaduwela   ','Welipillewa',1,NULL,NULL,NULL,NULL,NULL),(13434,NULL,'Galle   ','Galle Four Gravets   ','Welipitimodara',1,NULL,NULL,NULL,NULL,NULL),(13435,NULL,'Kalutara   ','Beruwala   ','Welipitiya',1,NULL,NULL,NULL,NULL,NULL),(13436,NULL,'Matara   ','Welipitiya   ','Welipitiya',1,NULL,NULL,NULL,NULL,NULL),(13437,NULL,'Hambantota   ','Katuwana   ','Welipitiya',1,NULL,NULL,NULL,NULL,NULL),(13438,NULL,'Hambantota   ','Katuwana   ','Welipitiya East',1,NULL,NULL,NULL,NULL,NULL),(13439,NULL,'Hambantota   ','Katuwana   ','Welipitiya West',1,NULL,NULL,NULL,NULL,NULL),(13440,NULL,'Hambantota   ','Thissamaharama   ','Welipothewala',1,NULL,NULL,NULL,NULL,NULL),(13441,NULL,'Gampaha   ','Wattala   ','Welisara',1,NULL,NULL,NULL,NULL,NULL),(13442,NULL,'Badulla   ','Uva-Paranagama   ','Weliulla',1,NULL,NULL,NULL,NULL,NULL),(13443,NULL,'Colombo   ','Kaduwela   ','Welivita',1,NULL,NULL,NULL,NULL,NULL),(13444,NULL,'Kandy   ','Hatharaliyadda   ','Welivita Ihalagama',1,NULL,NULL,NULL,NULL,NULL),(13445,NULL,'Kandy   ','Hatharaliyadda   ','Welivita Ihalagama North',1,NULL,NULL,NULL,NULL,NULL),(13446,NULL,'Kandy   ','Hatharaliyadda   ','Welivita Pahalagama',1,NULL,NULL,NULL,NULL,NULL),(13447,NULL,'Kandy   ','Hatharaliyadda   ','Welivita Pahalagama South',1,NULL,NULL,NULL,NULL,NULL),(13448,NULL,'Matara   ','Pitabeddara   ','Weliwa',1,NULL,NULL,NULL,NULL,NULL),(13449,NULL,'Matale   ','Laggala-Pallegama   ','Weliwaranagolla',1,NULL,NULL,NULL,NULL,NULL),(13450,NULL,'Galle   ','Balapitiya   ','Weliwathugoda',1,NULL,NULL,NULL,NULL,NULL),(13451,NULL,'Galle   ','Galle Four Gravets   ','Weliwatta',1,NULL,NULL,NULL,NULL,NULL),(13452,NULL,'Kurunegala   ','Katupotha   ','Weliwehera',1,NULL,NULL,NULL,NULL,NULL),(13453,NULL,'Gampaha   ','Gampaha   ','Weliweriya East',1,NULL,NULL,NULL,NULL,NULL),(13454,NULL,'Matara   ','Matara Four Gravets   ','Weliweriya East',1,NULL,NULL,NULL,NULL,NULL),(13455,NULL,'Gampaha   ','Gampaha   ','Weliweriya North',1,NULL,NULL,NULL,NULL,NULL),(13456,NULL,'Gampaha   ','Gampaha   ','Weliweriya South',1,NULL,NULL,NULL,NULL,NULL),(13457,NULL,'Gampaha   ','Gampaha   ','Weliweriya West',1,NULL,NULL,NULL,NULL,NULL),(13458,NULL,'Matara   ','Matara Four Gravets   ','Weliweriya West',1,NULL,NULL,NULL,NULL,NULL),(13459,NULL,'Hambantota   ','Sooriyawewa   ','Weliwewa',1,NULL,NULL,NULL,NULL,NULL),(13460,NULL,'Gampaha   ','Minuwangoda   ','Weliya',1,NULL,NULL,NULL,NULL,NULL),(13461,NULL,'Badulla   ','Haldummulla   ','Weliya',1,NULL,NULL,NULL,NULL,NULL),(13462,NULL,'Kurunegala   ','Ehetuwewa   ','Weliyawa',1,NULL,NULL,NULL,NULL,NULL),(13463,NULL,'Anuradhapura   ','Thambuttegama   ','Weliyaya',1,NULL,NULL,NULL,NULL,NULL),(13464,NULL,'Moneragala   ','Moneragala   ','Weliyaya',1,NULL,NULL,NULL,NULL,NULL),(13465,NULL,'Hambantota   ','Tangalle   ','Wella Odaya',1,NULL,NULL,NULL,NULL,NULL),(13466,NULL,'Gampaha   ','Negombo   ','Wella Weediya',1,NULL,NULL,NULL,NULL,NULL),(13467,NULL,'Gampaha   ','Negombo   ','Wella Weediya East',1,NULL,NULL,NULL,NULL,NULL),(13468,NULL,'Gampaha   ','Negombo   ','Wella Weediya South',1,NULL,NULL,NULL,NULL,NULL),(13469,NULL,'Galle   ','Balapitiya   ','Wellabada',1,NULL,NULL,NULL,NULL,NULL),(13470,NULL,'Galle   ','Hikkaduwa   ','Wellabada',1,NULL,NULL,NULL,NULL,NULL),(13471,NULL,'Galle   ','Hikkaduwa   ','Wellabada Thiranagama',1,NULL,NULL,NULL,NULL,NULL),(13472,NULL,'Nuwara Eliya   ','Hanguranketha   ','Wellagiriya',1,NULL,NULL,NULL,NULL,NULL),(13473,NULL,'Trincomalee   ','Trincomalee Town and Gravets   ','Wellaimanal',1,NULL,NULL,NULL,NULL,NULL),(13474,NULL,'Puttalam   ','Wennappuwa   ','Wellamankaraya',1,NULL,NULL,NULL,NULL,NULL),(13475,NULL,'Colombo   ','Kolonnawa   ','Wellampitiya',1,NULL,NULL,NULL,NULL,NULL),(13476,NULL,'Anuradhapura   ','Thirappane   ','Wellamudawa',1,NULL,NULL,NULL,NULL,NULL),(13477,NULL,'Matara   ','Welipitiya   ','Wellana',1,NULL,NULL,NULL,NULL,NULL),(13478,NULL,'Colombo   ','Kaduwela   ','Wellangiriya',1,NULL,NULL,NULL,NULL,NULL),(13479,NULL,'Anuradhapura   ','Mihinthale   ','Wellaragama',1,NULL,NULL,NULL,NULL,NULL),(13480,NULL,'Kurunegala   ','Bingiriya   ','Wellarawa',1,NULL,NULL,NULL,NULL,NULL),(13481,NULL,'Kalutara   ','Dodangoda   ','Wellatha',1,NULL,NULL,NULL,NULL,NULL),(13482,NULL,'Kurunegala   ','Kurunegala   ','Wellawa',1,NULL,NULL,NULL,NULL,NULL),(13483,NULL,'Kurunegala   ','Pannala   ','Wellawa',1,NULL,NULL,NULL,NULL,NULL),(13484,NULL,'Galle   ','Hikkaduwa   ','Wellawatta',1,NULL,NULL,NULL,NULL,NULL),(13485,NULL,'Colombo   ','Thimbirigasyaya   ','Wellawatta North',1,NULL,NULL,NULL,NULL,NULL),(13486,NULL,'Colombo   ','Thimbirigasyaya   ','Wellawatta South',1,NULL,NULL,NULL,NULL,NULL),(13487,NULL,'Moneragala   ','Wellawaya   ','Wellawaya',1,NULL,NULL,NULL,NULL,NULL),(13488,NULL,'Kandy   ','Medadumbara   ','Wellethota',1,NULL,NULL,NULL,NULL,NULL),(13489,NULL,'Galle   ','Habaraduwa   ','Wellethota',1,NULL,NULL,NULL,NULL,NULL),(13490,NULL,'Matara   ','Thihagoda   ','Wellethota',1,NULL,NULL,NULL,NULL,NULL),(13491,NULL,'Kurunegala   ','Polgahawela   ','Wellewa',1,NULL,NULL,NULL,NULL,NULL),(13492,NULL,'Matale   ','Laggala-Pallegama   ','Wellewala',1,NULL,NULL,NULL,NULL,NULL),(13493,NULL,'Kalutara   ','Horana   ','Wellmilla',1,NULL,NULL,NULL,NULL,NULL),(13494,NULL,'Kurunegala   ','Pannala   ','Welpalla',1,NULL,NULL,NULL,NULL,NULL),(13495,NULL,'Kurunegala   ','Kobeigane   ','Welpothuwewa',1,NULL,NULL,NULL,NULL,NULL),(13496,NULL,'Puttalam   ','Mundalama   ','Welusumanapura',1,NULL,NULL,NULL,NULL,NULL),(13497,NULL,'Trincomalee   ','Trincomalee Town and Gravets   ','Welveri',1,NULL,NULL,NULL,NULL,NULL),(13498,NULL,'Ratnapura   ','Kalawana   ','Wembiyagoda',1,NULL,NULL,NULL,NULL,NULL),(13499,NULL,'Matara   ','Athuraliya   ','Wenagama',1,NULL,NULL,NULL,NULL,NULL),(13500,NULL,'Galle   ','Hikkaduwa   ','Wenamulla',1,NULL,NULL,NULL,NULL,NULL),(13501,NULL,'Puttalam   ','Pallama   ','Wendakaduwa',1,NULL,NULL,NULL,NULL,NULL),(13502,NULL,'Kegalle   ','Ruwanwella   ','Wendala',1,NULL,NULL,NULL,NULL,NULL),(13503,NULL,'Hambantota   ','Sooriyawewa   ','Weniwel Ara',1,NULL,NULL,NULL,NULL,NULL),(13504,NULL,'Kalutara   ','Kalutara   ','Weniwelketiya',1,NULL,NULL,NULL,NULL,NULL),(13505,NULL,'Colombo   ','Homagama   ','Weniwelkola',1,NULL,NULL,NULL,NULL,NULL),(13506,NULL,'Kegalle   ','Warakapola   ','Weniwellakaduwa',1,NULL,NULL,NULL,NULL,NULL),(13507,NULL,'Kalutara   ','Millaniya   ','Weniwelpitiya',1,NULL,NULL,NULL,NULL,NULL),(13508,NULL,'Puttalam   ','Wennappuwa   ','Wennappuwa East',1,NULL,NULL,NULL,NULL,NULL),(13509,NULL,'Puttalam   ','Wennappuwa   ','Wennappuwa North',1,NULL,NULL,NULL,NULL,NULL),(13510,NULL,'Puttalam   ','Wennappuwa   ','Wennappuwa South',1,NULL,NULL,NULL,NULL,NULL),(13511,NULL,'Puttalam   ','Wennappuwa   ','Wennappuwa West',1,NULL,NULL,NULL,NULL,NULL),(13512,NULL,'Colombo   ','Kolonnawa   ','Wennawatta',1,NULL,NULL,NULL,NULL,NULL),(13513,NULL,'Kurunegala   ','Alawwa   ','Wennoruwa East',1,NULL,NULL,NULL,NULL,NULL),(13514,NULL,'Kurunegala   ','Alawwa   ','Wennoruwa West',1,NULL,NULL,NULL,NULL,NULL),(13515,NULL,'Badulla   ','Hali-Ela   ','Wepassawela',1,NULL,NULL,NULL,NULL,NULL),(13516,NULL,'Matara   ','Hakmana   ','Wepathaira North',1,NULL,NULL,NULL,NULL,NULL),(13517,NULL,'Matara   ','Hakmana   ','Wepathaira South',1,NULL,NULL,NULL,NULL,NULL),(13518,NULL,'Matara   ','Hakmana   ','Wepathaira West',1,NULL,NULL,NULL,NULL,NULL),(13519,NULL,'Kandy   ','Kundasale   ','Wepathana',1,NULL,NULL,NULL,NULL,NULL),(13520,NULL,'Matara   ','Matara Four Gravets   ','Weradoowa',1,NULL,NULL,NULL,NULL,NULL),(13521,NULL,'Colombo   ','Padukka   ','Weragala',1,NULL,NULL,NULL,NULL,NULL),(13522,NULL,'Kalutara   ','Beruwala   ','Weragala',1,NULL,NULL,NULL,NULL,NULL),(13523,NULL,'Kurunegala   ','Giribawa   ','Weragala',1,NULL,NULL,NULL,NULL,NULL),(13524,NULL,'Kurunegala   ','Ganewatta   ','Weragala',1,NULL,NULL,NULL,NULL,NULL),(13525,NULL,'Kurunegala   ','Narammala   ','Weragala',1,NULL,NULL,NULL,NULL,NULL),(13526,NULL,'Kegalle   ','Warakapola   ','Weragala',1,NULL,NULL,NULL,NULL,NULL),(13527,NULL,'Badulla   ','Bandarawela   ','Weragalathenna',1,NULL,NULL,NULL,NULL,NULL),(13528,NULL,'Matale   ','Galewela   ','Weragalawatta',1,NULL,NULL,NULL,NULL,NULL),(13529,NULL,'Kandy   ','Minipe   ','Weragama',1,NULL,NULL,NULL,NULL,NULL),(13530,NULL,'Ratnapura   ','Elapatha   ','Weragama',1,NULL,NULL,NULL,NULL,NULL),(13531,NULL,'Matara   ','Matara Four Gravets   ','Weragampita',1,NULL,NULL,NULL,NULL,NULL),(13532,NULL,'Kandy   ','Minipe   ','Weraganthota',1,NULL,NULL,NULL,NULL,NULL),(13533,NULL,'Gampaha   ','Mirigama   ','Weragoda',1,NULL,NULL,NULL,NULL,NULL),(13534,NULL,'Galle   ','Hikkaduwa   ','Weragoda',1,NULL,NULL,NULL,NULL,NULL),(13535,NULL,'Badulla   ','Lunugala   ','Weragoda',1,NULL,NULL,NULL,NULL,NULL),(13536,NULL,'Moneragala   ','Siyambalanduwa   ','Weragoda',1,NULL,NULL,NULL,NULL,NULL),(13537,NULL,'Kegalle   ','Mawanella   ','Weragoda',1,NULL,NULL,NULL,NULL,NULL),(13538,NULL,'Kegalle   ','Galigamuwa   ','Weragoda',1,NULL,NULL,NULL,NULL,NULL),(13539,NULL,'Kegalle   ','Warakapola   ','Weragoda',1,NULL,NULL,NULL,NULL,NULL),(13540,NULL,'Gampaha   ','Mirigama   ','Weragoda Kakkele',1,NULL,NULL,NULL,NULL,NULL),(13541,NULL,'Gampaha   ','Divulapitiya   ','Weragodamulla',1,NULL,NULL,NULL,NULL,NULL),(13542,NULL,'Colombo   ','Hanwella   ','Weragolla North',1,NULL,NULL,NULL,NULL,NULL),(13543,NULL,'Colombo   ','Hanwella   ','Weragolla South',1,NULL,NULL,NULL,NULL,NULL),(13544,NULL,'Gampaha   ','Dompe   ','Werahera',1,NULL,NULL,NULL,NULL,NULL),(13545,NULL,'Kurunegala   ','Pannala   ','Werahera',1,NULL,NULL,NULL,NULL,NULL),(13546,NULL,'Ratnapura   ','Godakawela   ','Werahera East',1,NULL,NULL,NULL,NULL,NULL),(13547,NULL,'Colombo   ','Kesbewa   ','Werahera North',1,NULL,NULL,NULL,NULL,NULL),(13548,NULL,'Colombo   ','Kesbewa   ','Werahera South',1,NULL,NULL,NULL,NULL,NULL),(13549,NULL,'Ratnapura   ','Godakawela   ','Werahera West',1,NULL,NULL,NULL,NULL,NULL),(13550,NULL,'Kegalle   ','Mawanella   ','Werake',1,NULL,NULL,NULL,NULL,NULL),(13551,NULL,'Puttalam   ','Chilaw   ','Weralabada',1,NULL,NULL,NULL,NULL,NULL),(13552,NULL,'Puttalam   ','Chilaw   ','Weralabada North',1,NULL,NULL,NULL,NULL,NULL),(13553,NULL,'Puttalam   ','Chilaw   ','Weralabada South',1,NULL,NULL,NULL,NULL,NULL),(13554,NULL,'Ratnapura   ','Godakawela   ','Weralugahamula',1,NULL,NULL,NULL,NULL,NULL),(13555,NULL,'Kurunegala   ','Kuliyapitiya West   ','Weralugama',1,NULL,NULL,NULL,NULL,NULL),(13556,NULL,'Gampaha   ','Dompe   ','Weralugampala',1,NULL,NULL,NULL,NULL,NULL),(13557,NULL,'Matale   ','Rattota   ','Weralugasthenna',1,NULL,NULL,NULL,NULL,NULL),(13558,NULL,'Kandy   ','Yatinuwara   ','Weralugolla',1,NULL,NULL,NULL,NULL,NULL),(13559,NULL,'Ratnapura   ','Ratnapura   ','Weralupa',1,NULL,NULL,NULL,NULL,NULL),(13560,NULL,'Colombo   ','Hanwella   ','Weralupitiya',1,NULL,NULL,NULL,NULL,NULL),(13561,NULL,'Kandy   ','Medadumbara   ','Werapitiya',1,NULL,NULL,NULL,NULL,NULL),(13562,NULL,'Kurunegala   ','Wariyapola   ','Werapola',1,NULL,NULL,NULL,NULL,NULL),(13563,NULL,'Kandy   ','Medadumbara   ','Werathenna',1,NULL,NULL,NULL,NULL,NULL),(13564,NULL,'Kandy   ','Udunuwara   ','Werawala East',1,NULL,NULL,NULL,NULL,NULL),(13565,NULL,'Kandy   ','Udunuwara   ','Werawala West',1,NULL,NULL,NULL,NULL,NULL),(13566,NULL,'Kalutara   ','Panadura   ','Werawatta',1,NULL,NULL,NULL,NULL,NULL),(13567,NULL,'Kalutara   ','Madurawela   ','Werawatta',1,NULL,NULL,NULL,NULL,NULL),(13568,NULL,'Kurunegala   ','Mallawapitiya   ','Werawella',1,NULL,NULL,NULL,NULL,NULL),(13569,NULL,'Kurunegala   ','Wariyapola   ','Werella',1,NULL,NULL,NULL,NULL,NULL),(13570,NULL,'Nuwara Eliya   ','Kothmale   ','Werella Pathana',1,NULL,NULL,NULL,NULL,NULL),(13571,NULL,'Nuwara Eliya   ','Walapane   ','Werella Pathana',1,NULL,NULL,NULL,NULL,NULL),(13572,NULL,'Kandy   ','Udunuwara   ','Werellamana',1,NULL,NULL,NULL,NULL,NULL),(13573,NULL,'Galle   ','Hikkaduwa   ','Werellana',1,NULL,NULL,NULL,NULL,NULL),(13574,NULL,'Kegalle   ','Rambukkana   ','Werellapatha',1,NULL,NULL,NULL,NULL,NULL),(13575,NULL,'Kalutara   ','Horana   ','Werullahena',1,NULL,NULL,NULL,NULL,NULL),(13576,NULL,'Anuradhapura   ','Nuwaragam Palatha Central   ','Wessagiriya',1,NULL,NULL,NULL,NULL,NULL),(13577,NULL,'Kandy   ','Pasbage Korale   ','Westhole',1,NULL,NULL,NULL,NULL,NULL),(13578,NULL,'Nuwara Eliya   ','Walapane   ','Wetagepatha',1,NULL,NULL,NULL,NULL,NULL),(13579,NULL,'Kurunegala   ','Pannala   ','Wetakeyawa',1,NULL,NULL,NULL,NULL,NULL),(13580,NULL,'Matale   ','Galewela   ','Wetakoluwewa',1,NULL,NULL,NULL,NULL,NULL),(13581,NULL,'Matale   ','Rattota   ','Wetasyaya',1,NULL,NULL,NULL,NULL,NULL),(13582,NULL,'Kurunegala   ','Katupotha   ','Wetehepitiya',1,NULL,NULL,NULL,NULL,NULL),(13583,NULL,'Nuwara Eliya   ','Walapane   ','Wetekgama',1,NULL,NULL,NULL,NULL,NULL),(13584,NULL,'Nuwara Eliya   ','Kothmale   ','Wethalawa',1,NULL,NULL,NULL,NULL,NULL),(13585,NULL,'Badulla   ','Uva-Paranagama   ','Wethalawa',1,NULL,NULL,NULL,NULL,NULL),(13586,NULL,'Colombo   ','Homagama   ','Wethara',1,NULL,NULL,NULL,NULL,NULL),(13587,NULL,'Hambantota   ','Ambalantota   ','Wetiya',1,NULL,NULL,NULL,NULL,NULL),(13588,NULL,'Puttalam   ','Pallama   ','Wetiya',1,NULL,NULL,NULL,NULL,NULL),(13589,NULL,'Kalutara   ','Mathugama   ','Wettewa',1,NULL,NULL,NULL,NULL,NULL),(13590,NULL,'Kandy   ','Thumpane   ','Wettewa',1,NULL,NULL,NULL,NULL,NULL),(13591,NULL,'Kurunegala   ','Pannala   ','Wettewa',1,NULL,NULL,NULL,NULL,NULL),(13592,NULL,'Kalutara   ','Kalutara   ','Wettumakada',1,NULL,NULL,NULL,NULL,NULL),(13593,NULL,'Kurunegala   ','Katupotha   ','Weudagama',1,NULL,NULL,NULL,NULL,NULL),(13594,NULL,'Nuwara Eliya   ','Nuwara Eliya   ','Weverly',1,NULL,NULL,NULL,NULL,NULL),(13595,NULL,'Kalutara   ','Bandaragama   ','Wevita',1,NULL,NULL,NULL,NULL,NULL),(13596,NULL,'Hambantota   ','Beliatta   ','Wevudatta',1,NULL,NULL,NULL,NULL,NULL),(13597,NULL,'Matara   ','Dickwella   ','Wevurukannala',1,NULL,NULL,NULL,NULL,NULL),(13598,NULL,'Matara   ','Matara Four Gravets   ','Wewa Ihalagoda',1,NULL,NULL,NULL,NULL,NULL),(13599,NULL,'Badulla   ','Lunugala   ','Wewabedda',1,NULL,NULL,NULL,NULL,NULL),(13600,NULL,'Kurunegala   ','Kuliyapitiya West   ','Wewagama',1,NULL,NULL,NULL,NULL,NULL),(13601,NULL,'Ratnapura   ','Kalawana   ','Wewagama',1,NULL,NULL,NULL,NULL,NULL),(13602,NULL,'Gampaha   ','Divulapitiya   ','Wewagedara',1,NULL,NULL,NULL,NULL,NULL),(13603,NULL,'Kurunegala   ','Wariyapola   ','Wewagedara',1,NULL,NULL,NULL,NULL,NULL),(13604,NULL,'Kurunegala   ','Kurunegala   ','Wewagedara',1,NULL,NULL,NULL,NULL,NULL),(13605,NULL,'Kurunegala   ','Mawathagama   ','Wewagedara',1,NULL,NULL,NULL,NULL,NULL),(13606,NULL,'Matara   ','Matara Four Gravets   ','Wewahamandoowa',1,NULL,NULL,NULL,NULL,NULL),(13607,NULL,'Nuwara Eliya   ','Kothmale   ','Wewahinna',1,NULL,NULL,NULL,NULL,NULL),(13608,NULL,'Nuwara Eliya   ','Walapane   ','Wewakele',1,NULL,NULL,NULL,NULL,NULL),(13609,NULL,'Gampaha   ','Ja-Ela   ','Wewala',1,NULL,NULL,NULL,NULL,NULL),(13610,NULL,'Kandy   ','Poojapitiya   ','Wewala',1,NULL,NULL,NULL,NULL,NULL),(13611,NULL,'Galle   ','Hikkaduwa   ','Wewala',1,NULL,NULL,NULL,NULL,NULL),(13612,NULL,'Kurunegala   ','Alawwa   ','Wewala',1,NULL,NULL,NULL,NULL,NULL),(13613,NULL,'Colombo   ','Kesbewa   ','Wewala East',1,NULL,NULL,NULL,NULL,NULL),(13614,NULL,'Kalutara   ','Horana   ','Wewala East',1,NULL,NULL,NULL,NULL,NULL),(13615,NULL,'Kandy   ','Poojapitiya   ','Wewala North',1,NULL,NULL,NULL,NULL,NULL),(13616,NULL,'Colombo   ','Kesbewa   ','Wewala West',1,NULL,NULL,NULL,NULL,NULL),(13617,NULL,'Kalutara   ','Horana   ','Wewala West',1,NULL,NULL,NULL,NULL,NULL),(13618,NULL,'Matale   ','Dambulla   ','Wewala Wewa',1,NULL,NULL,NULL,NULL,NULL),(13619,NULL,'Kegalle   ','Kegalle   ','Wewaladeniya',1,NULL,NULL,NULL,NULL,NULL),(13620,NULL,'Kurunegala   ','Ibbagamuwa   ','Wewalagama',1,NULL,NULL,NULL,NULL,NULL),(13621,NULL,'Kurunegala   ','Galgamuwa   ','Wewaranawetiya',1,NULL,NULL,NULL,NULL,NULL),(13622,NULL,'Kandy   ','Kandy Four Gravets and Gangawata Korale   ','Wewathenna',1,NULL,NULL,NULL,NULL,NULL),(13623,NULL,'Kandy   ','Doluwa   ','Wewathenna',1,NULL,NULL,NULL,NULL,NULL),(13624,NULL,'Nuwara Eliya   ','Hanguranketha   ','Wewathenna',1,NULL,NULL,NULL,NULL,NULL),(13625,NULL,'Nuwara Eliya   ','Walapane   ','Wewathenna',1,NULL,NULL,NULL,NULL,NULL),(13626,NULL,'Badulla   ','Meegahakivula   ','Wewathenna',1,NULL,NULL,NULL,NULL,NULL),(13627,NULL,'Badulla   ','Kandaketiya   ','Wewathenna',1,NULL,NULL,NULL,NULL,NULL),(13628,NULL,'Badulla   ','Bandarawela   ','Wewathenna',1,NULL,NULL,NULL,NULL,NULL),(13629,NULL,'Badulla   ','Mahiyanganaya   ','Wewatta',1,NULL,NULL,NULL,NULL,NULL),(13630,NULL,'Kandy   ','Medadumbara   ','Wewegama',1,NULL,NULL,NULL,NULL,NULL),(13631,NULL,'Kandy   ','Pasbage Korale   ','Wewegama',1,NULL,NULL,NULL,NULL,NULL),(13632,NULL,'Badulla   ','Uva-Paranagama   ','Wewegama',1,NULL,NULL,NULL,NULL,NULL),(13633,NULL,'Kurunegala   ','Rideegama   ','Wewegedara',1,NULL,NULL,NULL,NULL,NULL),(13634,NULL,'Badulla   ','Passara   ','Wewekele',1,NULL,NULL,NULL,NULL,NULL),(13635,NULL,'Gampaha   ','Gampaha   ','Wewel Agara',1,NULL,NULL,NULL,NULL,NULL),(13636,NULL,'Galle   ','Baddegama   ','Weweldeniya',1,NULL,NULL,NULL,NULL,NULL),(13637,NULL,'Gampaha   ','Mirigama   ','Weweldeniya Ihalagama',1,NULL,NULL,NULL,NULL,NULL),(13638,NULL,'Gampaha   ','Mirigama   ','Weweldeniya Ihalagama West',1,NULL,NULL,NULL,NULL,NULL),(13639,NULL,'Gampaha   ','Mirigama   ','Weweldeniya Pahalagama',1,NULL,NULL,NULL,NULL,NULL),(13640,NULL,'Gampaha   ','Mirigama   ','Weweldeniya Pahalagama West',1,NULL,NULL,NULL,NULL,NULL),(13641,NULL,'Gampaha   ','Kelaniya   ','Weweldoowa',1,NULL,NULL,NULL,NULL,NULL),(13642,NULL,'Badulla   ','Hali-Ela   ','Wewelhinna',1,NULL,NULL,NULL,NULL,NULL),(13643,NULL,'Ratnapura   ','Kalawana   ','Wewelkandura',1,NULL,NULL,NULL,NULL,NULL),(13644,NULL,'Anuradhapura   ','Rambewa   ','Wewelketiya',1,NULL,NULL,NULL,NULL,NULL),(13645,NULL,'Colombo   ','Padukka   ','Wewelpanawa',1,NULL,NULL,NULL,NULL,NULL),(13646,NULL,'Kurunegala   ','Weerambugedara   ','Wewelpola',1,NULL,NULL,NULL,NULL,NULL),(13647,NULL,'Kandy   ','Minipe   ','Wewere',1,NULL,NULL,NULL,NULL,NULL),(13648,NULL,'Badulla   ','Badulla   ','Wewessa',1,NULL,NULL,NULL,NULL,NULL),(13649,NULL,'Polonnaruwa   ','Thamankaduwa   ','Wewethenna',1,NULL,NULL,NULL,NULL,NULL),(13650,NULL,'Badulla   ','Mahiyanganaya   ','Wewgampaha',1,NULL,NULL,NULL,NULL,NULL),(13651,NULL,'Ampara   ','Dehiattakandiya   ','Wewmedagama',1,NULL,NULL,NULL,NULL,NULL),(13652,NULL,'Kalutara   ','Bulathsinhala   ','Weyangalla East',1,NULL,NULL,NULL,NULL,NULL),(13653,NULL,'Kalutara   ','Bulathsinhala   ','Weyangalla West',1,NULL,NULL,NULL,NULL,NULL),(13654,NULL,'Colombo   ','Kaduwela   ','Wickramasinghapura',1,NULL,NULL,NULL,NULL,NULL),(13655,NULL,'Matale   ','Wilgamuwa   ','Wigamiwa',1,NULL,NULL,NULL,NULL,NULL),(13656,NULL,'Ratnapura   ','Balangoda   ','Wijanathkumbura',1,NULL,NULL,NULL,NULL,NULL),(13657,NULL,'Kandy   ','Kundasale   ','Wijaya Sri Gama',1,NULL,NULL,NULL,NULL,NULL),(13658,NULL,'Kurunegala   ','Katupotha   ','Wijaya Udagama',1,NULL,NULL,NULL,NULL,NULL),(13659,NULL,'Nuwara Eliya   ','Kothmale   ','Wijayabahu Kanda',1,NULL,NULL,NULL,NULL,NULL),(13660,NULL,'Polonnaruwa   ','Thamankaduwa   ','Wijayabahu Pura',1,NULL,NULL,NULL,NULL,NULL),(13661,NULL,'Polonnaruwa   ','Dimbulagala   ','Wijayabapura',1,NULL,NULL,NULL,NULL,NULL),(13662,NULL,'Matara   ','Pasgoda   ','Wijayagama',1,NULL,NULL,NULL,NULL,NULL),(13663,NULL,'Puttalam   ','Arachchikattuwa   ','Wijayakatupatha',1,NULL,NULL,NULL,NULL,NULL),(13664,NULL,'Puttalam   ','Arachchikattuwa   ','Wijayakatupatha Elen Egoda',1,NULL,NULL,NULL,NULL,NULL),(13665,NULL,'Colombo   ','Kolonnawa   ','Wijayapura',1,NULL,NULL,NULL,NULL,NULL),(13666,NULL,'Hambantota   ','Thissamaharama   ','Wijayapura',1,NULL,NULL,NULL,NULL,NULL),(13667,NULL,'Polonnaruwa   ','Medirigiriya   ','Wijayapura',1,NULL,NULL,NULL,NULL,NULL),(13668,NULL,'Moneragala   ','Siyambalanduwa   ','Wijayapura',1,NULL,NULL,NULL,NULL,NULL),(13669,NULL,'Ampara   ','Uhana   ','Wijayapura East',1,NULL,NULL,NULL,NULL,NULL),(13670,NULL,'Puttalam   ','Vanathavilluwa   ','Wijayapura East',1,NULL,NULL,NULL,NULL,NULL),(13671,NULL,'Ampara   ','Uhana   ','Wijayapura West',1,NULL,NULL,NULL,NULL,NULL),(13672,NULL,'Puttalam   ','Vanathavilluwa   ','Wijayapura West',1,NULL,NULL,NULL,NULL,NULL),(13673,NULL,'Polonnaruwa   ','Thamankaduwa   ','Wijayaraja Pura',1,NULL,NULL,NULL,NULL,NULL),(13674,NULL,'Polonnaruwa   ','Hingurakgoda   ','Wijayaraja Wewa',1,NULL,NULL,NULL,NULL,NULL),(13675,NULL,'Polonnaruwa   ','Medirigiriya   ','Wijayarajapura',1,NULL,NULL,NULL,NULL,NULL),(13676,NULL,'Hambantota   ','Okewela   ','Wijayasiripura',1,NULL,NULL,NULL,NULL,NULL),(13677,NULL,'Colombo   ','Maharagama   ','Wijerama',1,NULL,NULL,NULL,NULL,NULL),(13678,NULL,'Kalutara   ','Kalutara   ','Wijerathnawatta',1,NULL,NULL,NULL,NULL,NULL),(13679,NULL,'Ratnapura   ','Kolonna   ','Wijeriya',1,NULL,NULL,NULL,NULL,NULL),(13680,NULL,'Trincomalee   ','Trincomalee Town and Gravets   ','Wilagama',1,NULL,NULL,NULL,NULL,NULL),(13681,NULL,'Kurunegala   ','Panduwasnuwara   ','Wilbagedara',1,NULL,NULL,NULL,NULL,NULL),(13682,NULL,'Kurunegala   ','Maspotha   ','Wilgamdematawa',1,NULL,NULL,NULL,NULL,NULL),(13683,NULL,'Puttalam   ','Pallama   ','Wilpatha East',1,NULL,NULL,NULL,NULL,NULL),(13684,NULL,'Puttalam   ','Pallama   ','Wilpatha West',1,NULL,NULL,NULL,NULL,NULL),(13685,NULL,'Nuwara Eliya   ','Hanguranketha   ','Wilwala',1,NULL,NULL,NULL,NULL,NULL),(13686,NULL,'Nuwara Eliya   ','Nuwara Eliya   ','Windicorner',1,NULL,NULL,NULL,NULL,NULL),(13687,NULL,'Badulla   ','Mahiyanganaya   ','Wiranegama',1,NULL,NULL,NULL,NULL,NULL),(13688,NULL,'Galle   ','Ambalangoda   ','Woodland Watta',1,NULL,NULL,NULL,NULL,NULL),(13689,NULL,'Gampaha   ','Biyagama   ','Yabaraluwa North',1,NULL,NULL,NULL,NULL,NULL),(13690,NULL,'Gampaha   ','Biyagama   ','Yabaraluwa South',1,NULL,NULL,NULL,NULL,NULL),(13691,NULL,'Galle   ','Habaraduwa   ','Yaddehimulla',1,NULL,NULL,NULL,NULL,NULL),(13692,NULL,'Kegalle   ','Warakapola   ','Yaddehimulla',1,NULL,NULL,NULL,NULL,NULL),(13693,NULL,'Kurunegala   ','Ehetuwewa   ','Yaddessawa',1,NULL,NULL,NULL,NULL,NULL),(13694,NULL,'Kurunegala   ','Mahawa   ','Yaddigama',1,NULL,NULL,NULL,NULL,NULL),(13695,NULL,'Kandy   ','Hatharaliyadda   ','Yaggala',1,NULL,NULL,NULL,NULL,NULL),(13696,NULL,'Kalutara   ','Walallavita   ','Yagirala',1,NULL,NULL,NULL,NULL,NULL),(13697,NULL,'Gampaha   ','Minuwangoda   ','Yagodamulla',1,NULL,NULL,NULL,NULL,NULL),(13698,NULL,'Gampaha   ','Minuwangoda   ','Yagodamulla North',1,NULL,NULL,NULL,NULL,NULL),(13699,NULL,'Gampaha   ','Minuwangoda   ','Yagodamulla South',1,NULL,NULL,NULL,NULL,NULL),(13700,NULL,'Badulla   ','Uva-Paranagama   ','Yahala Arawa',1,NULL,NULL,NULL,NULL,NULL),(13701,NULL,'Galle   ','Baddegama   ','Yahaladoowa',1,NULL,NULL,NULL,NULL,NULL),(13702,NULL,'Kandy   ','Yatinuwara   ','Yahalathenna',1,NULL,NULL,NULL,NULL,NULL),(13703,NULL,'Kandy   ','Harispattuwa   ','Yahalathenna Kanda',1,NULL,NULL,NULL,NULL,NULL),(13704,NULL,'Kandy   ','Harispattuwa   ','Yahalathenna West',1,NULL,NULL,NULL,NULL,NULL),(13705,NULL,'Kalutara   ','Bulathsinhala   ','Yahalawatta',1,NULL,NULL,NULL,NULL,NULL),(13706,NULL,'Ratnapura   ','Godakawela   ','Yahalawela',1,NULL,NULL,NULL,NULL,NULL),(13707,NULL,'Badulla   ','Ella   ','Yahalewela',1,NULL,NULL,NULL,NULL,NULL),(13708,NULL,'Ratnapura   ','Balangoda   ','Yahalewela',1,NULL,NULL,NULL,NULL,NULL),(13709,NULL,'Hambantota   ','Mundalama   ','Yahalmulla',1,NULL,NULL,NULL,NULL,NULL),(13710,NULL,'Matara   ','Athuraliya   ','Yahamulla',1,NULL,NULL,NULL,NULL,NULL),(13711,NULL,'Hambantota   ','Hambantota   ','Yahangala East',1,NULL,NULL,NULL,NULL,NULL),(13712,NULL,'Hambantota   ','Hambantota   ','Yahangala West',1,NULL,NULL,NULL,NULL,NULL),(13713,NULL,'Ratnapura   ','Kahawatta   ','Yainna',1,NULL,NULL,NULL,NULL,NULL),(13714,NULL,'Matara   ','Akuressa   ','Yakabwdda',1,NULL,NULL,NULL,NULL,NULL),(13715,NULL,'Kurunegala   ','Kotavehera   ','Yakadapatha',1,NULL,NULL,NULL,NULL,NULL),(13716,NULL,'Puttalam   ','Nattandiya   ','Yakadessawa',1,NULL,NULL,NULL,NULL,NULL),(13717,NULL,'Hambantota   ','Angunakolapelessa   ','Yakagala',1,NULL,NULL,NULL,NULL,NULL),(13718,NULL,'Anuradhapura   ','Galenbindunuwewa   ','Yakalla',1,NULL,NULL,NULL,NULL,NULL),(13719,NULL,'Gampaha   ','Dompe   ','Yakambe',1,NULL,NULL,NULL,NULL,NULL),(13720,NULL,'Kurunegala   ','Kuliyapitiya West   ','Yakarawatta',1,NULL,NULL,NULL,NULL,NULL),(13721,NULL,'Anuradhapura   ','Medawachchiya   ','Yakawewa',1,NULL,NULL,NULL,NULL,NULL),(13722,NULL,'Ratnapura   ','Nivithigala   ','Yakdehiwatta',1,NULL,NULL,NULL,NULL,NULL),(13723,NULL,'Ratnapura   ','Imbulpe   ','Yakdehiwela',1,NULL,NULL,NULL,NULL,NULL),(13724,NULL,'Galle   ','Akmeemana   ','Yakgaha',1,NULL,NULL,NULL,NULL,NULL),(13725,NULL,'Kurunegala   ','Mallawapitiya   ','Yakgahapitiya',1,NULL,NULL,NULL,NULL,NULL),(13726,NULL,'Hambantota   ','Weeraketiya   ','Yakgasmulla',1,NULL,NULL,NULL,NULL,NULL),(13727,NULL,'Gampaha   ','Ja-Ela   ','Yakkaduwa',1,NULL,NULL,NULL,NULL,NULL),(13728,NULL,'Gampaha   ','Gampaha   ','Yakkala East',1,NULL,NULL,NULL,NULL,NULL),(13729,NULL,'Gampaha   ','Gampaha   ','Yakkala North',1,NULL,NULL,NULL,NULL,NULL),(13730,NULL,'Gampaha   ','Gampaha   ','Yakkala South',1,NULL,NULL,NULL,NULL,NULL),(13731,NULL,'Gampaha   ','Gampaha   ','Yakkala West',1,NULL,NULL,NULL,NULL,NULL),(13732,NULL,'Galle   ','Yakkalamulla   ','Yakkalamulla',1,NULL,NULL,NULL,NULL,NULL),(13733,NULL,'Galle   ','Yakkalamulla   ','Yakkalamulla East',1,NULL,NULL,NULL,NULL,NULL),(13734,NULL,'Moneragala   ','Siyambalanduwa   ','Yakkandurawa',1,NULL,NULL,NULL,NULL,NULL),(13735,NULL,'Kurunegala   ','Narammala   ','Yakkavita',1,NULL,NULL,NULL,NULL,NULL),(13736,NULL,'Matale   ','Dambulla   ','Yakkuragala North',1,NULL,NULL,NULL,NULL,NULL),(13737,NULL,'Matale   ','Dambulla   ','Yakkuragala South',1,NULL,NULL,NULL,NULL,NULL),(13738,NULL,'Polonnaruwa   ','Dimbulagala   ','Yakkure',1,NULL,NULL,NULL,NULL,NULL),(13739,NULL,'Ratnapura   ','Kolonna   ','Yakmaditta',1,NULL,NULL,NULL,NULL,NULL),(13740,NULL,'Ratnapura   ','Eheliyagoda   ','Yakudagoda',1,NULL,NULL,NULL,NULL,NULL),(13741,NULL,'Moneragala   ','Medagama   ','Yakunnawa',1,NULL,NULL,NULL,NULL,NULL),(13742,NULL,'Kalutara   ','Palindanuwara   ','Yakupitiya',1,NULL,NULL,NULL,NULL,NULL),(13743,NULL,'Moneragala   ','Badalkumbura   ','Yakurawa',1,NULL,NULL,NULL,NULL,NULL),(13744,NULL,'Moneragala   ','Wellawaya   ','Yalabowa',1,NULL,NULL,NULL,NULL,NULL),(13745,NULL,'Kalutara   ','Millaniya   ','Yalagala',1,NULL,NULL,NULL,NULL,NULL),(13746,NULL,'Badulla   ','Uva-Paranagama   ','Yalagamuwa',1,NULL,NULL,NULL,NULL,NULL),(13747,NULL,'Kurunegala   ','Weerambugedara   ','Yalawa',1,NULL,NULL,NULL,NULL,NULL),(13748,NULL,'Galle   ','Benthota   ','Yalegama',1,NULL,NULL,NULL,NULL,NULL),(13749,NULL,'Kandy   ','Udunuwara   ','Yalegoda East',1,NULL,NULL,NULL,NULL,NULL),(13750,NULL,'Kandy   ','Udunuwara   ','Yalegoda West',1,NULL,NULL,NULL,NULL,NULL),(13751,NULL,'Moneragala   ','Bibile   ','Yalkumbura',1,NULL,NULL,NULL,NULL,NULL),(13752,NULL,'Badulla   ','Welimada   ','Yalpathwela',1,NULL,NULL,NULL,NULL,NULL),(13753,NULL,'Kurunegala   ','Kurunegala   ','Yanthampalawa',1,NULL,NULL,NULL,NULL,NULL),(13754,NULL,'Kurunegala   ','Weerambugedara   ','Yanthampola',1,NULL,NULL,NULL,NULL,NULL),(13755,NULL,'Matale   ','Dambulla   ','Yapagama',1,NULL,NULL,NULL,NULL,NULL),(13756,NULL,'Badulla   ','Lunugala   ','Yapamma',1,NULL,NULL,NULL,NULL,NULL),(13757,NULL,'Galle   ','Benthota   ','Yasthramulla',1,NULL,NULL,NULL,NULL,NULL),(13758,NULL,'Kalutara   ','Mathugama   ','Yatadolawatta East',1,NULL,NULL,NULL,NULL,NULL),(13759,NULL,'Kalutara   ','Mathugama   ','Yatadolawatta West',1,NULL,NULL,NULL,NULL,NULL),(13760,NULL,'Galle   ','Karandeniya   ','Yatagala',1,NULL,NULL,NULL,NULL,NULL),(13761,NULL,'Gampaha   ','Minuwangoda   ','Yatagama',1,NULL,NULL,NULL,NULL,NULL),(13762,NULL,'Galle   ','Akmeemana   ','Yatagama',1,NULL,NULL,NULL,NULL,NULL),(13763,NULL,'Kegalle   ','Rambukkana   ','Yatagama',1,NULL,NULL,NULL,NULL,NULL),(13764,NULL,'Kalutara   ','Bulathsinhala   ','Yatagampitiya',1,NULL,NULL,NULL,NULL,NULL),(13765,NULL,'Ratnapura   ','Kahawatta   ','Yatagare',1,NULL,NULL,NULL,NULL,NULL),(13766,NULL,'Puttalam   ','Mahawewa   ','Yatakalana',1,NULL,NULL,NULL,NULL,NULL),(13767,NULL,'Galle   ','Nagoda   ','Yatalamatta',1,NULL,NULL,NULL,NULL,NULL),(13768,NULL,'Galle   ','Nagoda   ','Yatalamatta East',1,NULL,NULL,NULL,NULL,NULL),(13769,NULL,'Galle   ','Nagoda   ','Yatalamatta West',1,NULL,NULL,NULL,NULL,NULL),(13770,NULL,'Galle   ','Yakkalamulla   ','Yatamalagala',1,NULL,NULL,NULL,NULL,NULL),(13771,NULL,'Kandy   ','Ganga Ihala Korale   ','Yatapana',1,NULL,NULL,NULL,NULL,NULL),(13772,NULL,'Kurunegala   ','Pannala   ','Yatattawa',1,NULL,NULL,NULL,NULL,NULL),(13773,NULL,'Gampaha   ','Attanagalla   ','Yatawaka',1,NULL,NULL,NULL,NULL,NULL),(13774,NULL,'Kandy   ','Pathadumbara   ','Yatawara',1,NULL,NULL,NULL,NULL,NULL),(13775,NULL,'Kandy   ','Pathadumbara   ','Yatawara Kandagama',1,NULL,NULL,NULL,NULL,NULL),(13776,NULL,'Kalutara   ','Millaniya   ','Yatawara North',1,NULL,NULL,NULL,NULL,NULL),(13777,NULL,'Kalutara   ','Millaniya   ','Yatawara South',1,NULL,NULL,NULL,NULL,NULL),(13778,NULL,'Colombo   ','Padukka   ','Yatawathura',1,NULL,NULL,NULL,NULL,NULL),(13779,NULL,'Matale   ','Yatawatta   ','Yatawatta',1,NULL,NULL,NULL,NULL,NULL),(13780,NULL,'Nuwara Eliya   ','Hanguranketha   ','Yati Hanguranketha',1,NULL,NULL,NULL,NULL,NULL),(13781,NULL,'Kurunegala   ','Alawwa   ','Yatigaloluwa',1,NULL,NULL,NULL,NULL,NULL),(13782,NULL,'Matale   ','Galewela   ','Yatigalpotta',1,NULL,NULL,NULL,NULL,NULL),(13783,NULL,'Kandy   ','Yatinuwara   ','Yatigammana',1,NULL,NULL,NULL,NULL,NULL),(13784,NULL,'Kandy   ','Harispattuwa   ','Yatihalagala Pallegama',1,NULL,NULL,NULL,NULL,NULL),(13785,NULL,'Kandy   ','Harispattuwa   ','Yatihalagala Udagama',1,NULL,NULL,NULL,NULL,NULL),(13786,NULL,'Gampaha   ','Biyagama   ','Yatihena',1,NULL,NULL,NULL,NULL,NULL),(13787,NULL,'Kurunegala   ','Polgahawela   ','Yatihena',1,NULL,NULL,NULL,NULL,NULL),(13788,NULL,'Badulla   ','Soranathota   ','Yatilellagama',1,NULL,NULL,NULL,NULL,NULL),(13789,NULL,'Nuwara Eliya   ','Walapane   ','Yatimadura',1,NULL,NULL,NULL,NULL,NULL),(13790,NULL,'Kegalle   ','Mawanella   ','Yatimahana',1,NULL,NULL,NULL,NULL,NULL),(13791,NULL,'Ratnapura   ','Kiriella   ','Yatipawwa',1,NULL,NULL,NULL,NULL,NULL),(13792,NULL,'Kandy   ','Pathadumbara   ','Yatirawana',1,NULL,NULL,NULL,NULL,NULL),(13793,NULL,'Kurunegala   ','Mawathagama   ','Yatiwala',1,NULL,NULL,NULL,NULL,NULL),(13794,NULL,'Kegalle   ','Deraniyagala   ','Yatiwala',1,NULL,NULL,NULL,NULL,NULL),(13795,NULL,'Kegalle   ','Rambukkana   ','Yatiwaldeniya',1,NULL,NULL,NULL,NULL,NULL),(13796,NULL,'Kandy   ','Harispattuwa   ','Yatiwawala',1,NULL,NULL,NULL,NULL,NULL),(13797,NULL,'Matale   ','Galewela   ','Yatiwehera',1,NULL,NULL,NULL,NULL,NULL),(13798,NULL,'Nuwara Eliya   ','Walapane   ','Yatiwella',1,NULL,NULL,NULL,NULL,NULL),(13799,NULL,'Moneragala   ','Buttala   ','Yatiyallathota',1,NULL,NULL,NULL,NULL,NULL),(13800,NULL,'Polonnaruwa   ','Hingurakgoda   ','Yatiyalpathana',1,NULL,NULL,NULL,NULL,NULL),(13801,NULL,'Gampaha   ','Minuwangoda   ','Yatiyana',1,NULL,NULL,NULL,NULL,NULL),(13802,NULL,'Gampaha   ','Attanagalla   ','Yatiyana',1,NULL,NULL,NULL,NULL,NULL),(13803,NULL,'Kalutara   ','Bandaragama   ','Yatiyana',1,NULL,NULL,NULL,NULL,NULL),(13804,NULL,'Matara   ','Thihagoda   ','Yatiyana',1,NULL,NULL,NULL,NULL,NULL),(13805,NULL,'Gampaha   ','Minuwangoda   ','Yatiyana Central',1,NULL,NULL,NULL,NULL,NULL),(13806,NULL,'Gampaha   ','Minuwangoda   ','Yatiyana East',1,NULL,NULL,NULL,NULL,NULL),(13807,NULL,'Kalutara   ','Agalawatta   ','Yatiyana East',1,NULL,NULL,NULL,NULL,NULL),(13808,NULL,'Kalutara   ','Agalawatta   ','Yatiyana West',1,NULL,NULL,NULL,NULL,NULL),(13809,NULL,'Kegalle   ','Yatiyanthota   ','Yatiyanthota',1,NULL,NULL,NULL,NULL,NULL),(13810,NULL,'Kurunegala   ','Alawwa   ','Yattalgoda',1,NULL,NULL,NULL,NULL,NULL),(13811,NULL,'Kalutara   ','Walallavita   ','Yattapatha',1,NULL,NULL,NULL,NULL,NULL),(13812,NULL,'Kegalle   ','Galigamuwa   ','Yattogoda',1,NULL,NULL,NULL,NULL,NULL),(13813,NULL,'Kalutara   ','Mathugama   ','Yattovita',1,NULL,NULL,NULL,NULL,NULL),(13814,NULL,'Kurunegala   ','Pannala   ','Yayamulla',1,NULL,NULL,NULL,NULL,NULL),(13815,NULL,'Kurunegala   ','Panduwasnuwara   ','Yayegedara',1,NULL,NULL,NULL,NULL,NULL),(13816,NULL,'Nuwara Eliya   ','Walapane   ','Yobuwelthenna',1,NULL,NULL,NULL,NULL,NULL),(13817,NULL,'Polonnaruwa   ','Hingurakgoda   ','Yodha Ela',1,NULL,NULL,NULL,NULL,NULL),(13818,NULL,'Ratnapura   ','Embilipitiya   ','Yodhagama',1,NULL,NULL,NULL,NULL,NULL),(13819,NULL,'Kegalle   ','Rambukkana   ','Yodhagama',1,NULL,NULL,NULL,NULL,NULL),(13820,NULL,'Kegalle   ','Aranayaka   ','Yodhagama',1,NULL,NULL,NULL,NULL,NULL),(13821,NULL,'Hambantota   ','Thissamaharama   ','Yodhakandiya',1,NULL,NULL,NULL,NULL,NULL),(13822,NULL,'Kurunegala   ','Panduwasnuwara   ','Yodhayakanda',1,NULL,NULL,NULL,NULL,NULL),(13823,NULL,'Kurunegala   ','Polgahawela   ','Yogamuwakanda',1,NULL,NULL,NULL,NULL,NULL),(13824,NULL,'Mullaitivu   ','Thunukkai   ','Yogapuram',1,NULL,NULL,NULL,NULL,NULL),(13825,NULL,'Puttalam   ','Dankotuwa   ','Yogiyana',1,NULL,NULL,NULL,NULL,NULL),(13826,NULL,'Gampaha   ','Mahara   ','Yongammulla',1,NULL,NULL,NULL,NULL,NULL),(13827,NULL,'Kalutara   ','Beruwala   ','Yovungama',1,NULL,NULL,NULL,NULL,NULL),(13828,NULL,'Moneragala   ','Buttala   ','Yudaganawa',1,NULL,NULL,NULL,NULL,NULL),(13829,NULL,'Polonnaruwa   ','Medirigiriya   ','Yudhaganawa',1,NULL,NULL,NULL,NULL,NULL),(13830,NULL,'Nuwara Eliya   ','Nuwara Eliya   ','Yulefield',1,NULL,NULL,NULL,NULL,NULL),(13831,'','Bondo','Nyan\'goma','Kokiri',1,'123456789','2013-01-17 22:26:20','John Doe','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `village` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_admission`
--

DROP TABLE IF EXISTS `ward_admission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_admission` (
  `bht_no` varchar(500) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `bed_no` int(11) DEFAULT NULL,
  `ward_no` varchar(100) NOT NULL,
  `daily_no` int(11) NOT NULL,
  `monthly_no` int(11) NOT NULL,
  `yearly_no` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `admit_date_time` datetime NOT NULL,
  `patient_complain` varchar(500) NOT NULL,
  `previous_history` varchar(500) NOT NULL,
  `discharge_type` varchar(5) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `admission_unit` varchar(5) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL,
  `last_updated_user` int(11) NOT NULL,
  `last_updated_date_time` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `sign` varchar(500) NOT NULL,
  `outcomes` varchar(500) NOT NULL,
  `dischargediagnosis` varchar(500) NOT NULL,
  `referredto` varchar(500) NOT NULL,
  PRIMARY KEY (`bht_no`),
  KEY `FK_5jkf9oy1q42r60q321hgkqhb1` (`patient_id`),
  KEY `FK_7s4w9mrpywamenx440nsy2poc` (`doctor_id`),
  KEY `FK_81h66in4uvsot5blbh2dq5f9t` (`created_user`),
  KEY `FK_7p67lml4bk0d6ovc2qxx9ffu4` (`last_updated_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_admission`
--

LOCK TABLES `ward_admission` WRITE;
/*!40000 ALTER TABLE `ward_admission` DISABLE KEYS */;
INSERT INTO `ward_admission` VALUES ('20141',15,2,'Ward-01',1,1,1,17,'2014-10-18 15:22:00','patient with headache','patient was a dengue patient','none','','Ward',1,'2014-10-03 13:52:00',3,'2014-11-10 14:22:00','is confirmed','C:\\Users\\Babi\\Desktop\\treatmentimages\\testdf','','',''),('201410',13,1,'Ward-01',1,9,10,17,'2014-11-18 12:59:00','Heart Pain','Second time heart attack','M','missing patient','WARD',3,'2014-11-16 16:26:00',3,'2014-11-20 12:59:00','','','','',''),('201412',1,10,'Ward-01',1,11,12,17,'2014-11-18 12:59:00','Rash','Infection','none','','opd',3,'2014-11-18 01:44:00',3,'2014-11-20 07:34:00','','','','',''),('201413',31,-99,'Ward-03',1,12,13,17,'2014-11-20 13:00:00','Fatigue','Virus Flu patient','none','','OPD',5,'2014-11-20 07:55:00',5,'2014-11-20 04:00:00','is confirmed','url','','',''),('201416',2,2,'Ward-03',1,15,16,17,'2014-11-20 12:59:00','Leg Cramps','Artharities','IT','Healed','OPD',5,'2014-11-20 10:11:00',5,'2014-11-20 12:59:00','','','','',''),('201417',39,1,'Ward-01',1,16,17,17,'2014-11-20 13:00:00','Stomach Ache','Urine Infection','L','Feaver','WARD',3,'2014-11-20 12:40:00',5,'2015-08-29 06:07:00','','','Feaver','Recovered','Feaver'),('201418',39,2,'Ward-03',1,17,18,17,'2014-11-20 12:59:00','test','test','none','','OPD',5,'2014-11-20 13:44:00',5,'2014-11-20 13:44:00','is confirmed','url','','',''),('201419',40,5,'Ward-02',1,18,19,22,'2014-11-20 12:59:00','patient with headack','patient was a dengue patient','L','go patient','WARD',6,'2014-11-20 14:33:00',5,'2014-11-20 13:59:00','is confirmned','urlnirmani','','',''),('20142',5,1,'Ward-01',1,1,2,17,'2014-11-21 14:22:00','Pain in heart','Heart Patient and daily get drugs','ET','transfer hospital','Ward',1,'2014-11-07 17:11:00',1,'2014-11-09 14:22:00','','','','',''),('201420',40,1,'Ward-03',1,19,20,17,'2014-11-13 12:59:00','test','test','IT','test','OPD',5,'2014-11-20 14:41:00',5,'2014-11-20 12:59:00','','','','',''),('20143',16,1,'Ward-01',1,2,3,17,'2014-11-09 14:30:00','patient with headack','patient was a dengue ','IT','he have to transfer hospital','Ward',1,'2014-11-12 23:14:00',1,'2014-11-12 00:15:00','','','','',''),('20144',13,1,'Ward-02',1,3,4,22,'2014-11-13 12:59:00','patient with headack','patient was a dengue patient','L','missing patient','Ward',5,'2014-11-12 23:15:00',5,'2014-11-20 13:00:00','','','','',''),('20145',17,5,'Ward-01',1,4,5,17,'2014-11-12 12:00:00','patient with headack','patient was a dengue patient','none','','opd',5,'2014-11-13 19:17:00',5,'2014-11-20 10:08:00','','','','',''),('20146',26,2,'Ward-02',1,5,6,1,'2014-11-19 12:59:00','Dengi','patient was a dengue patient','none','','opd',5,'2014-11-13 19:18:00',5,'2014-11-13 19:18:00','Confirmed\n','C:\\xampp\\htdocs\\Inward\\css\\img\\201418-190815082755.png','','',''),('20147',4,-99,'Ward-01',1,6,7,17,'2014-11-13 12:59:00','patient with headack','patient was a dengue patient','ND','go patient','WARD',1,'2014-11-13 22:29:00',3,'2014-11-20 12:58:00','','','','',''),('20148',18,-99,'Ward-02',1,7,8,22,'2014-11-12 12:59:00','Dengi','patient was a dengue patient','none','','WARD',5,'2014-11-13 22:38:00',5,'2014-11-17 19:04:00','','','','',''),('20149',28,1,'Ward-03',1,8,9,17,'2014-11-16 12:59:00','patient with headack','patient was a dengue patienttesttttttt','IT','test','WARD',3,'2014-11-16 14:42:00',5,'2014-11-20 12:59:00','','','','',''),('201520',2,-99,'Ward-01',1,19,20,1,'2015-02-04 08:02:00','','','','','WARD',5,'2015-02-19 00:39:00',5,'2015-02-19 18:18:00','Confirmed','C:\\xampp\\htdocs\\Inward\\css\\img\\201418-190815082755.png','','',''),('201523',3,-99,'Ward-01',1,20,23,1,'2015-02-17 05:06:00','','','','','WARD',5,'2015-02-19 09:06:00',5,'2015-02-19 09:06:00','Confirmed','C:\\xampp\\htdocs\\Inward\\css\\img\\201418-190815082755.png','','',''),('201524',13,3,'Ward-01',1,21,24,13,'2015-02-12 05:06:00','','','','','WARD',5,'2015-02-19 11:03:00',5,'2015-02-19 11:03:00','','','','',''),('201526',4,6,'Ward-01',1,23,26,13,'2015-02-12 05:06:00','','','ND','Direct damage to the kidneys themselves','WARD',5,'2015-02-19 23:48:00',5,'2015-09-03 08:07:00','Confirmed','C:\\xampp\\htdocs\\Inward\\css\\img\\201526-030915102855.jpg','successful kidney operation','Injury to the kidney','clinic'),('201527',15,1,'Ward-03',1,24,27,13,'2015-02-11 17:06:00','test','','ND','Direct damage to the kidneys themselves','WARD',5,'2015-02-19 23:53:00',5,'2015-09-10 08:09:00','Confirmed','','successful kidney operation','Injury to the kidney','clinic'),('201528',27,2,'Ward-01',2,25,28,1,'2015-02-11 05:06:00','','','L','test4','WARD',5,'2015-02-19 23:55:00',5,'2015-08-29 04:54:00','','','test1','test1','test1'),('201529',7,1,'Ward-01',2,25,29,1,'2015-08-27 17:06:00','after','testing','none','','OPD',5,'2015-08-27 17:38:00',5,'2015-08-27 17:38:00','Confirmed','C:\\xampp\\htdocs\\Inward\\css\\img\\201418-190815082755.png','','',''),('201530',7,2,'Ward-01',3,26,30,1,'2015-08-27 17:06:00','testing','dd','none','','OPD',5,'2015-08-27 17:39:00',5,'2015-08-27 17:39:00','signs','C:\\Users\\Babi\\Desktop\\treatmentimages\\testdf','','',''),('201531',6,1,'Ward-01',3,26,31,1,'2015-01-09 08:30:00','Stomach Ache','Kidney Stones','ND','Direct damage to the kidneys themselves','OPD',5,'2015-09-03 06:42:00',5,'2015-09-03 06:07:00','Confirmed','C:\\xampp\\htdocs\\Inward\\css\\img\\201531-030915090213.jpg','successful kidney operation','Injury to the kidney','clinic'),('201532',7,2,'Ward-01',3,26,32,13,'2015-05-06 18:04:00','Fatigue','Dengi','L','Direct damage to the kidneys themselves','OPD',5,'2015-09-03 06:44:00',5,'2015-09-03 03:23:00','Confirmed','C:\\xampp\\htdocs\\Inward\\css\\img\\201532-030915021940.jpg','successful kidney operation','Injury to the kidney','clinic'),('201533',7,8,'Ward-01',3,26,33,1,'2015-09-03 03:43:00','Kidney disease','Kidney pain','L','Direct damage to the kidneys themselves','OPD',5,'2015-09-03 07:07:00',5,'2015-09-03 09:08:00','Confirmed','C:\\xampp\\htdocs\\Inward\\css\\img\\201533-030915024155.jpg','successful kidney operation','Injury to the kidney','clinic'),('201534',7,8,'Ward-01',3,26,34,1,'2015-07-16 07:16:00','Kidney Pain','Kidney Failure Symptoms','none','','OPD',5,'2015-09-03 07:16:00',5,'2015-09-03 07:16:00','Confirmed','C:\\xampp\\htdocs\\Inward\\css\\img\\201534-040915084913.jpg','','','');
/*!40000 ALTER TABLE `ward_admission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_admission_request`
--

DROP TABLE IF EXISTS `ward_admission_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_admission_request` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `request_unit` varchar(20) NOT NULL,
  `is_read` int(11) NOT NULL,
  `transfer_ward` varchar(100) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `create_user` int(11) NOT NULL,
  `create_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_user_doctor` int(11) NOT NULL,
  `last_update_user` int(11) NOT NULL,
  `last_update_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bht_no` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `patient_id` (`patient_id`,`transfer_ward`,`create_user`),
  KEY `last_update_user` (`last_update_user`),
  KEY `FK_h6c8fqw4d5gqm2hkxbxd7vhku` (`patient_id`),
  KEY `FK_6to31q5n3ed7auj3rs9kgm8ng` (`transfer_ward`),
  KEY `FK_18x072h4rmt8y0upm23en8ssh` (`create_user`),
  KEY `FK_76drp62asrfy54kanrop697ab` (`last_update_user`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_admission_request`
--

LOCK TABLES `ward_admission_request` WRITE;
/*!40000 ALTER TABLE `ward_admission_request` DISABLE KEYS */;
INSERT INTO `ward_admission_request` VALUES (6,1,'opd',1,'Ward-01','opd transfer',3,'2014-11-13 08:15:00',0,3,'2014-11-13 08:17:00','20145'),(7,2,'opd',1,'Ward-02','my ward patient admission',3,'2014-11-13 08:18:00',1,3,'2014-11-13 08:18:00','20146'),(8,2,'opd',1,'Ward-01','neww',3,'2014-11-15 23:16:00',1,3,'2014-11-17 14:41:00','201411'),(9,1,'opd',1,'Ward-01','patient',3,'2014-11-15 23:27:00',0,3,'2014-11-17 14:44:00','201412'),(11,31,'OPD',1,'Ward-03','patient admit imediately',3,'2014-11-19 20:53:00',0,5,'2014-11-19 20:55:00','201413'),(12,1,'OPD',1,'Ward-01','TEST',3,'2014-11-19 23:09:00',1,3,'2014-11-19 23:10:00','201415'),(13,2,'OPD',1,'Ward-03','test',3,'2014-11-19 23:11:00',0,5,'2014-11-19 23:11:00','201416'),(14,23,'OPD',0,'Ward-02','testing',6,'2014-11-20 01:29:00',0,6,'2014-11-20 01:29:00',NULL),(15,39,'OPD',1,'Ward-03','test',3,'2014-11-20 02:24:00',0,5,'2014-11-20 02:44:00','201418'),(16,40,'OPD',1,'Ward-03','test',3,'2014-11-20 03:39:00',0,5,'2014-11-20 03:41:00','201420'),(17,7,'OPD',0,'Ward-02','wed',3,'2015-07-30 05:03:00',1,3,'2015-07-30 05:03:00',NULL),(18,7,'OPD',0,'Ward-01','asd',3,'2015-07-30 05:11:00',1,3,'2015-07-30 05:11:00',NULL),(19,7,'OPD',0,'Ward-01','',3,'2015-07-30 05:13:00',1,3,'2015-07-30 05:13:00',NULL),(20,7,'OPD',0,'Ward-01','',3,'2015-07-30 05:15:00',0,3,'2015-07-30 05:15:00',NULL),(21,7,'OPD',0,'Ward-01','',3,'2015-07-30 05:24:00',1,3,'2015-07-30 05:24:00',NULL),(22,7,'OPD',0,'Ward-01','',3,'2015-07-30 05:25:00',1,3,'2015-07-30 05:25:00',NULL),(23,1,'OPD',0,'Ward-01','',1,'2015-08-03 08:05:00',0,1,'2015-08-03 08:05:00',NULL),(24,6,'OPD',0,'Ward-01','',1,'2015-08-06 08:49:00',1,1,'2015-08-06 08:49:00',NULL),(25,51,'OPD',0,'Ward-01','',1,'2015-09-14 04:57:00',1,1,'2015-09-14 04:57:00',NULL),(26,6,'OPD',0,'Ward-01','',3,'2015-11-06 04:11:00',1,3,'2015-11-06 04:11:00',NULL),(27,5,'OPD',0,'Ward-04','',3,'2015-11-06 04:34:00',1,3,'2015-11-06 04:34:00',NULL),(28,7,'OPD',0,'Ward-01','',3,'2015-11-09 04:55:00',1,3,'2015-11-09 04:55:00',NULL),(29,4,'OPD',0,'Ward-01','',3,'2015-11-09 04:56:00',1,3,'2015-11-09 04:56:00',NULL),(30,8,'OPD',0,'Ward-01','',3,'2015-11-09 05:10:00',0,3,'2015-11-09 05:10:00',NULL),(31,8,'OPD',0,'Ward-01','',3,'2015-11-09 05:32:00',0,3,'2015-11-09 05:32:00',NULL),(32,10,'OPD',0,'Ward-01','',3,'2015-11-09 05:38:00',1,3,'2015-11-09 05:38:00',NULL),(33,4,'OPD',0,'Ward-01','',3,'2015-11-09 06:17:00',1,3,'2015-11-09 06:17:00',NULL),(34,4,'OPD',0,'Ward-01','',3,'2015-11-09 06:36:00',1,3,'2015-11-09 06:36:00',NULL),(35,4,'OPD',0,'Ward-01','',3,'2015-11-09 06:37:00',1,3,'2015-11-09 06:37:00',NULL),(36,5,'OPD',0,'Ward-01','',3,'2015-11-10 04:54:00',1,3,'2015-11-10 04:54:00',NULL),(37,5,'OPD',0,'Ward-01','',3,'2015-11-10 04:54:00',1,3,'2015-11-10 04:54:00',NULL),(38,6,'OPD',0,'Ward-01','',3,'2015-11-12 05:38:00',1,3,'2015-11-12 05:38:00',NULL),(39,9,'OPD',0,'Ward-04','',3,'2015-11-16 06:03:00',0,3,'2015-11-16 06:03:00',NULL),(40,9,'OPD',0,'Ward-03','Muu pissek ooi',3,'2015-11-16 06:03:00',0,3,'2015-11-16 06:03:00',NULL),(41,5,'OPD',0,'Ward-03','redda mee yakawa admit karapan',3,'2015-11-16 06:08:00',0,3,'2015-11-16 06:08:00',NULL),(42,5,'OPD',0,'Ward-03','ssd',3,'2015-11-16 06:12:00',0,3,'2015-11-16 06:12:00',NULL),(43,5,'OPD',0,'Ward-02','l',3,'2015-11-16 06:16:00',0,3,'2015-11-16 06:16:00',NULL),(44,5,'OPD',0,'Ward-02','l',3,'2015-11-16 06:18:00',0,3,'2015-11-16 06:18:00',NULL),(45,5,'OPD',0,'Ward-04','k',3,'2015-11-16 06:18:00',0,3,'2015-11-16 06:18:00',NULL),(46,5,'OPD',0,'Ward-01','jjk',3,'2015-11-16 06:19:00',0,3,'2015-11-16 06:19:00',NULL),(47,5,'OPD',0,'Ward-04','sds',3,'2015-11-16 06:24:00',0,3,'2015-11-16 06:24:00',NULL),(48,5,'OPD',0,'Ward-01','s',3,'2015-11-16 06:27:00',0,3,'2015-11-16 06:27:00',NULL),(49,5,'OPD',0,'Ward-03','sd',3,'2015-11-16 06:30:00',0,3,'2015-11-16 06:30:00',NULL),(50,5,'OPD',0,'Ward-01','s',3,'2015-11-16 06:31:00',0,3,'2015-11-16 06:31:00',NULL),(51,12,'OPD',0,'Ward-03','werer',3,'2015-11-16 06:35:00',0,3,'2015-11-16 06:35:00',NULL),(52,12,'OPD',0,'Ward-04','dsd',3,'2015-11-16 06:37:00',0,3,'2015-11-16 06:37:00',NULL),(53,12,'OPD',0,'Ward-03','ss',3,'2015-11-16 06:38:00',0,3,'2015-11-16 06:38:00',NULL),(54,12,'OPD',0,'Ward-03','ds',3,'2015-11-16 06:40:00',0,3,'2015-11-16 06:40:00',NULL),(55,12,'OPD',0,'Ward-02','lk',3,'2015-11-16 06:41:00',0,3,'2015-11-16 06:41:00',NULL),(56,12,'OPD',0,'Ward-03','k',3,'2015-11-16 06:44:00',0,3,'2015-11-16 06:44:00',NULL),(57,8,'OPD',0,'Ward-03','dasd',3,'2015-11-16 06:49:00',0,3,'2015-11-16 06:49:00',NULL),(58,69,'OPD',0,'Ward-04','Nikan admit karapan',3,'2015-11-16 07:04:00',0,3,'2015-11-16 07:04:00',NULL),(59,4,'OPD',0,'Ward-03','poo',3,'2015-11-17 03:57:00',0,3,'2015-11-17 03:57:00',NULL);
/*!40000 ALTER TABLE `ward_admission_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_beds`
--

DROP TABLE IF EXISTS `ward_beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_beds` (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_no` int(11) NOT NULL,
  `bed_type` varchar(100) NOT NULL,
  `ward_no` varchar(100) NOT NULL,
  `availability` varchar(500) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bed_id`),
  KEY `FK_23b5mi3stwtn5gsc9w8m7sfwy` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_beds`
--

LOCK TABLES `ward_beds` WRITE;
/*!40000 ALTER TABLE `ward_beds` DISABLE KEYS */;
INSERT INTO `ward_beds` VALUES (22,1,'Normal','Ward-01','free',NULL),(23,2,'Normal','Ward-01','free',NULL),(24,3,'Normal','Ward-01','201524',13),(26,5,'Normal','Ward-01','20145',17),(27,6,'Normal','Ward-01','201526',4),(28,7,'Normal','Ward-01','free',NULL),(29,8,'Normal','Ward-01','free',NULL),(30,9,'Normal','Ward-01','free',NULL),(31,10,'Normal','Ward-01','201412',1),(32,1,'Normal','Ward-02','free',NULL),(33,2,'Normal','Ward-02','20146',2),(34,3,'Normal','Ward-02','free',NULL),(36,1,'Normal','Ward-03','201527',15),(37,2,'Normal','Ward-03','201418',39),(38,3,'Normal','Ward-03','free',NULL),(39,1,'Normal','Ward-04','free',NULL),(40,2,'Normal','Ward-04','free',NULL),(41,3,'Normal','Ward-04','free',NULL),(42,4,'Normal','Ward-04','free',NULL),(43,5,'Normal','Ward-04','free',NULL),(44,6,'Normal','Ward-04','free',NULL),(45,7,'Normal','Ward-04','free',NULL),(46,8,'Normal','Ward-04','free',NULL),(47,9,'Normal','Ward-04','free',NULL),(48,10,'Normal','Ward-04','free',NULL),(49,5,'Normal','Ward-02','free',NULL),(50,6,'Normal','Ward-02','free',NULL),(51,4,'Normal','Ward-03','free',NULL),(52,5,'Normal','Ward-03','free',NULL),(53,11,'Normal','Ward-04','free',NULL),(54,1,'Normal','Ward-05','free',NULL),(55,2,'special','Ward-05','free',NULL),(57,3,'Normal','Ward-05','free',NULL),(59,2,'Normal','Word-07','free',NULL),(60,13,'Normal','Ward-01','Test',NULL),(61,13,'Normal','Ward-01','Test',NULL),(62,13,'Normal','Ward-01','Test',NULL),(63,13,'Normal','Ward-01','Test',NULL),(64,13,'Normal','Ward-01','Test',NULL),(65,13,'Normal','Ward-01','Test',NULL),(66,13,'Normal','Ward-01','Test',NULL),(67,13,'Normal','Ward-01','Test',NULL),(68,13,'Normal','Ward-01','Test',NULL),(69,13,'Normal','Ward-01','Test',NULL),(70,13,'Normal','Ward-01','Test',NULL),(71,13,'Normal','Ward-01','Test',NULL),(72,13,'Normal','Ward-01','Test',NULL),(73,13,'Normal','Ward-01','Test',NULL),(74,13,'Normal','Ward-01','Test',NULL),(75,13,'Normal','Ward-01','Test',NULL);
/*!40000 ALTER TABLE `ward_beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_diabeticchart`
--

DROP TABLE IF EXISTS `ward_diabeticchart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_diabeticchart` (
  `row_no` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `date_time` datetime NOT NULL,
  `blood_suger` double NOT NULL,
  PRIMARY KEY (`row_no`),
  KEY `FK_2440ps4yitahh5965atiy1tu6` (`bht_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_diabeticchart`
--

LOCK TABLES `ward_diabeticchart` WRITE;
/*!40000 ALTER TABLE `ward_diabeticchart` DISABLE KEYS */;
INSERT INTO `ward_diabeticchart` VALUES (1,'201410','2015-06-08 09:02:00',10),(2,'201520','2015-06-08 09:02:00',20),(3,'201410','2015-06-13 10:00:00',55.5),(4,'201410','2015-08-25 10:05:00',55.5);
/*!40000 ALTER TABLE `ward_diabeticchart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_diet`
--

DROP TABLE IF EXISTS `ward_diet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_diet` (
  `diet_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `patient_diet` varchar(200) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `diet_category` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`diet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_diet`
--

LOCK TABLES `ward_diet` WRITE;
/*!40000 ALTER TABLE `ward_diet` DISABLE KEYS */;
INSERT INTO `ward_diet` VALUES (1,0,'Brown rice or wild rice','1 bowl','Diabetic patient diet','Breakfast','false');
/*!40000 ALTER TABLE `ward_diet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_discharge`
--

DROP TABLE IF EXISTS `ward_discharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_discharge` (
  `id` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `bht_no` varchar(255) DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5v1sqi7ew7fvukw0ay5j07wsk` (`bht_no`),
  KEY `FK_sd7t9o8tu2x6yr9wet81sta6v` (`create_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_discharge`
--

LOCK TABLES `ward_discharge` WRITE;
/*!40000 ALTER TABLE `ward_discharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `ward_discharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_externaltransfer`
--

DROP TABLE IF EXISTS `ward_externaltransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_externaltransfer` (
  `transfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `transfer_from` varchar(100) NOT NULL,
  `transfer_to` varchar(100) NOT NULL,
  `name_of_guardian` varchar(200) NOT NULL,
  `address_of_guardian` varchar(500) NOT NULL,
  `reason_for_transfer` varchar(1000) NOT NULL,
  `report_of_spacial_examination` varchar(1000) NOT NULL,
  `treatment_suggested` varchar(1000) NOT NULL,
  `transfer_created_date_time` datetime NOT NULL,
  `transfer_created_user` int(11) NOT NULL,
  PRIMARY KEY (`transfer_id`,`bht_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_externaltransfer`
--

LOCK TABLES `ward_externaltransfer` WRITE;
/*!40000 ALTER TABLE `ward_externaltransfer` DISABLE KEYS */;
INSERT INTO `ward_externaltransfer` VALUES (1,'20142','Thalangama','Homagama','S.A Wijerathne','No-145/8/3, Dadagamuwa,Veyangoda','sergical','Heart patient','Give Aspin ','2014-11-09 14:22:00',1);
/*!40000 ALTER TABLE `ward_externaltransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_internaltransfer`
--

DROP TABLE IF EXISTS `ward_internaltransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_internaltransfer` (
  `tranfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `transfer_ward` varchar(100) NOT NULL,
  `transfer_from_ward` varchar(100) NOT NULL,
  `reson_for_trasnsfer` varchar(1000) NOT NULL,
  `report_of_spacial_examination` varchar(1000) NOT NULL,
  `treatment_suggested` varchar(1000) NOT NULL,
  `transfer_created_date_time` datetime NOT NULL,
  `transfer_created_user` int(11) NOT NULL,
  `read_transfer` int(11) NOT NULL,
  `new_bht_no` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tranfer_id`,`bht_no`),
  KEY `FK_ojcjr4ha0evnwm6ew8knpwkec` (`bht_no`),
  KEY `FK_1xik82wie38atliouuwk8bnk5` (`transfer_from_ward`),
  KEY `FK_dugn44vuohd8o1501bsdcqbnm` (`transfer_ward`),
  KEY `FK_5rm2j6j6ld85w4ti65x6rpr6l` (`transfer_created_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_internaltransfer`
--

LOCK TABLES `ward_internaltransfer` WRITE;
/*!40000 ALTER TABLE `ward_internaltransfer` DISABLE KEYS */;
INSERT INTO `ward_internaltransfer` VALUES (4,'20143','Ward-02','Ward-01','lab testing','heart attack','aspin','2014-11-12 00:15:00',1,1,'20148'),(5,'201416','Ward-01','Ward-03','test','heart attack','test','2014-11-20 12:59:00',5,0,NULL),(6,'20149','Ward-01','Ward-03','test','test','test','2014-11-20 12:59:00',5,0,NULL),(7,'201420','Ward-01','Ward-03','tes','test','test','2014-11-20 12:59:00',5,1,'99999'),(8,'201530','Ward-02','Ward-01','test4','','tests','2015-01-12 10:10:00',5,0,NULL);
/*!40000 ALTER TABLE `ward_internaltransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_liquidbalancechart`
--

DROP TABLE IF EXISTS `ward_liquidbalancechart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_liquidbalancechart` (
  `row_no` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `date_time` datetime NOT NULL,
  `Oral` double NOT NULL,
  `Saline` double NOT NULL,
  `Output` double NOT NULL,
  PRIMARY KEY (`row_no`),
  KEY `FK_tmeaerj0n1scwe68ig53ynsum` (`bht_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_liquidbalancechart`
--

LOCK TABLES `ward_liquidbalancechart` WRITE;
/*!40000 ALTER TABLE `ward_liquidbalancechart` DISABLE KEYS */;
INSERT INTO `ward_liquidbalancechart` VALUES (1,'201419','2015-06-08 09:02:00',100,80,20),(2,'201419','2015-06-14 09:02:00',120,20,100),(3,'201419','2015-07-02 10:11:00',100,20,32),(4,'201410','2015-10-26 10:10:00',120,20,100),(5,'201412','2015-09-16 05:05:00',100,45,55),(6,'201412','2015-09-16 05:06:00',100,45,55),(7,'201412','2015-09-16 05:06:00',145,50,95);
/*!40000 ALTER TABLE `ward_liquidbalancechart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_nursenote`
--

DROP TABLE IF EXISTS `ward_nursenote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_nursenote` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `create_user` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK_18cd1bqgsyesbq7iwbihqrx66` (`bht_no`),
  KEY `FK_j8tlbjcy80qqvn2kl2kbowcpy` (`create_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_nursenote`
--

LOCK TABLES `ward_nursenote` WRITE;
/*!40000 ALTER TABLE `ward_nursenote` DISABLE KEYS */;
INSERT INTO `ward_nursenote` VALUES (1,'201417','test1',5,'2015-06-08 07:43:00'),(2,'201419','test1',5,'2015-07-05 21:38:49');
/*!40000 ALTER TABLE `ward_nursenote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_operations`
--

DROP TABLE IF EXISTS `ward_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_operations` (
  `operation_id` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `operation_type` varchar(500) NOT NULL,
  `operation_discription` varchar(500) NOT NULL,
  PRIMARY KEY (`operation_id`,`bht_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_operations`
--

LOCK TABLES `ward_operations` WRITE;
/*!40000 ALTER TABLE `ward_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ward_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_prescription_terms`
--

DROP TABLE IF EXISTS `ward_prescription_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_prescription_terms` (
  `term_id` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `no_of_terms` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `create_user` int(11) NOT NULL,
  PRIMARY KEY (`term_id`),
  KEY `bht_no` (`bht_no`,`create_user`),
  KEY `FK_hdc4m0x332k05cxsuvp4ywpeg` (`create_user`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_prescription_terms`
--

LOCK TABLES `ward_prescription_terms` WRITE;
/*!40000 ALTER TABLE `ward_prescription_terms` DISABLE KEYS */;
INSERT INTO `ward_prescription_terms` VALUES (23,'20144',1,'2014-11-19','2014-11-19',3),(24,'20144',2,'2014-11-19','2014-11-19',3),(25,'20144',3,'2014-11-19','2014-11-19',3),(26,'201410',1,'2014-11-19','2014-11-19',3),(27,'20144',4,'2014-11-20','2014-11-20',3),(28,'20144',5,'2014-11-20','2014-11-20',3),(29,'20144',6,'2014-11-20','2014-11-20',3),(30,'20144',7,'2014-11-20','2014-11-20',3),(31,'20142',1,'2014-11-20','2014-11-20',3),(32,'20141',1,'2014-11-20','2014-11-20',3),(33,'20149',1,'2014-11-20','2014-11-20',3),(34,'20149',2,'2014-11-20','2014-11-20',3),(35,'20149',3,'2014-11-20','2014-11-20',3),(36,'201413',1,'2014-11-20','2014-11-20',3),(37,'20141',2,'2014-11-20','2014-11-20',3),(38,'20142',2,'2014-11-20','2014-11-20',3),(39,'20142',3,'2014-11-20','2014-11-20',3),(40,'20142',4,'2014-11-20','2014-11-20',3),(41,'20141',3,'2014-11-20','2014-11-20',3),(42,'201416',1,'2014-11-20','2014-11-20',3),(43,'201415',1,'2014-11-20','2014-11-20',3),(44,'201410',2,'2014-11-20','2014-11-20',3),(45,'201410',3,'2014-11-20','2014-11-20',3),(46,'201410',4,'2014-11-20','2014-11-20',3),(47,'201417',1,'2014-11-20','2014-11-20',3),(48,'20147',1,'2014-11-20','2014-11-20',3),(49,'201419',1,'2014-11-20','2014-11-20',6),(50,'201420',1,'2014-11-20','2014-11-20',5),(51,'20141',4,'2014-11-20','2014-11-20',3),(52,'201412',1,'2014-12-20','2014-12-20',3),(53,'201412',2,'2014-12-20','2014-12-20',3),(54,'201412',3,'2014-12-20','2014-12-20',3),(55,'201412',4,'2014-12-20','2014-12-20',3),(58,'201520',1,'2015-02-19','2015-02-19',5),(59,'201520',2,'2015-02-19','2015-02-19',5),(61,'201414',1,'2015-02-19','2015-02-19',1),(62,'201414',1,'2015-02-19','2015-02-19',1),(63,'201521',1,'2015-02-19','2015-02-19',5),(64,'201522',1,'2015-02-19','2015-02-19',5),(66,'201418',1,'2015-02-19','2015-02-19',5),(67,'201418',2,'2015-02-19','2015-02-19',5),(68,'201521',2,'2015-02-19','2015-02-19',5),(69,'201523',1,'2015-02-19','2015-02-19',5),(70,'201522',1,'2015-02-19','2015-02-19',5),(73,'201522',1,'2015-02-19','2015-02-19',5),(75,'201521',3,'2015-02-19','2015-02-19',5),(76,'201522',1,'2015-02-19','2015-02-19',5),(79,'201524',1,'2015-02-19','2015-02-19',5),(81,'201526',1,'2015-02-19','2015-02-19',5),(82,'201528',1,'2015-02-19','2015-02-19',5),(83,'201411',1,'2015-02-20','2015-02-20',5),(84,'201411',1,'2015-02-20','2015-02-20',5),(86,'201528',2,'2015-02-20','2015-02-20',5),(87,'201528',3,'2015-02-20','2015-02-20',5),(90,'201526',2,'2015-02-20','2015-02-20',5),(91,'20145',1,'2015-02-20','2015-02-20',5),(92,'20145',2,'2015-02-20','2015-02-20',5),(93,'201411',1,'2015-02-22','2015-02-22',5),(94,'201525',1,'2015-02-22','2015-02-22',5),(95,'20146',1,'2015-02-22','2015-02-22',5),(96,'201414',1,'2015-02-22','2015-02-22',5),(97,'201414',1,'2015-02-22','2015-02-22',5),(98,'201414',1,'2015-02-22','2015-02-22',5),(99,'201414',1,'2015-02-22','2015-02-22',5),(100,'201414',1,'2015-02-22','2015-02-22',5),(101,'20148',1,'2015-02-22','2015-02-22',5),(102,'201414',1,'2015-02-22','2015-02-22',5),(103,'20148',2,'2015-02-22','2015-02-22',5),(104,'201414',1,'2015-02-22','2015-02-22',5),(105,'201529',1,'2015-03-28','2015-03-28',5),(106,'201529',2,'2015-03-28','2015-03-28',5),(107,'201524',2,'2015-04-16','2015-04-16',5),(108,'201412',5,'2015-09-16','2015-09-16',5),(109,'201412',6,'2015-09-16','2015-09-16',5),(110,'201412',7,'2015-09-16','2015-09-16',5);
/*!40000 ALTER TABLE `ward_prescription_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_prescriptionitem`
--

DROP TABLE IF EXISTS `ward_prescriptionitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_prescriptionitem` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `dose` int(11) NOT NULL,
  `frequency` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`auto_id`,`term_id`),
  KEY `drug_id` (`drug_id`),
  KEY `FK_oe52j16vb9cxn1x6yuihc3o2a` (`term_id`),
  KEY `FK_jwe7r9n0xhg6kay8uroma2vcr` (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_prescriptionitem`
--

LOCK TABLES `ward_prescriptionitem` WRITE;
/*!40000 ALTER TABLE `ward_prescriptionitem` DISABLE KEYS */;
INSERT INTO `ward_prescriptionitem` VALUES (33,24,38,1,'Twice a Day','con'),(34,24,3,1,'Once a Day','omit'),(35,24,20,2,' Thrice a Day','con'),(36,24,6,1,' Thrice a Day','omit'),(37,25,38,1,'Twice a Day','con'),(38,25,20,2,' Thrice a Day','con'),(39,25,11,1,'Once a Day','chg'),(40,27,38,1,'Twice a Day','con'),(41,27,20,2,' Thrice a Day','chg'),(42,27,38,2,'Twice a Day','con'),(43,27,21,3,' Thrice a Day','con'),(44,27,11,3,'Thrice a Day','chg'),(45,28,38,1,'Twice a Day','con'),(46,28,38,2,'Twice a Day','con'),(47,28,21,3,' Thrice a Day','con'),(48,28,11,2,'Once a Day','con'),(49,28,20,3,'Thrice a Day','con'),(50,29,38,1,'Twice a Day','con'),(51,29,38,2,'Twice a Day','con'),(52,29,21,3,' Thrice a Day','con'),(53,29,11,2,'Once a Day','con'),(54,29,20,3,'Thrice a Day','con'),(55,29,6,1,'Once a Day','con'),(56,30,38,1,'Twice a Day','active'),(57,30,38,2,'Twice a Day','active'),(58,30,21,3,' Thrice a Day','active'),(59,30,11,2,'Once a Day','active'),(60,30,20,3,'Thrice a Day','active'),(61,32,6,1,'Once a Day','con'),(62,32,1,1,'Once a Day','omit'),(63,32,11,2,'Once a Day','chg'),(64,34,38,3,'Twice a Day','omit'),(65,35,2,3,'Twice a Day','active'),(66,35,3,1,' Thrice a Day','active'),(67,37,6,1,'Once a Day','omit'),(68,37,2,3,'Twice a Day','con'),(69,37,11,1,'Thrice a Day','chg'),(70,38,11,2,' Thrice a Day','con'),(71,38,6,2,' Thrice a Day','omit'),(72,38,3,2,'Twice a Day','omit'),(73,38,39,1,'Once a Day','chg'),(74,39,11,2,' Thrice a Day','con'),(75,39,39,2,'Once a Day','omit'),(76,39,1,3,' Thrice a Day','con'),(77,40,11,2,' Thrice a Day','active'),(78,40,1,3,' Thrice a Day','active'),(79,40,2,2,'Twice a Day','active'),(80,40,5,2,' Thrice a Day','active'),(81,41,2,3,'Twice a Day','con'),(82,41,1,3,' Thrice a Day','omit'),(83,41,11,2,'Thrice a Day','con'),(84,44,39,2,'Twice a Day','con'),(85,44,6,3,'Twice a Day','chg'),(86,44,6,2,'Twice a Day','omit'),(87,45,39,2,'Twice a Day','con'),(88,45,8,2,' Thrice a Day','con'),(89,45,6,1,'Once a Day','omit'),(90,46,39,2,'Twice a Day','active'),(91,46,8,2,' Thrice a Day','active'),(92,46,2,3,'Twice a Day','active'),(93,51,2,3,'Twice a Day','active'),(94,51,11,2,'Thrice a Day','active'),(95,51,39,1,'Once a Day','active'),(96,53,15,3,' Thrice a Day','omit'),(97,53,39,2,'Twice a Day','chg'),(98,54,39,1,'Twice a Day','chg'),(99,54,11,2,'Once a Day','chg'),(100,55,39,2,'Twice a Day','active'),(101,55,11,3,'Thrice a Day','active'),(102,55,39,1,'Twice a Day','active'),(103,59,39,3,' Thrice a Day','active'),(104,67,53,3,' Thrice a Day','active'),(105,68,11,3,' Thrice a Day','con'),(106,75,11,3,' Thrice a Day','active'),(107,75,11,3,'Twice a Day','active'),(108,86,15,3,' Thrice a Day','omit'),(109,86,39,2,' Thrice a Day','chg'),(110,87,39,3,'Twice a Day','active'),(111,87,39,2,'Twice a Day','active'),(112,90,15,2,'Twice a Day','active'),(113,92,53,2,'Once a Day','active'),(114,103,53,2,'Twice a Day','active'),(115,106,38,2,'Twice a Day','active'),(116,106,53,2,'Twice a Day','active'),(117,107,53,3,' Thrice a Day','active'),(118,108,11,1,'Once a Day','active'),(119,110,11,1,'Once a Day','active');
/*!40000 ALTER TABLE `ward_prescriptionitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_prescriptions`
--

DROP TABLE IF EXISTS `ward_prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_prescriptions` (
  `prescribe_id` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `diagnosis` varchar(1000) NOT NULL,
  `created_user` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL,
  PRIMARY KEY (`prescribe_id`,`bht_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_prescriptions`
--

LOCK TABLES `ward_prescriptions` WRITE;
/*!40000 ALTER TABLE `ward_prescriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ward_prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_signature`
--

DROP TABLE IF EXISTS `ward_signature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_signature` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `d_sign` varchar(500) NOT NULL,
  `createuser` int(11) NOT NULL,
  `createdatetime` datetime NOT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_signature`
--

LOCK TABLES `ward_signature` WRITE;
/*!40000 ALTER TABLE `ward_signature` DISABLE KEYS */;
INSERT INTO `ward_signature` VALUES (1,17,'test',5,'2015-08-16 21:26:04');
/*!40000 ALTER TABLE `ward_signature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_surgicalobsrchart`
--

DROP TABLE IF EXISTS `ward_surgicalobsrchart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_surgicalobsrchart` (
  `row_no` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `date_time` datetime NOT NULL,
  `remark` varchar(100) NOT NULL,
  PRIMARY KEY (`row_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_surgicalobsrchart`
--

LOCK TABLES `ward_surgicalobsrchart` WRITE;
/*!40000 ALTER TABLE `ward_surgicalobsrchart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ward_surgicalobsrchart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_temp_prescribe`
--

DROP TABLE IF EXISTS `ward_temp_prescribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_temp_prescribe` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `dose` int(11) NOT NULL,
  `frequency` varchar(100) NOT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `FK_beb545hp3m5cwurtie3dihv53` (`term_id`),
  KEY `FK_ghhq6a4as54dcs8db66efo660` (`drug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_temp_prescribe`
--

LOCK TABLES `ward_temp_prescribe` WRITE;
/*!40000 ALTER TABLE `ward_temp_prescribe` DISABLE KEYS */;
INSERT INTO `ward_temp_prescribe` VALUES (35,23,38,1,'Twice a Day'),(36,23,3,1,'Once a Day'),(37,23,20,2,' Thrice a Day'),(38,23,6,1,' Thrice a Day'),(39,24,11,1,'Once a Day'),(40,25,38,2,'Twice a Day'),(41,25,21,3,' Thrice a Day'),(42,25,11,3,'Thrice a Day'),(43,27,11,2,'Once a Day'),(44,27,20,3,'Thrice a Day'),(45,28,6,1,'Once a Day'),(46,29,1,1,'Once a Day'),(47,33,38,3,'Twice a Day'),(49,34,2,3,'Twice a Day'),(50,34,3,1,' Thrice a Day'),(51,32,2,3,'Twice a Day'),(52,32,11,1,'Thrice a Day'),(53,31,11,2,' Thrice a Day'),(54,31,6,2,' Thrice a Day'),(55,31,3,2,'Twice a Day'),(56,31,39,1,'Once a Day'),(57,38,39,2,'Once a Day'),(58,38,1,3,' Thrice a Day'),(59,39,2,2,'Twice a Day'),(60,39,5,2,' Thrice a Day'),(61,37,1,3,' Thrice a Day'),(62,37,11,2,'Thrice a Day'),(63,26,39,2,'Twice a Day'),(64,26,6,3,'Twice a Day'),(65,26,6,2,'Twice a Day'),(67,44,8,2,' Thrice a Day'),(68,44,6,1,'Once a Day'),(69,45,2,3,'Twice a Day'),(70,41,39,1,'Once a Day'),(71,52,15,3,' Thrice a Day'),(72,52,39,2,'Twice a Day'),(73,53,39,1,'Twice a Day'),(74,53,11,2,'Once a Day'),(75,54,39,2,'Twice a Day'),(76,54,11,3,'Thrice a Day'),(77,54,39,1,'Twice a Day'),(78,58,39,3,' Thrice a Day'),(79,63,11,3,' Thrice a Day'),(80,66,53,3,' Thrice a Day'),(81,68,11,3,'Twice a Day'),(82,75,53,3,'Twice a Day'),(83,82,15,3,' Thrice a Day'),(84,82,39,2,' Thrice a Day'),(85,86,39,3,'Twice a Day'),(86,86,39,2,'Twice a Day'),(87,81,15,2,'Twice a Day'),(88,91,53,2,'Once a Day'),(89,101,53,2,'Twice a Day'),(90,105,38,2,'Twice a Day'),(91,105,53,2,'Twice a Day'),(92,79,53,3,' Thrice a Day');
/*!40000 ALTER TABLE `ward_temp_prescribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_temperaturechart`
--

DROP TABLE IF EXISTS `ward_temperaturechart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_temperaturechart` (
  `row_no` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `temperature` double NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`row_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_temperaturechart`
--

LOCK TABLES `ward_temperaturechart` WRITE;
/*!40000 ALTER TABLE `ward_temperaturechart` DISABLE KEYS */;
INSERT INTO `ward_temperaturechart` VALUES (1,'201410',55.5,'2015-08-25 10:05:00'),(2,'99999',100,'2017-01-01 01:10:00'),(3,'99999',100,'2017-01-01 01:10:00'),(4,'99999',100,'2017-01-01 01:10:00'),(5,'99999',100,'2017-01-01 01:10:00'),(6,'99999',100,'2017-01-01 01:10:00'),(7,'99999',100,'2017-01-01 01:10:00'),(8,'99999',100,'2017-01-01 01:10:00'),(9,'99999',100,'2017-01-01 01:10:00'),(10,'99999',100,'2017-01-01 01:10:00'),(11,'99999',100,'2017-01-01 01:10:00'),(12,'99999',100,'2017-01-01 01:10:00'),(13,'99999',100,'2017-01-01 01:10:00');
/*!40000 ALTER TABLE `ward_temperaturechart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_treatment`
--

DROP TABLE IF EXISTS `ward_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_treatment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bht_no` varchar(500) NOT NULL,
  `treat` varchar(1000) NOT NULL,
  `image` varchar(5000) NOT NULL,
  `create_user` int(11) DEFAULT NULL,
  `create_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_lm8f6w3wad8mj5nntbqqdmwpf` (`bht_no`),
  KEY `FK_anu1vbi78paxd4aac86fxpnsw` (`create_user`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_treatment`
--

LOCK TABLES `ward_treatment` WRITE;
/*!40000 ALTER TABLE `ward_treatment` DISABLE KEYS */;
INSERT INTO `ward_treatment` VALUES (1,'20142','test','urlddd',3,'2014-11-19 00:15:44'),(2,'20141','surath','urlddd',3,'2014-11-19 00:17:58'),(3,'20145','Kidney failure','C:\\xampp\\htdocs\\Inward\\css\\img\\20145-190815090839.png',5,'2015-08-18 22:08:37'),(5,'201418','Lungs pres ','C:\\xampp\\htdocs\\Inward\\css\\img\\201418-190815100331.png',5,'2015-08-18 23:03:30'),(22,'201526','jjj','\\his\\Home\\Desktop\\dilhara\\images\\201526-160915091033.jpg',5,'2015-09-16 06:08:49'),(23,'201526','tty','\\his\\Home\\Desktop\\dilhara\\images\\201526-160915091555.jpg',5,'2015-09-16 06:14:12'),(24,'20145','gyhu','/home/his/Desktop/dilhara/images/20145-160915091837.jpeg',5,'2015-09-16 06:16:54'),(25,'201526','hkl','/home/his/Desktop/dilhara/images/201526-160915092105.jpeg',5,'2015-09-16 06:19:21');
/*!40000 ALTER TABLE `ward_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_wards`
--

DROP TABLE IF EXISTS `ward_wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ward_wards` (
  `ward_no` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `ward_gender` varchar(100) NOT NULL,
  PRIMARY KEY (`ward_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_wards`
--

LOCK TABLES `ward_wards` WRITE;
/*!40000 ALTER TABLE `ward_wards` DISABLE KEYS */;
INSERT INTO `ward_wards` VALUES ('Ward-01','Medical','Male'),('Ward-02','Sergical','Male'),('Ward-03','Sergical','Male'),('Ward-04','medical','Female'),('Ward-05','Sergical','Male');
/*!40000 ALTER TABLE `ward_wards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `hr_employee_view`
--

/*!50001 DROP VIEW IF EXISTS `hr_employee_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hr_employee_view` AS select `e`.`emp_ID` AS `emp_ID`,`e`.`title` AS `title`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`e`.`birthday` AS `birthday`,`e`.`gender` AS `gender`,`e`.`civil_status` AS `civil_status`,max((case when (`c`.`contact_type_ID` = '1') then `c`.`contact` end)) AS `Address`,max((case when (`c`.`contact_type_ID` = '2') then `c`.`contact` end)) AS `Phone`,max((case when (`c`.`contact_type_ID` = '3') then `c`.`contact` end)) AS `Mobile`,max((case when (`c`.`contact_type_ID` = '4') then `c`.`contact` end)) AS `Email`,max((case when (`i`.`identity_type_ID` = '1') then `i`.`identity` end)) AS `NIC`,max((case when (`i`.`identity_type_ID` = '2') then `i`.`identity` end)) AS `EPF`,max((case when (`i`.`identity_type_ID` = '3') then `i`.`identity` end)) AS `Driving_Licence`,`dep`.`dept_name` AS `dept_name`,`des`.`designation_name` AS `designation_name` from (((((`hr_employee` `e` left join `hr_contact` `c` on((`e`.`emp_ID` = `c`.`emp_ID`))) left join `hr_identity` `i` on((`e`.`emp_ID` = `i`.`emp_ID`))) left join `hr_workin` `w` on((`e`.`emp_ID` = `w`.`emp_ID`))) left join `hr_department` `dep` on((`w`.`dept_ID` = `dep`.`dept_ID`))) left join `hr_designation` `des` on((`w`.`designation_ID` = `des`.`designation_ID`))) group by `e`.`emp_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pcu_viewinventory`
--

/*!50001 DROP VIEW IF EXISTS `pcu_viewinventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pcu_viewinventory` AS select `ib`.`s_number` AS `s_number`,`pi`.`name` AS `name`,`pi`.`remark` AS `remark`,`pi`.`last_stock_recieved` AS `last_stock_recieved`,`pi`.`reorder_level` AS `reorder_level`,sum(`ib`.`quantity`) AS `tot_qty` from (`pcu_items` `pi` join `pcu_itembatchrelation` `ib`) where (`pi`.`s_number` = `ib`.`s_number`) group by `ib`.`s_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-03  8:26:21