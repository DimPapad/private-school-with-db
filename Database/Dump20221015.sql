CREATE DATABASE  IF NOT EXISTS `private_school` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `private_school`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: private_school
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `as_id` int NOT NULL AUTO_INCREMENT,
  `as_title` varchar(45) DEFAULT NULL,
  `as_description` mediumtext,
  `as_sub_date_time` date DEFAULT NULL,
  PRIMARY KEY (`as_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,'ASSIGNMENT 1','AAAAA','2020-02-01'),(2,'ASSIGNMENT 2','BBBBB','2020-02-10'),(3,'ASSIGNMENT 3','CCCCC','2020-02-19'),(4,'ASSIGNMENT 4','DDDDD','2020-02-28'),(5,'ASSIGNMENT 5','EEEEE','2020-03-08'),(6,'PROJECT 1','FFFFF','2020-03-17'),(7,'PROJECT 2','GGGGG','2020-03-26'),(8,'qwe','rty','2020-01-01'),(9,'asd','fgh','2020-03-01'),(10,'g','g','2025-03-31'),(11,'h','h','2025-05-31'),(12,'G','G','2030-03-31'),(13,'H','H','2030-05-31');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `assignment_info`
--

DROP TABLE IF EXISTS `assignment_info`;
/*!50001 DROP VIEW IF EXISTS `assignment_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `assignment_info` AS SELECT 
 1 AS `as_id`,
 1 AS `as_title`,
 1 AS `as_description`,
 1 AS `as_sub_date_time`,
 1 AS `No_of_Students`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_title` varchar(15) DEFAULT NULL,
  `c_type` varchar(15) DEFAULT NULL,
  `c_stream` varchar(15) DEFAULT NULL,
  `c_start_date` date DEFAULT NULL,
  `c_end_date` date DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'CB8','PART-TIME','JAVA','2020-01-01','2020-06-30'),(2,'CB8','PART-TIME','C#','2020-01-01','2020-06-30'),(3,'CB8','PART-TIME','PYTHON','2020-01-01','2020-06-30'),(4,'CB8','PART-TIME','JAVASCRIPT','2020-01-01','2020-06-30'),(5,'CB8','FULL-TIME','JAVA','2020-01-01','2020-03-31'),(6,'CB8','FULL-TIME','C#','2020-01-01','2020-03-31'),(7,'CB8','FULL-TIME','PYTHON','2020-01-01','2020-03-31'),(8,'CB8','FULL-TIME','JAVASCRIPT','2020-01-01','2020-03-31'),(9,'CB9','PART-TIME','JAVA','2020-01-01','2020-06-30'),(10,'CB9','PART-TIME','C#','2020-01-01','2020-06-30'),(11,'CB9','PART-TIME','PYTHON','2020-01-01','2020-06-30'),(12,'CB9','PART-TIME','JAVASCRIPT','2020-01-01','2020-06-30'),(13,'CB9','FULL-TIME','JAVA','2020-01-01','2020-03-31'),(14,'CB9','FULL-TIME','C#','2020-01-01','2020-03-31'),(15,'CB9','FULL-TIME','PYTHON','2020-01-01','2020-03-31'),(16,'CB9','FULL-TIME','JAVASCRIPT','2020-01-01','2020-03-31'),(17,'a','qqq','aaa','2020-12-31','2021-06-30'),(18,'b','www','bbb','2020-01-01','2020-06-30'),(19,'w','w','w','2020-05-03','2020-12-31'),(20,'w','w','w','2020-05-03','2020-12-31'),(21,'w','w','w','2020-05-03','2020-12-31'),(22,'r','r','r','2021-01-01','2021-03-31'),(23,'g','g','g','2025-01-01','2025-06-30'),(24,'G','G','G','2030-01-01','2030-06-30');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_assignment`
--

DROP TABLE IF EXISTS `course_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_assignment` (
  `cas_c_id` int NOT NULL,
  `cas_as_id` int NOT NULL,
  PRIMARY KEY (`cas_c_id`,`cas_as_id`),
  KEY `FkCAsAs_idx` (`cas_as_id`),
  CONSTRAINT `FkCAsAs` FOREIGN KEY (`cas_as_id`) REFERENCES `assignment` (`as_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FkCAsC` FOREIGN KEY (`cas_c_id`) REFERENCES `course` (`c_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_assignment`
--

LOCK TABLES `course_assignment` WRITE;
/*!40000 ALTER TABLE `course_assignment` DISABLE KEYS */;
INSERT INTO `course_assignment` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(23,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(23,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(12,6),(13,6),(14,6),(15,6),(16,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(11,7),(12,7),(13,7),(14,7),(15,7),(16,7),(24,12),(24,13);
/*!40000 ALTER TABLE `course_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `course_info`
--

DROP TABLE IF EXISTS `course_info`;
/*!50001 DROP VIEW IF EXISTS `course_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `course_info` AS SELECT 
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `No_of_Students`,
 1 AS `No_of_Trainers`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course_student`
--

DROP TABLE IF EXISTS `course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_student` (
  `cst_c_id` int NOT NULL,
  `cst_st_ssn` int NOT NULL,
  `cst_tuition_fees` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`cst_c_id`,`cst_st_ssn`),
  KEY `FkCStStudent_idx` (`cst_st_ssn`),
  CONSTRAINT `FkCStCourse` FOREIGN KEY (`cst_c_id`) REFERENCES `course` (`c_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FkCStStudent` FOREIGN KEY (`cst_st_ssn`) REFERENCES `student` (`st_ssn`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student`
--

LOCK TABLES `course_student` WRITE;
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
INSERT INTO `course_student` VALUES (1,155999537,0.00),(1,434688409,2500.00),(1,514450763,2500.00),(1,626553999,2250.00),(1,746556820,0.00),(1,986312582,2250.00),(2,104876610,0.00),(2,300527847,2500.00),(2,470038971,2250.00),(2,521902106,2500.00),(2,527043216,2250.00),(2,633985532,0.00),(2,653072527,2500.00),(2,715902017,0.00),(2,897207039,2500.00),(2,923500187,2500.00),(2,928766067,0.00),(3,182430073,2500.00),(3,350268282,2250.00),(3,358273818,2250.00),(3,653072527,0.00),(3,697936888,2500.00),(3,895759230,2500.00),(4,132315764,2500.00),(4,261434754,0.00),(4,279356246,2500.00),(4,437747218,2250.00),(4,569671337,2250.00),(4,649255286,2250.00),(4,752049708,0.00),(4,754350093,2500.00),(5,126755209,0.00),(5,403690532,0.00),(5,514450763,0.00),(5,686158220,2250.00),(5,928766067,2500.00),(6,546701910,2250.00),(6,815130460,2500.00),(6,869060539,0.00),(6,877678402,2500.00),(7,149210230,0.00),(7,686158220,0.00),(7,717167827,2250.00),(7,832169780,2500.00),(7,897207039,0.00),(8,563789478,2250.00),(8,633362396,0.00),(8,651001431,2500.00),(8,653072527,2250.00),(8,883046012,2500.00),(8,937329121,0.00),(9,239706173,0.00),(9,330401496,2250.00),(9,495310256,2500.00),(9,795700934,2250.00),(9,877678402,0.00),(9,954594528,0.00),(10,300378452,2250.00),(10,360873957,2250.00),(10,661368604,0.00),(10,665174302,2500.00),(10,857581029,0.00),(10,954594528,2250.00),(11,653344967,2250.00),(11,716497432,2250.00),(11,931047741,0.00),(11,954594528,2250.00),(12,132315764,0.00),(12,531349196,2250.00),(12,665174302,0.00),(12,719559705,0.00),(12,951713505,2250.00),(13,275415086,2250.00),(13,329253711,0.00),(13,364094634,2500.00),(13,459556146,2500.00),(13,897018856,2250.00),(13,920792401,2500.00),(13,954594528,2250.00),(14,522241533,0.00),(14,568773436,0.00),(15,284331468,2500.00),(15,329253711,2250.00),(15,345583948,2250.00),(15,371423977,0.00),(15,876590782,2500.00),(15,967330459,0.00),(15,970380414,2500.00),(16,329253711,2250.00),(16,402533368,2250.00),(16,507828726,2250.00),(16,540800878,2500.00),(16,830310941,2250.00),(16,894493046,2500.00),(19,8,1800.00),(19,9,1900.00),(20,7,1300.00),(23,10,0.00),(24,100,500.00);
/*!40000 ALTER TABLE `course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_trainer`
--

DROP TABLE IF EXISTS `course_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_trainer` (
  `ctr_c_id` int NOT NULL,
  `ctr_tr_ssn` int NOT NULL,
  PRIMARY KEY (`ctr_c_id`,`ctr_tr_ssn`),
  KEY `FkCTrTrainer_idx` (`ctr_tr_ssn`),
  CONSTRAINT `FkCTrCourse` FOREIGN KEY (`ctr_c_id`) REFERENCES `course` (`c_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FkCTrTrainer` FOREIGN KEY (`ctr_tr_ssn`) REFERENCES `trainer` (`tr_ssn`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_trainer`
--

LOCK TABLES `course_trainer` WRITE;
/*!40000 ALTER TABLE `course_trainer` DISABLE KEYS */;
INSERT INTO `course_trainer` VALUES (8,123935000),(1,136874819),(7,192438092),(8,192807388),(15,198233549),(1,225931787),(16,287667583),(13,356186657),(15,370387511),(4,379785513),(8,418072757),(15,420182593),(9,427924224),(3,443900464),(13,476266697),(7,507744837),(2,511195308),(4,519953697),(10,551547494),(11,632789420),(4,675490328),(6,678278893),(3,717497267),(8,730973250),(10,732820670),(3,735151790),(14,766683207),(8,886989889),(1,898249208),(8,953232362),(14,978276743),(16,987664319);
/*!40000 ALTER TABLE `course_trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `coursexassignment_detailed`
--

DROP TABLE IF EXISTS `coursexassignment_detailed`;
/*!50001 DROP VIEW IF EXISTS `coursexassignment_detailed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursexassignment_detailed` AS SELECT 
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `Assignment_ID`,
 1 AS `Assignment_Title`,
 1 AS `Assignment_Description`,
 1 AS `Assignment_Sub_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coursexassignment_summary`
--

DROP TABLE IF EXISTS `coursexassignment_summary`;
/*!50001 DROP VIEW IF EXISTS `coursexassignment_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursexassignment_summary` AS SELECT 
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `No_of_Assignments`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coursexstudent_detailed`
--

DROP TABLE IF EXISTS `coursexstudent_detailed`;
/*!50001 DROP VIEW IF EXISTS `coursexstudent_detailed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursexstudent_detailed` AS SELECT 
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `Student_SSN`,
 1 AS `Student_Last_Name`,
 1 AS `Student_First_Name`,
 1 AS `Tuition_Fees`,
 1 AS `Student_Date_of_Birth`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coursexstudent_summary`
--

DROP TABLE IF EXISTS `coursexstudent_summary`;
/*!50001 DROP VIEW IF EXISTS `coursexstudent_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursexstudent_summary` AS SELECT 
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `No_of_Students`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coursexstudentxassignment_detailed`
--

DROP TABLE IF EXISTS `coursexstudentxassignment_detailed`;
/*!50001 DROP VIEW IF EXISTS `coursexstudentxassignment_detailed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursexstudentxassignment_detailed` AS SELECT 
 1 AS `Student_SSN`,
 1 AS `Student_Last_Name`,
 1 AS `Student_First_Name`,
 1 AS `Tuition_Fees`,
 1 AS `Student_Date_of_Birth`,
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `Assignment_ID`,
 1 AS `Assignment_Title`,
 1 AS `Assignment_Description`,
 1 AS `Assignment_Sub_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coursexstudentxassignment_summary`
--

DROP TABLE IF EXISTS `coursexstudentxassignment_summary`;
/*!50001 DROP VIEW IF EXISTS `coursexstudentxassignment_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursexstudentxassignment_summary` AS SELECT 
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `Student_SSN`,
 1 AS `Student_Last_Name`,
 1 AS `Student_First_Name`,
 1 AS `Tuition_Fees`,
 1 AS `Student_Date_of_Birth`,
 1 AS `No_of_Assignments`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coursextrainer_detailed`
--

DROP TABLE IF EXISTS `coursextrainer_detailed`;
/*!50001 DROP VIEW IF EXISTS `coursextrainer_detailed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursextrainer_detailed` AS SELECT 
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `Trainer_SSN`,
 1 AS `Trainer_Last_Name`,
 1 AS `Trainer_First_Name`,
 1 AS `Trainer_Subject`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coursextrainer_summary`
--

DROP TABLE IF EXISTS `coursextrainer_summary`;
/*!50001 DROP VIEW IF EXISTS `coursextrainer_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursextrainer_summary` AS SELECT 
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `No_of_Trainers`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `st_ssn` int NOT NULL,
  `st_fname` varchar(45) DEFAULT NULL,
  `st_lname` varchar(45) DEFAULT NULL,
  `st_date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`st_ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (0,'a','A','2000-01-01'),(1,'b','B','2000-02-02'),(7,'z','z','1999-01-01'),(8,'q','q','1989-02-06'),(9,'w','w','1990-06-25'),(10,'g','g','1988-07-28'),(100,'G','G','1980-01-01'),(104876610,'Karolos','Spiteridis','1985-07-13'),(126755209,'Marilena','Siskalli','1988-06-21'),(132315764,'Penelope','Kallalli','1987-07-20'),(149210230,'Paraskevoula','Laskouli','1994-05-13'),(155999537,'Fotios','Palidis','1994-02-12'),(182430073,'Persefoni','Laskaroti','1988-12-22'),(239706173,'Emmanouil','Strakiadis','1985-08-17'),(261434754,'Antonios','Paulallis','1992-06-09'),(275415086,'Theano','Gianoglou','1990-05-04'),(279356246,'Telemachos','Rossopoulos','1985-10-21'),(284331468,'Alkestis','Pavlili','1992-01-12'),(300378452,'Myrto','Constantiniade','1990-10-31'),(300527847,'Eleftherios','Zenellis','1990-03-14'),(329253711,'Pelagia','Tasside','1992-12-07'),(330401496,'Stefanos','Macroulis','1987-02-28'),(345583948,'Matthaios','Christoglou','1988-10-13'),(350268282,'Prokopos','Androtis','1986-11-25'),(358273818,'Agapios','Constantinas','1994-03-28'),(360873957,'Ioulia','Panagili','1992-11-13'),(364094634,'Euterpe','Chondrotzi','1993-05-03'),(371423977,'Katia','Geroti','1988-05-19'),(402533368,'Chrysanthos','Vidalidis','1993-05-17'),(403690532,'Chryssa','Kontotsi','1993-02-17'),(434688409,'Matthaios','Raptellis','1990-10-22'),(437747218,'Elpida','Chondroti','1989-12-14'),(459556146,'Tasos','Antonilis','1987-01-01'),(470038971,'Stellina','Strakiadi','1987-07-25'),(495310256,'Poulcheria','Petratou','1994-12-11'),(507828726,'Aristotelis','Condotis','1987-08-11'),(514450763,'Antonia','Rousselli','1993-09-22'),(521902106,'Alex','Contou','1988-03-08'),(522241533,'Fotis','Calakis','1989-12-28'),(527043216,'Minas','Mallakos','1986-09-16'),(531349196,'Dionysios','Michaelakis','1992-01-23'),(540800878,'Yanni','Antonieas','1986-02-06'),(546701910,'Aspasia','Tantalelli','1986-11-12'),(563789478,'Valentinos','Mellou','1990-06-18'),(568773436,'Andriana','Thaniade','1994-08-15'),(569671337,'Vassiliki','Staneli','1985-05-28'),(626553999,'Periklis','Matiades','1993-01-14'),(633362396,'Mirto','Kanakou','1992-01-07'),(633985532,'Efthimia','Demetriidi','1994-05-04'),(649255286,'Grigorios','Mallides','1986-01-31'),(651001431,'Gianni','Salliades','1991-02-15'),(653072527,'Ioulia','Chacona','1992-12-19'),(653344967,'Yianni','Stratellis','1990-11-09'),(661368604,'Iason','Laskelis','1986-11-27'),(665174302,'Sibylla','Tatalli','1991-12-06'),(686158220,'Kyriaki','Gounariadi','1987-04-03'),(697936888,'Dorotheos','Athanatos','1988-10-09'),(715902017,'Nokoletta','Georgelli','1986-09-02'),(716497432,'Olympia','Constantiniade','1995-09-28'),(717167827,'Eros','Kormidis','1993-05-27'),(719559705,'Eliana','Zarouli','1995-06-26'),(746556820,'Georgios','Vallotis','1986-12-19'),(752049708,'Demetrios','Ballidis','1988-06-03'),(754350093,'Makis','Galaniadis','1994-08-23'),(795700934,'Dimosthenis','Rondides','1991-09-09'),(815130460,'Prokopos','Moniadis','1995-09-12'),(830310941,'Prokopis','Remoulis','1995-08-15'),(832169780,'Lambros','Kourallis','1986-07-21'),(857581029,'Areti','Frangoti','1988-01-19'),(869060539,'Mando','Lampride','1993-01-09'),(876590782,'Avra','Andretsi','1991-06-17'),(877678402,'Poulcheria','Maropoulou','1992-10-30'),(883046012,'Christos','Ganou','1993-05-28'),(894493046,'Zenovia','Contatou','1993-04-15'),(895759230,'Tatiana','Mulili','1990-09-05'),(897018856,'Katerina','Markoti','1989-04-18'),(897207039,'Apostolia','Mulili','1991-06-22'),(920792401,'Chysanthos','Vlahoglou','1989-05-02'),(923500187,'Tasos','Gounareas','1990-05-13'),(928766067,'Gianna','Salla','1992-12-03'),(931047741,'Liza','Karalili','1992-11-20'),(937329121,'Themistoklis','Vlachou','1989-10-12'),(951713505,'Chrisanthi','Sala','1986-09-12'),(954594528,'Dorothea','Politea','1990-08-01'),(967330459,'Andrianos','Spanakis','1986-06-21'),(970380414,'Nikolaos','Stamidis','1991-02-26'),(986312582,'Zoe','Miskeli','1994-03-23');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_assignment`
--

DROP TABLE IF EXISTS `student_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_assignment` (
  `stas_st_ssn` int NOT NULL,
  `stas_as_id` int NOT NULL,
  `stas_oral_mark` tinyint DEFAULT NULL,
  `stas_total_mark` tinyint DEFAULT NULL,
  PRIMARY KEY (`stas_st_ssn`,`stas_as_id`),
  KEY `FkStAsAssignment_idx` (`stas_as_id`),
  CONSTRAINT `FkStAsAssignment` FOREIGN KEY (`stas_as_id`) REFERENCES `assignment` (`as_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FkStAsStudent` FOREIGN KEY (`stas_st_ssn`) REFERENCES `student` (`st_ssn`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_assignment`
--

LOCK TABLES `student_assignment` WRITE;
/*!40000 ALTER TABLE `student_assignment` DISABLE KEYS */;
INSERT INTO `student_assignment` VALUES (10,1,NULL,NULL),(10,2,NULL,NULL),(100,12,NULL,NULL),(100,13,NULL,NULL),(104876610,1,8,93),(104876610,2,25,45),(104876610,3,27,47),(104876610,4,26,69),(104876610,5,17,84),(104876610,6,4,67),(104876610,7,1,47),(126755209,1,17,87),(126755209,2,26,32),(126755209,3,22,31),(126755209,4,26,70),(126755209,5,4,59),(126755209,6,10,32),(126755209,7,4,81),(132315764,1,4,83),(132315764,2,23,70),(132315764,3,23,73),(132315764,4,11,65),(132315764,5,12,48),(132315764,6,5,92),(132315764,7,14,92),(149210230,1,12,89),(149210230,2,22,62),(149210230,3,1,49),(149210230,4,19,93),(149210230,5,11,40),(149210230,6,5,74),(149210230,7,3,86),(155999537,1,17,99),(155999537,2,28,65),(155999537,3,0,72),(155999537,4,23,45),(155999537,5,7,83),(155999537,6,10,75),(155999537,7,25,49),(182430073,1,29,81),(182430073,2,21,68),(182430073,3,15,91),(182430073,4,3,73),(182430073,5,9,44),(182430073,6,15,73),(182430073,7,4,58),(239706173,1,25,40),(239706173,2,23,40),(239706173,3,22,95),(239706173,4,26,38),(239706173,5,12,61),(239706173,6,0,32),(239706173,7,29,68),(261434754,1,13,99),(261434754,2,26,57),(261434754,3,29,82),(261434754,4,18,96),(261434754,5,10,46),(261434754,6,24,71),(261434754,7,18,47),(275415086,1,27,47),(275415086,2,14,97),(275415086,3,13,74),(275415086,4,24,59),(275415086,5,11,99),(275415086,6,23,45),(275415086,7,23,31),(279356246,1,23,75),(279356246,2,21,56),(279356246,3,26,55),(279356246,4,12,45),(279356246,5,6,48),(279356246,6,5,97),(279356246,7,23,79),(284331468,1,25,70),(284331468,2,8,46),(284331468,3,21,73),(284331468,4,14,86),(284331468,5,24,55),(284331468,6,1,31),(284331468,7,3,84),(300378452,1,13,61),(300378452,2,29,84),(300378452,3,0,93),(300378452,4,14,56),(300378452,5,0,59),(300378452,6,4,76),(300378452,7,2,64),(300527847,1,3,66),(300527847,2,4,95),(300527847,3,24,61),(300527847,4,9,69),(300527847,5,15,99),(300527847,6,5,77),(300527847,7,27,88),(329253711,1,30,46),(329253711,2,7,54),(329253711,3,20,63),(329253711,4,23,95),(329253711,5,11,68),(329253711,6,15,40),(329253711,7,18,72),(330401496,1,23,63),(330401496,2,6,51),(330401496,3,25,38),(330401496,4,3,57),(330401496,5,18,48),(330401496,6,24,72),(330401496,7,22,35),(345583948,1,18,42),(345583948,2,29,62),(345583948,3,24,98),(345583948,4,3,98),(345583948,5,15,69),(345583948,6,7,37),(345583948,7,5,80),(350268282,1,2,47),(350268282,2,14,76),(350268282,3,14,68),(350268282,4,12,55),(350268282,5,28,59),(350268282,6,29,55),(350268282,7,0,66),(358273818,1,9,41),(358273818,2,8,39),(358273818,3,24,59),(358273818,4,13,79),(358273818,5,25,38),(358273818,6,29,78),(358273818,7,3,43),(360873957,1,17,55),(360873957,2,30,87),(360873957,3,29,30),(360873957,4,26,47),(360873957,5,13,65),(360873957,6,4,83),(360873957,7,23,32),(364094634,1,30,97),(364094634,2,4,76),(364094634,3,14,90),(364094634,4,26,79),(364094634,5,11,70),(364094634,6,0,64),(364094634,7,6,90),(371423977,1,25,50),(371423977,2,15,46),(371423977,3,2,100),(371423977,4,19,40),(371423977,5,1,33),(371423977,6,6,52),(371423977,7,6,66),(402533368,1,19,63),(402533368,2,10,85),(402533368,3,20,98),(402533368,4,17,80),(402533368,5,18,56),(402533368,6,23,47),(402533368,7,22,98),(403690532,1,21,54),(403690532,2,16,92),(403690532,3,7,88),(403690532,4,23,81),(403690532,5,4,56),(403690532,6,16,68),(403690532,7,15,47),(434688409,1,26,88),(434688409,2,18,63),(434688409,3,6,57),(434688409,4,30,93),(434688409,5,13,61),(434688409,6,28,79),(434688409,7,13,79),(437747218,1,6,90),(437747218,2,21,91),(437747218,3,5,78),(437747218,4,3,48),(437747218,5,10,82),(437747218,6,18,31),(437747218,7,19,66),(459556146,1,12,31),(459556146,2,10,58),(459556146,3,27,86),(459556146,4,25,95),(459556146,5,21,84),(459556146,6,26,38),(459556146,7,13,74),(470038971,1,6,82),(470038971,2,4,42),(470038971,3,28,61),(470038971,4,16,45),(470038971,5,9,99),(470038971,6,4,33),(470038971,7,10,44),(495310256,1,10,77),(495310256,2,14,33),(495310256,3,2,64),(495310256,4,15,44),(495310256,5,19,61),(495310256,6,29,65),(495310256,7,20,31),(507828726,1,6,42),(507828726,2,17,92),(507828726,3,16,45),(507828726,4,18,91),(507828726,5,22,32),(507828726,6,16,82),(507828726,7,10,34),(514450763,1,11,65),(514450763,2,26,82),(514450763,3,10,56),(514450763,4,0,39),(514450763,5,0,38),(514450763,6,22,36),(514450763,7,5,55),(521902106,1,17,77),(521902106,2,15,73),(521902106,3,26,65),(521902106,4,21,40),(521902106,5,13,98),(521902106,6,25,77),(521902106,7,18,78),(522241533,1,29,86),(522241533,2,9,70),(522241533,3,4,75),(522241533,4,1,41),(522241533,5,19,84),(522241533,6,11,52),(522241533,7,28,73),(527043216,1,0,53),(527043216,2,5,69),(527043216,3,24,95),(527043216,4,29,55),(527043216,5,29,54),(527043216,6,16,86),(527043216,7,1,89),(531349196,1,19,43),(531349196,2,25,75),(531349196,3,4,39),(531349196,4,19,82),(531349196,5,25,65),(531349196,6,1,64),(531349196,7,4,98),(540800878,1,0,94),(540800878,2,19,100),(540800878,3,4,63),(540800878,4,1,78),(540800878,5,25,73),(540800878,6,23,46),(540800878,7,11,50),(546701910,1,12,57),(546701910,2,0,75),(546701910,3,21,58),(546701910,4,10,50),(546701910,5,23,77),(546701910,6,19,91),(546701910,7,20,99),(563789478,1,4,38),(563789478,2,11,35),(563789478,3,15,100),(563789478,4,1,33),(563789478,5,6,71),(563789478,6,2,53),(563789478,7,13,75),(568773436,1,21,40),(568773436,2,1,69),(568773436,3,20,72),(568773436,4,16,47),(568773436,5,12,35),(568773436,6,2,39),(568773436,7,17,38),(569671337,1,24,56),(569671337,2,6,83),(569671337,3,1,77),(569671337,4,18,83),(569671337,5,5,40),(569671337,6,17,56),(569671337,7,9,47),(626553999,1,4,90),(626553999,2,29,64),(626553999,3,9,41),(626553999,4,7,77),(626553999,5,9,61),(626553999,6,14,60),(626553999,7,8,82),(633362396,1,14,31),(633362396,2,5,93),(633362396,3,17,54),(633362396,4,16,87),(633362396,5,22,64),(633362396,6,21,76),(633362396,7,8,50),(633985532,1,4,81),(633985532,2,28,90),(633985532,3,28,54),(633985532,4,22,39),(633985532,5,25,99),(633985532,6,7,36),(633985532,7,11,33),(649255286,1,3,43),(649255286,2,12,57),(649255286,3,28,75),(649255286,4,6,54),(649255286,5,17,47),(649255286,6,16,77),(649255286,7,27,98),(651001431,1,5,66),(651001431,2,8,41),(651001431,3,18,85),(651001431,4,20,35),(651001431,5,28,95),(651001431,6,28,97),(651001431,7,14,97),(653072527,1,13,64),(653072527,2,11,67),(653072527,3,16,47),(653072527,4,14,88),(653072527,5,15,97),(653072527,6,28,44),(653072527,7,19,91),(653344967,1,21,49),(653344967,2,9,89),(653344967,3,17,40),(653344967,4,2,67),(653344967,5,26,32),(653344967,6,2,51),(653344967,7,11,51),(661368604,1,15,53),(661368604,2,19,88),(661368604,3,26,85),(661368604,4,8,42),(661368604,5,13,76),(661368604,6,9,33),(661368604,7,0,79),(665174302,1,20,93),(665174302,2,24,59),(665174302,3,22,95),(665174302,4,19,79),(665174302,5,8,35),(665174302,6,23,76),(665174302,7,30,98),(686158220,1,21,47),(686158220,2,23,49),(686158220,3,9,76),(686158220,4,22,95),(686158220,5,22,64),(686158220,6,29,78),(686158220,7,23,56),(697936888,1,18,46),(697936888,2,13,40),(697936888,3,4,85),(697936888,4,13,40),(697936888,5,6,85),(697936888,6,7,43),(697936888,7,1,34),(715902017,1,30,92),(715902017,2,0,82),(715902017,3,2,79),(715902017,4,25,38),(715902017,5,20,68),(715902017,6,8,51),(715902017,7,1,46),(716497432,1,4,38),(716497432,2,26,48),(716497432,3,22,47),(716497432,4,27,89),(716497432,5,1,74),(716497432,6,15,90),(716497432,7,22,97),(717167827,1,18,33),(717167827,2,19,55),(717167827,3,3,55),(717167827,4,15,36),(717167827,5,22,67),(717167827,6,16,31),(717167827,7,23,73),(719559705,1,18,78),(719559705,2,21,55),(719559705,3,26,93),(719559705,4,13,40),(719559705,5,14,47),(719559705,6,28,51),(719559705,7,8,45),(746556820,1,22,44),(746556820,2,20,84),(746556820,3,26,62),(746556820,4,16,72),(746556820,5,14,63),(746556820,6,5,70),(746556820,7,10,81),(752049708,1,10,70),(752049708,2,15,100),(752049708,3,14,32),(752049708,4,6,64),(752049708,5,9,68),(752049708,6,5,62),(752049708,7,7,67),(754350093,1,21,100),(754350093,2,22,67),(754350093,3,4,42),(754350093,4,27,95),(754350093,5,25,37),(754350093,6,26,55),(754350093,7,0,40),(795700934,1,17,32),(795700934,2,9,75),(795700934,3,2,62),(795700934,4,12,75),(795700934,5,5,90),(795700934,6,27,95),(795700934,7,6,53),(815130460,1,3,30),(815130460,2,14,81),(815130460,3,23,40),(815130460,4,24,39),(815130460,5,22,39),(815130460,6,0,33),(815130460,7,16,65),(830310941,1,6,80),(830310941,2,0,47),(830310941,3,11,95),(830310941,4,27,36),(830310941,5,4,36),(830310941,6,25,35),(830310941,7,30,68),(832169780,1,27,36),(832169780,2,25,82),(832169780,3,11,35),(832169780,4,8,85),(832169780,5,6,74),(832169780,6,28,86),(832169780,7,4,47),(857581029,1,1,57),(857581029,2,14,64),(857581029,3,15,80),(857581029,4,13,67),(857581029,5,16,56),(857581029,6,8,48),(857581029,7,19,55),(869060539,1,4,77),(869060539,2,29,86),(869060539,3,25,84),(869060539,4,29,42),(869060539,5,3,59),(869060539,6,27,41),(869060539,7,17,35),(876590782,1,1,45),(876590782,2,28,85),(876590782,3,30,56),(876590782,4,21,85),(876590782,5,28,53),(876590782,6,26,78),(876590782,7,30,89),(877678402,1,25,52),(877678402,2,12,55),(877678402,3,2,37),(877678402,4,29,85),(877678402,5,15,73),(877678402,6,4,48),(877678402,7,19,72),(883046012,1,10,65),(883046012,2,8,91),(883046012,3,22,53),(883046012,4,13,70),(883046012,5,28,50),(883046012,6,14,64),(883046012,7,29,45),(894493046,1,2,99),(894493046,2,13,66),(894493046,3,16,70),(894493046,4,7,74),(894493046,5,7,68),(894493046,6,9,85),(894493046,7,15,79),(895759230,1,11,97),(895759230,2,22,59),(895759230,3,14,55),(895759230,4,4,49),(895759230,5,14,55),(895759230,6,19,81),(895759230,7,16,74),(897018856,1,9,49),(897018856,2,12,67),(897018856,3,27,52),(897018856,4,23,89),(897018856,5,19,80),(897018856,6,15,74),(897018856,7,24,81),(897207039,1,8,64),(897207039,2,7,43),(897207039,3,30,92),(897207039,4,14,47),(897207039,5,15,89),(897207039,6,15,87),(897207039,7,9,93),(920792401,1,3,46),(920792401,2,15,81),(920792401,3,19,34),(920792401,4,27,94),(920792401,5,13,57),(920792401,6,20,64),(920792401,7,3,49),(923500187,1,11,97),(923500187,2,13,52),(923500187,3,21,75),(923500187,4,23,89),(923500187,5,21,50),(923500187,6,3,82),(923500187,7,22,90),(928766067,1,6,33),(928766067,2,16,70),(928766067,3,25,85),(928766067,4,17,52),(928766067,5,6,47),(928766067,6,8,96),(928766067,7,25,89),(931047741,1,0,58),(931047741,2,4,60),(931047741,3,30,99),(931047741,4,14,57),(931047741,5,7,99),(931047741,6,16,49),(931047741,7,25,87),(937329121,1,30,84),(937329121,2,3,45),(937329121,3,0,93),(937329121,4,17,42),(937329121,5,27,93),(937329121,6,30,52),(937329121,7,1,67),(951713505,1,11,92),(951713505,2,3,56),(951713505,3,2,59),(951713505,4,12,56),(951713505,5,12,38),(951713505,6,12,56),(951713505,7,13,65),(954594528,1,3,54),(954594528,2,14,51),(954594528,3,8,68),(954594528,4,26,60),(954594528,5,30,97),(954594528,6,13,47),(954594528,7,22,100),(967330459,1,18,78),(967330459,2,19,85),(967330459,3,5,70),(967330459,4,22,37),(967330459,5,19,63),(967330459,6,28,55),(967330459,7,10,74),(970380414,1,30,65),(970380414,2,22,91),(970380414,3,15,58),(970380414,4,9,54),(970380414,5,0,75),(970380414,6,8,39),(970380414,7,13,76),(986312582,1,5,72),(986312582,2,4,71),(986312582,3,16,58),(986312582,4,8,72),(986312582,5,30,55),(986312582,6,11,50),(986312582,7,4,98);
/*!40000 ALTER TABLE `student_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_info`
--

DROP TABLE IF EXISTS `student_info`;
/*!50001 DROP VIEW IF EXISTS `student_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_info` AS SELECT 
 1 AS `Last_Name`,
 1 AS `First_Name`,
 1 AS `Student_SSN`,
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Assignment_Title`,
 1 AS `Submission_Date_of_Assignment`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`,
 1 AS `Tuition_Fees`,
 1 AS `Date_of_Birth`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `students_with_many_courses`
--

DROP TABLE IF EXISTS `students_with_many_courses`;
/*!50001 DROP VIEW IF EXISTS `students_with_many_courses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `students_with_many_courses` AS SELECT 
 1 AS `LastName`,
 1 AS `FirstName`,
 1 AS `Students_SSN`,
 1 AS `No_of_Courses`,
 1 AS `Sum_of_Tuition_Fees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `students_with_many_courses_detailed`
--

DROP TABLE IF EXISTS `students_with_many_courses_detailed`;
/*!50001 DROP VIEW IF EXISTS `students_with_many_courses_detailed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `students_with_many_courses_detailed` AS SELECT 
 1 AS `Students_SSN`,
 1 AS `LastName`,
 1 AS `FirstName`,
 1 AS `Student_Date_of_Birth`,
 1 AS `Tuition_Fees`,
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Type`,
 1 AS `Course_Stream`,
 1 AS `Course_Start_Date`,
 1 AS `Course_end_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `tr_ssn` int NOT NULL,
  `tr_fname` varchar(45) DEFAULT NULL,
  `tr_lname` varchar(45) DEFAULT NULL,
  `tr_subject` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tr_ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (123935000,'Elissavet','Mastrotzi','C#'),(136874819,'Demetrios','Tassoglou','PYTHON'),(192438092,'Andriana','Melide','C#'),(192807388,'Aikaterini','Palamareli','C#'),(198233549,'Anargyros','Balloulis','JAVA'),(225931787,'Marinos','Hadjitsis','JAVA'),(287667583,'Iasonas','Baridis','PYTHON'),(356186657,'Andromahi','Samariadi','JAVASCRIPT'),(370387511,'Panteleimon','Siderilis','JAVASCRIPT'),(379785513,'Anastasia','Spiterili','JAVASCRIPT'),(418072757,'Raphail','Florilis','JAVA'),(420182593,'Andriana','Politoglou','PYTHON'),(427924224,'Anastasia','Malleli','JAVA'),(443900464,'Elissavet','Saliade','C#'),(476266697,'Kimon','Rokas','JAVASCRIPT'),(507744837,'Vassia','Mastroli','JAVASCRIPT'),(511195308,'Danai','Barbiadi','C#'),(519953697,'Nikoleta','Rokiade','PYTHON'),(551547494,'Vassia','Athanea','PYTHON'),(632789420,'Stelios','Paliades','PYTHON'),(675490328,'Andromahi','Sarkakou','JAVA'),(678278893,'Prokopis','Muloglou','JAVASCRIPT'),(717497267,'Stefania','Chondrotsi','JAVA'),(730973250,'Serafim','Lazatos','PYTHON'),(732820670,'Evripidis','Zografopoulos','C#'),(735151790,'Rafail','Argyrallis','C#'),(766683207,'Aikaterini','Andreadoti','JAVASCRIPT'),(886989889,'Alexandros','Raptallis','PYTHON'),(898249208,'Trifonas','Andreadotis','PYTHON'),(953232362,'Haris','Stamakos','JAVA'),(978276743,'Theodosia','Nassea','PYTHON'),(987664319,'Yannis','Vasilelis','JAVA');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `trainer_info`
--

DROP TABLE IF EXISTS `trainer_info`;
/*!50001 DROP VIEW IF EXISTS `trainer_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trainer_info` AS SELECT 
 1 AS `Last_Name`,
 1 AS `First_Name`,
 1 AS `Trainer_SSN`,
 1 AS `Trainer_Subject`,
 1 AS `Course_ID`,
 1 AS `Course_Title`,
 1 AS `Course_Stream`,
 1 AS `Course_Type`,
 1 AS `Course_Start_Date`,
 1 AS `Course_End_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `assignment_info`
--

/*!50001 DROP VIEW IF EXISTS `assignment_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `assignment_info` AS select `assignment`.`as_id` AS `as_id`,`assignment`.`as_title` AS `as_title`,`assignment`.`as_description` AS `as_description`,`assignment`.`as_sub_date_time` AS `as_sub_date_time`,count(`student`.`st_ssn`) AS `No_of_Students` from ((`assignment` join `student_assignment` on((`assignment`.`as_id` = `student_assignment`.`stas_as_id`))) join `student` on((`student_assignment`.`stas_st_ssn` = `student`.`st_ssn`))) group by `assignment`.`as_id` order by `assignment`.`as_sub_date_time` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `course_info`
--

/*!50001 DROP VIEW IF EXISTS `course_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `course_info` AS select `coursexstudent_summary`.`Course_ID` AS `Course_ID`,`coursexstudent_summary`.`Course_Title` AS `Course_Title`,`coursexstudent_summary`.`Course_Stream` AS `Course_Stream`,`coursexstudent_summary`.`Course_Type` AS `Course_Type`,`coursexstudent_summary`.`Course_Start_Date` AS `Course_Start_Date`,`coursexstudent_summary`.`Course_End_Date` AS `Course_End_Date`,`coursexstudent_summary`.`No_of_Students` AS `No_of_Students`,`coursextrainer_summary`.`No_of_Trainers` AS `No_of_Trainers` from (`coursexstudent_summary` join `coursextrainer_summary` on((`coursexstudent_summary`.`Course_ID` = `coursextrainer_summary`.`Course_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursexassignment_detailed`
--

/*!50001 DROP VIEW IF EXISTS `coursexassignment_detailed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursexassignment_detailed` AS select distinct `course`.`c_id` AS `Course_ID`,`course`.`c_title` AS `Course_Title`,`course`.`c_stream` AS `Course_Stream`,`course`.`c_type` AS `Course_Type`,`course`.`c_start_date` AS `Course_Start_Date`,`course`.`c_end_date` AS `Course_End_Date`,`assignment`.`as_id` AS `Assignment_ID`,`assignment`.`as_title` AS `Assignment_Title`,`assignment`.`as_description` AS `Assignment_Description`,`assignment`.`as_sub_date_time` AS `Assignment_Sub_Date` from ((`assignment` join `course_assignment` on((`assignment`.`as_id` = `course_assignment`.`cas_as_id`))) join `course` on((`course_assignment`.`cas_c_id` = `course`.`c_id`))) order by `course`.`c_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursexassignment_summary`
--

/*!50001 DROP VIEW IF EXISTS `coursexassignment_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursexassignment_summary` AS select `coursexassignment_detailed`.`Course_ID` AS `Course_ID`,`coursexassignment_detailed`.`Course_Title` AS `Course_Title`,`coursexassignment_detailed`.`Course_Stream` AS `Course_Stream`,`coursexassignment_detailed`.`Course_Type` AS `Course_Type`,`coursexassignment_detailed`.`Course_Start_Date` AS `Course_Start_Date`,`coursexassignment_detailed`.`Course_End_Date` AS `Course_End_Date`,count(`coursexassignment_detailed`.`Assignment_ID`) AS `No_of_Assignments` from `coursexassignment_detailed` group by `coursexassignment_detailed`.`Course_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursexstudent_detailed`
--

/*!50001 DROP VIEW IF EXISTS `coursexstudent_detailed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursexstudent_detailed` AS select distinct `course`.`c_id` AS `Course_ID`,`course`.`c_title` AS `Course_Title`,`course`.`c_stream` AS `Course_Stream`,`course`.`c_type` AS `Course_Type`,`course`.`c_start_date` AS `Course_Start_Date`,`course`.`c_end_date` AS `Course_End_Date`,`student`.`st_ssn` AS `Student_SSN`,`student`.`st_lname` AS `Student_Last_Name`,`student`.`st_fname` AS `Student_First_Name`,`course_student`.`cst_tuition_fees` AS `Tuition_Fees`,`student`.`st_date_of_birth` AS `Student_Date_of_Birth` from ((`student` join `course_student` on((`student`.`st_ssn` = `course_student`.`cst_st_ssn`))) join `course` on((`course_student`.`cst_c_id` = `course`.`c_id`))) order by `course`.`c_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursexstudent_summary`
--

/*!50001 DROP VIEW IF EXISTS `coursexstudent_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursexstudent_summary` AS select `coursexstudent_detailed`.`Course_ID` AS `Course_ID`,`coursexstudent_detailed`.`Course_Title` AS `Course_Title`,`coursexstudent_detailed`.`Course_Stream` AS `Course_Stream`,`coursexstudent_detailed`.`Course_Type` AS `Course_Type`,`coursexstudent_detailed`.`Course_Start_Date` AS `Course_Start_Date`,`coursexstudent_detailed`.`Course_End_Date` AS `Course_End_Date`,count(`coursexstudent_detailed`.`Student_SSN`) AS `No_of_Students` from `coursexstudent_detailed` group by `coursexstudent_detailed`.`Course_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursexstudentxassignment_detailed`
--

/*!50001 DROP VIEW IF EXISTS `coursexstudentxassignment_detailed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursexstudentxassignment_detailed` AS select distinct `student`.`st_ssn` AS `Student_SSN`,`student`.`st_lname` AS `Student_Last_Name`,`student`.`st_fname` AS `Student_First_Name`,`course_student`.`cst_tuition_fees` AS `Tuition_Fees`,`student`.`st_date_of_birth` AS `Student_Date_of_Birth`,`course`.`c_id` AS `Course_ID`,`course`.`c_title` AS `Course_Title`,`course`.`c_stream` AS `Course_Stream`,`course`.`c_type` AS `Course_Type`,`course`.`c_start_date` AS `Course_Start_Date`,`course`.`c_end_date` AS `Course_End_Date`,`assignment`.`as_id` AS `Assignment_ID`,`assignment`.`as_title` AS `Assignment_Title`,`assignment`.`as_description` AS `Assignment_Description`,`assignment`.`as_sub_date_time` AS `Assignment_Sub_Date` from ((((`student` join `course_student` on((`student`.`st_ssn` = `course_student`.`cst_st_ssn`))) join `course` on((`course_student`.`cst_c_id` = `course`.`c_id`))) join `course_assignment` on((`course`.`c_id` = `course_assignment`.`cas_c_id`))) join `assignment` on((`course_assignment`.`cas_as_id` = `assignment`.`as_id`))) order by `student`.`st_ssn`,`course`.`c_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursexstudentxassignment_summary`
--

/*!50001 DROP VIEW IF EXISTS `coursexstudentxassignment_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursexstudentxassignment_summary` AS select `coursexstudentxassignment_detailed`.`Course_ID` AS `Course_ID`,`coursexstudentxassignment_detailed`.`Course_Title` AS `Course_Title`,`coursexstudentxassignment_detailed`.`Course_Stream` AS `Course_Stream`,`coursexstudentxassignment_detailed`.`Course_Type` AS `Course_Type`,`coursexstudentxassignment_detailed`.`Course_Start_Date` AS `Course_Start_Date`,`coursexstudentxassignment_detailed`.`Course_End_Date` AS `Course_End_Date`,`coursexstudentxassignment_detailed`.`Student_SSN` AS `Student_SSN`,`coursexstudentxassignment_detailed`.`Student_Last_Name` AS `Student_Last_Name`,`coursexstudentxassignment_detailed`.`Student_First_Name` AS `Student_First_Name`,`coursexstudentxassignment_detailed`.`Tuition_Fees` AS `Tuition_Fees`,`coursexstudentxassignment_detailed`.`Student_Date_of_Birth` AS `Student_Date_of_Birth`,count(`coursexstudentxassignment_detailed`.`Assignment_ID`) AS `No_of_Assignments` from `coursexstudentxassignment_detailed` group by `coursexstudentxassignment_detailed`.`Student_SSN` order by `coursexstudentxassignment_detailed`.`Course_ID`,`coursexstudentxassignment_detailed`.`Student_Last_Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursextrainer_detailed`
--

/*!50001 DROP VIEW IF EXISTS `coursextrainer_detailed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursextrainer_detailed` AS select distinct `course`.`c_id` AS `Course_ID`,`course`.`c_title` AS `Course_Title`,`course`.`c_stream` AS `Course_Stream`,`course`.`c_type` AS `Course_Type`,`course`.`c_start_date` AS `Course_Start_Date`,`course`.`c_end_date` AS `Course_End_Date`,`trainer`.`tr_ssn` AS `Trainer_SSN`,`trainer`.`tr_lname` AS `Trainer_Last_Name`,`trainer`.`tr_fname` AS `Trainer_First_Name`,`trainer`.`tr_subject` AS `Trainer_Subject` from ((`course` join `course_trainer` on((`course`.`c_id` = `course_trainer`.`ctr_c_id`))) join `trainer` on((`course_trainer`.`ctr_tr_ssn` = `trainer`.`tr_ssn`))) order by `course`.`c_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coursextrainer_summary`
--

/*!50001 DROP VIEW IF EXISTS `coursextrainer_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursextrainer_summary` AS select `coursextrainer_detailed`.`Course_ID` AS `Course_ID`,`coursextrainer_detailed`.`Course_Title` AS `Course_Title`,`coursextrainer_detailed`.`Course_Stream` AS `Course_Stream`,`coursextrainer_detailed`.`Course_Type` AS `Course_Type`,`coursextrainer_detailed`.`Course_Start_Date` AS `Course_Start_Date`,`coursextrainer_detailed`.`Course_End_Date` AS `Course_End_Date`,count(`coursextrainer_detailed`.`Trainer_SSN`) AS `No_of_Trainers` from `coursextrainer_detailed` group by `coursextrainer_detailed`.`Course_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_info`
--

/*!50001 DROP VIEW IF EXISTS `student_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_info` AS select `student`.`st_lname` AS `Last_Name`,`student`.`st_fname` AS `First_Name`,`student`.`st_ssn` AS `Student_SSN`,`course`.`c_id` AS `Course_ID`,`course`.`c_title` AS `Course_Title`,`course`.`c_stream` AS `Course_Stream`,`course`.`c_type` AS `Course_Type`,`assignment`.`as_title` AS `Assignment_Title`,`assignment`.`as_sub_date_time` AS `Submission_Date_of_Assignment`,`course`.`c_start_date` AS `Course_Start_Date`,`course`.`c_end_date` AS `Course_End_Date`,`course_student`.`cst_tuition_fees` AS `Tuition_Fees`,`student`.`st_date_of_birth` AS `Date_of_Birth` from ((((`course` join `course_student` on((`course`.`c_id` = `course_student`.`cst_c_id`))) join `student` on((`course_student`.`cst_st_ssn` = `student`.`st_ssn`))) join `student_assignment` on((`student`.`st_ssn` = `student_assignment`.`stas_st_ssn`))) join `assignment` on((`student_assignment`.`stas_as_id` = `assignment`.`as_id`))) order by `student`.`st_lname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `students_with_many_courses`
--

/*!50001 DROP VIEW IF EXISTS `students_with_many_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `students_with_many_courses` AS select `student`.`st_lname` AS `LastName`,`student`.`st_fname` AS `FirstName`,`student`.`st_ssn` AS `Students_SSN`,count(`course`.`c_id`) AS `No_of_Courses`,sum(`course_student`.`cst_tuition_fees`) AS `Sum_of_Tuition_Fees` from ((`student` join `course_student` on((`student`.`st_ssn` = `course_student`.`cst_st_ssn`))) join `course` on((`course_student`.`cst_c_id` = `course`.`c_id`))) group by `student`.`st_ssn` having (`No_of_Courses` > 1) order by `No_of_Courses` desc,`student`.`st_lname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `students_with_many_courses_detailed`
--

/*!50001 DROP VIEW IF EXISTS `students_with_many_courses_detailed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `students_with_many_courses_detailed` AS select `students_with_many_courses`.`Students_SSN` AS `Students_SSN`,`students_with_many_courses`.`LastName` AS `LastName`,`students_with_many_courses`.`FirstName` AS `FirstName`,`coursexstudent_detailed`.`Student_Date_of_Birth` AS `Student_Date_of_Birth`,`coursexstudent_detailed`.`Tuition_Fees` AS `Tuition_Fees`,`coursexstudent_detailed`.`Course_ID` AS `Course_ID`,`coursexstudent_detailed`.`Course_Title` AS `Course_Title`,`coursexstudent_detailed`.`Course_Type` AS `Course_Type`,`coursexstudent_detailed`.`Course_Stream` AS `Course_Stream`,`coursexstudent_detailed`.`Course_Start_Date` AS `Course_Start_Date`,`coursexstudent_detailed`.`Course_End_Date` AS `Course_end_Date` from (`students_with_many_courses` join `coursexstudent_detailed` on((`students_with_many_courses`.`Students_SSN` = `coursexstudent_detailed`.`Student_SSN`))) order by `students_with_many_courses`.`Students_SSN` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trainer_info`
--

/*!50001 DROP VIEW IF EXISTS `trainer_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trainer_info` AS select `trainer`.`tr_lname` AS `Last_Name`,`trainer`.`tr_fname` AS `First_Name`,`trainer`.`tr_ssn` AS `Trainer_SSN`,`trainer`.`tr_subject` AS `Trainer_Subject`,`course`.`c_id` AS `Course_ID`,`course`.`c_title` AS `Course_Title`,`course`.`c_stream` AS `Course_Stream`,`course`.`c_type` AS `Course_Type`,`course`.`c_start_date` AS `Course_Start_Date`,`course`.`c_end_date` AS `Course_End_Date` from ((`trainer` join `course_trainer` on((`trainer`.`tr_ssn` = `course_trainer`.`ctr_tr_ssn`))) join `course` on((`course_trainer`.`ctr_c_id` = `course`.`c_id`))) order by `trainer`.`tr_lname` */;
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

-- Dump completed on 2022-10-15  1:23:54
