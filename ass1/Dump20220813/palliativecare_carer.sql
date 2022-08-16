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
-- Table structure for table `carer`
--

DROP TABLE IF EXISTS `carer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carer` (
  `carerId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `title` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `address` varchar(60) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(50) NOT NULL,
  `postalCode` int NOT NULL,
  `homePhone` varchar(24) DEFAULT NULL,
  `mobilePhone` varchar(24) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`carerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carer`
--

LOCK TABLES `carer` WRITE;
/*!40000 ALTER TABLE `carer` DISABLE KEYS */;
INSERT INTO `carer` VALUES (1,'Cooper','Russell','Miss','1951-10-16','Ap #653-5807 Egestas Ave','Blenheim','South Island',2958,'(02) 7886 1997','(08) 6076 7718','mauris.non.dui@hotmail.org','ac urna. Ut tincidunt vehicula risus. Nulla eget'),(2,'Tatyana','Colon','Ms','1968-04-01','4463 Mauris Rd.','Dannevirke','South Island',7954,'(05) 7586 9287','(05) 6723 1115','urna@hotmail.net','blandit. Nam'),(3,'Galvin','Griffith','Sir','1923-03-14','P.O. Box 587, 8612 Pede, Street','Dannevirke','North Island',6962,'(03) 1075 6676','(07) 4349 2472','vitae.erat@yahoo.org','non sapien molestie orci tincidunt adipiscing. Mauris molestie'),(4,'Mercedes','Stout','Mr','1966-10-01','P.O. Box 768, 7913 Tellus St.','Motueka','South Island',7224,'(06) 6583 7351','(07) 8906 1939','sapien.cras@icloud.edu','est tempor bibendum. Donec'),(5,'Ivana','Todd','Miss','1962-02-15','Ap #336-6228 Elit Avenue','Alexandra','North Island',7504,'(06) 6331 1303','(06) 1377 6252','commodo.at@icloud.ca','Proin non massa non ante'),(6,'Wynne','Holman','Mr','1965-12-17','148 Fusce Avenue','Upper Hutt','South Island',7223,'(06) 0712 6615','(02) 7625 7845','aenean.eget@yahoo.com','consectetuer rhoncus. Nullam'),(7,'Fletcher','Castillo','Mr','1967-04-25','P.O. Box 349, 6991 Aenean Av.','Waiheke Island','South Island',6956,'(07) 8195 5288','(02) 7399 8475','ante.ipsum.primis@aol.net','enim, condimentum eget, volutpat ornare, facilisis'),(8,'Rana','Hamilton','Ms','1949-12-09','7784 Viverra. Rd.','Hastings','South Island',2346,'(04) 3546 2841','(06) 0592 6544','augue.porttitor.interdum@google.edu','cursus, diam at pretium aliquet, metus urna convallis'),(9,'Jin','Wolf','Miss','1964-05-25','622-3007 Sem Rd.','Balclutha','North Island',3363,'(08) 1189 6289','(07) 3647 8913','dictum.augue@aol.org','est tempor bibendum. Donec felis orci,'),(10,'Rooney','Lucas','Ms','1940-02-14','5492 Arcu. St.','Rangiora','North Island',2433,'(04) 6752 7265','(05) 1558 8210','ac.eleifend@hotmail.org','facilisis,'),(11,'Xavier','Glover','Miss','1903-10-31','Ap #716-4785 A Avenue','Dunedin','North Island',3088,'(08) 7661 4848','(02) 4294 4310','id@protonmail.net','Aliquam tincidunt, nunc ac mattis ornare, lectus'),(12,'Audra','Shaw','Sir','1943-03-24','Ap #190-5402 Enim, Road','Kapiti','South Island',2817,'(05) 5709 8734','(05) 7545 4388','ultrices@aol.edu','pede.'),(13,'Sasha','Goodman','Miss','1959-10-13','Ap #661-2665 Sed St.','Wanaka','South Island',6463,'(07) 8169 6686','(05) 3664 2691','commodo@icloud.couk','lectus convallis est, vitae'),(14,'Marcia','Chaney','Miss','1945-06-21','Ap #982-4854 Morbi Road','Hawera','South Island',3732,'(01) 6811 6071','(04) 1477 1613','a.magna.lorem@icloud.ca','cursus non, egestas a, dui.'),(15,'Roth','Torres','Miss','1943-04-11','Ap #591-2711 Nec Av.','Wanaka','North Island',6275,'(03) 2133 1812','(05) 1330 8331','quis.tristique.ac@icloud.edu','sodales at,'),(16,'Laura','Harrington','Ms','1961-09-28','398-7703 Vel, Ave','Wanaka','South Island',5833,'(02) 9092 6054','(05) 4493 7280','erat@aol.org','malesuada malesuada. Integer id'),(17,'Zenaida','Mcdaniel','Ms','1948-04-06','P.O. Box 809, 1454 Nunc Rd.','Dannevirke','South Island',8651,'(04) 9277 6182','(04) 7524 1441','nulla.aliquet@icloud.edu','metus facilisis lorem'),(18,'Branden','Carrillo','Ms','1913-03-21','Ap #336-776 Nisl. Street','Tauranga','South Island',6451,'(09) 0056 4768','(05) 1134 4643','erat@aol.net','venenatis lacus.'),(19,'Oscar','Craig','Sir','1936-05-18','897-8640 Pede Av.','Alexandra','North Island',5581,'(07) 1392 2063','(04) 9531 1893','facilisis@google.com','risus, at fringilla'),(20,'Nell','Ross','Sir','1951-03-08','406-2619 Hymenaeos. Road','Motueka','South Island',4592,'(02) 7717 1660','(03) 7269 5544','ultrices@outlook.couk','dui augue');
/*!40000 ALTER TABLE `carer` ENABLE KEYS */;
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
