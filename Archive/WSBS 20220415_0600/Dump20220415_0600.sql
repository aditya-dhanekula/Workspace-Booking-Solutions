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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `UserStatusId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `EmailID` varchar(150) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `ResetPasswordKey` varchar(10) DEFAULT NULL,
  `ResetPasswordKeySetOn` datetime DEFAULT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin','4b68ea0ce256c16f48625b52b75eca42',1,'Aditya','Dhanekula','dhanekulaaditya@gmail.com','9177445220',NULL,NULL,'2022-04-12 18:14:58','2022-04-12 18:14:58');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingservices`
--

DROP TABLE IF EXISTS `bookingservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingservices` (
  `BookingServiceID` int NOT NULL AUTO_INCREMENT,
  `BookingId` int NOT NULL,
  `ServiceID` int NOT NULL,
  `Quantity` int NOT NULL DEFAULT '1',
  `ServicePrice` int NOT NULL,
  PRIMARY KEY (`BookingServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingservices`
--

LOCK TABLES `bookingservices` WRITE;
/*!40000 ALTER TABLE `bookingservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerfeedbacks`
--

DROP TABLE IF EXISTS `customerfeedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerfeedbacks` (
  `FeedbackId` int NOT NULL AUTO_INCREMENT,
  `BookingId` int NOT NULL,
  `OverallRating` tinyint NOT NULL,
  `RatingOnStaff` tinyint NOT NULL,
  `FeedbackText` varchar(1000) DEFAULT NULL,
  `FeedbackTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FeedbackId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerfeedbacks`
--

LOCK TABLES `customerfeedbacks` WRITE;
/*!40000 ALTER TABLE `customerfeedbacks` DISABLE KEYS */;
INSERT INTO `customerfeedbacks` VALUES (1,1,3,4,'','2022-04-15 05:35:12'),(2,4,4,5,'','2022-04-15 05:39:49'),(3,5,3,5,'','2022-04-15 05:39:59');
/*!40000 ALTER TABLE `customerfeedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `UserStatusId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DOB` datetime DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `EmailID` varchar(150) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `ResidentialAddress` varchar(100) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Pincode` varchar(6) DEFAULT NULL,
  `WalletAmount` int NOT NULL DEFAULT '0',
  `ResetPasswordKey` varchar(10) DEFAULT NULL,
  `ResetPasswordKeySetOn` datetime DEFAULT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Raghu','4b68ea0ce256c16f48625b52b75eca42',1,'Raghu','Ram','1981-01-03 00:00:00','Male','srini.dhanekula@gmail.com','9705057788','401 Yamuna Towers','Hyderabad',NULL,19900,NULL,NULL,'2022-04-14 23:45:06','2022-04-15 05:34:51');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(50) DEFAULT NULL,
  `LocationStatusID` int DEFAULT NULL,
  `BigWorkSpaces` int NOT NULL DEFAULT '0',
  `SmallWorkSpaces` int NOT NULL DEFAULT '0',
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LocationID`),
  KEY `FK_locations_LocationStatusID_StatusId` (`LocationStatusID`),
  CONSTRAINT `FK_locations_LocationStatusID_StatusId` FOREIGN KEY (`LocationStatusID`) REFERENCES `statusmaster` (`StatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Kondapur',1,10,15,'2022-04-13 01:14:53','2022-04-13 23:31:40'),(2,'Madhapur',1,10,20,'2022-04-13 23:31:58','2022-04-13 23:31:58');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationworkspacecounts`
--

DROP TABLE IF EXISTS `locationworkspacecounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locationworkspacecounts` (
  `LocationID` int NOT NULL,
  `WorkSpaceSizeId` varchar(10) NOT NULL,
  `AvailableCount` int NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LocationID`,`WorkSpaceSizeId`),
  KEY `FK_Locationworkspacecounts_WorkSpaceSize_WorkSpaceSize` (`WorkSpaceSizeId`),
  CONSTRAINT `FK_Locationworkspacecounts_LocationID_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `locations` (`LocationID`),
  CONSTRAINT `FK_Locationworkspacecounts_WorkSpaceSize_WorkSpaceSize` FOREIGN KEY (`WorkSpaceSizeId`) REFERENCES `workspacesizemaster` (`WorkSpaceSizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationworkspacecounts`
--

LOCK TABLES `locationworkspacecounts` WRITE;
/*!40000 ALTER TABLE `locationworkspacecounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `locationworkspacecounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(50) NOT NULL,
  `ServicePrice` int NOT NULL,
  `ServiceStatusID` int NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Projector',300,1,'2022-04-13 02:13:39','2022-04-15 05:08:59'),(2,'Printer',250,1,'2022-04-13 02:13:39','2022-04-13 02:18:50');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffId` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `UserStatusId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DOB` datetime DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `ResidentialAddress` varchar(200) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Pincode` varchar(6) DEFAULT NULL,
  `EmailID` varchar(150) NOT NULL,
  `WorkLocationId` int DEFAULT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `StaffTotalPoints` int NOT NULL DEFAULT '0',
  `StaffRatedMembersCount` int NOT NULL DEFAULT '0',
  `ResetPasswordKey` varchar(10) DEFAULT NULL,
  `ResetPasswordKeySetOn` datetime DEFAULT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'StaffOne','4b68ea0ce256c16f48625b52b75eca42',1,'Staff ','One','1978-12-03 00:00:00','Male','tert','Hyderabad','500071','dhanekulaaditya@gmail.com',1,'9804423437',0,0,NULL,NULL,'2022-04-13 02:24:40','2022-04-13 23:07:50'),(2,'StaffTwo','4b68ea0ce256c16f48625b52b75eca42',1,'Staff ','Two','1987-12-01 00:00:00','Male','401','Hyderabad','500081','dhanekulaaditya@gmail.com',1,'9705057788',0,0,NULL,NULL,'2022-04-13 02:31:40','2022-04-13 02:43:20');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffservices`
--

DROP TABLE IF EXISTS `staffservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffservices` (
  `StaffID` int NOT NULL,
  `ServiceID` int NOT NULL,
  PRIMARY KEY (`StaffID`,`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffservices`
--

LOCK TABLES `staffservices` WRITE;
/*!40000 ALTER TABLE `staffservices` DISABLE KEYS */;
INSERT INTO `staffservices` VALUES (1,1),(1,2),(2,1),(2,2);
/*!40000 ALTER TABLE `staffservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusmaster`
--

DROP TABLE IF EXISTS `statusmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusmaster` (
  `StatusId` int NOT NULL,
  `StatusName` varchar(100) NOT NULL,
  PRIMARY KEY (`StatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusmaster`
--

LOCK TABLES `statusmaster` WRITE;
/*!40000 ALTER TABLE `statusmaster` DISABLE KEYS */;
INSERT INTO `statusmaster` VALUES (0,'Deleted'),(1,'Active'),(2,'Blocked'),(3,'Cancelled');
/*!40000 ALTER TABLE `statusmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallettransactions`
--

DROP TABLE IF EXISTS `wallettransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallettransactions` (
  `TransactionId` int NOT NULL AUTO_INCREMENT,
  `TransactionText` varchar(100) NOT NULL DEFAULT 'Deposit',
  `CustomerId` int NOT NULL,
  `Amount` int NOT NULL,
  `TransactionSuccess` tinyint NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallettransactions`
--

LOCK TABLES `wallettransactions` WRITE;
/*!40000 ALTER TABLE `wallettransactions` DISABLE KEYS */;
INSERT INTO `wallettransactions` VALUES (1,'Deposit',1,500,1,'2022-04-15 00:13:40'),(2,'Deposit',1,300,1,'2022-04-15 00:13:50'),(3,'Deposit',1,1000,1,'2022-04-15 03:34:18'),(5,'Advance for Booking Id 4',1,-1000,1,'2022-04-15 04:18:05'),(6,'Deposit',1,20000,1,'2022-04-15 04:20:57'),(7,'Advance for Booking Id 5',1,-1000,1,'2022-04-15 04:22:02'),(8,'Advance for Booking Id 6',1,-1000,1,'2022-04-15 04:29:54'),(9,'Refund of BookingId:4 advance due to Cancellnation',1,1000,1,'2022-04-15 04:37:17'),(10,'Advance for Booking Id 7',1,-1000,1,'2022-04-15 04:39:26'),(11,'Refund of BookingId:5 advance due to Cancellnation',1,1000,1,'2022-04-15 05:16:19'),(12,'Refund of BookingId:1 advance due to Cancellnation',1,100,1,'2022-04-15 05:34:51');
/*!40000 ALTER TABLE `wallettransactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspacebookings`
--

DROP TABLE IF EXISTS `workspacebookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspacebookings` (
  `BookingId` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `WorkSpaceId` int NOT NULL,
  `HourlyWorkSpacePrice` int NOT NULL DEFAULT '0',
  `StaffId` int NOT NULL,
  `CheckinTime` datetime NOT NULL,
  `CheckoutTime` datetime NOT NULL,
  `WorkSpaceBookingCost` int NOT NULL DEFAULT '0',
  `ChargedAmount` int NOT NULL,
  `RefundAmount` int NOT NULL DEFAULT '0',
  `BookingstatusId` int NOT NULL DEFAULT '1',
  `IsProcessed` tinyint NOT NULL DEFAULT '0',
  `IsMailSent` tinyint NOT NULL DEFAULT '0',
  `BookedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FeedbackKey` bigint unsigned DEFAULT NULL,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspacebookings`
--

LOCK TABLES `workspacebookings` WRITE;
/*!40000 ALTER TABLE `workspacebookings` DISABLE KEYS */;
INSERT INTO `workspacebookings` VALUES (1,1,5,0,1,'2022-05-13 09:00:00','2022-05-17 09:00:00',0,100,100,3,1,0,'2022-04-15 00:43:16',NULL,'2022-04-15 05:34:51'),(4,1,13,100,1,'2022-04-21 08:30:00','2022-04-21 11:30:00',300,1000,1000,3,1,0,'2022-04-15 04:18:05',NULL,'2022-04-15 04:37:17'),(5,1,12,100,1,'2022-04-20 10:30:00','2022-04-23 22:00:00',8400,1000,1000,3,1,0,'2022-04-15 04:22:02',NULL,'2022-04-15 05:16:19'),(6,1,9,200,1,'2022-04-18 16:29:00','2022-04-18 19:29:00',600,1000,0,1,0,0,'2022-04-15 04:29:54',NULL,'2022-04-15 04:29:54'),(7,1,3,200,1,'2022-04-15 04:00:00','2022-04-15 07:00:00',600,1000,0,1,0,0,'2022-04-15 04:39:26',NULL,'2022-04-15 04:39:26'),(8,1,3,200,1,'2022-04-07 05:14:00','2022-04-07 09:00:00',800,1000,0,1,0,0,'2022-04-15 05:15:16',NULL,'2022-04-15 05:15:16');
/*!40000 ALTER TABLE `workspacebookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspaces`
--

DROP TABLE IF EXISTS `workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspaces` (
  `WorkSpaceID` int NOT NULL AUTO_INCREMENT,
  `LocationId` int NOT NULL,
  `WorkSpaceSizeId` varchar(10) NOT NULL,
  `WorkSpaceNumber` int DEFAULT NULL,
  `WorkSpaceName` varchar(20) DEFAULT NULL,
  `StaffId` int DEFAULT NULL,
  `WorkSpaceStatusId` int NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WorkSpaceID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspaces`
--

LOCK TABLES `workspaces` WRITE;
/*!40000 ALTER TABLE `workspaces` DISABLE KEYS */;
INSERT INTO `workspaces` VALUES (1,1,'Big',1,'B1',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(2,1,'Big',2,'B2',1,1,'2022-04-13 01:27:14','2022-04-15 05:10:23'),(3,1,'Big',3,'B3',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(4,1,'Big',4,'B4',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(5,1,'Big',5,'B5',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(6,1,'Big',6,'B6',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(7,1,'Big',7,'B7',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(8,1,'Big',8,'B8',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(9,1,'Big',9,'B9',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(10,1,'Big',10,'B10',1,1,'2022-04-13 01:27:14','2022-04-14 01:20:35'),(11,1,'Small',1,'S1',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(12,1,'Small',2,'S2',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(13,1,'Small',3,'S3',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(14,1,'Small',4,'S4',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(15,1,'Small',5,'S5',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(16,1,'Small',6,'S6',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(17,1,'Small',7,'S7',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(18,1,'Small',8,'S8',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(19,1,'Small',9,'S9',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(20,1,'Small',10,'S10',2,1,'2022-04-13 01:27:14','2022-04-14 01:20:51'),(21,1,'Small',11,'S11',NULL,1,'2022-04-13 01:27:14','2022-04-13 01:27:14'),(22,1,'Small',12,'S12',NULL,1,'2022-04-13 01:27:14','2022-04-13 01:27:14'),(23,1,'Small',13,'S13',NULL,1,'2022-04-13 01:27:14','2022-04-13 01:27:14'),(24,1,'Small',14,'S14',NULL,1,'2022-04-13 01:27:14','2022-04-13 01:27:14'),(25,1,'Small',15,'S15',NULL,1,'2022-04-13 01:27:14','2022-04-13 01:27:14'),(26,2,'Big',1,'B1',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(27,2,'Big',2,'B2',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(28,2,'Big',3,'B3',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(29,2,'Big',4,'B4',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(30,2,'Big',5,'B5',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(31,2,'Big',6,'B6',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(32,2,'Big',7,'B7',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(33,2,'Big',8,'B8',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(34,2,'Big',9,'B9',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(35,2,'Big',10,'B10',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(36,2,'Small',1,'S1',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(37,2,'Small',2,'S2',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(38,2,'Small',3,'S3',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(39,2,'Small',4,'S4',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(40,2,'Small',5,'S5',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(41,2,'Small',6,'S6',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(42,2,'Small',7,'S7',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(43,2,'Small',8,'S8',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(44,2,'Small',9,'S9',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(45,2,'Small',10,'S10',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(46,2,'Small',11,'S11',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(47,2,'Small',12,'S12',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(48,2,'Small',13,'S13',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(49,2,'Small',14,'S14',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(50,2,'Small',15,'S15',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(51,2,'Small',16,'S16',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(52,2,'Small',17,'S17',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(53,2,'Small',18,'S18',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(54,2,'Small',19,'S19',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58'),(55,2,'Small',20,'S20',NULL,1,'2022-04-13 23:31:58','2022-04-13 23:31:58');
/*!40000 ALTER TABLE `workspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspacesizemaster`
--

DROP TABLE IF EXISTS `workspacesizemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspacesizemaster` (
  `WorkSpaceSizeId` varchar(10) NOT NULL,
  `WorkSpaceSizeName` varchar(15) NOT NULL,
  `WorkSpacePrice` int NOT NULL DEFAULT '100',
  PRIMARY KEY (`WorkSpaceSizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspacesizemaster`
--

LOCK TABLES `workspacesizemaster` WRITE;
/*!40000 ALTER TABLE `workspacesizemaster` DISABLE KEYS */;
INSERT INTO `workspacesizemaster` VALUES ('BIG','Big',200),('SMALL','Small',100);
/*!40000 ALTER TABLE `workspacesizemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspacestaff`
--

DROP TABLE IF EXISTS `workspacestaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspacestaff` (
  `WorkSpaceID` int NOT NULL,
  `StaffId` int DEFAULT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WorkSpaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- Dump completed on 2022-04-15  5:52:00
