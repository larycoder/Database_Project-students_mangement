-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: usth_gen8
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- use gen8 table
--
DROP SCHEMA IF EXISTS usth_gen8;
CREATE SCHEMA IF NOT EXISTS usth_gen8;
USE usth_gen8;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courses` (
  `ID` varchar(10) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `credits` int(5) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `grade` int(5) DEFAULT NULL,
  `attendance_percent` double DEFAULT NULL,
  `homework_percent` double DEFAULT NULL,
  `labwork_percent` double DEFAULT NULL,
  `midterm_percent` double DEFAULT NULL,
  `final_percent` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES ('ICT1.2','Computer Architecture',3,'ICT',1,10,10,NULL,20,60),('ICT1.3 ','Basic Databases',4,'ICT',3,10,10,NULL,NULL,80),('LAW2.0','Law on Intellectual Right',1,'ICT',2,10,10,NULL,20,60),('MATH2.0','Probability and Statistics',3,'ICT',3,10,10,NULL,20,60),('MATH2.4','Analysis & algebraic structures',3,'ICT',20,NULL,NULL,NULL,20,60),('MATH2.5','Digital Signal Processing ',3,'All',1,30,10,NULL,NULL,60);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fees`
--

DROP TABLE IF EXISTS `Fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fees` (
  `ID` varchar(10) NOT NULL,
  `Grade` varchar(10) DEFAULT NULL,
  `Full_year` varchar(20) DEFAULT NULL,
  `A_semester` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fees`
--

LOCK TABLES `Fees` WRITE;
/*!40000 ALTER TABLE `Fees` DISABLE KEYS */;
INSERT INTO `Fees` VALUES ('1','1','41,000,000','20,500,000'),('2','2','41,000,000','20,500,000'),('3','3','41,000,000','20,500,000');
/*!40000 ALTER TABLE `Fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Has`
--

DROP TABLE IF EXISTS `Has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Has` (
  `Student_ID` varchar(10) NOT NULL,
  `Scholar_ID` varchar(10) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  KEY `Scholar_ID` (`Scholar_ID`),
  CONSTRAINT `Has_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Students` (`ID`),
  CONSTRAINT `Has_ibfk_2` FOREIGN KEY (`Scholar_ID`) REFERENCES `Scholarships` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Has`
--

LOCK TABLES `Has` WRITE;
/*!40000 ALTER TABLE `Has` DISABLE KEYS */;
INSERT INTO `Has` VALUES ('189','1','VALLET2018'),('039','2','VALLET2018'),('014','3','VALLET2018'),('231','4',NULL);
/*!40000 ALTER TABLE `Has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lecturers`
--

DROP TABLE IF EXISTS `Lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lecturers` (
  `ID` varchar(10) NOT NULL,
  `First_name` varchar(50) DEFAULT NULL,
  `Last_name` varchar(50) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lecturers`
--

LOCK TABLES `Lecturers` WRITE;
/*!40000 ALTER TABLE `Lecturers` DISABLE KEYS */;
INSERT INTO `Lecturers` VALUES ('1','A','Nguyen Van','ICT'),('2','B','Nguyen Thi','NANO'),('3','C','Pham Van','BP');
/*!40000 ALTER TABLE `Lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paid`
--

DROP TABLE IF EXISTS `Paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paid` (
  `Student_ID` varchar(10) NOT NULL,
  `Fee_ID` varchar(10) NOT NULL,
  `Paid` varchar(20) DEFAULT NULL,
  `Not_paid` varchar(20) DEFAULT NULL,
  KEY `Student_ID` (`Student_ID`),
  KEY `Fee_ID` (`Fee_ID`),
  CONSTRAINT `Paid_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Students` (`ID`),
  CONSTRAINT `Paid_ibfk_2` FOREIGN KEY (`Fee_ID`) REFERENCES `Fees` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paid`
--

LOCK TABLES `Paid` WRITE;
/*!40000 ALTER TABLE `Paid` DISABLE KEYS */;
INSERT INTO `Paid` VALUES ('189','1','41,000,000',NULL),('039','2','20,500,000','20,500,000'),('014','3','41,000,000',NULL),('231','3',NULL,'41,000,000');
/*!40000 ALTER TABLE `Paid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scheduling`
--

DROP TABLE IF EXISTS `Scheduling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scheduling` (
  `Course_ID` varchar(10) NOT NULL,
  `Course_date` datetime DEFAULT NULL,
  `Course_place` varchar(50) DEFAULT NULL,
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `Scheduling_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `Courses` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scheduling`
--

LOCK TABLES `Scheduling` WRITE;
/*!40000 ALTER TABLE `Scheduling` DISABLE KEYS */;
INSERT INTO `Scheduling` VALUES ('LAW2.0','2020-03-05 00:00:00','Room9000'),('MATH2.0','2020-06-05 00:00:00','Room500'),('MATH2.4','2030-05-01 00:00:00','Room601'),('MATH2.5','2010-04-11 00:00:00','Room702');
/*!40000 ALTER TABLE `Scheduling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scholarships`
--

DROP TABLE IF EXISTS `Scholarships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scholarships` (
  `ID` varchar(10) NOT NULL,
  `Scholar_type` varchar(3) DEFAULT NULL,
  `Money` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scholarships`
--

LOCK TABLES `Scholarships` WRITE;
/*!40000 ALTER TABLE `Scholarships` DISABLE KEYS */;
INSERT INTO `Scholarships` VALUES ('1','A1','40,000,000'),('2','A2','30,000,000'),('3','A2','30,000,000'),('4','A2','30,000,000');
/*!40000 ALTER TABLE `Scholarships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Score_record`
--

DROP TABLE IF EXISTS `Score_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Score_record` (
  `course_id` varchar(10) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `attendance` double DEFAULT NULL,
  `homework` double DEFAULT NULL,
  `labwork` double DEFAULT NULL,
  `midterm` double DEFAULT NULL,
  `final` double DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  KEY `course_id` (`course_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `Score_record_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`ID`),
  CONSTRAINT `Score_record_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `Students` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Score_record`
--

LOCK TABLES `Score_record` WRITE;
/*!40000 ALTER TABLE `Score_record` DISABLE KEYS */;
INSERT INTO `Score_record` VALUES ('MATH2.0','231',13,3.5,NULL,16,19,'nice job'),('MATH2.0','189',10,NULL,3.9,12,20,'cool'),('ICT1.3','039',19.2,4.9,NULL,NULL,8.3,'great'),('ICT1.3','014',13.2,9.9,NULL,NULL,6.3,'not bad'),('ICT1.3','543',20,20,NULL,NULL,20,'not bad');
/*!40000 ALTER TABLE `Score_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `ID` varchar(10) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `birth_place` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` int(15) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES ('014','Pham Van','Quyen','1999-09-13','F','Saigon, Vietnam','2 Dz Street','dasd5@gmail.com',53653149,'EN'),('039','Nguyen Thi','Trang','1999-10-07','M','Hanoi, Vietnam','1 Banana Street','dasd2@gmail.com',124353149,'PMAB'),('126','Dang Van','Nguyen','2000-03-31','M','Hai Phong, Vietnam','12 POP Street','2131dddd@gmail.com',112434149,'SA'),('189','Truong Si Thi','Vu','1999-11-17','M','Stockholm, Sweden','2 Apple Street','thivu@gmail.com',124924149,'ICT'),('231','Le Hong','Anh','1999-01-01','F','Virginia, USA','3 VSAD Street','vge34@gmail.com',2555149,'NANO'),('543','Vu Van','Toan','1998-11-04','M','Bejing, China','42 Apple Street','faf34@gmail.com',12379849,'ICT');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teaching`
--

DROP TABLE IF EXISTS `Teaching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teaching` (
  `Course_ID` varchar(10) DEFAULT NULL,
  `Lecturer_ID` varchar(10) DEFAULT NULL,
  KEY `Course_ID` (`Course_ID`),
  KEY `Lecturer_ID` (`Lecturer_ID`),
  CONSTRAINT `Teaching_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `Courses` (`ID`),
  CONSTRAINT `Teaching_ibfk_2` FOREIGN KEY (`Lecturer_ID`) REFERENCES `Lecturers` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teaching`
--

LOCK TABLES `Teaching` WRITE;
/*!40000 ALTER TABLE `Teaching` DISABLE KEYS */;
INSERT INTO `Teaching` VALUES ('MATH2.0','1'),('ICT1.2','2'),('MATH2.4','3');
/*!40000 ALTER TABLE `Teaching` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-10 10:21:26
