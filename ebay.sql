CREATE DATABASE  IF NOT EXISTS `ebay` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ebay`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ebay
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `admin_email` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (NULL,'qwe123','johndoe@gmail.com');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apple`
--

DROP TABLE IF EXISTS `apple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apple` (
  `auctionId` int NOT NULL,
  PRIMARY KEY (`auctionId`),
  CONSTRAINT `apple_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `smartphone` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apple`
--

LOCK TABLES `apple` WRITE;
/*!40000 ALTER TABLE `apple` DISABLE KEYS */;
/*!40000 ALTER TABLE `apple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assisted_by`
--

DROP TABLE IF EXISTS `assisted_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assisted_by` (
  `rep_email` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`rep_email`,`email`),
  KEY `email` (`email`),
  CONSTRAINT `assisted_by_ibfk_1` FOREIGN KEY (`rep_email`) REFERENCES `customer_rep` (`rep_email`),
  CONSTRAINT `assisted_by_ibfk_2` FOREIGN KEY (`email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assisted_by`
--

LOCK TABLES `assisted_by` WRITE;
/*!40000 ALTER TABLE `assisted_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `assisted_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `creationdate` datetime DEFAULT NULL,
  `expdate` datetime DEFAULT NULL,
  `highestbidder` varchar(50) DEFAULT NULL,
  `seller` varchar(50) NOT NULL,
  `current_bid` double DEFAULT NULL,
  `min_price` double DEFAULT NULL,
  `auctionId` int NOT NULL,
  `sale_price` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (NULL,'2025-10-01 10:10:10',NULL,'johndoe@gmail.com',NULL,NULL,1,NULL),(NULL,NULL,NULL,'test@gmail.com',NULL,NULL,2,NULL),('2025-10-01 10:10:10','2025-10-01 10:10:10',NULL,'test@rutgers.edu',0,49,3,NULL),('2022-05-03 19:52:47','2025-10-01 10:10:10',NULL,'test@rutgers.edu',0,123,4,NULL),('2022-05-04 00:13:57','2024-10-02 12:11:11',NULL,'test@rutgers.edu',0,500,5,NULL);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctionbuyer`
--

DROP TABLE IF EXISTS `auctionbuyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctionbuyer` (
  `auction_Id` int NOT NULL,
  `min_bid` decimal(19,2) DEFAULT NULL,
  `min_increment` decimal(19,2) DEFAULT NULL,
  `bidder` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`auction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctionbuyer`
--

LOCK TABLES `auctionbuyer` WRITE;
/*!40000 ALTER TABLE `auctionbuyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctionbuyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidhistory`
--

DROP TABLE IF EXISTS `bidhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidhistory` (
  `seller` varchar(50) DEFAULT NULL,
  `bidder` varchar(50) DEFAULT NULL,
  `time` int DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `buyer_price` int DEFAULT NULL,
  `auction_id` int NOT NULL,
  PRIMARY KEY (`auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidhistory`
--

LOCK TABLES `bidhistory` WRITE;
/*!40000 ALTER TABLE `bidhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidsin`
--

DROP TABLE IF EXISTS `bidsin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidsin` (
  `auction_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`email`,`auction_id`),
  KEY `auction_id` (`auction_id`),
  CONSTRAINT `bidsin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `bidsin_ibfk_2` FOREIGN KEY (`auction_id`) REFERENCES `auctionbuyer` (`auction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidsin`
--

LOCK TABLES `bidsin` WRITE;
/*!40000 ALTER TABLE `bidsin` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidsin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidsto`
--

DROP TABLE IF EXISTS `bidsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidsto` (
  `auctionId` int NOT NULL,
  `auction_Id` int NOT NULL,
  PRIMARY KEY (`auctionId`,`auction_Id`),
  KEY `auction_Id` (`auction_Id`),
  CONSTRAINT `bidsto_ibfk_1` FOREIGN KEY (`auction_Id`) REFERENCES `auctionbuyer` (`auction_Id`),
  CONSTRAINT `bidsto_ibfk_2` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidsto`
--

LOCK TABLES `bidsto` WRITE;
/*!40000 ALTER TABLE `bidsto` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `auctionId` int DEFAULT NULL,
  `auction_id` int NOT NULL,
  `seller` varchar(50) NOT NULL,
  PRIMARY KEY (`auction_id`,`seller`),
  KEY `auctionId` (`auctionId`),
  KEY `seller_idx` (`seller`),
  CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`),
  CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`auction_id`) REFERENCES `bidhistory` (`auction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `createdby`
--

DROP TABLE IF EXISTS `createdby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `createdby` (
  `rep_email` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  PRIMARY KEY (`rep_email`,`admin_email`),
  KEY `admin_email` (`admin_email`),
  CONSTRAINT `createdby_ibfk_1` FOREIGN KEY (`rep_email`) REFERENCES `customer_rep` (`rep_email`),
  CONSTRAINT `createdby_ibfk_2` FOREIGN KEY (`admin_email`) REFERENCES `administrator` (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `createdby`
--

LOCK TABLES `createdby` WRITE;
/*!40000 ALTER TABLE `createdby` DISABLE KEYS */;
/*!40000 ALTER TABLE `createdby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_rep`
--

DROP TABLE IF EXISTS `customer_rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_rep` (
  `rep_email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rep_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_rep`
--

LOCK TABLES `customer_rep` WRITE;
/*!40000 ALTER TABLE `customer_rep` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google`
--

DROP TABLE IF EXISTS `google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `google` (
  `auctionId` int NOT NULL,
  PRIMARY KEY (`auctionId`),
  CONSTRAINT `google_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `smartphone` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google`
--

LOCK TABLES `google` WRITE;
/*!40000 ALTER TABLE `google` DISABLE KEYS */;
/*!40000 ALTER TABLE `google` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holds`
--

DROP TABLE IF EXISTS `holds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holds` (
  `auctionId` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `auctionId` (`auctionId`),
  CONSTRAINT `holds_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`),
  CONSTRAINT `holds_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `smartphone` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holds`
--

LOCK TABLES `holds` WRITE;
/*!40000 ALTER TABLE `holds` DISABLE KEYS */;
/*!40000 ALTER TABLE `holds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledger` (
  `sale_date` date DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `buyer` varchar(50) DEFAULT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `sale_id` int NOT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger`
--

LOCK TABLES `ledger` WRITE;
/*!40000 ALTER TABLE `ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makes`
--

DROP TABLE IF EXISTS `makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `makes` (
  `admin_email` varchar(50) NOT NULL,
  `sale_id` int NOT NULL,
  PRIMARY KEY (`sale_id`,`admin_email`),
  KEY `admin_email` (`admin_email`),
  CONSTRAINT `makes_ibfk_1` FOREIGN KEY (`admin_email`) REFERENCES `administrator` (`admin_email`),
  CONSTRAINT `makes_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ledger` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makes`
--

LOCK TABLES `makes` WRITE;
/*!40000 ALTER TABLE `makes` DISABLE KEYS */;
/*!40000 ALTER TABLE `makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderated_by`
--

DROP TABLE IF EXISTS `moderated_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderated_by` (
  `auctionId` int NOT NULL,
  `rep_email` varchar(50) NOT NULL,
  `seller` varchar(45) NOT NULL,
  PRIMARY KEY (`auctionId`,`rep_email`,`seller`),
  KEY `rep_email` (`rep_email`),
  KEY `seller_idx` (`seller`),
  CONSTRAINT `moderated_by_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`),
  CONSTRAINT `moderated_by_ibfk_2` FOREIGN KEY (`rep_email`) REFERENCES `customer_rep` (`rep_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderated_by`
--

LOCK TABLES `moderated_by` WRITE;
/*!40000 ALTER TABLE `moderated_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderated_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oneplus`
--

DROP TABLE IF EXISTS `oneplus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oneplus` (
  `auctionId` int NOT NULL,
  PRIMARY KEY (`auctionId`),
  CONSTRAINT `oneplus_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `smartphone` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oneplus`
--

LOCK TABLES `oneplus` WRITE;
/*!40000 ALTER TABLE `oneplus` DISABLE KEYS */;
/*!40000 ALTER TABLE `oneplus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other`
--

DROP TABLE IF EXISTS `other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `other` (
  `auctionId` int NOT NULL,
  PRIMARY KEY (`auctionId`),
  CONSTRAINT `other_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `smartphone` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other`
--

LOCK TABLES `other` WRITE;
/*!40000 ALTER TABLE `other` DISABLE KEYS */;
/*!40000 ALTER TABLE `other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `email` varchar(50) NOT NULL,
  `auctionId` int NOT NULL,
  PRIMARY KEY (`email`,`auctionId`),
  KEY `auctionId` (`auctionId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('test@rutgers.edu',5);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `auctionId` int NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  PRIMARY KEY (`auctionId`,`admin_email`),
  KEY `edmin_email_idx` (`admin_email`),
  CONSTRAINT `admin_email` FOREIGN KEY (`admin_email`) REFERENCES `administrator` (`admin_email`),
  CONSTRAINT `auctionId` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_date` date DEFAULT NULL,
  `total_earnings` double DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `end_user` int DEFAULT NULL,
  `best_selling` varchar(50) DEFAULT NULL,
  `report_id` int NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samsung`
--

DROP TABLE IF EXISTS `samsung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samsung` (
  `auctionId` int NOT NULL,
  PRIMARY KEY (`auctionId`),
  CONSTRAINT `samsung_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `smartphone` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samsung`
--

LOCK TABLES `samsung` WRITE;
/*!40000 ALTER TABLE `samsung` DISABLE KEYS */;
/*!40000 ALTER TABLE `samsung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searches` (
  `email` varchar(50) NOT NULL,
  `auctionID` int NOT NULL,
  PRIMARY KEY (`email`,`auctionID`),
  KEY `auctionID` (`auctionID`),
  CONSTRAINT `searches_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `searches_ibfk_2` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartphone`
--

DROP TABLE IF EXISTS `smartphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartphone` (
  `name` varchar(50) DEFAULT NULL,
  `color` varchar(40) DEFAULT NULL,
  `scondition` varchar(10) DEFAULT NULL,
  `auctionId` int NOT NULL,
  PRIMARY KEY (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone`
--

LOCK TABLES `smartphone` WRITE;
/*!40000 ALTER TABLE `smartphone` DISABLE KEYS */;
INSERT INTO `smartphone` VALUES (NULL,NULL,NULL,1),('joe','pink','BN',3),('fda','fds','BrandNew',4),('iphone3','Forest green','BrandNew',5);
/*!40000 ALTER TABLE `smartphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `balance` int DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `ccnum` char(10) DEFAULT NULL,
  `ccv` char(3) DEFAULT NULL,
  `exp` char(4) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('fdsfdsfdsf','fdsfds','fdsfsdfs',NULL,NULL,NULL,NULL,NULL,NULL),('jasss','fewdw','nice23',NULL,NULL,NULL,NULL,NULL,NULL),('gdfgdgdf','fgds','gfdgdfgdfgdf',NULL,NULL,NULL,NULL,NULL,NULL),('NICEU','IF THIS WORKS POG','FSAK',NULL,NULL,NULL,NULL,NULL,NULL),('James','jamesgmail.com','qwe123','0000-00-00',100,'123 rutgers lane',NULL,NULL,NULL),('Mr. Rutger','test@rutgers.edu','qwe123',NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2022-05-04 15:35:43
