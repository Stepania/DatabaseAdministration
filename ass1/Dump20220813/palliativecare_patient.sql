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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientId` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`patientId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Ashton','Rocha','Mr','1929-02-13','Ap #163-9917 Gravida Street','Oamaru','North Island',4579,'(07) 4687 8129','(01) 6212 5894','id.blandit@hotmail.net','Etiam ligula'),(2,'Yolanda','Lyons','Miss','1915-08-24','Ap #427-1120 Curabitur St.','Tauranga','North Island',1357,'(08) 6207 7265','(08) 4029 7837','a.ultricies@protonmail.com','ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,'),(3,'Hashim','Dejesus','Miss','1925-09-11','Ap #868-8722 Luctus Ave','Waiuku','North Island',6253,'(02) 5044 8280','(06) 9585 0487','sed.orci@outlook.com','aliquam iaculis, lacus pede sagittis augue, eu'),(4,'Mona','Stone','Mr','1941-09-23','Ap #493-2061 Pellentesque St.','Wellington','North Island',6425,'(02) 5356 9363','(03) 5857 7316','ac.metus@outlook.couk','id, ante. Nunc mauris sapien, cursus'),(5,'Abigail','Owen','Mr','1947-04-03','Ap #838-6289 Sagittis Avenue','Auckland','North Island',5686,'(07) 2193 6533','(09) 9187 4357','cursus.non@yahoo.couk','Nullam nisl. Maecenas malesuada fringilla est. Mauris eu'),(6,'Dolan','Ewing','Sir','1951-10-06','8550 Aliquam St.','Gore','North Island',6546,'(04) 8612 5348','(03) 3257 2773','sed.sem.egestas@google.com','parturient montes, nascetur ridiculus mus. Proin vel arcu eu'),(7,'Florence','Barlow','Mr','1912-07-11','290-5610 Auctor St.','Blenheim','South Island',5268,'(09) 8222 3541','(06) 7114 2181','quis.turpis@google.edu','condimentum eget,'),(8,'Jared','Mccall','Mr','1965-01-14','Ap #980-8319 Magna. St.','Blenheim','South Island',6222,'(05) 8397 9705','(03) 5827 4110','cras.dictum@icloud.edu','nisi magna sed dui.'),(9,'Abra','Hendricks','Mr','1944-03-01','4534 Phasellus St.','Dannevirke','South Island',2814,'(08) 0715 3463','(09) 4545 4274','luctus.et.ultrices@hotmail.ca','semper cursus. Integer mollis. Integer tincidunt'),(10,'Len','Chavez','Miss','1929-08-12','Ap #603-2748 Sit Street','Thames','North Island',5139,'(07) 2507 3008','(09) 8843 3284','non.enim@icloud.couk','pharetra, felis'),(11,'Kyla','Sheppard','Dr','1914-01-23','244-2443 Consectetuer Avenue','Palmerston North','South Island',1367,'(03) 2185 7730','(02) 9117 2063','fringilla@google.com','Suspendisse tristique neque venenatis'),(12,'Dawn','Moore','Miss','1953-04-22','303-7781 Convallis Ave','Waitakere','South Island',6663,'(04) 2123 4505','(02) 2846 9476','eu.dolor.egestas@icloud.com','sit amet,'),(13,'Giselle','Gordon','Ms','1923-08-23','127-7473 Dolor, Avenue','Rangiora','North Island',9625,'(04) 9212 6145','(06) 5217 2584','penatibus@google.com','Praesent interdum ligula eu enim.'),(14,'Iris','Miller','Miss','1955-05-30','P.O. Box 894, 3203 Ipsum Av.','Ashburton','North Island',4294,'(08) 8288 4677','(02) 2121 4543','mauris@google.ca','metus urna convallis erat, eget tincidunt dui'),(15,'Hakeem','Bolton','Dr','1969-12-11','7014 Ut, Road','Taupo','North Island',5296,'(05) 1321 4647','(02) 4426 8979','tellus.non@hotmail.org','non, cursus non, egestas a, dui. Cras pellentesque.'),(16,'Tamara','Martin','Mr','1954-02-07','Ap #652-8113 Lectus Avenue','Queenstown','North Island',3723,'(07) 4364 6853','(08) 8858 7725','penatibus.et.magnis@icloud.com','nulla at sem molestie'),(17,'Yolanda','Middleton','Ms','1945-10-23','Ap #504-767 Pede Rd.','Picton','North Island',4669,'(04) 2271 4954','(06) 2584 3493','ultrices.posuere@yahoo.com','erat vitae risus.'),(18,'Mara','Armstrong','Mr','1935-01-24','7532 Cursus. St.','Levin','South Island',5157,'(07) 2815 6326','(02) 3735 6449','ut.eros.non@icloud.com','Duis elementum, dui quis accumsan convallis, ante lectus convallis est,'),(19,'Graham','Clark','Dr','1961-03-19','854-9876 Dapibus Avenue','Picton','South Island',9412,'(05) 1312 4232','(07) 9737 5138','orci.donec@icloud.ca','laoreet posuere, enim nisl elementum purus, accumsan interdum'),(20,'Kato','Herrera','Miss','1936-12-03','P.O. Box 169, 3630 Lobortis Ave','Balclutha','South Island',2625,'(05) 3086 9935','(08) 6953 2763','euismod.mauris@yahoo.com','est arcu ac orci.');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
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
