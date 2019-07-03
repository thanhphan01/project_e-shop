CREATE DATABASE  IF NOT EXISTS `project_e_shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project_e_shop`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_e_shop
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idOrders` int(11) NOT NULL,
  `User_idUser` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `fk_Orders_User1_idx` (`User_idUser`),
  CONSTRAINT `fk_Orders_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `idProducts` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `picture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProducts`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `idProducts_UNIQUE` (`idProducts`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Useful Beer',20,'10.50 CHF','This is the new double beer. You want to get drunk with your partner? We have your solution!','beer.jpg'),(2,'Useful Dices',20,'3.50 CHF','You like to play bord games, but you lose everytime? With our new dices, you will never lose again. Your points are already on the table. ','dices.jpg'),(3,'Useful Flatware',20,'25 CHF','Climber, sailer or you just like ropes? With our new flatware you can combine your hobby with your flatware to remind you to the greatest times. ','flatware.jpg'),(4,'Useful Keys',20,'9.50 CHF','Do you have problems to open or lock your door indoor and outdoor? The new double key is your solutions. So you can lock or open your door indoor and outdoor with only one key. Our price include the installation. ','Keys.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_has_orders`
--

DROP TABLE IF EXISTS `products_has_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_has_orders` (
  `Products_idProducts` int(11) NOT NULL,
  `Orders_idOrders` int(11) NOT NULL,
  PRIMARY KEY (`Products_idProducts`,`Orders_idOrders`),
  KEY `fk_Products_has_Orders_Orders1_idx` (`Orders_idOrders`),
  KEY `fk_Products_has_Orders_Products_idx` (`Products_idProducts`),
  CONSTRAINT `fk_Products_has_Orders_Orders1` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_Orders_Products` FOREIGN KEY (`Products_idProducts`) REFERENCES `products` (`idProducts`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_has_orders`
--

LOCK TABLES `products_has_orders` WRITE;
/*!40000 ALTER TABLE `products_has_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_has_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_has_shopping cart`
--

DROP TABLE IF EXISTS `products_has_shopping cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_has_shopping cart` (
  `Products_idProducts` int(11) NOT NULL,
  `shopping cart_idshopping cart` int(11) NOT NULL,
  PRIMARY KEY (`Products_idProducts`,`shopping cart_idshopping cart`),
  KEY `fk_Products_has_shopping cart_shopping cart1_idx` (`shopping cart_idshopping cart`),
  KEY `fk_Products_has_shopping cart_Products1_idx` (`Products_idProducts`),
  CONSTRAINT `fk_Products_has_shopping cart_Products1` FOREIGN KEY (`Products_idProducts`) REFERENCES `products` (`idProducts`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_has_shopping cart_shopping cart1` FOREIGN KEY (`shopping cart_idshopping cart`) REFERENCES `shopping cart` (`idshopping cart`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_has_shopping cart`
--

LOCK TABLES `products_has_shopping cart` WRITE;
/*!40000 ALTER TABLE `products_has_shopping cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_has_shopping cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping cart`
--

DROP TABLE IF EXISTS `shopping cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping cart` (
  `idshopping cart` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`idshopping cart`),
  UNIQUE KEY `idshopping cart_UNIQUE` (`idshopping cart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping cart`
--

LOCK TABLES `shopping cart` WRITE;
/*!40000 ALTER TABLE `shopping cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping cart_has_user`
--

DROP TABLE IF EXISTS `shopping cart_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping cart_has_user` (
  `shopping cart_idshopping cart` int(11) NOT NULL,
  `User_idUser` int(11) NOT NULL,
  PRIMARY KEY (`shopping cart_idshopping cart`,`User_idUser`),
  KEY `fk_shopping cart_has_User_User1_idx` (`User_idUser`),
  KEY `fk_shopping cart_has_User_shopping cart1_idx` (`shopping cart_idshopping cart`),
  CONSTRAINT `fk_shopping cart_has_User_User1` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping cart_has_User_shopping cart1` FOREIGN KEY (`shopping cart_idshopping cart`) REFERENCES `shopping cart` (`idshopping cart`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping cart_has_user`
--

LOCK TABLES `shopping cart_has_user` WRITE;
/*!40000 ALTER TABLE `shopping cart_has_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping cart_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(45) NOT NULL,
  `pword` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `Username_UNIQUE` (`uname`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'dschelker','123'),(8,'tphan','456'),(9,'jhouda','789');
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
-- Dump completed on 2019-07-03 11:57:09
=======
-- Dump completed on 2019-07-02 16:04:25
>>>>>>> d01c87042137a8be4c0db7a538d40d17673766ab
