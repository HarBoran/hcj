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
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_index` int(11) NOT NULL AUTO_INCREMENT,
  `theater_num` int(11) NOT NULL,
  `seat_name` varchar(255) NOT NULL,
  PRIMARY KEY (`seat_index`),
  KEY `sch_num_idx` (`theater_num`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'A1'),(2,1,'A2'),(3,1,'A3'),(4,1,'A4'),(5,1,'A5'),(6,1,'A6'),(7,1,'A7'),(8,1,'A8'),(9,1,'A9'),(10,1,'A10'),(11,1,'B1'),(12,1,'B2'),(13,1,'B3'),(14,1,'B4'),(15,1,'B5'),(16,1,'B6'),(17,1,'B7'),(18,1,'B8'),(19,1,'B9'),(20,1,'B10'),(21,1,'C1'),(22,1,'C2'),(23,1,'C3'),(24,1,'C4'),(25,1,'C5'),(26,1,'C6'),(27,1,'C7'),(28,1,'C8'),(29,1,'C9'),(30,1,'C10'),(31,1,'D1'),(32,1,'D2'),(33,1,'D3'),(34,1,'D4'),(35,1,'D5'),(36,1,'D6'),(37,1,'D7'),(38,1,'D8'),(39,1,'D9'),(40,1,'D10'),(41,1,'E1'),(42,1,'E2'),(43,1,'E3'),(44,1,'E4'),(45,1,'E5'),(46,1,'E6'),(47,1,'E7'),(48,1,'E8'),(49,1,'E9'),(50,1,'E10'),(51,1,'F1'),(52,1,'F2'),(53,1,'F3'),(54,1,'F4'),(55,1,'F5'),(56,1,'F6'),(57,1,'F7'),(58,1,'F8'),(59,1,'F9'),(60,1,'F10'),(61,1,'G1'),(62,1,'G2'),(63,1,'G3'),(64,1,'G4'),(65,1,'G5'),(66,1,'G6'),(67,1,'G7'),(68,1,'G8'),(69,1,'G9'),(70,1,'G10'),(71,1,'H1'),(72,1,'H2'),(73,1,'H3'),(74,1,'H4'),(75,1,'H5'),(76,1,'H6'),(77,1,'H7'),(78,1,'H8'),(79,1,'H9'),(80,1,'H10'),(81,1,'I1'),(82,1,'I2'),(83,1,'I3'),(84,1,'I4'),(85,1,'I5'),(86,1,'I6'),(87,1,'I7'),(88,1,'I8'),(89,1,'I9'),(90,1,'I10'),(91,1,'J1'),(92,1,'J2'),(93,1,'J3'),(94,1,'J4'),(95,1,'J5'),(96,1,'J6'),(97,1,'J7'),(98,1,'J8'),(99,1,'J9'),(100,1,'J10'),(101,2,'A1'),(102,2,'A2'),(103,2,'A3'),(104,2,'A4'),(105,2,'A5'),(106,2,'A6'),(107,2,'A7'),(108,2,'A8'),(109,2,'A9'),(110,2,'A10'),(111,2,'B1'),(112,2,'B2'),(113,2,'B3'),(114,2,'B4'),(115,2,'B5'),(116,2,'B6'),(117,2,'B7'),(118,2,'B8'),(119,2,'B9'),(120,2,'B10'),(121,2,'C1'),(122,2,'C2'),(123,2,'C3'),(124,2,'C4'),(125,2,'C5'),(126,2,'C6'),(127,2,'C7'),(128,2,'C8'),(129,2,'C9'),(130,2,'C10'),(131,2,'D1'),(132,2,'D2'),(133,2,'D3'),(134,2,'D4'),(135,2,'D5'),(136,2,'D6'),(137,2,'D7'),(138,2,'D8'),(139,2,'D9'),(140,2,'D10'),(141,2,'E1'),(142,2,'E2'),(143,2,'E3'),(144,2,'E4'),(145,2,'E5'),(146,2,'E6'),(147,2,'E7'),(148,2,'E8'),(149,2,'E9'),(150,2,'E10'),(151,2,'F1'),(152,2,'F2'),(153,2,'F3'),(154,2,'F4'),(155,2,'F5'),(156,2,'F6'),(157,2,'F7'),(158,2,'F8'),(159,2,'F9'),(160,2,'F10'),(161,2,'G1'),(162,2,'G2'),(163,2,'G3'),(164,2,'G4'),(165,2,'G5'),(166,2,'G6'),(167,2,'G7'),(168,2,'G8'),(169,2,'G9'),(170,2,'G10'),(171,2,'H1'),(172,2,'H2'),(173,2,'H3'),(174,2,'H4'),(175,2,'H5'),(176,2,'H6'),(177,2,'H7'),(178,2,'H8'),(179,2,'H9'),(180,2,'H10'),(181,2,'I1'),(182,2,'I2'),(183,2,'I3'),(184,2,'I4'),(185,2,'I5'),(186,2,'I6'),(187,2,'I7'),(188,2,'I8'),(189,2,'I9'),(190,2,'I10'),(191,2,'J1'),(192,2,'J2'),(193,2,'J3'),(194,2,'J4'),(195,2,'J5'),(196,2,'J6'),(197,2,'J7'),(198,2,'J8'),(199,2,'J9'),(200,2,'J10');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-20 12:01:37
