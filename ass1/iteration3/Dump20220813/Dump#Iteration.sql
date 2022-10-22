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
  `title` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(50) NOT NULL,
  `postalCode` int NOT NULL,
  `notes` text,
  `firstName` varbinary(480) DEFAULT NULL,
  `lastName` blob,
  `address` blob,
  `homePhone` varbinary(364) DEFAULT NULL,
  `mobilePhone` varbinary(384) DEFAULT NULL,
  `email` blob,
  PRIMARY KEY (`carerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carer`
--

LOCK TABLES `carer` WRITE;
/*!40000 ALTER TABLE `carer` DISABLE KEYS */;
INSERT INTO `carer` VALUES (1,'Miss','1951-10-16','Blenheim','South Island',2958,'ac urna. Ut tincidunt vehicula risus. Nulla eget',_binary 'x\��#SF��\�O\" �',_binary '\�I\�K�\��I���7$��',_binary '4�\Z��\�\�?4�=8i��\��\�q\�)O3	+=',_binary '�ZaAz��\�4QTf�B\�',_binary '*�\�@\�/�\"�\�y�\�',_binary 'rzv;zWWU\�дNKp�\�Lހխ�\� e-9l'),(2,'Ms','1968-04-01','Dannevirke','South Island',7954,'blandit. Nam',_binary '\���H�N��\0`f<T\�',_binary '�\�\"�\�\�\'\'.�\�Qµ\�',_binary '��1yR(��j	.�\�ɉ',_binary 's��\�WV\�\n.\�ܻs,�',_binary '�+���\�D\�*@9�1?�\�',_binary '�آ�>\�y��\�q\�ޮ�G�>\"sn\08'),(3,'Sir','1923-03-14','Dannevirke','North Island',6962,'non sapien molestie orci tincidunt adipiscing. Mauris molestie',_binary 'e��\\�}~\"+\nJͲ�',_binary '�V\�\r��\�\�XrZnK��',_binary '\�Ѻ?�C1\�x��\\x:5\��c�\�a\��',_binary '\�y��\�l?b#�\�uW',_binary '\�\�o�H\�yI9<\�ç',_binary '�7��^��F����r�ۦ��\Z;\�A\�\�v\�-$r'),(4,'Mr','1966-10-01','Motueka','South Island',7224,'est tempor bibendum. Donec',_binary '�xG\�\�g�*xm�\�޷',_binary '܆\����\�)\nls\\N\r\�',_binary 'oX�\�D���jk[\�M}M<�E5ف\�<6\�\�',_binary '\�dj\�!X\�\�Dsي\\',_binary 'lZ����.]�\"��*',_binary '�1�d�Tܽb\�RQji��5��Ow�L}�n��'),(5,'Miss','1962-02-15','Alexandra','North Island',7504,'Proin non massa non ante',_binary '�\Z�r�y��y�M9D5',_binary 'v5&L(�@�������',_binary '�\�\�\r\�\�#Dz-�!:À\rL��>\'�H�wJt',_binary 'P�k�	��b55;��',_binary 'C�\�\�p5f���',_binary '��x\Zm\�̆�\�Ŗ\�F\�H���ʟ5Mζ\�\��'),(6,'Mr','1965-12-17','Upper Hutt','South Island',7223,'consectetuer rhoncus. Nullam',_binary '\�J>�y�\�9<\�O�9�',_binary 'wBI�J�U7\�\�\�',_binary '\�g⁾:�|\"\��곀�q\�ޮ�G�>\"sn\08',_binary '��8hWi�_�\'\�]�sn',_binary 'W~v��.=\�鐗\�_\��\r',_binary '��н\�_\�\���\��\��1�Ƹ�=���;^�z`�'),(7,'Mr','1967-04-25','Waiheke Island','South Island',6956,'enim, condimentum eget, volutpat ornare, facilisis',_binary '-߱��\�\�\�\�R\�\�',_binary 'M6b��iW뗫��|',_binary '�>T\��@\\\�ּ\�o�\�ղO\�����\"�@���',_binary 'f\�a/��I�\�}汄�',_binary '�\�ӳ%\�^���)$8}�C',_binary '܄�(\�1?\�;ٞ�!gg�����|��>�97���c'),(8,'Ms','1949-12-09','Hastings','South Island',2346,'cursus, diam at pretium aliquet, metus urna convallis',_binary '�V\�\'¥LJ��Ѱ�\�}',_binary '��\�k�\��2t�̓�',_binary '��\�È�t�\Z�+q%ZF\����\0�����_S*�k',_binary '[j�\r��6h�(w��\�\�',_binary '�L\r\�Z�\�Kܪ\'\�w�}]',_binary '��/�\�8���esF��q>��y�\�\�\�,⾿J\�\�b̺94��}� x�'),(9,'Miss','1964-05-25','Balclutha','North Island',3363,'est tempor bibendum. Donec felis orci,',_binary '$b9�Δ\�\�\�\���',_binary '�g��0����\��Y\�',_binary '\�u��ix\�%GH3\�q\�ޮ�G�>\"sn\08',_binary '#X\�Q\��b|\�\�O',_binary '\�A\0\�E\�Dbq�L�\�\'\'',_binary '\Z]ݲ�p��O�\�]\�F����\Z;\�A\�\�v\�-$r'),(10,'Ms','1940-02-14','Rangiora','North Island',2433,'facilisis,',_binary 'x\�\�\���z7ˁX�\�7',_binary ':�\r�u��gx�1bu',_binary '�\0��؎��\������\�',_binary 'DkD�lck������\'<',_binary '\�32	\�>\�\�̘D�u�dI',_binary '\0uz\�%8��d�\�\�C��	\�=�.Q�A\�n'),(11,'Miss','1903-10-31','Dunedin','North Island',3088,'Aliquam tincidunt, nunc ac mattis ornare, lectus',_binary '�1I��A��\��:	I�',_binary '\�\�\rLc0[@0\�\�\�C',_binary '�\�\�\"��P\Z�1!fc���=5x���4�M��&',_binary '\�\��F�$;81\�de��	',_binary '\�\��l~\�\�u\'�l��-',_binary '\�t��\�N\n�ђ$/Ђ\�+�IPNv�\�eW\�\�ҳQ'),(12,'Sir','1943-03-24','Kapiti','South Island',2817,'pede.',_binary 'U\�HW&\�\�[w6Ba\�d',_binary '܅�f	+@�,�d8	',_binary '3\�3�Ӈ��v���\\�I\�4Y\��3�!�\�ֳ�m',_binary '\�LǠ;=?\�x9�,',_binary '�6�?�\��\���뵃\�',_binary ',�n��t\�%p�>�%X(�q\�ޮ�G�>\"sn\08'),(13,'Miss','1959-10-13','Wanaka','South Island',6463,'lectus convallis est, vitae',_binary '\�5ʐ=_c\��id�\� ',_binary '�\�\�)\�.�8����^\�',_binary '\�\�Cm@�K[��ܙ�,:�G������7%���w\�',_binary '&�i8����sgd\"gT',_binary '4`�\�\�\�*�!O\�Õ�',_binary '2pm]s4_��\�4\�Ms\�a�ɨ�u/�ļ#'),(14,'Miss','1945-06-21','Hawera','South Island',3732,'cursus non, egestas a, dui.',_binary '��XQ�BP�Qxm�I݂',_binary '5t�aFɊ8�a��:�\�',_binary '1\��`�\�!�\nO �A^ۮ�HԖ�\�\"�à�\�',_binary 'n3)�i��:\�\��\�p',_binary '�<��	Y0�BD�A܇',_binary 'ks�P��2�\�S�V̟1�A	\�?�M\�\r\�K�'),(15,'Miss','1943-04-11','Wanaka','North Island',6275,'sodales at,',_binary '\�҉���}�A\�;���',_binary '\�g\�\�mU\�:�\�g!2',_binary '\�;\\�M�/OY,�Q�bw�wG`����:˸Z',_binary '`V�* ߿\�2U\�gC\\�',_binary '\�\\9n?j,k�qП�\�',_binary '!�`6�Q�\rYmc���*������\�=�\\̀x�'),(16,'Ms','1961-09-28','Wanaka','South Island',5833,'malesuada malesuada. Integer id',_binary '���I5\�`���\rZ\�\�\�',_binary '��\�ۈ_\��e_	�Dby',_binary '� O#2w�e�9Y\�R|a�\�}�D_\�\�h}s',_binary ',\�C8\�r�2k�\�?�G�',_binary '\Z��������]\�a�',_binary '���?\�\�V)��^Rp�R'),(17,'Ms','1948-04-06','Dannevirke','South Island',8651,'metus facilisis lorem',_binary '�fǹ\��Y��\�KN',_binary '\�r���\�&\�W!XN��',_binary '��\rR\��x�	��p\�\�0\�3CG�2\�%�䳛�5�',_binary '\�*�\����sE%\�yLTv',_binary '�j�>v�2\�\�n\rU�!',_binary '��v`�n�\�@dt\�H�\�X�s\�~\�\�\�\�%\�9'),(18,'Ms','1913-03-21','Tauranga','South Island',6451,'venenatis lacus.',_binary '\�ԥ\�A;r\r˿�,�',_binary '[⼅\\OR�\�@*i�y6',_binary 'H\�M�h\�꒻,\�2H\�-=�\�\�τZ啘N\�\�X�&\�',_binary '\�t����X,�+\�</',_binary 'x���!�I\����\�',_binary '/AU\�\��h��b\�/mB'),(19,'Sir','1936-05-18','Alexandra','North Island',5581,'risus, at fringilla',_binary '\�{$���\�\�}aP2ޡ',_binary 'ڻ��L�Y.-�g���',_binary '`\�\�Ghc�}�t\'�%\����\0�����_S*�k',_binary '��Y�`��\�\�V\� .',_binary '\�L#)i��\�(\�<\�',_binary '�����\rӻ��ٖ;\�\���;�G(;��9A�t'),(20,'Sir','1951-03-08','Motueka','South Island',4592,'dui augue',_binary '\�0\'c�\�$\n�����',_binary '\�,<\�!�\��{�\�ȩX\�N',_binary '��M\�a|\�\�|�\�˘���41\����N�\�k�',_binary 'n,S\�_[��D�|�\�B',_binary 'R���#����t�\��',_binary '}�N���I�o\��)\Z\�5\�Q�e�Q4�Y���=H');
/*!40000 ALTER TABLE `carer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `carersouthisland`
--

DROP TABLE IF EXISTS `carersouthisland`;
/*!50001 DROP VIEW IF EXISTS `carersouthisland`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `carersouthisland` AS SELECT 
 1 AS `Carer full name`,
 1 AS `age`,
 1 AS `city`*/;
SET character_set_client = @saved_cs_client;

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
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,5,4,4,'2022-08-07 15:03:00','Question aboutan appointment','Checked the the timetable',NULL),(2,6,1,9,'2022-02-04 13:15:00','Got bored','Sang a song',NULL),(3,7,2,1,'2022-04-02 23:33:00','Question about prescription','Prescription was repeated',NULL),(4,8,5,1,'2022-05-07 12:11:00','Serious injury,advise needed','Ambulance was called',NULL);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `contactor`
--

