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
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contactId` int NOT NULL AUTO_INCREMENT,
  `contactorId` int NOT NULL,
  `patientId` int NOT NULL,
  `workerId` int NOT NULL,
  `date` datetime NOT NULL,
  `reasonCalling` text,
  `actionsTaken` text,
  `notes` text,
  PRIMARY KEY (`contactId`),
  KEY `contactorId` (`contactorId`),
  KEY `patientId` (`patientId`),
  KEY `workerId` (`workerId`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`contactorId`) REFERENCES `contactor` (`contactorId`),
  CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  CONSTRAINT `contact_ibfk_3` FOREIGN KEY (`workerId`) REFERENCES `worker` (`workerId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactor`
--

DROP TABLE IF EXISTS `contactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactor` (
  `contactorId` int NOT NULL AUTO_INCREMENT,
  `carerId` int DEFAULT NULL,
  `patientId` int DEFAULT NULL,
  PRIMARY KEY (`contactorId`),
  KEY `carerId` (`carerId`),
  KEY `patientId` (`patientId`),
  CONSTRAINT `contactor_ibfk_1` FOREIGN KEY (`carerId`) REFERENCES `carer` (`carerId`),
  CONSTRAINT `contactor_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `diagnosisId` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`diagnosisId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `patientcarers`
--

DROP TABLE IF EXISTS `patientcarers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientcarers` (
  `patientId` int NOT NULL,
  `carerId` int NOT NULL,
  `relationshipToPatient` varchar(100) NOT NULL,
  KEY `patientId` (`patientId`),
  KEY `carerId` (`carerId`),
  CONSTRAINT `patientcarers_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  CONSTRAINT `patientcarers_ibfk_2` FOREIGN KEY (`carerId`) REFERENCES `carer` (`carerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientdiagnoses`
--

DROP TABLE IF EXISTS `patientdiagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientdiagnoses` (
  `patientId` int NOT NULL,
  `diagnosisId` int NOT NULL,
  `notes` text,
  KEY `patNumb` (`patientId`),
  KEY `diagNumb` (`diagnosisId`),
  CONSTRAINT `patientdiagnoses_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  CONSTRAINT `patientdiagnoses_ibfk_2` FOREIGN KEY (`diagnosisId`) REFERENCES `diagnosis` (`diagnosisId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `patientinfo`
--

DROP TABLE IF EXISTS `patientinfo`;
/*!50001 DROP VIEW IF EXISTS `patientinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientinfo` AS SELECT 
 1 AS `patientId`,
 1 AS `title`,
 1 AS `Patient fullname`,
 1 AS `Age`,
 1 AS `homePhone`,
 1 AS `mobilePhone`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

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
-- Final view structure for view `patientinfo`
--

/*!50001 DROP VIEW IF EXISTS `patientinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientinfo` AS select `p`.`patientId` AS `patientId`,`p`.`title` AS `title`,concat(`p`.`firstName`,' ',`p`.`lastName`) AS `Patient fullname`,timestampdiff(YEAR,`p`.`DOB`,curdate()) AS `Age`,`p`.`homePhone` AS `homePhone`,`p`.`mobilePhone` AS `mobilePhone`,`p`.`email` AS `email` from `patient` `p` order by `p`.`patientId` */;
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

-- Dump completed on 2022-08-20 20:07:37
