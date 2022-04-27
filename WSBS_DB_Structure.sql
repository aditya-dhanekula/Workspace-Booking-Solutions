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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customerfeedbacks`
--

DROP TABLE IF EXISTS `customerfeedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerfeedbacks` (
  `FeedbackId` int NOT NULL AUTO_INCREMENT,
  `BookingId` int NOT NULL,
  `RatingOnService` tinyint NOT NULL,
  `RatingOnStaff` tinyint NOT NULL,
  `FeedbackText` varchar(1000) DEFAULT NULL,
  `FeedbackTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FeedbackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(50) NOT NULL,
  `ServicePrice` int NOT NULL,
  `UnitType` varchar(20) NOT NULL DEFAULT 'Per Item',
  `ServiceStatusID` int NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `ServiceTotalPoints` int NOT NULL DEFAULT '0',
  `StaffRatedMembersCount` int NOT NULL DEFAULT '0',
  `ResetPasswordKey` varchar(10) DEFAULT NULL,
  `ResetPasswordKeySetOn` datetime DEFAULT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `ChargedAmount` int NOT NULL,
  `RefundAmount` int NOT NULL DEFAULT '0',
  `BookingstatusId` int NOT NULL DEFAULT '1',
  `IsMailSent` tinyint NOT NULL DEFAULT '0',
  `BookedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FeedbackKey` bigint unsigned DEFAULT NULL,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 19:16:26
