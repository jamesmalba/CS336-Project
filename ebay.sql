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
-- Table structure for table `acontains`
--

DROP TABLE IF EXISTS `acontains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acontains` (
  `auctionId` int NOT NULL,
  `bidamount` float NOT NULL,
  `auction_id` int DEFAULT NULL,
  PRIMARY KEY (`auctionId`,`bidamount`),
  KEY `auction_id` (`auction_id`,`bidamount`),
  CONSTRAINT `acontains_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`),
  CONSTRAINT `acontains_ibfk_2` FOREIGN KEY (`auction_id`, `bidamount`) REFERENCES `bidhistory` (`auction_id`, `bidamount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acontains`
--

LOCK TABLES `acontains` WRITE;
/*!40000 ALTER TABLE `acontains` DISABLE KEYS */;
INSERT INTO `acontains` VALUES (6,500,6);
/*!40000 ALTER TABLE `acontains` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `qId` int NOT NULL,
  `rep_email` varchar(50) NOT NULL,
  PRIMARY KEY (`qId`,`rep_email`),
  KEY `rep_email` (`rep_email`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`rep_email`) REFERENCES `customer_rep` (`rep_email`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`qId`) REFERENCES `qna` (`qId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asks`
--

DROP TABLE IF EXISTS `asks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asks` (
  `qId` int NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`qId`,`email`),
  KEY `email` (`email`),
  CONSTRAINT `asks_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `asks_ibfk_2` FOREIGN KEY (`qId`) REFERENCES `qna` (`qId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asks`
--

LOCK TABLES `asks` WRITE;
/*!40000 ALTER TABLE `asks` DISABLE KEYS */;
/*!40000 ALTER TABLE `asks` ENABLE KEYS */;
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
  `minbidincrement` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES ('2022-05-07 16:34:23','2009-10-10 10:10:10',NULL,'test@rutgers.edu',0,200,1,19.00,0.00),('2022-05-07 16:34:51','2020-10-10 10:10:10',NULL,'test@rutgers.edu',0,200,2,NULL,0.00),('2022-05-08 13:34:47','2024-10-20 10:10:10','c','test@rutgers.edu',49,10,3,49.00,10.00),('2022-05-08 14:48:58','2023-10-10 10:10:10',NULL,'test@rutgers.edu',0,100,4,NULL,21.00),('2022-05-08 14:50:03','2024-10-19 10:10:10',NULL,'test@rutgers.edu',0,500,5,NULL,20.00),('2022-05-08 14:51:16','2024-10-19 10:10:10','c','test@rutgers.edu',1000,500,6,NULL,20.00);
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
  `min_increment` decimal(19,2) DEFAULT NULL,
  `bidder` varchar(50) NOT NULL,
  `autolimit` decimal(19,2) DEFAULT NULL,
  `bidamount` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`auction_Id`,`bidder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctionbuyer`
--

LOCK TABLES `auctionbuyer` WRITE;
/*!40000 ALTER TABLE `auctionbuyer` DISABLE KEYS */;
INSERT INTO `auctionbuyer` VALUES (3,0.00,'c',0.00,49.00),(6,0.00,'c',0.00,100.00),(6,0.00,'dd',0.00,1000.00);
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
  `biddt` datetime DEFAULT NULL,
  `bidamount` float NOT NULL,
  `auction_id` int NOT NULL,
  `minincrement` float DEFAULT NULL,
  `autolimitb` float DEFAULT NULL,
  PRIMARY KEY (`auction_id`,`bidamount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidhistory`
--

LOCK TABLES `bidhistory` WRITE;
/*!40000 ALTER TABLE `bidhistory` DISABLE KEYS */;
INSERT INTO `bidhistory` VALUES ('test@rutgers.edu','c','2022-05-08 15:55:41',100,6,0,0),('test@rutgers.edu','dd','2022-05-08 15:59:24',200,6,0,0),('test@rutgers.edu','dd','2022-05-08 16:06:47',500,6,0,0);
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
  `bidder` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email`,`auction_id`),
  KEY `bidsin_ibfk_2` (`auction_id`,`bidder`),
  CONSTRAINT `bidsin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `bidsin_ibfk_2` FOREIGN KEY (`auction_id`, `bidder`) REFERENCES `auctionbuyer` (`auction_Id`, `bidder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidsin`
--

LOCK TABLES `bidsin` WRITE;
/*!40000 ALTER TABLE `bidsin` DISABLE KEYS */;
INSERT INTO `bidsin` VALUES (3,'c','c'),(6,'c','c'),(6,'dd','dd');
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
  `bidder` varchar(50) NOT NULL,
  PRIMARY KEY (`auctionId`,`auction_Id`,`bidder`),
  KEY `auction_Id` (`auction_Id`,`bidder`),
  CONSTRAINT `bidsto_ibfk_1` FOREIGN KEY (`auction_Id`, `bidder`) REFERENCES `auctionbuyer` (`auction_Id`, `bidder`),
  CONSTRAINT `bidsto_ibfk_2` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidsto`
--

LOCK TABLES `bidsto` WRITE;
/*!40000 ALTER TABLE `bidsto` DISABLE KEYS */;
INSERT INTO `bidsto` VALUES (3,3,'c'),(6,6,'c'),(6,6,'dd');
/*!40000 ALTER TABLE `bidsto` ENABLE KEYS */;
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
-- Table structure for table `electronics`
--

DROP TABLE IF EXISTS `electronics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electronics` (
  `name` varchar(50) DEFAULT NULL,
  `color` varchar(40) DEFAULT NULL,
  `scondition` varchar(20) DEFAULT NULL,
  `auction_Id` int NOT NULL,
  `brand` varchar(40) DEFAULT NULL,
  `storagesize` varchar(40) DEFAULT NULL,
  `dimensions` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`auction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronics`
--

LOCK TABLES `electronics` WRITE;
/*!40000 ALTER TABLE `electronics` DISABLE KEYS */;
INSERT INTO `electronics` VALUES ('j','j','Brand New',1,'Apple','j','j'),('j','test','Brand New',2,'Apple','j','testt'),('Phone','freen','Brand New',3,'Oneplus','j','j'),('test','free','Opened',4,'Samsung','129gb','12in'),('Asus i3','Granite','Broken',5,'Asus','1tb','12in'),('Asus i3','Granite','Broken',6,'Asus','1tb','12in');
/*!40000 ALTER TABLE `electronics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holds`
--

DROP TABLE IF EXISTS `holds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holds` (
  `auctionId` int NOT NULL,
  `auction_Id` int NOT NULL,
  PRIMARY KEY (`auction_Id`,`auctionId`),
  KEY `auctionId` (`auctionId`),
  CONSTRAINT `holds_ibfk_1` FOREIGN KEY (`auctionId`) REFERENCES `auction` (`auctionId`),
  CONSTRAINT `holds_ibfk_2` FOREIGN KEY (`auction_Id`) REFERENCES `electronics` (`auction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holds`
--

LOCK TABLES `holds` WRITE;
/*!40000 ALTER TABLE `holds` DISABLE KEYS */;
INSERT INTO `holds` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `holds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS `laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptop` (
  `auction_Id` int NOT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `gpu` varchar(50) DEFAULT NULL,
  `storagetype` varchar(50) DEFAULT NULL,
  `OS` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`auction_Id`),
  CONSTRAINT `laptop_ibfk_1` FOREIGN KEY (`auction_Id`) REFERENCES `electronics` (`auction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

LOCK TABLES `laptop` WRITE;
/*!40000 ALTER TABLE `laptop` DISABLE KEYS */;
INSERT INTO `laptop` VALUES (6,'i6 4900k','RTX 3090','Both','Windows','12gb');
/*!40000 ALTER TABLE `laptop` ENABLE KEYS */;
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
INSERT INTO `posts` VALUES ('j',1),('test@rutgers.edu',2),('test@rutgers.edu',3),('test@rutgers.edu',4),('test@rutgers.edu',5),('test@rutgers.edu',6);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `question` varchar(280) DEFAULT NULL,
  `answer` varchar(280) DEFAULT NULL,
  `qId` int NOT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
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
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `item_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`item_name`, `email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
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
  `auction_Id` int NOT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `cpu` varchar(50) DEFAULT NULL,
  `connectivity` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`auction_Id`),
  CONSTRAINT `smartphone_ibfk_1` FOREIGN KEY (`auction_Id`) REFERENCES `electronics` (`auction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone`
--

LOCK TABLES `smartphone` WRITE;
/*!40000 ALTER TABLE `smartphone` DISABLE KEYS */;
INSERT INTO `smartphone` VALUES (1,'j','j','j'),(2,'test','j','j'),(3,'j','j','j');
/*!40000 ALTER TABLE `smartphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablet`
--

DROP TABLE IF EXISTS `tablet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablet` (
  `auction_Id` int NOT NULL,
  `displaytype` varchar(50) DEFAULT NULL,
  `resolution` varchar(50) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `inputmethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`auction_Id`),
  CONSTRAINT `tv_ibfk_1` FOREIGN KEY (`auction_Id`) REFERENCES `electronics` (`auction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablet`
--

LOCK TABLES `tablet` WRITE;
/*!40000 ALTER TABLE `tablet` DISABLE KEYS */;
INSERT INTO `tablet` VALUES (4,'oled','4k','Ios20','Touchscreen/stylus');
/*!40000 ALTER TABLE `tablet` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('c','c','j','2000-10-20',NULL,'j',NULL,NULL,NULL),('j','dd','j','2001-10-10',NULL,'j',NULL,NULL,NULL),('j','j','j','2000-10-11',NULL,'j',NULL,NULL,NULL),('o','o','o','2001-10-10',NULL,'o',NULL,NULL,NULL),('t','t','t','2000-10-10',NULL,'t',NULL,NULL,NULL),('Mr. Rutgers','test@rutgers.edu','qwe123','2001-10-10',NULL,'Rutgers Ave',NULL,NULL,NULL),('test','testing','1','2001-10-10',NULL,'dfsa',NULL,NULL,NULL);
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

-- Dump completed on 2022-05-08 16:06:55
