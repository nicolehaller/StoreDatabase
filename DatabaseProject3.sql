-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: store
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `CID` int(11) NOT NULL,
  `c_first` varchar(20) NOT NULL,
  `c_last` varchar(20) NOT NULL,
  `c_street` varchar(60) DEFAULT NULL,
  `c_city` varchar(20) DEFAULT NULL,
  `c_state` char(2) DEFAULT NULL,
  `c_zipcode` int(11) DEFAULT NULL,
  `c_account` varchar(35) NOT NULL,
  `c_password` varchar(35) NOT NULL,
  `c_phone` char(10) DEFAULT NULL,
  `c_borough` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Sara','Haines','7 Hane Ln','Woodmere','NY',11598,'sh@gmail.com','sh1','516666666','Staten Island'),(2,'Jane','Hines','6 Broad Ln','Cedarhurst','NY',11558,'jh@gmail.com','jh1','516766666','Staten Island'),(3,'Leah','Krame','5 Hawk Ln','Flushing','NY',11227,'lk@gmail.com','lk1','516666667','Queens'),(4,'Kayla','Will','7 Tree Ln','Flushing','NY',11898,'kw@gmail.com','kw1','516666669','Queens'),(5,'Harry','Lin','5 Inwood Ln','Brownsville','NY',11899,'hl@gmail.com','hl1','516666664','Brooklyn'),(6,'Jim','Noon','8 Jewel Ln','Lawrence','NY',11557,'jn@gmail.com','jn1','516666661','Staten Island'),(7,'Jeff','Holl','7 Beach Ln','Woodmere','NY',11598,'jh@gmail.com','jh1','516666662','Staten Island');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery` (
  `delivery_ID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `purchase_ID` int(11) NOT NULL,
  `d_street` varchar(60) DEFAULT NULL,
  `d_city` varchar(20) DEFAULT NULL,
  `d_state` char(2) DEFAULT NULL,
  `d_zipcode` char(5) DEFAULT NULL,
  `d_date` date DEFAULT NULL,
  `survey_date` date DEFAULT NULL,
  `survey_method` varchar(20) DEFAULT NULL,
  `survey_comments` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`delivery_ID`),
  KEY `SID` (`SID`),
  KEY `purchase_ID` (`purchase_ID`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `staff` (`SID`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`purchase_ID`) REFERENCES `purchase` (`purchase_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,1,'7 Hane Ln','Woodmere','NY','11598','2024-05-15','2024-05-15','stars','5 stars'),(2,1,2,'6 Broad Ln','Cedarhurst','NY','11558','2023-05-17','2023-05-17','stars',NULL),(3,2,3,'6 Bind Ln','Cedarhurst','NY','11558','2024-05-16','2024-05-16','letter grade','A+ amazing'),(4,3,4,'6 Borrow Ln','Cedarhurst','NY','11558','2024-05-15','2024-05-15','letter grade','A+++ amazing'),(5,4,5,'80 Borrow Ln','Cedarhurst','NY','11558','2023-05-02','2023-05-02','number','10/10 reccomend'),(6,5,6,'500 Borrow Ln','Cedarhurst','NY','11558','2022-05-15','2022-05-15','number','10/10 recommend, for questions my email is nh@gmail.com');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `prod_ID` int(11) NOT NULL,
  `prod_name` varchar(40) NOT NULL,
  `prod_type` varchar(30) NOT NULL,
  `calories` int(11) DEFAULT NULL,
  `sodium` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `discontinued_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Cheerios','Cereal',100,10,0,'2024-05-15','2024-05-15','2027-05-15'),(2,'Blue Diamond Dog Food','Pets',100,10,1,'2024-05-16',NULL,NULL),(3,'Fish Food','Pets',NULL,NULL,1,'2024-05-17',NULL,NULL),(4,'Apple','Produce',1,0,1,'2025-05-17',NULL,NULL),(5,'Baby Food','Baby',15,5,1,'2025-05-18',NULL,NULL),(6,'Steak','Meat',200,25,1,'2025-05-18',NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_warehouse`
--

