-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: studycafe
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `locker`
--

DROP TABLE IF EXISTS `locker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locker` (
  `LockerID` int NOT NULL,
  `FloorID` int NOT NULL,
  `IsAvailable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`LockerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locker`
--

LOCK TABLES `locker` WRITE;
/*!40000 ALTER TABLE `locker` DISABLE KEYS */;
INSERT INTO `locker` VALUES (1,1,1),(2,1,1),(3,1,0),(4,1,0),(5,1,1),(6,1,0),(7,2,0),(8,2,0),(9,2,0),(10,2,1),(11,2,0),(12,2,1),(13,3,1),(14,3,0),(15,3,0),(16,3,0),(17,3,0),(18,3,0);
/*!40000 ALTER TABLE `locker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locker_res`
--

DROP TABLE IF EXISTS `locker_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locker_res` (
  `ReservationID` int NOT NULL AUTO_INCREMENT,
  `LockerID` int NOT NULL,
  `UserID` int NOT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ReservationID`,`LockerID`),
  KEY `LockerID` (`LockerID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `locker_res_ibfk_1` FOREIGN KEY (`LockerID`) REFERENCES `locker` (`LockerID`),
  CONSTRAINT `locker_res_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `member` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locker_res`
--

LOCK TABLES `locker_res` WRITE;
/*!40000 ALTER TABLE `locker_res` DISABLE KEYS */;
INSERT INTO `locker_res` VALUES (1,1,10,'2023-11-24 15:00:00','2023-12-24 15:00:00'),(2,2,9,'2023-11-24 11:00:00','2023-12-24 11:00:00'),(3,5,8,'2023-11-24 10:00:00','2023-12-24 20:00:00'),(4,10,7,'2023-11-24 09:00:00','2023-12-24 09:00:00'),(5,12,6,'2023-11-24 08:00:00','2023-12-24 08:00:00'),(6,13,5,'2023-11-23 17:00:00','2023-12-23 17:00:00');
/*!40000 ALTER TABLE `locker_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `UserID` int NOT NULL,
  `Name_` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `PhoneNumber` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `UsageTIME` time DEFAULT NULL,
  `Duration` datetime DEFAULT NULL,
  `Permission` tinyint(1) DEFAULT '0',
  `InviteID` int DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `InviteID` (`InviteID`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `member_ibfk_2` FOREIGN KEY (`InviteID`) REFERENCES `member` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'박서준','01048094818','02:00:00','2023-11-23 00:00:00',1,2),(2,'박원빈','01034384448','02:00:00','2023-11-23 00:00:00',1,3),(3,'신민아','01048324845','06:00:00','2023-11-23 00:00:00',1,6),(4,'김지연','01040904858','06:00:00','2023-11-23 00:00:00',1,NULL),(5,'이서진','01034884858','08:00:00','2023-11-23 00:00:00',1,NULL),(6,'정유미','01048334558','08:00:00','2023-11-24 00:00:00',1,NULL),(7,'최우식','01068382758','08:00:00','2023-11-24 00:00:00',1,NULL),(8,'김혁수','01038384086','10:00:00','2023-11-24 00:00:00',1,NULL),(9,'주현영','01088351458','10:00:00','2023-11-24 00:00:00',1,NULL),(10,'이승민','01018384458','10:00:00','2023-11-24 00:00:00',1,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_payment`
--

DROP TABLE IF EXISTS `member_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `ProductID` int NOT NULL,
  `PaymentStartTime` datetime DEFAULT NULL,
  `PaymentCompleteTime` datetime DEFAULT NULL,
  `PaymentAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`,`ProductID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `member_payment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `member` (`UserID`),
  CONSTRAINT `member_payment_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `member_product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_payment`
--

LOCK TABLES `member_payment` WRITE;
/*!40000 ALTER TABLE `member_payment` DISABLE KEYS */;
INSERT INTO `member_payment` VALUES (1,1,4,'2023-11-24 12:00:00','2023-11-24 12:01:00',10000.00),(2,2,4,'2023-11-24 12:02:00','2023-11-24 12:05:00',10000.00),(3,3,7,'2023-11-24 12:12:00','2023-11-24 12:15:00',45000.00),(4,4,7,'2023-11-24 12:45:00','2023-11-24 12:43:00',45000.00),(5,5,7,'2023-11-25 16:10:00','2023-11-25 16:12:00',45000.00),(6,6,8,'2023-11-25 16:15:00','2023-11-25 16:17:00',60000.00),(7,7,8,'2023-11-25 18:10:00','2023-11-25 18:12:00',60000.00),(8,8,8,'2023-11-25 18:28:00','2023-11-25 18:29:00',60000.00),(9,9,9,'2023-11-25 18:31:00','2023-11-25 18:33:00',110000.00),(10,10,9,'2023-11-25 18:35:00','2023-11-25 18:37:00',110000.00);
/*!40000 ALTER TABLE `member_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_product`
--

DROP TABLE IF EXISTS `member_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_product` (
  `ProductID` int NOT NULL,
  `ProductTime` time NOT NULL,
  `ProductDuration` datetime DEFAULT NULL,
  `ProductPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_product`
--

LOCK TABLES `member_product` WRITE;
/*!40000 ALTER TABLE `member_product` DISABLE KEYS */;
INSERT INTO `member_product` VALUES (1,'02:00:00','2023-11-30 19:45:41',4000.00),(2,'04:00:00','2023-11-30 19:45:41',6000.00),(3,'06:00:00','2023-11-30 19:45:41',8000.00),(4,'12:00:00','2023-11-30 19:45:41',10000.00),(5,'01:00:00','2023-11-30 19:45:41',2000.00),(6,'10:00:00','2023-12-29 19:45:41',15000.00),(7,'30:00:00','2023-12-29 19:45:41',45000.00),(8,'50:00:00','2024-02-27 19:45:41',60000.00),(9,'100:00:00','2024-02-27 19:45:41',110000.00);
/*!40000 ALTER TABLE `member_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `non_member`
--

DROP TABLE IF EXISTS `non_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_member` (
  `UserID` int NOT NULL,
  `Non_Name_` varchar(20) COLLATE utf8mb3_bin NOT NULL,
  `Non_PhoneNumber` varchar(15) COLLATE utf8mb3_bin NOT NULL,
  `UsageTIME` time DEFAULT NULL,
  `Permission` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UserID`),
  CONSTRAINT `non_member_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_member`
--

LOCK TABLES `non_member` WRITE;
/*!40000 ALTER TABLE `non_member` DISABLE KEYS */;
INSERT INTO `non_member` VALUES (101,'강동원','01048384858','02:00:00',1),(102,'박민지','01049754858','02:00:00',1),(103,'김선호','01048254858','10:00:00',1),(104,'박지성','01046734848','10:00:00',1),(105,'신서영','01048384858','06:00:00',1),(106,'이수호','01023584858','06:00:00',1),(107,'최지연','01045684828','08:00:00',1),(108,'서지혜','01067384878','08:00:00',1),(109,'최아영','01028384818','04:00:00',1),(110,'이강인','01048384858','04:00:00',1);
/*!40000 ALTER TABLE `non_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `non_member_payment`
--

DROP TABLE IF EXISTS `non_member_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_member_payment` (
  `NonMemberPaymentID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `NonMemberProductID` int NOT NULL,
  `NonMemberPaymentStartTime` datetime DEFAULT NULL,
  `NonMemberPaymentCompleteTime` datetime DEFAULT NULL,
  `NonMemberPaymentAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`NonMemberPaymentID`,`NonMemberProductID`),
  KEY `UserID` (`UserID`),
  KEY `NonMemberProductID` (`NonMemberProductID`),
  CONSTRAINT `non_member_payment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `non_member` (`UserID`),
  CONSTRAINT `non_member_payment_ibfk_2` FOREIGN KEY (`NonMemberProductID`) REFERENCES `non_member_product` (`NonMemberProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_member_payment`
--

LOCK TABLES `non_member_payment` WRITE;
/*!40000 ALTER TABLE `non_member_payment` DISABLE KEYS */;
INSERT INTO `non_member_payment` VALUES (1,101,2,'2023-11-24 12:00:00','2023-11-24 12:01:00',8000.00),(2,102,2,'2023-11-24 12:01:00','2023-11-24 12:03:00',8000.00),(3,103,4,'2023-11-24 12:05:00','2023-11-24 12:07:00',12000.00),(4,104,4,'2023-11-24 12:08:00','2023-11-24 12:12:00',12000.00),(5,105,3,'2023-11-24 12:30:00','2023-11-24 12:35:00',10000.00),(6,106,3,'2023-11-27 09:12:00','2023-11-27 09:05:00',10000.00),(7,107,4,'2023-11-27 09:06:00','2023-11-27 09:07:00',12000.00),(8,108,4,'2023-11-27 09:08:00','2023-11-27 09:10:00',12000.00),(9,109,2,'2023-11-27 09:42:00','2023-11-27 09:43:00',8000.00),(10,110,2,'2023-11-27 16:53:00','2023-11-27 16:55:00',8000.00);
/*!40000 ALTER TABLE `non_member_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `non_member_product`
--

DROP TABLE IF EXISTS `non_member_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_member_product` (
  `NonMemberProductID` int NOT NULL,
  `NonMemberProductTime` time NOT NULL,
  `NonMemberProductPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`NonMemberProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_member_product`
--

LOCK TABLES `non_member_product` WRITE;
/*!40000 ALTER TABLE `non_member_product` DISABLE KEYS */;
INSERT INTO `non_member_product` VALUES (1,'02:00:00',6000.00),(2,'04:00:00',8000.00),(3,'06:00:00',10000.00),(4,'12:00:00',12000.00),(5,'01:00:00',4000.00);
/*!40000 ALTER TABLE `non_member_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `SeatID` int NOT NULL,
  `FloorID` int NOT NULL,
  `IsAvailable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`SeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,1),(2,1,1),(3,1,0),(4,1,1),(5,1,1),(6,1,0),(7,1,0),(8,1,1),(9,1,0),(10,1,1),(11,2,1),(12,2,0),(13,2,1),(14,2,0),(15,2,1),(16,2,1),(17,2,0),(18,2,1),(19,2,1),(20,2,0),(21,3,1),(22,3,1),(23,3,1),(24,3,1),(25,3,1),(26,3,0),(27,3,1),(28,3,0),(29,3,1),(30,3,1);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_res`
--

DROP TABLE IF EXISTS `seat_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_res` (
  `ReservationID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `SeatID` int NOT NULL,
  `ReservationStartTime` datetime DEFAULT NULL,
  `CheckoutTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ReservationID`,`SeatID`),
  KEY `UserID` (`UserID`),
  KEY `SeatID` (`SeatID`),
  CONSTRAINT `seat_res_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `seat_res_ibfk_2` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_res`
--

LOCK TABLES `seat_res` WRITE;
/*!40000 ALTER TABLE `seat_res` DISABLE KEYS */;
INSERT INTO `seat_res` VALUES (1,1,1,'2023-11-23 14:00:00','2023-11-23 16:00:00'),(2,2,2,'2023-11-23 16:00:00','2023-11-23 18:00:00'),(3,3,4,'2023-11-23 10:00:00','2023-11-23 16:00:00'),(4,4,5,'2023-11-23 09:00:00','2023-11-23 15:00:00'),(5,5,8,'2023-11-23 08:00:00','2023-11-23 16:00:00'),(6,6,10,'2023-11-24 15:00:00',NULL),(7,7,11,'2023-11-24 16:00:00',NULL),(8,8,13,'2023-11-24 16:00:00',NULL),(9,9,15,'2023-11-24 18:00:00',NULL),(10,10,16,'2023-11-24 20:00:00',NULL),(11,101,18,'2023-11-23 14:00:00','2023-11-23 16:00:00'),(12,102,19,'2023-11-23 17:00:00','2023-11-23 19:00:00'),(13,103,21,'2023-11-24 14:00:00',NULL),(14,104,22,'2023-11-24 15:00:00',NULL),(15,105,23,'2023-11-24 16:00:00',NULL),(16,106,24,'2023-11-24 17:00:00',NULL),(17,107,25,'2023-11-24 18:00:00',NULL),(18,108,27,'2023-11-24 19:00:00',NULL),(19,109,29,'2023-11-24 20:00:00',NULL),(20,110,30,'2023-11-24 21:00:00',NULL);
/*!40000 ALTER TABLE `seat_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_member_payment`
--

DROP TABLE IF EXISTS `sp_member_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_member_payment` (
  `SP_PaymentID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `SP_ProductID` int NOT NULL,
  `SP_PaymentStartTime` datetime DEFAULT NULL,
  `SP_PaymentCompleteTime` datetime DEFAULT NULL,
  `SP_PaymentAmount` decimal(10,2) DEFAULT NULL,
  `InviteID` int NOT NULL,
  PRIMARY KEY (`SP_PaymentID`,`SP_ProductID`),
  KEY `UserID` (`UserID`),
  KEY `InviteID` (`InviteID`),
  KEY `SP_ProductID` (`SP_ProductID`),
  CONSTRAINT `sp_member_payment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `member` (`UserID`),
  CONSTRAINT `sp_member_payment_ibfk_2` FOREIGN KEY (`InviteID`) REFERENCES `member` (`UserID`),
  CONSTRAINT `sp_member_payment_ibfk_3` FOREIGN KEY (`SP_ProductID`) REFERENCES `special_product` (`SP_ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_member_payment`
--

LOCK TABLES `sp_member_payment` WRITE;
/*!40000 ALTER TABLE `sp_member_payment` DISABLE KEYS */;
INSERT INTO `sp_member_payment` VALUES (1,2,1,'2023-11-26 15:12:00','2023-11-26 15:14:00',3000.00,1),(2,3,1,'2023-12-26 16:32:00','2023-12-26 16:34:00',3000.00,2),(3,6,3,'2024-04-02 16:32:00','2024-04-02 16:33:00',7000.00,3);
/*!40000 ALTER TABLE `sp_member_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_product`
--

DROP TABLE IF EXISTS `special_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_product` (
  `SP_ProductID` int NOT NULL,
  `SP_ProductTime` time NOT NULL,
  `SP_ProductPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`SP_ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_product`
--

LOCK TABLES `special_product` WRITE;
/*!40000 ALTER TABLE `special_product` DISABLE KEYS */;
INSERT INTO `special_product` VALUES (1,'02:00:00',3000.00),(2,'04:00:00',5000.00),(3,'06:00:00',7000.00),(4,'12:00:00',9000.00);
/*!40000 ALTER TABLE `special_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studyroom`
--

DROP TABLE IF EXISTS `studyroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studyroom` (
  `RoomID` int NOT NULL,
  `FloorID` int NOT NULL,
  `MaxCapacity` int NOT NULL,
  `IsAvailable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studyroom`
--

LOCK TABLES `studyroom` WRITE;
/*!40000 ALTER TABLE `studyroom` DISABLE KEYS */;
INSERT INTO `studyroom` VALUES (1,1,4,1),(2,1,6,0),(3,1,10,0),(4,2,4,1),(5,2,6,1),(6,2,10,0),(7,3,4,1),(8,3,6,0),(9,3,10,0);
/*!40000 ALTER TABLE `studyroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studyroom_res`
--

DROP TABLE IF EXISTS `studyroom_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studyroom_res` (
  `ReservationID` int NOT NULL AUTO_INCREMENT,
  `RoomID` int NOT NULL,
  `UserID` int NOT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ReservationID`,`RoomID`),
  KEY `RoomID` (`RoomID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `studyroom_res_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `studyroom` (`RoomID`),
  CONSTRAINT `studyroom_res_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `member` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studyroom_res`
--

LOCK TABLES `studyroom_res` WRITE;
/*!40000 ALTER TABLE `studyroom_res` DISABLE KEYS */;
INSERT INTO `studyroom_res` VALUES (1,1,1,'2023-11-22 10:00:00','2023-11-22 12:00:00'),(2,4,2,'2023-11-22 15:00:00','2023-11-22 17:00:00'),(3,5,10,'2023-11-22 11:00:00','2023-11-22 13:00:00'),(4,7,9,'2023-11-23 19:00:00','2023-11-23 21:00:00');
/*!40000 ALTER TABLE `studyroom_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL,
  `UserType` enum('Member','NonMember') COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Member'),(2,'Member'),(3,'Member'),(4,'Member'),(5,'Member'),(6,'Member'),(7,'Member'),(8,'Member'),(9,'Member'),(10,'Member'),(101,'NonMember'),(102,'NonMember'),(103,'NonMember'),(104,'NonMember'),(105,'NonMember'),(106,'NonMember'),(107,'NonMember'),(108,'NonMember'),(109,'NonMember'),(110,'NonMember');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29 19:59:26
