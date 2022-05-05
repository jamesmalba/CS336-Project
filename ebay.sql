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
<<<<<<< HEAD
INSERT INTO `auction` VALUES (NULL,'2025-10-01 10:10:10','bid@gmail.com','johndoe@gmail.com',310000,NULL,1,NULL,NULL),(NULL,NULL,NULL,'test@gmail.com',NULL,NULL,2,NULL,NULL),('2025-10-01 10:10:10','2025-10-01 10:10:10',NULL,'test@rutgers.edu',0,49,3,NULL,NULL),('2022-05-03 19:52:47','2025-10-01 10:10:10',NULL,'test@rutgers.edu',0,123,4,NULL,NULL),('2022-05-04 00:13:57','2024-10-02 12:11:11',NULL,'test@rutgers.edu',0,500,5,NULL,NULL),('2022-05-04 15:39:37','2024-01-23 12:20:40',NULL,'test@rutgers.edu',0,400,6,NULL,NULL),('2022-05-04 20:17:47','2025-06-07 12:19:29',NULL,'test@rutgers.edu',0,900,7,NULL,NULL),('2022-05-05 02:53:12','2024-10-24 10:10:20',NULL,'bid@gmail.com',0,100,8,NULL,10.00);
=======
INSERT INTO `auction` VALUES (NULL,'2025-10-01 10:10:10',NULL,'johndoe@gmail.com',NULL,NULL,1,NULL,NULL),(NULL,NULL,NULL,'test@gmail.com',NULL,NULL,2,NULL,NULL),('2025-10-01 10:10:10','2025-10-01 10:10:10',NULL,'test@rutgers.edu',0,49,3,NULL,NULL),('2022-05-03 19:52:47','2025-10-01 10:10:10',NULL,'test@rutgers.edu',0,123,4,NULL,NULL),('2022-05-04 00:13:57','2024-10-02 12:11:11',NULL,'test@rutgers.edu',0,500,5,NULL,NULL),('2022-05-04 15:39:37','2024-01-23 12:20:40',NULL,'test@rutgers.edu',0,400,6,NULL,NULL),('2022-05-04 20:17:47','2025-06-07 12:19:29',NULL,'test@rutgers.edu',0,900,7,NULL,NULL);
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
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
INSERT INTO `auctionbuyer` VALUES (1,0.00,'bid@gmail.com',0.00,310000.00),(2,0.00,'test@gmail.com',0.00,NULL),(3,0.00,'bid@gmail.com',0.00,1999.00),(4,0.00,'bid@gmail.com',0.00,10000.00),(6,0.00,'bid@gmail.com',0.00,NULL),(7,0.00,'test@rutgers.edu',0.00,NULL),(8,0.00,'test@rutgers.edu',0.00,400.00);
=======
  `bidder` varchar(50) DEFAULT NULL,
  `autolimit` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`auction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctionbuyer`
--

LOCK TABLES `auctionbuyer` WRITE;
/*!40000 ALTER TABLE `auctionbuyer` DISABLE KEYS */;
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
  `bidder` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email`),
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
INSERT INTO `bidsin` VALUES (1,'bid@gmail.com',NULL);
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
INSERT INTO `bidsto` VALUES (1,1,'bid@gmail.com');
=======
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
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
INSERT INTO `electronics` VALUES (NULL,NULL,NULL,1,NULL,NULL,NULL),('joe','pink','BN',3,NULL,NULL,NULL),('fda','fds','BrandNew',4,NULL,NULL,NULL),('iphone3','Forest green','BrandNew',5,NULL,NULL,NULL),('Iphone20','Blue','BrandNew',6,NULL,NULL,NULL),('iphone13','Forest Green','Broken',7,'Apple','128gb','12in'),('testphone','green','Opened',8,'Apple','100gb','10in');
=======
INSERT INTO `electronics` VALUES (NULL,NULL,NULL,1,NULL,NULL,NULL),('joe','pink','BN',3,NULL,NULL,NULL),('fda','fds','BrandNew',4,NULL,NULL,NULL),('iphone3','Forest green','BrandNew',5,NULL,NULL,NULL),('Iphone20','Blue','BrandNew',6,NULL,NULL,NULL),('iphone13','Forest Green','Broken',7,'Apple','128gb','12in');
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
INSERT INTO `holds` VALUES (7,7),(8,8);
=======
INSERT INTO `holds` VALUES (7,7);
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
INSERT INTO `posts` VALUES ('test@rutgers.edu',5),('test@rutgers.edu',6),('test@rutgers.edu',7),('bid@gmail.com',8);
=======
INSERT INTO `posts` VALUES ('test@rutgers.edu',5),('test@rutgers.edu',6),('test@rutgers.edu',7);
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
INSERT INTO `smartphone` VALUES (7,'ATT','Pentioni5','Lightning'),(8,'verision','1020','fjdsa');
=======
INSERT INTO `smartphone` VALUES (7,'ATT','Pentioni5','Lightning');
>>>>>>> refs/remotes/origin/main
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
INSERT INTO `user` VALUES ('joe ds','bid@gmail.com','qwe123','2021-10-20',NULL,'3232',NULL,NULL,NULL),('fdsfdsfdsf','fdsfds','fdsfsdfs',NULL,NULL,NULL,NULL,NULL,NULL),('jasss','fewdw','nice23',NULL,NULL,NULL,NULL,NULL,NULL),('gdfgdgdf','fgds','gfdgdfgdfgdf',NULL,NULL,NULL,NULL,NULL,NULL),('NICEU','IF THIS WORKS POG','FSAK',NULL,NULL,NULL,NULL,NULL,NULL),('James','jamesgmail.com','qwe123','0000-00-00',100,'123 rutgers lane',NULL,NULL,NULL),('Mr. Rutger','test@rutgers.edu','qwe123',NULL,NULL,NULL,NULL,NULL,NULL);
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

<<<<<<< HEAD
-- Dump completed on 2022-05-05  3:14:33
=======
-- Dump completed on 2022-05-05  1:38:00
>>>>>>> refs/remotes/origin/main