DROP TABLE IF EXISTS `product_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_warehouse` (
  `prod_warehouse_ID` int(11) NOT NULL AUTO_INCREMENT,
  `prod_ID` int(11) NOT NULL,
  `WID` int(11) NOT NULL,
  PRIMARY KEY (`prod_warehouse_ID`),
  KEY `prod_ID` (`prod_ID`),
  KEY `WID` (`WID`),
  CONSTRAINT `product_warehouse_ibfk_1` FOREIGN KEY (`prod_ID`) REFERENCES `product` (`prod_ID`),
  CONSTRAINT `product_warehouse_ibfk_2` FOREIGN KEY (`WID`) REFERENCES `warehouse` (`WID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_warehouse`
--

LOCK TABLES `product_warehouse` WRITE;
/*!40000 ALTER TABLE `product_warehouse` DISABLE KEYS */;
INSERT INTO `product_warehouse` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,2),(5,5,3),(6,6,4);
/*!40000 ALTER TABLE `product_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchase` (
  `purchase_ID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `prod_ID` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `credit_card_exp_date` char(5) DEFAULT NULL,
  PRIMARY KEY (`purchase_ID`),
  KEY `CID` (`CID`),
  KEY `prod_ID` (`prod_ID`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`prod_ID`) REFERENCES `product` (`prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1,1,5,'cash','2024-05-15',NULL),(2,2,2,15,'credit card','2023-05-15','08/24'),(3,3,3,20,'cash','2024-05-15',NULL),(4,3,1,6,'cash','2024-05-14',NULL),(5,4,5,10,'credit card','2023-05-01','08/24'),(6,5,6,100,'cash','2022-05-15',NULL),(7,2,3,5,'cash','2024-05-15',NULL),(8,2,3,5,'cash','2024-05-14',NULL);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rating` (
  `RID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `Prod_ID` int(11) NOT NULL,
  `rating_method` varchar(20) DEFAULT NULL,
  `rating_date` date DEFAULT NULL,
  `rating_comment` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`RID`),
  KEY `CID` (`CID`),
  KEY `prod_ID` (`Prod_ID`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`Prod_ID`) REFERENCES `product` (`prod_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,1,'number','2024-05-15',NULL),(2,2,2,'stars','2023-05-15','5 stars my dog loved it! my email is: jh@gmail.com'),(3,3,3,'letter grade','2022-05-15',NULL),(4,3,1,'letter grade','2021-05-15','amazing cereal!');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `SID` int(11) NOT NULL,
  `s_first` varchar(20) NOT NULL,
  `s_last` varchar(20) NOT NULL,
  `s_street` varchar(60) DEFAULT NULL,
  `s_city` varchar(20) DEFAULT NULL,
  `s_state` char(2) DEFAULT NULL,
  `s_zipcode` char(5) DEFAULT NULL,
  `s_email` varchar(35) NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Rachel','Nin','19 Beach Ln','Woodmere','NY','11598','sh@gmail.com'),(2,'Sam','Hiss','16 Broad Ln','Cedarhurst','NY','11558','jh@gmail.com'),(3,'Evan','Jones','90 Hawk Ln','Skokie','IL','11227','lk@gmail.com'),(4,'Samantha','Williams','25 Tree Ln','Hollywood','FL','11898','kw@gmail.com'),(5,'James','Lin','80 Inwood Ln','Boca Raton','FL','11899','hl@gmail.com'),(6,'Patrick','Hull','15 Jewel Ln','Lawrence','NY','11557','jn@gmail.com'),(7,'Nancy','Alexis','19 Beach Ln','Woodmere','NY','11598','jh@gmail.com');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_dept`
--

DROP TABLE IF EXISTS `staff_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_dept` (
  `staff_dept_ID` int(11) NOT NULL,
  `SID` int(11) DEFAULT NULL,
  `dept_name` varchar(35) NOT NULL,
  PRIMARY KEY (`staff_dept_ID`),
  KEY `SID` (`SID`),
  CONSTRAINT `staff_dept_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `staff` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_dept`
--

LOCK TABLES `staff_dept` WRITE;
/*!40000 ALTER TABLE `staff_dept` DISABLE KEYS */;
INSERT INTO `staff_dept` VALUES (1,1,'produce'),(2,2,'produce'),(3,3,'maintenance'),(4,4,'register'),(5,5,'customer service'),(6,6,'kitchen'),(7,7,'maintenance');
/*!40000 ALTER TABLE `staff_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_title`
--

DROP TABLE IF EXISTS `staff_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_title` (
  `staff_title_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SID` int(11) NOT NULL,
  `staff_title_name` varchar(30) DEFAULT NULL,
  `staff_start_date` date NOT NULL,
  `staff_end_date` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`staff_title_ID`),
  KEY `SID` (`SID`),
  CONSTRAINT `staff_title_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `staff` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_title`
--

LOCK TABLES `staff_title` WRITE;
/*!40000 ALTER TABLE `staff_title` DISABLE KEYS */;
INSERT INTO `staff_title` VALUES (1,1,'grocer','2024-03-07','2024-04-07',20),(2,2,'grocer','2020-03-07','2020-04-07',25),(3,3,'janitor','2020-03-07','2020-04-07',15),(4,4,'grocer','2024-04-07',NULL,25),(5,5,'IT','2021-03-07',NULL,30),(6,6,'chef','2024-05-01',NULL,30),(7,7,'janitor','2020-03-07',NULL,15);
/*!40000 ALTER TABLE `staff_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staff_view_of_purchase`
--

DROP TABLE IF EXISTS `staff_view_of_purchase`;
/*!50001 DROP VIEW IF EXISTS `staff_view_of_purchase`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `staff_view_of_purchase` AS SELECT 
 1 AS `purchase_ID`,
 1 AS `CID`,
 1 AS `prod_ID`,
 1 AS `price`,
 1 AS `purchase_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `warehouse` (
  `WID` int(11) NOT NULL,
  `w_street` varchar(60) DEFAULT NULL,
  `w_city` varchar(20) DEFAULT NULL,
  `w_state` char(2) DEFAULT NULL,
  `w_zipcode` char(5) DEFAULT NULL,
  `w_type` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`WID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'2 Dog Ln','Skokie','IL','11227','Refridgerated'),(2,'7 Arthur Ln','Skokie','IL','11227','Refridgerated'),(3,'2 Sign Ln','Cedarhurst','NY','11557','Kitchen used to prepare foods'),(4,'4 Main Ln','Woodmere','NY','11598','Refridgerated');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `staff_view_of_purchase`
--

/*!50001 DROP VIEW IF EXISTS `staff_view_of_purchase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_view_of_purchase` AS select `purchase`.`purchase_ID` AS `purchase_ID`,`purchase`.`CID` AS `CID`,`purchase`.`prod_ID` AS `prod_ID`,`purchase`.`price` AS `price`,`purchase`.`purchase_date` AS `purchase_date` from `purchase` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-04 14:28:47
