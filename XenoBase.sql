-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: cssql.seattleu.edu    Database: mm_sttest1
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `Address_ID` int(11) NOT NULL AUTO_INCREMENT,
  `City_City_ID` int(11) NOT NULL,
  `Street_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Address_ID`),
  KEY `fk_Address_City1_idx` (`City_City_ID`),
  CONSTRAINT `fk_Address_City1` FOREIGN KEY (`City_City_ID`) REFERENCES `City` (`City_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,1,'123 Timber Ln'),(2,1,'456  Broadway St'),(3,1,'789 Marion Way'),(4,2,'101 Columbia Ave'),(5,1,'342 16th Ave'),(6,3,'420 Blaze St'),(7,4,'543 12th Ave'),(8,5,'1001 Madison Ave'),(9,6,'732 Martin Luther King Blvd');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `Admin_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Admin_FName` varchar(45) NOT NULL,
  `Admin_LName` varchar(45) NOT NULL,
  `Admin_Date_Hired` date NOT NULL,
  `Admin_Date_Terminated` date DEFAULT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,'Dylan','Gnatz','2018-01-06',NULL),(2,'Tom ','Brady','2018-01-06',NULL),(3,'Diego','Hoyos','2018-01-06',NULL),(4,'John','Benjamin','2018-03-06',NULL),(5,'Jim ','Morrison','2018-05-06','2018-09-06'),(6,'Patti ','Smith','2018-05-06',NULL),(7,'David','Bowie','2018-06-06',NULL),(8,'Lou','Reed','2018-06-06',NULL),(9,'Joan','Jett','2018-06-07','2018-10-07');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnalystTeam`
--

DROP TABLE IF EXISTS `AnalystTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnalystTeam` (
  `Analyst_Team_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Analyst_FName` varchar(45) NOT NULL,
  `Analyst_LName` varchar(45) NOT NULL,
  `Analyst_Date_Hired` date NOT NULL,
  `Anal_Date_Terminated` date DEFAULT NULL,
  PRIMARY KEY (`Analyst_Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnalystTeam`
--

LOCK TABLES `AnalystTeam` WRITE;
/*!40000 ALTER TABLE `AnalystTeam` DISABLE KEYS */;
INSERT INTO `AnalystTeam` VALUES (1,'McKee','Michael','2018-06-01','2018-11-18'),(2,'Brady','Tom','2018-06-01',NULL),(3,'Hoyos','Diego','2018-06-01',NULL),(4,'Gnatz','Dylan','2018-06-01',NULL),(5,'Skodinski','Brandon','2018-06-01','2018-09-18'),(6,'Usky','John','2018-06-01','2018-11-02');
/*!40000 ALTER TABLE `AnalystTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuyOrders`
--

DROP TABLE IF EXISTS `BuyOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BuyOrders` (
  `Buy_Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Wallet_ID` int(11) NOT NULL,
  `Amount` double NOT NULL,
  `Max_Price` double NOT NULL,
  `BuyOrdersDate` date NOT NULL,
  `Was_Fulfilled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Buy_Order_ID`),
  KEY `fk_Buy Orders_Wallets1_idx` (`Wallet_ID`),
  CONSTRAINT `fk_Buy Orders_Wallets1` FOREIGN KEY (`Wallet_ID`) REFERENCES `Wallets` (`Wallet_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuyOrders`
--

LOCK TABLES `BuyOrders` WRITE;
/*!40000 ALTER TABLE `BuyOrders` DISABLE KEYS */;
INSERT INTO `BuyOrders` VALUES (1,3,40,210.64,'2018-07-24',0),(2,3,4,592.37,'2018-11-11',0),(3,3,92,119.92,'2018-11-01',1),(4,7,39,11.72,'2018-09-04',0),(5,5,4,258.89,'2018-09-13',0),(6,7,65,677.48,'2018-10-29',0),(7,2,28,83.4,'2018-09-14',1),(8,9,73,800.75,'2018-08-08',1),(9,5,25,533.81,'2018-11-08',1),(10,7,76,533.42,'2018-10-22',0),(11,5,34,291.58,'2018-07-02',0),(12,5,71,205.52,'2018-07-22',0),(13,5,54,989.35,'2018-10-20',0),(14,7,86,97.4,'2018-11-11',1),(15,3,7,213.95,'2018-05-30',0),(16,5,80,772.35,'2018-08-27',0),(17,4,75,742.13,'2018-09-30',0),(18,9,83,434.11,'2018-10-22',0),(19,2,50,918.4,'2018-08-23',0),(20,2,12,873.58,'2018-07-02',1),(21,5,68,735.89,'2018-09-18',0),(22,4,61,776.15,'2018-10-12',0),(23,1,87,396.85,'2018-09-20',0),(24,4,11,569.25,'2018-07-03',1),(25,5,81,70.61,'2018-11-13',0),(26,5,4,189.28,'2018-06-14',0),(27,6,32,541.94,'2018-06-15',0),(28,1,76,454.2,'2018-08-17',0),(29,3,51,261.93,'2018-10-14',0),(30,5,80,301.14,'2018-06-22',0),(31,8,46,594.78,'2018-06-07',0),(32,4,69,570.99,'2018-06-10',0),(33,7,35,912.76,'2018-07-14',0),(34,4,70,399.86,'2018-07-12',0),(35,8,100,626.78,'2018-09-08',0),(36,6,55,895.78,'2018-10-12',0),(37,7,82,33.8,'2018-06-03',0),(38,3,18,94.98,'2018-08-05',0),(39,4,5,612.36,'2018-10-06',0),(40,4,36,841.43,'2018-08-15',0),(41,8,76,49.19,'2018-08-17',0),(42,5,69,930.8,'2018-10-21',0),(43,2,46,737.69,'2018-06-17',0),(44,4,16,704.9,'2018-06-23',0),(45,7,53,661.35,'2018-09-09',0),(46,4,40,701.28,'2018-08-26',0),(47,4,17,204,'2018-09-19',0),(48,5,100,468.84,'2018-07-08',0),(49,4,6,943.87,'2018-09-27',0);
/*!40000 ALTER TABLE `BuyOrders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
  `City_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Country_Country_ID` int(11) NOT NULL,
  `City_Name` varchar(45) NOT NULL,
  `State_Province` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`City_ID`),
  KEY `fk_City_Country1_idx` (`Country_Country_ID`),
  CONSTRAINT `fk_City_Country1` FOREIGN KEY (`Country_Country_ID`) REFERENCES `Country` (`Country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,1,'Portland','OR'),(2,1,'Seattle','WA'),(3,1,'Weed','CA'),(4,3,'Vancouver','BC'),(5,3,'Toronto','ON'),(6,2,'Mexico City','DF');
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `Country_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Country_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'USA'),(2,'Mexico'),(3,'Canada');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Crypto`
--

DROP TABLE IF EXISTS `Crypto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Crypto` (
  `Crypto_Wallet_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Crypto_Balance` double NOT NULL DEFAULT '0',
  `Wallets_Wallet_ID` int(11) NOT NULL,
  PRIMARY KEY (`Crypto_Wallet_ID`),
  KEY `fk_Crypto_Wallets1_idx` (`Wallets_Wallet_ID`),
  CONSTRAINT `fk_Crypto_Wallets1` FOREIGN KEY (`Wallets_Wallet_ID`) REFERENCES `Wallets` (`Wallet_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crypto`
--

LOCK TABLES `Crypto` WRITE;
/*!40000 ALTER TABLE `Crypto` DISABLE KEYS */;
INSERT INTO `Crypto` VALUES (1,1000000,1),(2,300,2),(3,600,3),(4,500,4),(5,400,5),(6,200.99,6),(7,400,7),(8,600,8),(9,699.98,9);
/*!40000 ALTER TABLE `Crypto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EngineeringTeam`
--

DROP TABLE IF EXISTS `EngineeringTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EngineeringTeam` (
  `Eng_Team_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Eng_FName` varchar(45) NOT NULL,
  `Eng_LName` varchar(45) NOT NULL,
  `Eng_Date_Hired` date NOT NULL,
  `Eng_Date_Terminated` date DEFAULT NULL,
  PRIMARY KEY (`Eng_Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EngineeringTeam`
--

LOCK TABLES `EngineeringTeam` WRITE;
/*!40000 ALTER TABLE `EngineeringTeam` DISABLE KEYS */;
INSERT INTO `EngineeringTeam` VALUES (1,'Barack ','Obama','2018-08-09',NULL),(2,'Joe','Biden','2018-08-09',NULL),(3,'Richard ','Nixon','2018-08-09','2018-08-10'),(4,'Nancy','Reagan','2018-07-10',NULL),(5,'Vladimir','Lenin','2018-08-11',NULL);
/*!40000 ALTER TABLE `EngineeringTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MarketingTeam`
--

DROP TABLE IF EXISTS `MarketingTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MarketingTeam` (
  `Mark_Team_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mark_FName` varchar(45) NOT NULL,
  `Mark_LName` varchar(45) NOT NULL,
  `Mark_Date_Hired` date NOT NULL,
  `Mark_Date_Terminated` date DEFAULT NULL,
  PRIMARY KEY (`Mark_Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MarketingTeam`
--

LOCK TABLES `MarketingTeam` WRITE;
/*!40000 ALTER TABLE `MarketingTeam` DISABLE KEYS */;
INSERT INTO `MarketingTeam` VALUES (1,'Jacobey','Janes','2018-06-01',NULL),(2,'Skillet','Homes','2018-06-01',NULL),(3,'Mexico','State','2018-06-01',NULL);
/*!40000 ALTER TABLE `MarketingTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModeratorTeam`
--

DROP TABLE IF EXISTS `ModeratorTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModeratorTeam` (
  `Moderator_Team_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mod_FName` varchar(45) NOT NULL,
  `Mod_LName` varchar(45) NOT NULL,
  `Mod_Date_Hired` date NOT NULL,
  `Mod_Date_Terminated` date DEFAULT NULL,
  PRIMARY KEY (`Moderator_Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModeratorTeam`
--

LOCK TABLES `ModeratorTeam` WRITE;
/*!40000 ALTER TABLE `ModeratorTeam` DISABLE KEYS */;
INSERT INTO `ModeratorTeam` VALUES (1,'Gnatz','Dylan','2018-06-01',NULL),(2,'Brady','Tom','2018-06-01',NULL),(3,'Hoyos','Diego','2018-06-01',NULL),(4,'Hanks','Steven','2018-07-07','2018-11-18'),(5,'Bean','Michael','2018-09-18','2018-09-19'),(6,'Nixon','Richard','2018-10-18','2018-11-18');
/*!40000 ALTER TABLE `ModeratorTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OwnerTeam`
--

DROP TABLE IF EXISTS `OwnerTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OwnerTeam` (
  `Own_Team_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner_FName` varchar(45) NOT NULL,
  `Owner_LName` varchar(45) NOT NULL,
  `Owner_Date_Hired` date NOT NULL,
  `Owner_Date_Fired` date DEFAULT NULL,
  PRIMARY KEY (`Own_Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OwnerTeam`
--

LOCK TABLES `OwnerTeam` WRITE;
/*!40000 ALTER TABLE `OwnerTeam` DISABLE KEYS */;
INSERT INTO `OwnerTeam` VALUES (1,'Dylan','Gnatz','2018-01-06',NULL),(2,'Tom','Brady','2018-01-06',NULL),(3,'Diego','Hoyos','2018-01-06',NULL);
/*!40000 ALTER TABLE `OwnerTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SellOrders`
--

DROP TABLE IF EXISTS `SellOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SellOrders` (
  `Sell_Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Wallet_ID` int(11) NOT NULL,
  `Amount` double NOT NULL,
  `Price` double NOT NULL,
  `SellOrderDate` date NOT NULL,
  `Was_Fulfilled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Sell_Order_ID`),
  KEY `fk_Sell Orders_Wallets1_idx` (`Wallet_ID`),
  CONSTRAINT `fk_Sell Orders_Wallets1` FOREIGN KEY (`Wallet_ID`) REFERENCES `Wallets` (`Wallet_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SellOrders`
--

LOCK TABLES `SellOrders` WRITE;
/*!40000 ALTER TABLE `SellOrders` DISABLE KEYS */;
INSERT INTO `SellOrders` VALUES (1,2,40,210.64,'2018-07-25',0),(2,2,4,592.37,'2018-11-12',0),(3,2,92,119.92,'2018-11-02',1),(4,4,39,11.72,'2018-09-05',0),(5,3,4,258.89,'2018-09-14',0),(6,4,65,677.48,'2018-10-30',0),(7,2,28,83.4,'2018-09-15',1),(8,5,73,800.75,'2018-08-09',1),(9,3,25,533.81,'2018-11-09',1),(10,4,76,533.42,'2018-10-23',0),(11,3,34,291.58,'2018-07-03',0),(12,3,71,205.52,'2018-07-23',0),(13,3,54,989.35,'2018-10-27',0),(14,4,86,97.4,'2018-11-12',1),(15,2,7,213.95,'2018-05-31',0),(16,3,80,772.35,'2018-08-29',0),(17,3,75,742.13,'2018-10-01',0),(18,5,83,434.11,'2018-10-28',0),(19,2,50,918.4,'2018-08-24',0),(20,2,12,873.58,'2018-07-03',1),(21,3,68,735.89,'2018-09-19',0),(22,3,61,776.15,'2018-10-13',0),(23,1,87,396.85,'2018-09-29',0),(24,3,11,569.25,'2018-07-04',1),(25,3,81,70.61,'2018-11-11',0),(26,8,60,40.58,'2018-07-14',0),(27,8,68,9.37,'2018-08-23',0),(28,5,20,89.95,'2018-06-04',0),(29,9,36,18.03,'2018-08-18',0),(30,8,4,29.38,'2018-10-08',0),(31,1,28,14.88,'2018-11-12',0),(32,6,14,4.15,'2018-08-20',0),(33,4,11,68.02,'2018-08-20',0),(34,3,6,56.22,'2018-10-05',0),(35,1,18,91.27,'2018-07-12',0),(36,7,99,95.64,'2018-11-09',0),(37,2,17,11.87,'2018-10-07',0),(38,1,87,5.9,'2018-11-03',0),(39,9,49,66.96,'2018-09-03',0),(40,8,53,49.77,'2018-09-30',0),(41,7,56,6.51,'2018-09-06',0),(42,6,49,79.43,'2018-09-13',0),(43,1,40,14.27,'2018-09-08',0),(44,9,71,91.62,'2018-09-14',0),(45,6,35,83.26,'2018-11-17',0),(46,9,44,20.05,'2018-07-17',0),(47,8,100,78.83,'2018-09-05',0),(48,9,45,86.37,'2018-09-28',0),(49,8,88,41.63,'2018-10-04',0);
/*!40000 ALTER TABLE `SellOrders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `Staff_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) DEFAULT NULL,
  `Mark_Team_ID` int(11) DEFAULT NULL,
  `Own_Team_ID` int(11) DEFAULT NULL,
  `Eng_Team_ID` int(11) DEFAULT NULL,
  `Analyst_Team_ID` int(11) DEFAULT NULL,
  `Moderator_Team_ID` int(11) DEFAULT NULL,
  `Admin_Admin_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`),
  KEY `fk_Admin_Users1_idx` (`User_ID`),
  KEY `fk_Administration_Marketing Team1_idx` (`Mark_Team_ID`),
  KEY `fk_Administration_Owner Team1_idx` (`Own_Team_ID`),
  KEY `fk_Administration_Engineering Team1_idx` (`Eng_Team_ID`),
  KEY `fk_Administration_Analyst Team1_idx` (`Analyst_Team_ID`),
  KEY `fk_Administration_Moderator Team1_idx` (`Moderator_Team_ID`),
  KEY `fk_Administration_Admin1_idx` (`Admin_Admin_ID`),
  CONSTRAINT `fk_Admin_Users1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administration_Marketing Team1` FOREIGN KEY (`Mark_Team_ID`) REFERENCES `MarketingTeam` (`Mark_Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administration_Owner Team1` FOREIGN KEY (`Own_Team_ID`) REFERENCES `OwnerTeam` (`Own_Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administration_Engineering Team1` FOREIGN KEY (`Eng_Team_ID`) REFERENCES `EngineeringTeam` (`Eng_Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administration_Analyst Team1` FOREIGN KEY (`Analyst_Team_ID`) REFERENCES `AnalystTeam` (`Analyst_Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administration_Moderator Team1` FOREIGN KEY (`Moderator_Team_ID`) REFERENCES `ModeratorTeam` (`Moderator_Team_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administration_Admin1` FOREIGN KEY (`Admin_Admin_ID`) REFERENCES `Admin` (`Admin_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,NULL,1,NULL,NULL,NULL,NULL,NULL),(43,NULL,2,NULL,NULL,NULL,NULL,NULL),(44,NULL,3,NULL,NULL,NULL,NULL,NULL),(45,NULL,NULL,1,NULL,4,1,1),(46,NULL,NULL,2,NULL,2,2,2),(47,NULL,NULL,3,NULL,3,3,3),(48,NULL,NULL,NULL,1,NULL,NULL,NULL),(49,NULL,NULL,NULL,2,NULL,NULL,NULL),(50,NULL,NULL,NULL,3,NULL,6,NULL),(51,NULL,NULL,NULL,4,NULL,NULL,NULL),(52,NULL,NULL,NULL,5,NULL,NULL,NULL),(53,NULL,NULL,NULL,NULL,1,NULL,NULL),(54,NULL,NULL,NULL,NULL,5,NULL,NULL),(55,NULL,NULL,NULL,NULL,6,NULL,NULL),(56,NULL,NULL,NULL,NULL,NULL,4,NULL),(57,NULL,NULL,NULL,NULL,NULL,5,NULL),(59,NULL,NULL,NULL,NULL,NULL,NULL,4),(60,NULL,NULL,NULL,NULL,NULL,NULL,5),(61,NULL,NULL,NULL,NULL,NULL,NULL,6),(62,NULL,NULL,NULL,NULL,NULL,NULL,7),(63,NULL,NULL,NULL,NULL,NULL,NULL,8),(64,NULL,NULL,NULL,NULL,NULL,NULL,9);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transactions` (
  `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BuyOrders_Buy_Order_ID` int(11) NOT NULL,
  `SellOrders_Sell_Order_ID` int(11) NOT NULL,
  `TransactionDate` date NOT NULL,
  `Was_Mined` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Transaction_ID`),
  KEY `fk_Transactions_Buy Orders1_idx` (`BuyOrders_Buy_Order_ID`),
  KEY `fk_Transactions_Sell Orders1_idx` (`SellOrders_Sell_Order_ID`),
  CONSTRAINT `fk_Transactions_Buy Orders1` FOREIGN KEY (`BuyOrders_Buy_Order_ID`) REFERENCES `BuyOrders` (`Buy_Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transactions_Sell Orders1` FOREIGN KEY (`SellOrders_Sell_Order_ID`) REFERENCES `SellOrders` (`Sell_Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,1,1,'2018-07-26',0),(2,2,2,'2018-11-13',0),(3,3,3,'2018-11-03',1),(4,4,4,'2018-09-06',0),(5,5,5,'2018-09-15',0),(6,6,6,'2018-10-31',0),(7,7,7,'2018-09-16',0),(8,8,8,'2018-08-10',0),(9,9,9,'2018-11-10',0),(10,10,10,'2018-10-24',0),(11,11,11,'2018-07-04',0),(12,12,12,'2018-07-24',0),(13,13,13,'2018-10-28',1),(14,14,14,'2018-11-13',0),(15,15,15,'2018-06-01',0),(16,16,16,'2018-08-30',0),(17,17,17,'2018-10-02',0),(18,18,18,'2018-10-29',0),(19,19,19,'2018-08-25',0),(20,20,20,'2018-07-04',0),(21,21,21,'2018-09-20',0),(22,22,22,'2018-10-14',0),(23,23,23,'2018-09-30',0),(24,24,24,'2018-07-05',0),(25,25,25,'2018-11-12',0),(105,1,1,'2018-11-19',0),(106,1,1,'2018-11-19',0),(107,1,1,'2018-11-19',0),(108,1,1,'2018-11-19',0),(109,1,1,'2018-11-19',0);
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USD`
--

DROP TABLE IF EXISTS `USD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USD` (
  `USD_Wallet_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USD_Balance` double NOT NULL DEFAULT '0',
  `Wallets_Wallet_ID` int(11) NOT NULL,
  PRIMARY KEY (`USD_Wallet_ID`),
  KEY `fk_USD_Wallets1_idx` (`Wallets_Wallet_ID`),
  CONSTRAINT `fk_USD_Wallets1` FOREIGN KEY (`Wallets_Wallet_ID`) REFERENCES `Wallets` (`Wallet_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USD`
--

LOCK TABLES `USD` WRITE;
/*!40000 ALTER TABLE `USD` DISABLE KEYS */;
INSERT INTO `USD` VALUES (1,500,1),(2,400,2),(3,308,3),(4,500,4),(5,1095.99,5),(6,600,6),(7,999.99,7),(8,324.54,8),(9,600,9);
/*!40000 ALTER TABLE `USD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Last_Name` varchar(45) NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Address_Address_ID` int(11) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `fk_Users_Address1_idx` (`Address_Address_ID`),
  CONSTRAINT `fk_Users_Address1` FOREIGN KEY (`Address_Address_ID`) REFERENCES `Address` (`Address_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Wayne','John',1,'1967-06-02'),(2,'Cruz','Ted',3,'1989-05-02'),(3,'Davis','Wendy',2,'1978-04-03'),(4,'Rocket','Jonny',4,'2000-05-05'),(5,'Cantwell','Maria',5,'2001-06-08'),(6,'Pop','Iggy',6,'1955-07-09'),(7,'Starr','Ringo',7,'1940-08-07'),(8,'Wood','Elijah',8,'1985-03-03'),(9,'Jones','Quincy',3,'1987-04-06');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wallets`
--

DROP TABLE IF EXISTS `Wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wallets` (
  `Wallet_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Users_User_ID` int(11) NOT NULL,
  PRIMARY KEY (`Wallet_ID`),
  KEY `fk_Wallets_Users1_idx` (`Users_User_ID`),
  CONSTRAINT `fk_Wallets_Users1` FOREIGN KEY (`Users_User_ID`) REFERENCES `Users` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wallets`
--

LOCK TABLES `Wallets` WRITE;
/*!40000 ALTER TABLE `Wallets` DISABLE KEYS */;
INSERT INTO `Wallets` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `Wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mm_sttest1'
--
/*!50003 DROP PROCEDURE IF EXISTS `transaction_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mm_sttest1`@`%` PROCEDURE `transaction_add`(
		IN buyOrder 			INT(11)	,
		IN sellOrder 			INT(11)	,
		IN transactionDate 		DATE
	)
BEGIN
  INSERT into Transactions
	(
		BuyOrders_Buy_Order_ID		, 
        SellOrders_Sell_Order_ID	, 
        TransactionDate				
	)
  VALUES
	(
		buyOrder			,
        sellOrder			, 
        transactionDate		
	) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-20 11:13:15
