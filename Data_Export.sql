CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class_mst`
--

DROP TABLE IF EXISTS `class_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `class_mst` (
  `classid` int(10) NOT NULL AUTO_INCREMENT,
  `Trainer_trainerid` int(10) NOT NULL,
  `class_name` varchar(45) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `charge_rate` float DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`classid`),
  KEY `Trainer_trainerid` (`Trainer_trainerid`),
  CONSTRAINT `class_mst_ibfk_1` FOREIGN KEY (`Trainer_trainerid`) REFERENCES `trainer_mst` (`trainerid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_mst`
--

LOCK TABLES `class_mst` WRITE;
/*!40000 ALTER TABLE `class_mst` DISABLE KEYS */;
INSERT INTO `class_mst` VALUES (1,1335,'boxing','19:00:00','20:00:00',3,30,'2019-03-03 03:00:24',NULL),(2,1092,'cardio','17:00:00','18:00:00',3,30,'2019-03-03 03:00:24',NULL),(3,1404,'strength training','17:30:00','18:30:00',3,40,'2019-03-03 03:00:24',NULL),(4,1092,'yoga','11:00:00','12:00:00',1,20,'2019-03-03 03:00:24',NULL),(5,1335,'boxing','16:00:00','17:00:00',2,20,'2019-03-03 03:00:24',NULL),(6,1404,'pilates','12:00:00','13:00:00',2,20,'2019-03-03 03:00:24',NULL),(7,1404,'strength training','15:00:00','16:00:00',3,40,'2019-03-03 03:00:24',NULL),(8,1092,'pilates','12:00:00','13:00:00',4,30,'2019-03-03 03:00:24',NULL),(9,1335,'strength training','17:00:00','18:00:00',1,20,'2019-03-03 03:00:25',NULL),(10,1092,'cardio','19:00:00','20:00:00',3,40,'2019-03-03 03:00:25',NULL);
/*!40000 ALTER TABLE `class_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_training_schedule_txn`
--

DROP TABLE IF EXISTS `class_training_schedule_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `class_training_schedule_txn` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `Member_memberid` int(10) NOT NULL,
  `Class_classid` int(10) NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `Member_memberid` (`Member_memberid`),
  KEY `Class_classid` (`Class_classid`),
  CONSTRAINT `class_training_schedule_txn_ibfk_1` FOREIGN KEY (`Member_memberid`) REFERENCES `member_mst` (`memberid`),
  CONSTRAINT `class_training_schedule_txn_ibfk_2` FOREIGN KEY (`Class_classid`) REFERENCES `class_mst` (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_training_schedule_txn`
--

LOCK TABLES `class_training_schedule_txn` WRITE;
/*!40000 ALTER TABLE `class_training_schedule_txn` DISABLE KEYS */;
INSERT INTO `class_training_schedule_txn` VALUES (1,1062,1,4,'2019-03-03 03:00:25',NULL),(2,1051,2,1,'2019-03-03 03:00:25',NULL),(3,1062,3,4,'2019-03-03 03:00:25',NULL),(4,1022,4,1,'2019-03-03 03:00:25',NULL),(5,1036,5,3,'2019-03-03 03:00:25',NULL),(6,1057,6,5,'2019-03-03 03:00:25',NULL),(7,1057,8,5,'2019-03-03 03:00:25',NULL),(8,1036,7,3,'2019-03-03 03:00:25',NULL),(9,1014,10,4,'2019-03-03 03:00:25',NULL),(10,1014,9,1,'2019-03-03 03:00:25',NULL);
/*!40000 ALTER TABLE `class_training_schedule_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_mst`
--

DROP TABLE IF EXISTS `customer_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_mst` (
  `customerid` int(10) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`customerid`),
  UNIQUE KEY `customerid_UNIQUE` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_mst`
--

LOCK TABLES `customer_mst` WRITE;
/*!40000 ALTER TABLE `customer_mst` DISABLE KEYS */;
INSERT INTO `customer_mst` VALUES (164298144,'Martainn','Kruschev','2000-11-01','Male','565-208-4814','mkruschev3@wikipedia.org','2019-03-03 03:00:22',NULL),(253268310,'Melesa','Purver','1984-08-21','Female','732-621-7147','mpurver9@tinyurl.com','2019-03-03 03:00:22',NULL),(369547495,'Drucy','Bowne','1983-06-13','Female','364-783-9296','dbowne0@canalblog.com','2019-03-03 03:00:21',NULL),(542311337,'Renee','Goundrill','1982-08-21','Female','108-868-1724','rgoundrill6@domainmarket.com','2019-03-03 03:00:22',NULL),(580264571,'Vassili','Swaden','1955-03-23','Male','540-797-1023','vswaden5@acquirethisname.com','2019-03-03 03:00:22',NULL),(582616867,'Meaghan','Ewers','1975-03-23','Female','715-249-4848','mewers7@umich.edu','2019-03-03 03:00:22',NULL),(636551506,'Josephina','Denington','1984-01-22','Female','919-986-0113','jdenington8@comsenz.com','2019-03-03 03:00:22',NULL),(650582734,'Benito','Heak','1969-08-10','Male','428-259-4717','bheak2@about.me','2019-03-03 03:00:21',NULL),(753319131,'Cirilo','Estoile','1967-12-01','Male','933-420-3927','cestoile1@archive.org','2019-03-03 03:00:21',NULL),(783542696,'Bertram','Leasor','1990-03-26','Male','528-554-5719','bleasor4@newsvine.com','2019-03-03 03:00:22',NULL);
/*!40000 ALTER TABLE `customer_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_mst`
--

DROP TABLE IF EXISTS `employee_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_mst` (
  `employeeid` int(10) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `employee_type` varchar(20) DEFAULT NULL,
  `supervisor_id` int(10) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`employeeid`),
  KEY `supervisor_id` (`supervisor_id`),
  CONSTRAINT `employee_mst_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `employee_mst` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_mst`
--

LOCK TABLES `employee_mst` WRITE;
/*!40000 ALTER TABLE `employee_mst` DISABLE KEYS */;
INSERT INTO `employee_mst` VALUES (178341615,'Robin','Swanborough','Male',18135,'2014-04-21','manager',NULL,'2019-03-03 03:00:22',NULL),(258411642,'Alaster','De Meis','Male',27855,'2013-04-01','staff',NULL,'2019-03-03 03:00:22',NULL),(263672469,'Brock','Jeandon','Male',27493,'2014-11-19','staff',NULL,'2019-03-03 03:00:22',NULL),(277911886,'Clemente','Dank','Male',35375,'2016-08-15','manager',NULL,'2019-03-03 03:00:22',NULL),(391745522,'Edvard','Deboy','Male',37177,'2018-02-02','trainer',NULL,'2019-03-03 03:00:22',NULL),(476472452,'Inglis','Peschke','Male',30954,'2014-04-27','trainer',NULL,'2019-03-03 03:00:22',NULL),(485787573,'Alfy','Heed','Male',35947,'2010-11-21','salesperson',NULL,'2019-03-03 03:00:22',NULL),(618976178,'Christa','Sheerman','Female',31747,'2015-11-15','salesperson',NULL,'2019-03-03 03:00:22',NULL),(768940716,'Bucky','Jacmard','Male',28669,'2010-09-12','trainer',NULL,'2019-03-03 03:00:22',NULL);
/*!40000 ALTER TABLE `employee_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_Employee` BEFORE DELETE ON `employee_mst` FOR EACH ROW BEGIN
  IF old.employee_type = 'salesperson'
  THEN
    DELETE FROM Salesperson_mst 
    WHERE Employee_employeeid = old.employeeid;
  ELSEIF old.employee_type = 'trainer'
  THEN
    DELETE FROM Trainer_mst 
    WHERE Employee_employeeid = old.employeeid;  
  END IF;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `initial fee_txn`
--

DROP TABLE IF EXISTS `initial fee_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `initial fee_txn` (
  `Customer_customerid` int(10) NOT NULL,
  `Salesperson_salesid` int(10) NOT NULL,
  `created_date` date DEFAULT NULL,
  `payment_method` varchar(25) DEFAULT NULL,
  `payment_amount` float DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Customer_customerid`,`Salesperson_salesid`),
  KEY `Salesperson_salesid` (`Salesperson_salesid`),
  CONSTRAINT `initial fee_txn_ibfk_1` FOREIGN KEY (`Customer_customerid`) REFERENCES `customer_mst` (`customerid`),
  CONSTRAINT `initial fee_txn_ibfk_2` FOREIGN KEY (`Salesperson_salesid`) REFERENCES `salesperson_mst` (`salesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initial fee_txn`
--

LOCK TABLES `initial fee_txn` WRITE;
/*!40000 ALTER TABLE `initial fee_txn` DISABLE KEYS */;
INSERT INTO `initial fee_txn` VALUES (164298144,1126,'2016-02-27','mastercard',110.94,'2019-03-03 03:00:25',NULL),(369547495,1580,'2016-01-18','americanexpress',182.98,'2019-03-03 03:00:25',NULL),(542311337,1082,'2018-04-20','visa',97.62,'2019-03-03 03:00:25',NULL),(580264571,1082,'2016-08-23','mastercard',73.55,'2019-03-03 03:00:25',NULL),(582616867,1082,'2016-08-25','mastercard',88.96,'2019-03-03 03:00:25',NULL),(650582734,1580,'2017-03-16','americanexpress',158.91,'2019-03-03 03:00:25',NULL),(753319131,1126,'2018-08-11','mastercard',91.2,'2019-03-03 03:00:25',NULL),(783542696,1580,'2018-06-21','discover',104.45,'2019-03-03 03:00:25',NULL);
/*!40000 ALTER TABLE `initial fee_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_mst`
--

DROP TABLE IF EXISTS `member_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `member_mst` (
  `memberid` int(10) NOT NULL,
  `Customer_customerid` int(10) NOT NULL,
  `member_type` int(5) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`memberid`),
  UNIQUE KEY `memberid_UNIQUE` (`memberid`),
  KEY `Customer_customerid` (`Customer_customerid`),
  CONSTRAINT `member_mst_ibfk_1` FOREIGN KEY (`Customer_customerid`) REFERENCES `customer_mst` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_mst`
--

LOCK TABLES `member_mst` WRITE;
/*!40000 ALTER TABLE `member_mst` DISABLE KEYS */;
INSERT INTO `member_mst` VALUES (1001,650582734,3,'2018-03-16','2019-03-03 03:00:23',NULL),(1014,542311337,1,'2018-08-13','2019-03-03 03:00:23',NULL),(1022,783542696,3,'2019-06-21','2019-03-03 03:00:23',NULL),(1036,753319131,2,'2019-08-11','2019-03-03 03:00:23',NULL),(1047,582616867,2,'2017-08-25','2019-03-03 03:00:23',NULL),(1051,164298144,3,'2017-02-27','2019-03-03 03:00:23',NULL),(1057,580264571,1,'2017-08-23','2019-03-03 03:00:23',NULL),(1062,369547495,1,'2017-01-18','2019-03-03 03:00:22',NULL);
/*!40000 ALTER TABLE `member_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal activity_txn`
--

DROP TABLE IF EXISTS `personal activity_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personal activity_txn` (
  `start_time` datetime NOT NULL,
  `Member_memberid` int(10) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`start_time`,`Member_memberid`),
  KEY `Member_memberid` (`Member_memberid`),
  CONSTRAINT `personal activity_txn_ibfk_1` FOREIGN KEY (`Member_memberid`) REFERENCES `member_mst` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal activity_txn`
--

LOCK TABLES `personal activity_txn` WRITE;
/*!40000 ALTER TABLE `personal activity_txn` DISABLE KEYS */;
INSERT INTO `personal activity_txn` VALUES ('2018-04-18 15:04:46',1036,'2018-04-18 18:04:46',1.74,106.03,'2019-03-03 03:00:23',NULL),('2018-04-23 11:07:49',1047,'2018-04-23 12:07:49',1.6,241.29,'2019-03-03 03:00:24',NULL),('2018-04-29 12:38:26',1036,'2018-04-29 15:38:26',1.72,117.05,'2019-03-03 03:00:23',NULL),('2018-05-14 01:01:43',1057,'2018-05-14 02:01:43',1.74,115.15,'2019-03-03 03:00:24',NULL),('2018-07-26 15:34:22',1001,'2018-07-26 19:34:22',1.65,181.51,'2019-03-03 03:00:23',NULL),('2018-08-24 13:20:20',1001,'2018-08-24 16:20:20',1.57,152.53,'2019-03-03 03:00:23',NULL),('2018-10-19 02:25:35',1062,'2018-10-19 05:25:35',1.57,246.82,'2019-03-03 03:00:23',NULL),('2018-10-20 13:55:15',1014,'2018-10-20 17:55:15',1.73,229.74,'2019-03-03 03:00:24',NULL),('2018-10-27 13:13:09',1047,'2018-10-27 16:13:09',1.99,165.08,'2019-03-03 03:00:23',NULL),('2018-11-17 20:09:48',1036,'2018-11-17 22:09:48',1.91,155.29,'2019-03-03 03:00:23',NULL),('2018-11-28 10:33:55',1062,'2018-11-28 13:33:55',1.55,228.72,'2019-03-03 03:00:24',NULL),('2018-11-29 06:56:17',1022,'2018-11-29 09:56:17',1.52,122.39,'2019-03-03 03:00:23',NULL),('2018-12-02 16:05:13',1062,'2018-12-02 19:05:13',1.94,180.09,'2019-03-03 03:00:23',NULL),('2018-12-11 08:47:23',1057,'2018-12-11 11:47:23',1.96,219.02,'2019-03-03 03:00:23',NULL),('2018-12-26 21:50:10',1036,'2018-12-26 23:50:10',1.81,214.35,'2019-03-03 03:00:23',NULL),('2019-01-28 16:53:16',1036,'2019-01-28 20:53:16',1.79,185.23,'2019-03-03 03:00:24',NULL),('2019-01-30 03:53:38',1022,'2019-01-30 04:53:38',1.64,221.87,'2019-03-03 03:00:23',NULL),('2019-02-01 03:03:35',1062,'2019-02-01 06:03:35',1.58,127.3,'2019-03-03 03:00:24',NULL),('2019-02-09 20:17:35',1062,'2019-02-09 22:17:35',1.77,161.62,'2019-03-03 03:00:23',NULL),('2019-02-12 08:32:05',1062,'2019-02-12 12:32:05',1.54,195.41,'2019-03-03 03:00:23',NULL);
/*!40000 ALTER TABLE `personal activity_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_training_schedule_txn`
--

DROP TABLE IF EXISTS `personal_training_schedule_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personal_training_schedule_txn` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `Member_memberid` int(10) NOT NULL,
  `Trainer_trainerid` int(10) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `rating` int(1) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `Member_memberid` (`Member_memberid`),
  KEY `Trainer_trainerid` (`Trainer_trainerid`),
  CONSTRAINT `personal_training_schedule_txn_ibfk_1` FOREIGN KEY (`Member_memberid`) REFERENCES `member_mst` (`memberid`),
  CONSTRAINT `personal_training_schedule_txn_ibfk_2` FOREIGN KEY (`Trainer_trainerid`) REFERENCES `trainer_mst` (`trainerid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_training_schedule_txn`
--

LOCK TABLES `personal_training_schedule_txn` WRITE;
/*!40000 ALTER TABLE `personal_training_schedule_txn` DISABLE KEYS */;
INSERT INTO `personal_training_schedule_txn` VALUES (1,1014,1335,'2018-01-17 15:00:00','2018-01-17 16:00:00',5,'2019-03-03 03:00:26',NULL),(2,1057,1092,'2017-09-23 01:00:00','2017-09-23 02:00:00',5,'2019-03-03 03:00:26',NULL),(3,1062,1092,'2018-11-19 03:00:00','2018-11-19 04:00:00',4,'2019-03-03 03:00:26',NULL),(4,1062,1404,'2018-05-06 16:00:00','2018-05-06 17:00:00',2,'2019-03-03 03:00:26',NULL),(5,1022,1335,'2017-06-02 19:00:00','2017-06-02 20:00:00',3,'2019-03-03 03:00:26',NULL),(6,1057,1404,'2018-10-15 22:00:00','2018-10-15 23:00:00',5,'2019-03-03 03:00:26',NULL),(7,1022,1404,'2017-03-25 04:00:00','2017-03-25 05:00:00',4,'2019-03-03 03:00:26',NULL),(8,1022,1335,'2018-09-23 15:00:00','2018-09-23 16:00:00',5,'2019-03-03 03:00:26',NULL);
/*!40000 ALTER TABLE `personal_training_schedule_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renewal_txn`
--

DROP TABLE IF EXISTS `renewal_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `renewal_txn` (
  `renewal_id` int(10) NOT NULL AUTO_INCREMENT,
  `Member_memberid` int(10) NOT NULL,
  `Employee_employeeid` int(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `payment_method` varchar(25) DEFAULT NULL,
  `payment_amount` float DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`renewal_id`),
  KEY `Member_memberid` (`Member_memberid`),
  KEY `Employee_employeeid` (`Employee_employeeid`),
  CONSTRAINT `renewal_txn_ibfk_1` FOREIGN KEY (`Member_memberid`) REFERENCES `member_mst` (`memberid`),
  CONSTRAINT `renewal_txn_ibfk_2` FOREIGN KEY (`Employee_employeeid`) REFERENCES `employee_mst` (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renewal_txn`
--

LOCK TABLES `renewal_txn` WRITE;
/*!40000 ALTER TABLE `renewal_txn` DISABLE KEYS */;
INSERT INTO `renewal_txn` VALUES (1,1014,768940716,'2018-01-02','visa',50,'2019-03-03 03:00:26',NULL),(2,1036,391745522,'2017-03-18','discover',100,'2019-03-03 03:00:26',NULL),(3,1057,277911886,'2018-01-27','discover',50,'2019-03-03 03:00:26',NULL),(4,1062,618976178,'2017-11-16','americanexpress',50,'2019-03-03 03:00:26',NULL),(5,1051,277911886,'2017-08-13','mastercard',50,'2019-03-03 03:00:26',NULL),(6,1022,618976178,'2016-09-16','visa',50,'2019-03-03 03:00:26',NULL);
/*!40000 ALTER TABLE `renewal_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesperson_mst`
--

DROP TABLE IF EXISTS `salesperson_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salesperson_mst` (
  `salesid` int(10) NOT NULL,
  `Employee_employeeid` int(10) NOT NULL,
  `commision_rate` float DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`salesid`),
  KEY `Employee_employeeid` (`Employee_employeeid`),
  CONSTRAINT `salesperson_mst_ibfk_1` FOREIGN KEY (`Employee_employeeid`) REFERENCES `employee_mst` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesperson_mst`
--

LOCK TABLES `salesperson_mst` WRITE;
/*!40000 ALTER TABLE `salesperson_mst` DISABLE KEYS */;
INSERT INTO `salesperson_mst` VALUES (1082,618976178,0.3,'2019-03-03 03:00:24',NULL),(1580,485787573,0.4,'2019-03-03 03:00:24',NULL);
/*!40000 ALTER TABLE `salesperson_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_mst`
--

DROP TABLE IF EXISTS `trainer_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trainer_mst` (
  `trainerid` int(10) NOT NULL,
  `Employee_employeeid` int(10) NOT NULL,
  `certification` varchar(20) DEFAULT NULL,
  `experience` int(2) DEFAULT NULL,
  `charge_rate` float DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`trainerid`),
  KEY `Employee_employeeid` (`Employee_employeeid`),
  CONSTRAINT `trainer_mst_ibfk_1` FOREIGN KEY (`Employee_employeeid`) REFERENCES `employee_mst` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_mst`
--

LOCK TABLES `trainer_mst` WRITE;
/*!40000 ALTER TABLE `trainer_mst` DISABLE KEYS */;
INSERT INTO `trainer_mst` VALUES (1092,391745522,'NCSF',7,80,'2019-03-03 03:00:24',NULL),(1335,476472452,'NCCA',6,50,'2019-03-03 03:00:24',NULL),(1404,768940716,'NCCA',8,80,'2019-03-03 03:00:24',NULL);
/*!40000 ALTER TABLE `trainer_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-02 19:01:03
