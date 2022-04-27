-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: wsbs1
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin','4b68ea0ce256c16f48625b52b75eca42',1,'Aditya','Dhanekula','dhanekulaaditya@gmail.com','9177445220',NULL,NULL,'2022-04-12 18:14:58','2022-04-12 18:14:58');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bookingservices`
--

LOCK TABLES `bookingservices` WRITE;
/*!40000 ALTER TABLE `bookingservices` DISABLE KEYS */;
INSERT INTO `bookingservices` VALUES (23,1,2,1,100),(24,2,1,1,100),(25,2,2,1,100),(27,3,1,1,100),(28,4,1,1,100),(29,4,2,1,100);
/*!40000 ALTER TABLE `bookingservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customerfeedbacks`
--

LOCK TABLES `customerfeedbacks` WRITE;
/*!40000 ALTER TABLE `customerfeedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerfeedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Prakhar','badde341429614c496c590a898fcb4ed',1,'Prakhar ','Nigam','2002-02-06 00:00:00','Male','dhanekulaaditya@gmail.com','9177445220','VM 453, Bits Hyderabad','Hyderabad',NULL,2200,NULL,NULL,'2022-04-27 01:56:59','2022-04-27 02:03:22');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (3,'Madhapur',1,10,12,'2022-04-26 23:28:35','2022-04-26 23:28:35'),(4,'Kondapur',1,5,10,'2022-04-26 23:28:49','2022-04-26 23:28:49'),(5,'Gachibowli',1,15,20,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(6,'Ameerpet',1,10,10,'2022-04-27 02:55:42','2022-04-27 02:55:42');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `locationworkspacecounts`
--

LOCK TABLES `locationworkspacecounts` WRITE;
/*!40000 ALTER TABLE `locationworkspacecounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `locationworkspacecounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Break fast',100,'Per Pack',1,'2022-04-27 01:46:39','2022-04-27 01:46:39'),(2,'Projector',100,'Per hour',1,'2022-04-27 01:46:59','2022-04-27 01:46:59'),(3,'Meals',200,'Per Pack',1,'2022-04-27 02:52:36','2022-04-27 02:52:36'),(4,'Printer',100,'Per hour',1,'2022-04-27 02:53:02','2022-04-27 02:53:02');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'santhosh','13d80cb8bba84534c955ba90bf3db8ce',1,'Santhosh','Kumar','1989-12-01 00:00:00','Male','403 Mayuri Complex\r\nMadhapur','Hyderabad','500081','dhanekulaaditya@gmail.com',3,'9177445220',0,0,0,NULL,NULL,'2022-04-26 23:31:00','2022-04-26 23:31:00'),(2,'Kiran','13d80cb8bba84534c955ba90bf3db8ce',1,'Kiran','M','1998-06-01 00:00:00','Male','301 Fortune Towers\r\nMadhapur','Hyderabad','500081','dhanekulaaditya@gmail.com',3,'9177445220',0,0,0,NULL,NULL,'2022-04-27 01:48:37','2022-04-27 01:48:37'),(3,'Uday','13d80cb8bba84534c955ba90bf3db8ce',1,'Uday','S','2001-12-07 00:00:00','Male','301 Aditya Heights\r\nKondapur','Hyderabad','500033','dhanekulaaditya@gmail.com',4,'9177445220',0,0,0,NULL,NULL,'2022-04-27 01:50:27','2022-04-27 01:50:27'),(4,'Suman','4b68ea0ce256c16f48625b52b75eca42',1,'Suman','K','2000-03-12 00:00:00','Male','Yasodha Nagar Borabanda','Hyderabad','500033','dhanekulaaditya@gmail.com',4,'9177445220',0,0,0,NULL,NULL,'2022-04-27 02:54:46','2022-04-27 02:54:46'),(5,'Srinadh','13d80cb8bba84534c955ba90bf3db8ce',1,'Srinadh','M','1989-11-15 00:00:00','Male','Yallareddyguda','Hyderabad','500078','dhanekulaaditya@gmail.com',6,'9177445220',0,0,0,NULL,NULL,'2022-04-27 03:02:42','2022-04-27 03:02:42'),(6,'Karan','13d80cb8bba84534c955ba90bf3db8ce',1,'Karan','Johar','1978-12-17 00:00:00','Male','Varun Towers  ','Hyderabad','500065','dhanekulaaditya@gmail.com',5,'9878734987',0,0,0,NULL,NULL,'2022-04-27 03:05:38','2022-04-27 03:05:38');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `staffservices`
--

LOCK TABLES `staffservices` WRITE;
/*!40000 ALTER TABLE `staffservices` DISABLE KEYS */;
INSERT INTO `staffservices` VALUES (2,1),(2,2),(3,1),(3,2);
/*!40000 ALTER TABLE `staffservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `statusmaster`
--

LOCK TABLES `statusmaster` WRITE;
/*!40000 ALTER TABLE `statusmaster` DISABLE KEYS */;
INSERT INTO `statusmaster` VALUES (0,'Deleted'),(1,'Active'),(2,'Blocked'),(3,'Cancelled');
/*!40000 ALTER TABLE `statusmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wallettransactions`
--

LOCK TABLES `wallettransactions` WRITE;
/*!40000 ALTER TABLE `wallettransactions` DISABLE KEYS */;
INSERT INTO `wallettransactions` VALUES (1,'Deposit',1,5000,1,'2022-04-27 01:57:16'),(2,'Payment for Booking Id 1',1,-400,1,'2022-04-27 01:58:02'),(3,'Payment for Booking Id 2',1,-800,1,'2022-04-27 01:58:45'),(4,'Payment for Booking Id 3',1,-800,1,'2022-04-27 01:59:35'),(5,'Payment for Booking Id 4',1,-200,1,'2022-04-27 02:00:17'),(6,'Payment for Booking Id 5',1,-600,1,'2022-04-27 02:03:22');
/*!40000 ALTER TABLE `wallettransactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `workspacebookings`
--

LOCK TABLES `workspacebookings` WRITE;
/*!40000 ALTER TABLE `workspacebookings` DISABLE KEYS */;
INSERT INTO `workspacebookings` VALUES (1,1,10,200,2,'2022-04-10 14:00:00','2022-04-10 16:00:00',400,0,1,0,'2022-04-27 01:58:02',NULL,'2022-04-27 01:58:02'),(2,1,23,200,3,'2022-04-27 01:00:00','2022-04-27 05:00:00',800,0,1,0,'2022-04-27 01:58:45',NULL,'2022-04-27 01:58:45'),(3,1,23,200,3,'2022-04-28 13:00:00','2022-04-28 17:00:00',800,0,1,0,'2022-04-27 01:59:35',NULL,'2022-04-27 01:59:35'),(4,1,28,100,3,'2022-04-27 05:00:00','2022-04-27 07:00:00',200,0,1,0,'2022-04-27 02:00:17',NULL,'2022-04-27 02:00:17'),(5,1,25,200,3,'2022-04-19 14:00:00','2022-04-19 17:00:00',600,0,1,0,'2022-04-27 02:03:22',NULL,'2022-04-27 02:03:22');
/*!40000 ALTER TABLE `workspacebookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `workspaces`
--

LOCK TABLES `workspaces` WRITE;
/*!40000 ALTER TABLE `workspaces` DISABLE KEYS */;
INSERT INTO `workspaces` VALUES (1,3,'Big',1,'B1',1,1,'2022-04-26 23:28:35','2022-04-27 01:51:50'),(2,3,'Big',2,'B2',1,1,'2022-04-26 23:28:35','2022-04-27 01:51:50'),(3,3,'Big',3,'B3',NULL,1,'2022-04-26 23:28:35','2022-04-26 23:28:35'),(4,3,'Big',4,'B4',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(5,3,'Big',5,'B5',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(6,3,'Big',6,'B6',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(7,3,'Big',7,'B7',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(8,3,'Big',8,'B8',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(9,3,'Big',9,'B9',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(10,3,'Big',10,'B10',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(11,3,'Small',1,'S1',1,1,'2022-04-26 23:28:35','2022-04-27 01:51:50'),(12,3,'Small',2,'S2',1,1,'2022-04-26 23:28:35','2022-04-27 01:51:50'),(13,3,'Small',3,'S3',1,1,'2022-04-26 23:28:35','2022-04-27 01:51:50'),(14,3,'Small',4,'S4',NULL,1,'2022-04-26 23:28:35','2022-04-26 23:28:35'),(15,3,'Small',5,'S5',NULL,1,'2022-04-26 23:28:35','2022-04-26 23:28:35'),(16,3,'Small',6,'S6',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(17,3,'Small',7,'S7',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(18,3,'Small',8,'S8',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(19,3,'Small',9,'S9',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(20,3,'Small',10,'S10',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(21,3,'Small',11,'S11',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(22,3,'Small',12,'S12',2,1,'2022-04-26 23:28:35','2022-04-27 01:51:09'),(23,4,'Big',1,'B1',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(24,4,'Big',2,'B2',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(25,4,'Big',3,'B3',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(26,4,'Big',4,'B4',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(27,4,'Big',5,'B5',NULL,1,'2022-04-26 23:28:49','2022-04-26 23:28:49'),(28,4,'Small',1,'S1',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(29,4,'Small',2,'S2',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(30,4,'Small',3,'S3',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(31,4,'Small',4,'S4',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(32,4,'Small',5,'S5',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(33,4,'Small',6,'S6',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(34,4,'Small',7,'S7',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(35,4,'Small',8,'S8',3,1,'2022-04-26 23:28:49','2022-04-27 01:52:25'),(36,4,'Small',9,'S9',NULL,1,'2022-04-26 23:28:49','2022-04-26 23:28:49'),(37,4,'Small',10,'S10',NULL,1,'2022-04-26 23:28:49','2022-04-26 23:28:49'),(38,5,'Big',1,'B1',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(39,5,'Big',2,'B2',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(40,5,'Big',3,'B3',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(41,5,'Big',4,'B4',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(42,5,'Big',5,'B5',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(43,5,'Big',6,'B6',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(44,5,'Big',7,'B7',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(45,5,'Big',8,'B8',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(46,5,'Big',9,'B9',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(47,5,'Big',10,'B10',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(48,5,'Big',11,'B11',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(49,5,'Big',12,'B12',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(50,5,'Big',13,'B13',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(51,5,'Big',14,'B14',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(52,5,'Big',15,'B15',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(53,5,'Small',1,'S1',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(54,5,'Small',2,'S2',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(55,5,'Small',3,'S3',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(56,5,'Small',4,'S4',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(57,5,'Small',5,'S5',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(58,5,'Small',6,'S6',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(59,5,'Small',7,'S7',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(60,5,'Small',8,'S8',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(61,5,'Small',9,'S9',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(62,5,'Small',10,'S10',6,1,'2022-04-27 02:55:25','2022-04-27 03:06:29'),(63,5,'Small',11,'S11',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(64,5,'Small',12,'S12',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(65,5,'Small',13,'S13',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(66,5,'Small',14,'S14',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(67,5,'Small',15,'S15',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(68,5,'Small',16,'S16',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(69,5,'Small',17,'S17',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(70,5,'Small',18,'S18',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(71,5,'Small',19,'S19',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(72,5,'Small',20,'S20',NULL,1,'2022-04-27 02:55:25','2022-04-27 02:55:25'),(73,6,'Big',1,'B1',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(74,6,'Big',2,'B2',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(75,6,'Big',3,'B3',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(76,6,'Big',4,'B4',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(77,6,'Big',5,'B5',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(78,6,'Big',6,'B6',NULL,1,'2022-04-27 02:55:42','2022-04-27 02:55:42'),(79,6,'Big',7,'B7',NULL,1,'2022-04-27 02:55:42','2022-04-27 02:55:42'),(80,6,'Big',8,'B8',NULL,1,'2022-04-27 02:55:42','2022-04-27 02:55:42'),(81,6,'Big',9,'B9',NULL,1,'2022-04-27 02:55:42','2022-04-27 02:55:42'),(82,6,'Big',10,'B10',NULL,1,'2022-04-27 02:55:42','2022-04-27 02:55:42'),(83,6,'Small',1,'S1',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(84,6,'Small',2,'S2',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(85,6,'Small',3,'S3',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(86,6,'Small',4,'S4',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(87,6,'Small',5,'S5',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(88,6,'Small',6,'S6',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(89,6,'Small',7,'S7',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(90,6,'Small',8,'S8',5,1,'2022-04-27 02:55:42','2022-04-27 03:07:04'),(91,6,'Small',9,'S9',NULL,1,'2022-04-27 02:55:42','2022-04-27 02:55:42'),(92,6,'Small',10,'S10',NULL,1,'2022-04-27 02:55:42','2022-04-27 02:55:42');
/*!40000 ALTER TABLE `workspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `workspacesizemaster`
--

LOCK TABLES `workspacesizemaster` WRITE;
/*!40000 ALTER TABLE `workspacesizemaster` DISABLE KEYS */;
INSERT INTO `workspacesizemaster` VALUES ('BIG','Big',200),('SMALL','Small',100);
/*!40000 ALTER TABLE `workspacesizemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `workspacestaff`
--

LOCK TABLES `workspacestaff` WRITE;
/*!40000 ALTER TABLE `workspacestaff` DISABLE KEYS */;
/*!40000 ALTER TABLE `workspacestaff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27  3:12:29