LOCK TABLES `contactor` WRITE;
/*!40000 ALTER TABLE `contactor` DISABLE KEYS */;
INSERT INTO `contactor` VALUES (1,5,NULL),(2,19,NULL),(3,12,NULL),(4,14,NULL),(5,NULL,4),(6,NULL,1),(7,NULL,2),(8,NULL,5),(9,14,NULL);
/*!40000 ALTER TABLE `contactor` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'ALS'),(2,'Alzheimer’s Disease'),(3,'Breast Cancer'),(4,'Dementia'),(5,'Eosinophil Associated Disease (EAD)'),(6,'Congestive Heart Failure'),(7,'Huntington’s Disease'),(8,'Lymphoma'),(9,'Pancreatic Cancer'),(10,'Stroke'),(11,'Pulmonary Fibrosis'),(12,'Multiple Myeloma'),(13,'Parkinson’s Disease');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(50) NOT NULL,
  `postalCode` int NOT NULL,
  `notes` text,
  `firstName` varbinary(480) DEFAULT NULL,
  `lastName` blob,
  `address` blob,
  `homePhone` varbinary(364) DEFAULT NULL,
  `mobilePhone` varbinary(384) DEFAULT NULL,
  `email` blob,
  PRIMARY KEY (`patientId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Mr','1929-02-13','Oamaru','North Island',4579,'Etiam ligula',_binary '��<��ѧ��X,\�\�D',_binary '�3���q] \��\�',_binary 'v\�sgG\�$\�-�ߵ\\f\�=\�\�\�Ǫv\�2�X\�',_binary '�l�\�Љ�t��X\n7a',_binary 'n\�u���\�\��\��!k\�\�',_binary 'e�Y�5Coj\�\���\�}&;t�\'\rS[��:�\�?���'),(2,'Miss','1915-08-24','Tauranga','North Island',1357,'ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,',_binary 's�wL)ε��\�{{�z',_binary '\�S�痶<>Z�u���',_binary '�mf�*�ma�v<MYL\�\�aw�Pli��ڮS�\�\�',_binary '%�\\b7\�ST��y\�}А',_binary '�\�O�j�Y��o?���',_binary '`����\n*\�\�\�r�N\�\�7�\��.ē\\Ǻ�GG�N'),(3,'Miss','1925-09-11','Waiuku','North Island',6253,'aliquam iaculis, lacus pede sagittis augue, eu',_binary '�\�e!��(ќ\n�\�',_binary 'ob\�b�#2�,w\�u�&',_binary '��Z���Dl\�r\�\�\�?����N\�S�c�<\�\�v',_binary 'z1>�Ǭ\�t���I�',_binary '�H\�jI\Z�\�\�n�\0)',_binary '���U9Y?�}\�\�Kaϴ��;�G(;��9A�t'),(4,'Mr','1941-09-23','Wellington','North Island',6425,'id, ante. Nunc mauris sapien, cursus',_binary '\��9g�\'wgu��\�7\�',_binary '\�ګ�����>�\Z�*',_binary 'p!Sg�)X\�\�O��6ZIb/��&�e�+�\�\�\�',_binary 'v	L�6e�Q&�H\�͇#',_binary '{��\�i{\"�xM\�\�83�',_binary '�iRp�����Ǎa�*#]�5\�Q�e�Q4�Y���=H'),(5,'Mr','1947-04-03','Auckland','North Island',5686,'Nullam nisl. Maecenas malesuada fringilla est. Mauris eu',_binary 'u��U$F\�F^$�\0\�B',_binary '��^\ZZ(�/S連��k�',_binary '�Jϩ\�~,uG(�5�\�]i�\�r��Bn��-',_binary '\�\��\�)\�-6��Q�\�',_binary '��ݘ\��\�T5�\Z��d@',_binary 'M���\��a��+sU֤5\�Q�e�Q4�Y���=H'),(6,'Sir','1951-10-06','Gore','North Island',6546,'parturient montes, nascetur ridiculus mus. Proin vel arcu eu',_binary '�A\�(eo\�\�p\�[l/�\�',_binary '|����\0S�dc�',_binary '\��\�֊��\�*�.�l\\q\�ޮ�G�>\"sn\08',_binary '!�\��?,���@\�3-',_binary '0A+(Q�v&G�c\��S�\�',_binary 'j\�T$�\�T8\�P]\�\�O��\�C���\�*#�'),(7,'Mr','1912-07-11','Blenheim','South Island',5268,'condimentum eget,',_binary 'b�k\�9�&\n\�>��H',_binary '�R�R�k�\�P<ǜ',_binary ' �\�D�\�\�\n\�\"�Wj�ӻ���/��8\��\'',_binary '=\�\�7\� \�^�B:VD@F',_binary '�R\���?��\�Z\Z+JX',_binary 'vY~f��}hV�ΘAq ram\�\�\�\\q�\�7'),(8,'Mr','1965-01-14','Blenheim','South Island',6222,'nisi magna sed dui.',_binary '�\�08\�\�2f�2\"',_binary 'Bg@\'@�\�6D�\�\�~\�:\�',_binary '7i߽��6��SzX��\�r\\�%���^��:	�\�\�',_binary '�ꌂ\�\�qR�`�\�\�8',_binary 'u\�UħDo\�$\�����Z',_binary '\�\���\�]>%M\��i��i��5��Ow�L}�n��'),(9,'Mr','1944-03-01','Dannevirke','South Island',2814,'semper cursus. Integer mollis. Integer tincidunt',_binary '\�\�\�\��>�W�\�+',_binary 'J~��T\�\�+ce�%77i�',_binary 'k\�si\�J$Md�\�VM�\'3�#$%�y\�\���\�3�w',_binary '�&\�μ\�\�e��A���',_binary '�޻5�\�\�\�B�\�x#ƽO',_binary 'u\�(́\�n!s�\�s���\�;\0\'\�/�K�KL'),(10,'Miss','1929-08-12','Thames','North Island',5139,'pharetra, felis',_binary '�{W�}��n\�E���s>\�',_binary '��\�\r!���7��W\�',_binary 'vYb�9\�Nov�Bqy��_�\�ne\�p�\�\�*~,J�',_binary '�A\�2�\�XD�k\�ǿo',_binary '�\�:Ga��\�[�Φ\�\�\�',_binary 'N̤L�]\�!\�ވ��q�O>\�\\(\�\�\�$u�c��'),(11,'Dr','1914-01-23','Palmerston North','South Island',1367,'Suspendisse tristique neque venenatis',_binary '\�\'�\�a�Z\Z\�\�/C\�\�G',_binary '%\"%^�`}z ZD\�	~',_binary 'Vy\�<�X�\nP14��:SL*\�{0`r\�\�*_\�',_binary '8\�O\�\�\�B6\�k\�3�\�',_binary '^�/��\���\�	C<^',_binary 'c�\��r�hp�G��_}��;�G(;��9A�t'),(12,'Miss','1953-04-22','Waitakere','South Island',6663,'sit amet,',_binary 'r\\/�\"��K&l�k',_binary 'j{�e\�+94�֓�QU',_binary '�\�tb�\�\�\�K�!\�V��y�Ծ��!mv]�\�@',_binary '3�\�)1l\�5՟h�X�2b',_binary 'pO�\�Z[\�]V*<(5\�',_binary '�2�r�u\�\0��>Z�8\"\�x��E<>\�� ;0f�\�2'),(13,'Ms','1923-08-23','Rangiora','North Island',9625,'Praesent interdum ligula eu enim.',_binary '�lR�0{��-��42',_binary 'uۯ\�9e\�uYS\rÛM',_binary '.Gsx�\�x�1D\��,;��_\�s�;\'��r֝�\�',_binary 'uU8\�-\�Fw�>��2\�x9',_binary '��j�B\�\�;^ج�',_binary '\\\�ґ9�\�X,\�: $���;�G(;��9A�t'),(14,'Miss','1955-05-30','Ashburton','North Island',4294,'metus urna convallis erat, eget tincidunt dui',_binary '\�>��+\nCE�[�P',_binary '��輨C��,�oX�շ%',_binary '0|�ֲ�\�΂�\��\�^�\�Tg�2\�^\�=QFk',_binary 'تX�2\n�%�Y\�[#',_binary '\�\�Eiv߷W?�\'�\�bVW',_binary '7\'tz�ܷ���P�y��%q\�ޮ�G�>\"sn\08'),(15,'Dr','1969-12-11','Taupo','North Island',5296,'non, cursus non, egestas a, dui. Cras pellentesque.',_binary 'k��nL�L@ʏL�\�\�',_binary '\nK`���%а\�[|G�6',_binary '\��\�J�.\�8f\nQx',_binary '��B]�����]\�J\�t/�',_binary '2\0U��@��O3s�\�y�K',_binary 'Q���P��)�\�\"\�\�j�_�Dc���\�y\�;4s�U'),(16,'Mr','1954-02-07','Queenstown','North Island',3723,'nulla at sem molestie',_binary '�y\0\�;?\�\�M�0��b\Z',_binary '\��AO.E`�fb\�Xy�$�',_binary 'SWNԧ.*�)\�@�_d���%�^\�<��\�\�!Z\Z',_binary '\�с�0kǏ@��u5',_binary 'W�?rFVWSO�*Ľ\�',_binary '�\�\�\�+�\�\�=�I 9t��\�|\�[Q:�ܾ�Y�/'),(17,'Ms','1945-10-23','Picton','North Island',4669,'erat vitae risus.',_binary 's�wL)ε��\�{{�z',_binary '\�̒?���\�hԶ��',_binary '�\��1����aF�G\�+�;c�Md����m\�\�]r2',_binary 'i���*1wx�\'t',_binary 'u\�!	Gv\Z�IYu�\�',_binary 'k�wz�N�\�Z\�03�\0xY\'�\��\�mUi���\�	'),(18,'Mr','1935-01-24','Levin','South Island',5157,'Duis elementum, dui quis accumsan convallis, ante lectus convallis est,',_binary '����#\�%B }M\�Rfo',_binary 'f`\Z����\0S���\�\'',_binary 'A\�0 �s��͘�P�\�q\�ޮ�G�>\"sn\08',_binary '*6���2mk�\r`�',_binary '���H�7jcu�\�\�PN\�',_binary '�i\�EQ\"ȉ��\��	I�&H�QT�8j���1'),(19,'Dr','1961-03-19','Picton','South Island',9412,'laoreet posuere, enim nisl elementum purus, accumsan interdum',_binary '��\�\�q\���\Z',_binary '��\�\�\�)��\�yhu�',_binary ',4|M\�7jwG�Tpm\��\'$9W\�S�\�\�\�\�Y',_binary '�\�\�T�߇\�\�\'�\�\�\Z�',_binary 'n�Ө��\�7�jĕYu',_binary 'z�\�;��\Z�%73A�\�\�H���ʟ5Mζ\�\��'),(20,'Miss','1936-12-03','Balclutha','South Island',2625,'est arcu ac orci.',_binary '�\��]%6�\�NZ\�}L�',_binary 'v>�~��&E��\0\��H\�',_binary 'W�Ah�\�\�7\�n�p����*E��&�\�l�?',_binary 'DYFW\�Wq�G5\�G�',_binary '�umb\�p�\�)\�\�\�\�Q',_binary '��U6�e\�I\�(^\0\�-ƭ�\���|��}j�eM');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `patientcarers`
--

LOCK TABLES `patientcarers` WRITE;
/*!40000 ALTER TABLE `patientcarers` DISABLE KEYS */;
INSERT INTO `patientcarers` VALUES (1,11,'Friend'),(5,13,'Family member'),(4,12,'Friend'),(8,14,'District nurse'),(8,14,'District nurse'),(10,19,'Family member'),(9,18,'Friend'),(2,14,'District nurse'),(7,14,'District nurse');
/*!40000 ALTER TABLE `patientcarers` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `patientdiagnoses`
--

LOCK TABLES `patientdiagnoses` WRITE;
/*!40000 ALTER TABLE `patientdiagnoses` DISABLE KEYS */;
INSERT INTO `patientdiagnoses` VALUES (4,9,NULL),(19,6,NULL),(1,1,NULL),(1,8,NULL),(1,4,NULL),(15,13,NULL),(8,4,NULL),(9,7,NULL),(6,11,NULL),(7,1,NULL),(2,4,NULL),(4,13,NULL),(3,5,NULL),(5,10,NULL),(18,11,NULL);
/*!40000 ALTER TABLE `patientdiagnoses` ENABLE KEYS */;
UNLOCK TABLES;

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
  `title` varchar(20) DEFAULT NULL,
  `available` varchar(3) DEFAULT NULL,
  `firstName` blob,
  `lastName` blob,
  `phoneNumber` blob,
  `email` blob,
  PRIMARY KEY (`workerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'Mrs','Yes',_binary 'd\�`�v\�[+#�˦\�e\�',_binary '\ZbW쎲\�ju�Z�\�',_binary '\"�� \0ƫ�HAet!\�',_binary '}ln�|\�\�=X=����\���gyKweE,BL'),(2,'Mrs','No',_binary '\��oM\reh=�\���\�\�',_binary 'A�?��0R\�=1u��\�',_binary '\�B	HP���d\��_���\n',_binary 'V\�xSF[\0�躒�+�7^^Y��?\�P�edjL\���'),(3,'Sir','Yes',_binary 'ބ��\�^��z;�	',_binary 'qԒ?\�/\�4\�	�~2X@',_binary '6\�\�ELPM�UZ\\dw�',_binary '\�\�\�x&��9�z��T\�\"\�\����Baw4��\�H,\�'),(4,'Ms','No',_binary '=y\��\�F|.o���k',_binary '�7�\�\�@����ؕB�',_binary '\"����{\�Q&\�Xd',_binary 'e�4$5=��\�9\Z?\�\���;�G(;��9A�t'),(5,'Miss','No',_binary '\"�	6\'�\����=�PC',_binary '�KX\�0��DF\0G�',_binary '\r_P\��L\�(\�Z.7w',_binary '�8I\n��\�+߶\r\'Ó��x`j�ЮY'),(6,'Miss','Yes',_binary '\�\�[����2vI\�lr|v',_binary 'G$w.:7�/\��*\�\�wm',_binary '`�5DƝq9|K�NM',_binary '��C�U�\�G��N2o1�A	\�?�M\�\r\�K�'),(7,'Ms','No',_binary 'Gq5ԫ�?�\�\"�\�\Z��',_binary '�,;\��\'|��0�ǒ\��B',_binary '�<\�uukt@�d\�\��\�',_binary '�ս\�cf%\�\�M<�\�\0+\"{\�nE�SN��\��\�'),(8,'Mrs','Yes',_binary '��o�2�\�W���;n�\Z',_binary 'k�\��V)Z�]\'\�M?o',_binary '�\'j{\�\\p�L��+��\�',_binary '�]=�\�͐c��1�َ1\"9\��E��82I��'),(9,'Ms','Yes',_binary '~o�T\���N#x��\�2�',_binary 'o��,S�>:�m',_binary '�\�A�M-&\Z�j\Z\�e�+',_binary '1\�\��\\_��\�v���!x�ܔ���7�\�]�\��'),(10,'Mrs','No',_binary '	x���ǿ\�\�;�\\',_binary '��FJ�\�b��2L!9?l',_binary '	aE��<�\"\0G(�qY',_binary '���%4@\�q����\�4V��p3O@�\0x��7'),(11,'Mrs','No',_binary '��\Z}�\�7�E:%z�',_binary '܆\����\�)\nls\\N\r\�',_binary '\�\�P|�\�\r�\�	m[�',_binary 'xq_�v��i@:G�\Z)�d\�)�\�K\�����\�c'),(12,'Mrs','No',_binary '>ˁ�\�\�\�hA�0l���',_binary '\�Mԙᣬ��8yh4tz',_binary 'j\���qhghң@\�>[',_binary '{dB\\���w��������\Z;\�A\�\�v\�-$r'),(13,'Miss','No',_binary '\n\�L=\�:Z\�\'�\�P_',_binary '݄���c�\'R5y\����',_binary '\�\�@��Z\�\�\�άe\'',_binary '&�\�D\�z��s��\'�f�1�p\�`I���=�׀n'),(14,'Miss','Yes',_binary '/3t!e�2�\�w��\"',_binary '�5欀\��\�-\�\�HVM+',_binary '�\��mX\�]^\�\��M��\�',_binary '�\�I\0\�h\�ق;g�\�\Z8H��o�Ƶ������'),(15,'Ms','Yes',_binary '�ֱ½����\�鮾',_binary 'Eݣ\�\�L\r��\�`\�hN',_binary '4����8uo�\�',_binary '��\�*=�\�\�,YG\\P�k��(�(�\�\�~P�!�'),(16,'Mrs','Yes',_binary 'L���\��𚼓W(n�',_binary 'q���<�rF1:*\���\�9',_binary '���\�S\"*\�S�\�.:�E',_binary 'k�wz�N�\�Z\�03��&5%�~Q{\�k\�Hj6�'),(17,'Mr','No',_binary '*X\'�\�E إX*c�\�m',_binary '\�^\�}\Z�W�t�]��g',_binary '�u�4YskoUV5�\�r',_binary '\�\�	:���R\�\�m���#�\�$s�\�V\�vp��;�7�'),(18,'Mrs','Yes',_binary 'C\�j�\�����\�o�����',_binary '\�p�m��$7������mT',_binary 'JP\�\�p��\�!�',_binary '�����l�h��s�u\�j\�'),(19,'Mrs','Yes',_binary '�MjL�\�\0`\�f�c',_binary '\�𶫲\�z��\�$��!�',_binary 'r�\�\�+a�\��Hؤ,�r',_binary '?·���\\z�\��\�wI\�Yٔ8\�U\0~�1F'),(20,'Ms','No',_binary '\��9g�\'wgu��\�7\�',_binary 'z�m[��%�Щ�|�',_binary '���	�\�3txN�\�\�T\�',_binary 'i+\�AL\�Y�~\�3��?隟B\\\r��!=�θ�h�\�\��K�c\�]U,��');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `carersouthisland`
--

/*!50001 DROP VIEW IF EXISTS `carersouthisland`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `carersouthisland` AS select concat(`carer`.`firstName`,' ',`carer`.`lastName`) AS `Carer full name`,timestampdiff(YEAR,`carer`.`DOB`,curdate()) AS `age`,`carer`.`city` AS `city` from `carer` where (`carer`.`district` = 'South Island') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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

-- Dump completed on 2022-08-27  8:27:53
