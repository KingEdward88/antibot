-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: primes_db
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `primes`
--

DROP TABLE IF EXISTS `primes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `primes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prime_number` int NOT NULL,
  `ascii` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prime_number` (`prime_number`),
  UNIQUE KEY `ascii` (`ascii`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primes`
--

LOCK TABLES `primes` WRITE;
/*!40000 ALTER TABLE `primes` DISABLE KEYS */;
INSERT INTO `primes` VALUES (1,2,'NULL'),(2,3,'SOH'),(3,5,'STX'),(4,7,'ETX'),(5,11,'EOT'),(6,13,'ENQ'),(7,17,'ACK'),(8,19,'BEL'),(9,23,'BS'),(10,29,'HT'),(11,31,'LF'),(12,37,'VT'),(13,41,'FF'),(14,43,'CR'),(15,47,'SO'),(16,53,'SI'),(17,59,'DLE'),(18,61,'DC1'),(19,67,'DC2'),(20,71,'DC3'),(21,73,'DC4'),(22,79,'NAK'),(23,83,'SYN'),(24,89,'ETB'),(25,97,'CAN'),(26,101,'EM'),(27,103,'SUB'),(28,107,'ESC'),(29,109,'FS'),(30,113,'GS'),(31,127,'RS'),(32,131,'US'),(33,137,'SPC'),(34,139,'!'),(35,149,'QUO'),(36,151,'#'),(37,157,'$'),(38,163,'%'),(39,167,'&'),(40,173,''),(41,179,'('),(42,181,')'),(43,191,'*'),(44,193,'+'),(45,197,','),(46,199,'-'),(47,211,'.'),(48,223,'/'),(49,227,'0'),(50,229,'1'),(51,233,'2'),(52,239,'3'),(53,241,'4'),(54,251,'5'),(55,257,'6'),(56,263,'7'),(57,269,'8'),(58,271,'9'),(59,277,':'),(60,281,';'),(61,283,'<'),(62,293,'='),(63,307,'>'),(64,311,'?'),(65,313,'@'),(66,317,'A'),(67,331,'B'),(68,337,'C'),(69,347,'D'),(70,349,'E'),(71,353,'F'),(72,359,'G'),(73,367,'H'),(74,373,'I'),(75,379,'J'),(76,383,'K'),(77,389,'L'),(78,397,'M'),(79,401,'N'),(80,409,'O'),(81,419,'P'),(82,421,'Q'),(83,431,'R'),(84,433,'S'),(85,439,'T'),(86,443,'U'),(87,449,'V'),(88,457,'W'),(89,461,'X'),(90,463,'Y'),(91,467,'Z'),(92,479,'['),(93,487,'\\'),(94,491,']'),(95,499,'^'),(96,503,'_'),(97,509,'`'),(98,683,'{'),(99,691,'|'),(100,701,'}'),(101,709,'~'),(102,719,'DEL'),(103,839,'æ'),(104,919,'£'),(105,937,'×'),(106,941,'ƒ'),(107,1009,'¿'),(108,1013,'®'),(109,1019,'¬'),(110,1021,'½'),(111,1031,'¼'),(112,1033,'¡'),(113,1039,'«'),(114,1049,'»'),(115,1051,'░'),(116,1061,'▒'),(117,1063,'▓'),(118,1069,'│'),(119,1087,'┤'),(120,1103,'©'),(121,1109,'╣'),(122,1117,'║'),(123,1123,'╗'),(124,1129,'╝'),(125,1151,'¢'),(126,1153,'¥'),(127,1163,'┐'),(128,1171,'└'),(129,1181,'┴'),(130,1187,'┬'),(131,1193,'├'),(132,1201,'─'),(133,1213,'┼'),(134,1229,'╚'),(135,1231,'╔'),(136,1237,'╩'),(137,1249,'╦'),(138,1259,'╠'),(139,1277,'═'),(140,1279,'╬'),(141,1283,'¤'),(142,1307,'ı'),(143,1361,'┘'),(144,1367,'┌'),(145,1373,'█'),(146,1381,'▄'),(147,1399,'¦'),(148,1423,'▀'),(149,1429,'ß'),(150,1453,'µ'),(151,1459,'þ'),(152,1499,'¯'),(153,1511,'´'),(154,1531,'±'),(155,1543,'‗'),(156,1549,'¾'),(157,1553,'¶'),(158,1559,'§'),(159,1567,'÷'),(160,1571,'¸'),(161,1579,'°'),(162,1583,'¨'),(163,1597,'·'),(164,1613,'■'),(165,1619,'nbsp');
/*!40000 ALTER TABLE `primes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-08 16:14:29
