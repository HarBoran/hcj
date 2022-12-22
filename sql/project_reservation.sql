-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `sch_num` int(11) NOT NULL,
  `seat_index` int(11) NOT NULL,
  `check_user` int(11) NOT NULL,
  `nonuser_index` int(11) DEFAULT NULL,
  `user_index` int(11) DEFAULT NULL,
  `multiple_seat` varchar(45) DEFAULT NULL,
  `cancellations` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`index`),
  KEY `nonuser_index_idx` (`nonuser_index`),
  KEY `user_index_idx` (`user_index`),
  KEY `seat_index_idx` (`seat_index`),
  KEY `sch_num_idx` (`sch_num`),
  CONSTRAINT `nonuser_index` FOREIGN KEY (`nonuser_index`) REFERENCES `non_user` (`non_user_index`),
  CONSTRAINT `sch_num` FOREIGN KEY (`sch_num`) REFERENCES `schedule` (`sch_num`),
  CONSTRAINT `seat_index` FOREIGN KEY (`seat_index`) REFERENCES `seat` (`seat_index`),
  CONSTRAINT `user_index` FOREIGN KEY (`user_index`) REFERENCES `user` (`user_index`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,4,100,0,1,NULL,NULL,NULL),(2,4,91,1,NULL,3,NULL,NULL),(3,11,91,0,1,NULL,NULL,NULL),(4,11,94,0,1,NULL,NULL,NULL),(5,10,50,1,NULL,1,NULL,NULL),(21,4,70,0,1,NULL,NULL,NULL),(22,4,69,0,NULL,1,NULL,NULL),(26,4,68,0,1,NULL,NULL,NULL),(27,4,67,1,NULL,1,NULL,NULL),(29,4,66,0,1,NULL,NULL,NULL),(30,4,93,0,1,NULL,NULL,NULL),(31,4,1,0,1,NULL,NULL,NULL),(33,4,41,1,NULL,2,NULL,NULL),(35,4,82,1,NULL,2,NULL,NULL),(37,4,2,1,NULL,2,NULL,NULL),(38,4,81,1,NULL,2,NULL,NULL),(39,4,3,1,NULL,2,NULL,NULL),(40,4,34,1,NULL,2,NULL,NULL),(41,4,92,1,NULL,2,NULL,NULL),(42,4,10,1,NULL,2,NULL,NULL),(43,4,74,1,NULL,2,NULL,NULL),(45,4,14,1,NULL,2,NULL,NULL),(46,4,15,1,NULL,2,NULL,NULL),(47,4,90,1,NULL,2,NULL,NULL),(48,4,9,1,NULL,2,NULL,NULL),(49,4,94,1,NULL,2,NULL,NULL),(50,4,56,1,NULL,2,NULL,NULL),(55,1,92,1,NULL,2,NULL,NULL),(57,6,101,1,NULL,2,NULL,NULL),(58,6,102,1,NULL,2,NULL,NULL),(59,11,101,1,NULL,2,NULL,NULL),(222,2,2,1,NULL,7,NULL,'cancel'),(223,2,3,1,NULL,7,NULL,'cancel'),(224,2,4,1,NULL,7,NULL,'cancel'),(225,2,5,1,NULL,7,NULL,'cancel'),(226,2,6,1,NULL,7,NULL,'cancel'),(227,2,7,1,NULL,7,NULL,'cancel'),(228,2,8,1,NULL,7,NULL,'cancel'),(229,2,9,1,NULL,7,NULL,NULL),(230,2,10,1,NULL,7,NULL,NULL),(250,8,101,1,NULL,7,'2022-12-16 14:39','cancel'),(251,8,102,1,NULL,7,'2022-12-16 14:39','cancel'),(252,9,105,1,NULL,7,'2022-12-16 14:40','cancel'),(253,6,110,1,NULL,7,'2022-12-16 14:47',NULL),(254,10,103,1,NULL,7,'2022-12-16 14:47',NULL),(255,11,181,1,NULL,7,'2022-12-16 14:48',NULL),(256,11,182,1,NULL,7,'2022-12-16 14:48',NULL),(257,11,191,1,NULL,7,'2022-12-16 14:48',NULL),(258,6,105,1,NULL,7,'2022-12-16 14:49',NULL),(259,8,191,1,NULL,7,'2022-12-16 14:51',NULL),(260,11,113,1,NULL,7,'2022-12-16 14:51',NULL),(261,7,101,1,NULL,7,'2022-12-16 14:56',NULL),(262,6,103,1,NULL,7,'2022-12-16 14:56',NULL),(263,6,106,1,NULL,7,'2022-12-16 14:57','cancel'),(264,5,8,1,NULL,7,'2022-12-16 14:58',NULL),(265,5,9,1,NULL,7,'2022-12-16 14:58',NULL),(266,5,10,1,NULL,7,'2022-12-16 14:58',NULL),(267,5,18,1,NULL,7,'2022-12-16 14:58',NULL),(268,5,19,1,NULL,7,'2022-12-16 14:58',NULL),(269,5,20,1,NULL,7,'2022-12-16 14:58',NULL),(270,11,105,1,NULL,7,'2022-12-16 14:59',NULL),(271,11,115,1,NULL,7,'2022-12-16 14:59',NULL),(272,11,125,1,NULL,7,'2022-12-16 14:59',NULL),(273,11,135,1,NULL,7,'2022-12-16 14:59',NULL),(274,11,145,1,NULL,7,'2022-12-16 14:59',NULL),(275,11,155,1,NULL,7,'2022-12-16 14:59',NULL),(276,9,101,1,NULL,7,'2022-12-16 15:02','cancel'),(277,9,102,1,NULL,7,'2022-12-16 15:02','cancel'),(278,9,103,1,NULL,7,'2022-12-16 15:02',NULL),(279,9,104,1,NULL,7,'2022-12-16 15:02',NULL),(280,9,106,1,NULL,7,'2022-12-16 15:02',NULL),(281,9,107,1,NULL,7,'2022-12-16 15:02',NULL),(282,9,170,1,NULL,7,'2022-12-19 14:03',NULL),(283,9,180,1,NULL,7,'2022-12-19 14:03',NULL),(284,9,190,1,NULL,7,'2022-12-19 14:03',NULL),(285,9,200,1,NULL,7,'2022-12-19 14:03',NULL),(286,3,10,1,NULL,7,'2022-12-19 14:48','cancel'),(287,3,20,1,NULL,7,'2022-12-19 14:48','cancel'),(288,7,102,1,NULL,7,'2022-12-19 15:01','cancel'),(289,7,103,1,NULL,7,'2022-12-19 15:01','cancel'),(290,7,104,1,NULL,7,'2022-12-19 15:10',NULL),(291,7,105,1,NULL,7,'2022-12-19 15:10',NULL),(292,11,121,1,NULL,7,'2022-12-19 15:10',NULL),(293,11,131,1,NULL,7,'2022-12-19 15:10',NULL),(294,11,141,1,NULL,7,'2022-12-19 15:10',NULL),(295,11,151,1,NULL,7,'2022-12-19 15:10',NULL),(296,11,161,1,NULL,7,'2022-12-19 15:10',NULL),(297,11,171,1,NULL,7,'2022-12-19 15:10',NULL),(298,7,106,1,NULL,7,'2022-12-19 15:18','cancel'),(299,7,107,1,NULL,7,'2022-12-19 15:18','cancel'),(300,7,108,1,NULL,7,'2022-12-19 15:24','cancel'),(301,7,109,1,NULL,7,'2022-12-19 15:24','cancel'),(302,7,110,1,NULL,7,'2022-12-19 15:24','cancel'),(303,1,1,1,NULL,7,'2022-12-20 09:45',NULL),(304,1,2,1,NULL,7,'2022-12-20 09:45',NULL),(305,1,3,1,NULL,7,'2022-12-20 09:45',NULL),(306,1,4,1,NULL,7,'2022-12-20 09:45',NULL),(307,1,5,1,NULL,7,'2022-12-20 09:45',NULL),(309,1,7,1,NULL,7,'2022-12-20 09:57',NULL),(310,1,8,1,NULL,7,'2022-12-20 09:57',NULL),(311,7,119,1,NULL,7,'2022-12-20 10:41','cancel'),(312,7,120,1,NULL,7,'2022-12-20 10:41','cancel'),(313,9,108,1,NULL,7,'2022-12-20 14:49','cancel'),(314,9,109,1,NULL,7,'2022-12-20 14:49','cancel'),(315,9,110,1,NULL,7,'2022-12-20 14:49','cancel'),(316,9,120,1,NULL,7,'2022-12-20 14:49','cancel'),(317,6,104,1,NULL,7,'2022-12-21 10:02',NULL),(318,6,107,1,NULL,7,'2022-12-21 10:02',NULL),(319,2,1,1,NULL,7,'2022-12-21 10:14',NULL),(320,2,11,1,NULL,7,'2022-12-21 10:14',NULL),(321,2,12,1,NULL,7,'2022-12-21 10:14',NULL),(322,2,19,1,NULL,7,'2022-12-21 10:14',NULL),(323,1,9,1,NULL,7,'2022-12-22 15:23',NULL),(324,1,10,1,NULL,7,'2022-12-22 15:23',NULL),(325,7,115,1,NULL,7,'2022-12-22 15:23',NULL),(326,7,116,1,NULL,7,'2022-12-22 15:23',NULL),(327,7,117,1,NULL,7,'2022-12-22 15:23',NULL),(328,7,118,1,NULL,7,'2022-12-22 15:23',NULL);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-22 15:59:56
