use mindspace;

CREATE TABLE `statusmaster` (
  `StatusId` int NOT NULL,
  `StatusName` varchar(100) NOT NULL,
  PRIMARY KEY (`StatusId`) 
);

CREATE TABLE `workspacesizemaster`(
`WorkSpaceSizeId` VARCHAR(10) NOT NULL,
`WorkSpaceSizeName` VARCHAR(15) NOT NULL,
PRIMARY KEY (`WorkSpaceSizeId`) 
);

CREATE TABLE `locations` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(50) DEFAULT NULL,
  `LocationStatusID` int DEFAULT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LocationID`)
);


CREATE TABLE `Locationworkspacecounts`(
`LocationID` int NOT NULL, 
`WorkSpaceSizeId` VARCHAR(10) NOT NULL,
`AvailableCount` INT NOT NULL,
`TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`LocationID`, `WorkSpaceSizeId`)
);


CREATE TABLE `workspaces` (
  `WorkSpaceID` int NOT NULL AUTO_INCREMENT,
  `LocationId` int NOT NULL,
  `WorkSpaceSizeId` varchar(10) NOT NULL,
  `WorkSpaceStatusId` int NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WorkSpaceID`)
);


CREATE TABLE `workspacestaff` (
  `WorkSpaceID` int NOT NULL,
  `StaffId` int DEFAULT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WorkSpaceID`)
);


CREATE TABLE `services` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(50) NOT NULL,
  `ServicePrice` int NOT NULL,
  `ServiceStatusID` int NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ServiceID`)
);


CREATE TABLE `admin` (
  `adminId` int NOT NULL,
  `Username` varchar(20) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `UserStatusId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `EmailID` varchar(150) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`adminId`)
);


CREATE TABLE `customers` (
  `customerId` int NOT NULL,
  `Username` varchar(20) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `UserStatusId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DOB` datetime DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `EmailID` varchar(150) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `AddressLine1` varchar(100) NOT NULL,
  `AddressLine2` varchar(100) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Pincode` varchar(6) DEFAULT NULL,
  `WalletAmount` int NOT NULL DEFAULT '0',
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerId`)
);

