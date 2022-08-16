CREATE DATABASE  IF NOT EXISTS `palliativecare` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `palliativecare`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: palliativecare
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `workerId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `available` varchar(3) DEFAULT NULL,
  `phoneNumber` varchar(24) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`workerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'Whoopi','Delgado','Mrs','Yes','(03) 0382 7741','ultricies.adipiscing@hotmail.ca'),(2,'Carissa','Simpson','Mrs','No','(06) 0828 4595','arcu.vel.quam@outlook.couk'),(3,'Georgia','Hopper','Sir','Yes','(04) 8863 7779','elit.nulla@protonmail.org'),(4,'Xena','Love','Ms','No','(07) 2321 7284','metus.in@outlook.com'),(5,'Brenden','Ellis','Miss','No','(05) 6729 3104','varius.nam.porttitor@icloud.edu'),(6,'Anne','Knowles','Miss','Yes','(04) 8732 1237','ridiculus.mus@icloud.ca'),(7,'David','Hahn','Ms','No','(07) 2691 8143','auctor.velit@protonmail.edu'),(8,'Basia','Dorsey','Mrs','Yes','(04) 3406 1476','nam.tempor@protonmail.net'),(9,'Wylie','Kennedy','Ms','Yes','(05) 3444 5946','adipiscing.fringilla@aol.net'),(10,'Rhona','Fisher','Mrs','No','(01) 7259 5714','lorem.auctor@outlook.ca'),(11,'Tasha','Stout','Mrs','No','(06) 8761 4973','neque.et@aol.couk'),(12,'Colby','Mcpherson','Mrs','No','(06) 6455 2604','vel.arcu@hotmail.org'),(13,'Aurelia','Barnes','Miss','No','(02) 7852 3589','vel.arcu.curabitur@icloud.org'),(14,'Gisela','Bradley','Miss','Yes','(08) 8265 7063','urna.convallis.erat@icloud.couk'),(15,'Halee','Vega','Ms','Yes','(06) 5764 1287','ac.mattis@aol.org'),(16,'Dillon','Haney','Mrs','Yes','(07) 8933 2126','ultrices.posuere@google.edu'),(17,'Chastity','Guerrero','Mr','No','(06) 4029 6502','sem.ut@hotmail.com'),(18,'Alexandra','Sawyer','Mrs','Yes','(09) 0556 5305','est@hotmail.edu'),(19,'Marsden','Hodges','Mrs','Yes','(04) 1412 2860','nisi.magna.sed@google.com'),(20,'Mona','Levine','Ms','No','(05) 2499 7745','purus.gravida.sagittis@icloud.couk');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-13 14:47:18