CREATE TABLE `staff` (
  `StaffId` int NOT NULL,
  `Username` varchar(20) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `UserStatusId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DOB` datetime DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `AddressLine1` varchar(100) NOT NULL,
  `AddressLine2` varchar(100) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Pincode` varchar(6) DEFAULT NULL,
  `EmailID` varchar(150) NOT NULL,
  `WorkLocationId` int DEFAULT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `StaffTotalPoints` int NOT NULL DEFAULT '0',
  `StaffRatedMembersCount` int NOT NULL DEFAULT '0',
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`staffId`)
);

CREATE TABLE `staffservices` (
  `StaffID` int NOT NULL,
  `ServiceID` int NOT NULL,
  PRIMARY KEY (`StaffID`,`ServiceID`)
);

CREATE TABLE `workspacebookings` (
  `BookingId` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `WorkSpaceId` int NOT NULL,
  `StaffId` int NOT NULL,
  `CheckinTime` datetime NOT NULL,
  `CheckoutTime` datetime NOT NULL,
  `ChargedAmount` int NOT NULL,
  `RefundAmount` int NOT NULL DEFAULT '0',
  `BookingstatusId` int NOT NULL DEFAULT '1',
  `IsProcessed` tinyint NOT NULL DEFAULT '0',
  `IsMailSent` tinyint NOT NULL DEFAULT '0',
  `BookedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FeedbackKey` bigint unsigned DEFAULT NULL,
  `TimeUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookingId`)
) ;

CREATE TABLE `bookingservices` (
  `BookingServiceID` int NOT NULL AUTO_INCREMENT,
  `BookingId` int NOT NULL,
  `ServiceID` int NOT NULL,
  `Quantity`  int NOT NULL,
  `ServicePrice` int NOT NULL,
  PRIMARY KEY (`BookingServiceID`)
) ;

CREATE TABLE `wallettransactions` (
  `TransactionId` int NOT NULL AUTO_INCREMENT,
  `TransactionText` varchar(100) NOT NULL DEFAULT 'Deposit',
  `CustomerId` int NOT NULL,
  `Amount` int NOT NULL,
  `TransactionSuccess` tinyint NOT NULL,
  `TimeCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionId`)
) ;

CREATE TABLE `customerfeedbacks` (
  `FeedbackId` int NOT NULL AUTO_INCREMENT,
  `BookingId` int NOT NULL,
  `OverallRating` tinyint NOT NULL,
  `RatingOnStaff` tinyint NOT NULL,
  `FeedbackText` varchar(1000) DEFAULT NULL,
  `FeedbackTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FeedbackId`)
);

ALTER TABLE `locations`
ADD CONSTRAINT FK_locations_LocationStatusID_StatusId FOREIGN KEY (`LocationStatusID`)
    REFERENCES `StatusMaster`(`StatusId`);  
    
ALTER TABLE `Locationworkspacecounts`
ADD CONSTRAINT FK_Locationworkspacecounts_LocationID_LocationID FOREIGN KEY (`LocationID`)
    REFERENCES `locations`(`LocationID`),
ADD CONSTRAINT FK_Locationworkspacecounts_WorkSpaceSize_WorkSpaceSize FOREIGN KEY (`WorkSpaceSizeId`)
    REFERENCES `workspacesizemaster`(`WorkSpaceSizeId`); 
    
ALTER TABLE `workspaces`
ADD CONSTRAINT FK_workspaces_LocationId FOREIGN KEY (`LocationId`)
    REFERENCES `locations`(`LocationID`),
ADD  CONSTRAINT FK_workspaces_WorkSpaceStatusId FOREIGN KEY (`WorkSpaceStatusId`)
    REFERENCES `statusmaster`(`StatusId`),
ADD CONSTRAINT FK_workspaces_WorkSpaceSizeId FOREIGN KEY (`WorkSpaceSizeId`)
    REFERENCES `workspacesizemaster`(`WorkSpaceSizeId`); 
    
ALTER TABLE `workspacestaff`
ADD CONSTRAINT FK_workspacestaff_WorkSpaceID FOREIGN KEY (`WorkSpaceID`)
    REFERENCES `workspaces`(`WorkSpaceID`),
ADD CONSTRAINT FK_workspacestaff_StaffId FOREIGN KEY (`StaffId`)
    REFERENCES `staff`(`StaffId`);
    
ALTER TABLE `services`
ADD CONSTRAINT FK_services_ServiceStatusId FOREIGN KEY (`ServiceID`)
    REFERENCES `StatusMaster`(`StatusId`); 
    
ALTER TABLE `admin`
ADD CONSTRAINT FK_admin_UserStatusId FOREIGN KEY (`adminId`)
    REFERENCES `StatusMaster`(`StatusId`); 

ALTER TABLE `customers`
ADD CONSTRAINT FK_customers_UserStatusId FOREIGN KEY (`customerId`)
    REFERENCES `StatusMaster`(`StatusId`); 

ALTER TABLE `staff`
ADD CONSTRAINT FK_staff_UserStatusId FOREIGN KEY (`StaffId`)
    REFERENCES `StatusMaster`(`StatusId`),
ADD CONSTRAINT FK_staff_WorkLocationId FOREIGN KEY (`WorkLocationId`)
	REFERENCES 	`locations`(`LocationID`);

ALTER TABLE `staffservices` 
ADD CONSTRAINT FK_staffservices_StaffId FOREIGN KEY (`StaffId`)
    REFERENCES `staff`(`StaffId`),
ADD  CONSTRAINT FK_staffservices_ServiceID FOREIGN KEY (`ServiceID`)
    REFERENCES `services`(`ServiceID`);
    
ALTER TABLE `workspacebookings` 
ADD CONSTRAINT FK_workspacebookings_CustomerId FOREIGN KEY (`CustomerId`)
    REFERENCES `customers`(`customerId`),
ADD CONSTRAINT FK_workspacebookings_WorkSpaceId FOREIGN KEY (`WorkSpaceId`)
    REFERENCES `workspaces`(`WorkSpaceID`),
ADD CONSTRAINT FK_workspacebookings_StaffId FOREIGN KEY (`staffId`)
	REFERENCES `staff` (`StaffId`),
ADD CONSTRAINT FK_workspacebookings_BookingStatusId FOREIGN KEY (`BookingstatusId`)
    REFERENCES `StatusMaster`(`StatusId`); 

ALTER TABLE `bookingservices` 
ADD CONSTRAINT FK_bookingservices_BookingId FOREIGN KEY (`BookingId`)
    REFERENCES `workspacebookings`(`BookingId`),
ADD CONSTRAINT FK_bookingservices_ServiceID FOREIGN KEY (`ServiceID`)
    REFERENCES `services`(`ServiceID`);
    
ALTER TABLE `wallettransactions` 
ADD CONSTRAINT FK_wallettransactions_CustomerId FOREIGN KEY (`CustomerId`)
    REFERENCES `Customers`(`CustomerId`);

ALTER TABLE `customerfeedbacks` 
ADD CONSTRAINT FK_customerfeedbacks_BookingId FOREIGN KEY (`BookingId`)
    REFERENCES `workspacebookings`(`BookingId`);








    
