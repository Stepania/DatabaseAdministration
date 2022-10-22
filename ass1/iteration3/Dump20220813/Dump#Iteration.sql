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
INSERT INTO `carer` VALUES (1,'Miss','1951-10-16','Blenheim','South Island',2958,'ac urna. Ut tincidunt vehicula risus. Nulla eget',_binary 'x\èó#SF¢‘\ßO\" Œ',_binary '\ÓI\íK\çğI‹®À7$…—',_binary '4\Zœ\è\Ú?4¡=8i¢\Úü\ëq\Ç)O3	+=',_binary 'ZaAz¡½\Ä4QTf©B\îŒ',_binary '*¼\É@\ì/ˆ\"Ÿ\Ây¨\ê',_binary 'rzv;zWWU\ëĞ´NKp‡\ŞLŞ€Õ­Š\Ò e-9l'),(2,'Ms','1968-04-01','Dannevirke','South Island',7954,'blandit. Nam',_binary '\á«¦HùN‘‘\0`f<T\Å',_binary 'Š\Å\"\Í\Ó\'\'.²\ÊQÂµ\ê¨',_binary 'À 1yR(©–j	.‰\×É‰',_binary 's”¸\çWV\Î\n.\ãÜ»s,õ',_binary 'Á+ÿ·\ÛD\å*@9£1?‹\×',_binary 'Ø¢Á>\ÔyüğŸ\Éq\åŞ®¬G—>\"sn\08'),(3,'Sir','1923-03-14','Dannevirke','North Island',6962,'non sapien molestie orci tincidunt adipiscing. Mauris molestie',_binary 'e¥—\\ù}~\"+\nJÍ²À',_binary '“V\Õ\røœ\Û\ïXrZnKúŸ',_binary '\ÍÑº?òC1\êˆx±ù\\x:5\ì¡c²\äŒa\éÁ',_binary '\Éy¸õ\ïl?b#\êuW',_binary '\È\æo£H\ÇyI9<\ÚÃ§',_binary '¢7³ñ^±ƒF‰«»öröÛ¦—²\Z;\äA\Ã\Ãv\ß-$r'),(4,'Mr','1966-10-01','Motueka','South Island',7224,'est tempor bibendum. Donec',_binary 'ûxG\Ç\ïgó´*xm\ßŞ·',_binary 'Ü†\Îü—\â)\nls\\N\r\×',_binary 'oX\ÕD‚ jk[\é«M}M<¯E5Ù\É<6\Ä\æ©',_binary '\Údj\Î!X\á£\ÑDsÙŠ\\',_binary 'lZ†ƒ´.]õ\"ÿ·*',_binary '´1•d‡TÜ½b\ßRQji™§5‹şOwÁL}šn”‡'),(5,'Miss','1962-02-15','Alexandra','North Island',7504,'Proin non massa non ante',_binary 'ø\ZrşyŒy“M9D5',_binary 'v5&L(ƒ@ÀŸ÷ö‚¦ø',_binary '¸\å\î\r\Ï\Ì#Dz-˜!:Ã€\rL‚¥>\'öH÷wJt',_binary 'Pük§	«ıb55;ªŠ',_binary 'C\Ó\Úp5fğ“”ˆµ',_binary 'Á—x\Zm\åÌ†…\ÏÅ–\ÜF\ëHòœÊŸ5MÎ¶\Ã\àÀ'),(6,'Mr','1965-12-17','Upper Hutt','South Island',7223,'consectetuer rhoncus. Nullam',_binary '\ÉJ>½yı\È9<\ÛO‡9¿',_binary 'wBI÷J÷U7\å\Õ\ê',_binary '\Ögâ¾:ı|\"\âûê³€q\åŞ®¬G—>\"sn\08',_binary 'ø8hWiú_›\'\Å]…sn',_binary 'W~v÷•.=\âé—\ë_\Ëø\r',_binary '¼¢Ğ½\Å_\Ú\ßü£\ãõ\İü1ñÆ¸¢=”—µ;^–z`½'),(7,'Mr','1967-04-25','Waiheke Island','South Island',6956,'enim, condimentum eget, volutpat ornare, facilisis',_binary '-ß±“¼\Ì\Ê\İ\áR\æ»\Ä',_binary 'M6b‰·iWë—«–|',_binary 'ñ³>T\Èı@\\\ÙÖ¼\èo®\ëÕ²O\×ÿ—ú„\"“@™‘Œ',_binary 'f\ãa/³ŠI‡\Ï}æ±„›',_binary 'ù\ëÓ³%\Ï^“½Ÿ)$8}©C',_binary 'Ü„ƒ(\Ò1?\è;Ù‰!gg¹‰º”Œ|»»>·97’‰c'),(8,'Ms','1949-12-09','Hastings','South Island',2346,'cursus, diam at pretium aliquet, metus urna convallis',_binary 'œV\Â\'Â¥LJ©„Ñ°†\Ä}',_binary '·”\ík \ç£2tšÍƒ',_binary '€¯\íÃˆ¹t­\Z¹+q%ZF\ÅúöÀ\0°Œù‘˜_S*‘k',_binary '[jˆ\r˜€6hµ(w¶\î\é',_binary 'šL\r\éZô\ïKÜª\'\éwğ}]',_binary 'š/ö\á8”…¸esFŸ€q>œ†y¸\Ü\á\Ñ,â¾¿J\ì\ŞbÌº94®ø} x¿'),(9,'Miss','1964-05-25','Balclutha','North Island',3363,'est tempor bibendum. Donec felis orci,',_binary '$b9ıÎ”\ë\Ñ\í›\äû•',_binary '§g¬‰0÷¬\ÒõY\ê',_binary '\Ïu²¿ix\İ%GH3\î³q\åŞ®¬G—>\"sn\08',_binary '#X\ïQ\äñšb|\Ğ\åO',_binary '\ÑA\0\ÌE\ÔDbqÿLÁ\ã\'\'',_binary '\Z]İ²€p‘ùOú\ä]\éF­¦—²\Z;\äA\Ã\Ãv\ß-$r'),(10,'Ms','1940-02-14','Rangiora','North Island',2433,'facilisis,',_binary 'x\İ\Ô\Äôöz7ËXó\Ü7',_binary ':•\r§uòögxğ1bu',_binary 'ù\0˜ÁØù‰\Íó÷½†Ÿ\Ä',_binary 'DkD÷lck «¾¯ˆ\'<',_binary '\í32	\È>\é\èÌ˜DªuğdI',_binary '\0uz\Ä%8€ôdš\ë\ÛC¶›	\ë=ö.Q”A\ân'),(11,'Miss','1903-10-31','Dunedin','North Island',3088,'Aliquam tincidunt, nunc ac mattis ornare, lectus',_binary '1I¸Aˆ•\âÀ:	I¢',_binary '\Õ\î­\rLc0[@0\ì\Ê\ÓC',_binary '»\è\Ø\"‹ıP\Z›1!fc’¹¯=5x”¬—4¾M™&',_binary '\Ö\çşF‹$;81\Ödeƒ¯	',_binary '\è\Üÿl~\Û\àu\'‚l…÷-',_binary '\Òt¸û\ÇN\n¬Ñ’$/Ğ‚\Ù+ŠIPNv˜\ÛeW\Î\ÃÒ³Q'),(12,'Sir','1943-03-24','Kapiti','South Island',2817,'pede.',_binary 'U\ÇHW&\Î\Ø[w6Ba\Ëd',_binary 'Ü…¿f	+@ˆ,ôd8	',_binary '3\á3şÓ‡˜†v‘„²\\—I\Ñ4Y\åñ3!¯\å¦Ö³Šm',_binary '\ĞLÇ ;=?\Şx9„,',_binary 'ˆ6¼?¸\çú\ã”¶ëµƒ\Ğ',_binary ',Šn¯ºt\Ú%p³>¸%X(·q\åŞ®¬G—>\"sn\08'),(13,'Miss','1959-10-13','Wanaka','South Island',6463,'lectus convallis est, vitae',_binary '\æ5Ê=_c\Ï¢idõ\ê ',_binary '©\Ê\Ç)\Ó.³8œ¥µ¸^\ë',_binary '\é\ÅCm@—K[€¯Ü™³,:¹GŒªş³¹ª7%©…¯w\Â',_binary '&“i8‹Œ¡ˆsgd\"gT',_binary '4`¼\Ü\Â\Ï*§!O\êÃ•¿',_binary '2pm]s4_÷„\æ4\ÉMs\ÊaøÉ¨›u/Ä¼#'),(14,'Miss','1945-06-21','Hawera','South Island',3732,'cursus non, egestas a, dui.',_binary '£øXQóBPúQxm¦Iİ‚',_binary '5t”aFÉŠ8³aŸù:¶\Õ',_binary '1\Üö`–\Â!¯\nO ñA^Û®—HÔ–Ÿ\í­\"ˆÃ ò\Ç',_binary 'n3)¡i«ñ:\í\íˆ\èp',_binary 'ƒ<À¡	Y0•BDœAÜ‡',_binary 'ks¦Pƒ2„\ÍSVÌŸ1óA	\ä?—M\Ñ\r\ÊK•'),(15,'Miss','1943-04-11','Wanaka','North Island',6275,'sodales at,',_binary '\ÎÒ‰÷‹}A\Ø;§ş',_binary '\Şg\Ç\åmU\Í:’\Ğg!2',_binary '\ï;\\ŸMø/OY,Q«bwwG`‚•šñ:Ë¸Z',_binary '`Vˆ* ß¿\Ì2U\ÇgC\\£',_binary '\É\\9n?j,k¥qĞŸ¦\è',_binary '!¢`6üQó\rYmcÿ¸»*…úõ„…ˆ\â=¿\\Í€x¡'),(16,'Ms','1961-09-28','Wanaka','South Island',5833,'malesuada malesuada. Integer id',_binary '„®ñI5\Ô`„÷–\rZ\Â\Ğ\ì',_binary '¼³\çÛˆ_\Âòe_	ªDby',_binary '° O#2w“e 9Y\ĞR|aÀ\Ã}ˆD_\Ê\ê˜h}s',_binary ',\ÅC8\Ñrû2k‰\Ä?¥G¶',_binary '\Z†•§‘½šö¾]\Şaÿ',_binary 'ö‡?\İ\ïV)ı^Rp¾R'),(17,'Ms','1948-04-06','Dannevirke','South Island',8651,'metus facilisis lorem',_binary 'fÇ¹\İ”YŸ¡\âKN',_binary '\Är³ğ¦\Ù&\ÆW!XN¿—',_binary '½ˆ\rR\áõx	úœp\Ó\å0\î3CG†2\èŠ%ğä³›Š5Á',_binary '\ì*€\ÛøÀ¨sE%\ÜyLTv',_binary '‹j>v†2\â\Õn\rU•!',_binary '‹ÿv`òn·\Ú@dt\ãH§\ÎXŒs\Æ~\Ñ\Ë\î\â%\á9'),(18,'Ms','1913-03-21','Tauranga','South Island',6451,'venenatis lacus.',_binary '\ëÔ¥\ÈA;r\rË¿ù, ',_binary '[â¼…\\ORõ\İ@*iùy6',_binary 'H\æMõh\éê’»,\Ù2H\æ-=±\Ş\ĞÏ„Zå•˜N\ê\ÍX“&\æ',_binary '\ît©®ı„X,‡+\è</',_binary 'xÿ°¯!»I\ïş•¼\å',_binary '/AU\í—\äòh©¡b\Í/mB'),(19,'Sir','1936-05-18','Alexandra','North Island',5581,'risus, at fringilla',_binary '\Ñ{$‘Ÿ·\â\è}aP2Ş¡',_binary 'Ú»¹¤LñY.-—gô§±',_binary '`\È\ìGhcñ}ñt\'û%\ÅúöÀ\0°Œù‘˜_S*‘k',_binary 'øY®`²¬\Ë\ÓV\à .',_binary '\éL#)i‹°\ä(\Î<\íµ',_binary '«¿‹û‚\rÓ»õ¬Ù–;\É\Ò¹…;şG(;º¿9A¼t'),(20,'Sir','1951-03-08','Motueka','South Island',4592,'dui augue',_binary '\Ö0\'c¶\Å$\nù†¤¤‡',_binary '\Ù,<\Ü!ğ\Ôø{¶\ÛÈ©X\íN',_binary '”›M\Èa|\æ¤\Ï|ü\áË˜œúª41\Æô²‡N»\Òkõ',_binary 'n,S\Ã_[º±D‡|µ\ĞB',_binary 'R¼¯œ#¡¨ÿ®t¤\Ëø',_binary '}N±I¿o\Äğ“)\Z\ï¤5\ÒQ•e½Q4£Y„³=H');
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
INSERT INTO `diagnosis` VALUES (1,'ALS'),(2,'Alzheimerâ€™s Disease'),(3,'Breast Cancer'),(4,'Dementia'),(5,'Eosinophil Associated Disease (EAD)'),(6,'Congestive Heart Failure'),(7,'Huntingtonâ€™s Disease'),(8,'Lymphoma'),(9,'Pancreatic Cancer'),(10,'Stroke'),(11,'Pulmonary Fibrosis'),(12,'Multiple Myeloma'),(13,'Parkinsonâ€™s Disease');
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
INSERT INTO `patient` VALUES (1,'Mr','1929-02-13','Oamaru','North Island',4579,'Etiam ligula',_binary '³´<õ¾Ñ§®šX,\Û\ãD',_binary '¼îº»3„¾q] \êø\Ê',_binary 'v\âsgG\Ë$\Ø-ˆßµ\\f\ß=\Í\ç\àÇªv\Ë2©X\í´',_binary 'l´\×Ğ‰ótˆÀX\n7a',_binary 'n\Âuù¿ñ\í\ÔÀ\à†!k\Ğ\Î',_binary 'eñY²5Coj\Ã\ÇöÀ\å}&;t•\'\rS[‡:®\Ï?“º…'),(2,'Miss','1915-08-24','Tauranga','North Island',1357,'ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,',_binary 's•wL)Îµ–ş\Ş{{z',_binary '\åS•ç—¶<>Zºuƒªü',_binary 'mf±*šma—v<MYL\Ë\áaw´Pli¥Ú®S¥\Ï\Ä',_binary '%„\\b7\æST´y\Õ}Ğ',_binary '‘\ßO¶j¿YŒ—o?«‹½',_binary '`û™›\n*\â\Ø\×rˆN\Í\Ù7›\Äô.Ä“\\Çº GGŠN'),(3,'Miss','1925-09-11','Waiuku','North Island',6253,'aliquam iaculis, lacus pede sagittis augue, eu',_binary '…\âe!şÁ(Ñœ\n‚\Ö',_binary 'ob\×b²#2º,w\Åu½&',_binary 'ŒõZ”¹§Dl\Ùr\Ñ\ß\Ã?ˆ–ÀN\ÍS¹c•<\æ\Ôv',_binary 'z1>‚Ç¬\Ùtœ÷ŸI¡',_binary '‰H\ÊjI\Zû\Ö\Ñn’\0)',_binary '¨µU9Y?¿}\ä\ÃKaÏ´¹…;şG(;º¿9A¼t'),(4,'Mr','1941-09-23','Wellington','North Island',6425,'id, ante. Nunc mauris sapien, cursus',_binary '\Ø÷9gÿ\'wgu·\á7\Ş',_binary '\ÜÚ«²£À¯©>§\Zª*',_binary 'p!Sg˜)X\Å\ÈO˜”6ZIb/Á£&˜eş+û\Æ\è¦\è',_binary 'v	L¿6e’Q&®H\ÄÍ‡#',_binary '{†¨\ái{\"‰xM\ì\æ83ò',_binary 'œiRpŸÿ€‰óÇa“*#]¤5\ÒQ•e½Q4£Y„³=H'),(5,'Mr','1947-04-03','Auckland','North Island',5686,'Nullam nisl. Maecenas malesuada fringilla est. Mauris eu',_binary 'u‹»U$F\îF^$ÿ\0\ãB',_binary '¯–^\ZZ(’/Sé€£¬ k¢',_binary '³JÏ©\å~,uG(ú5\ë]i\ïr¢«Bnñ­-',_binary '\ê´\Æó\á)\Ì-6®·Qñ¬\Ì',_binary 'ˆ¯İ˜\Úó\ëT5‚\Zº¢d@',_binary 'M°‹¤\ìôa“¿+sUÖ¤5\ÒQ•e½Q4£Y„³=H'),(6,'Sir','1951-10-06','Gore','North Island',6546,'parturient montes, nascetur ridiculus mus. Proin vel arcu eu',_binary '…A\ä(eo\æ\ãp\ß[l/›\Ö',_binary '|ò¾¥‘³\0S¦dc©',_binary '\îı\êÖŠ‘‡\ã€*….‡l\\q\åŞ®¬G—>\"sn\08',_binary '!ñ†\ãğ¬?,õ·¦@\æ3-',_binary '0A+(Q÷v&G‡c\Å÷S\Æ',_binary 'j\êT$ÿ\ÍT8\ÅP]\Ó\ÔOœ‡\ŞCõ”÷\î’Â*#»'),(7,'Mr','1912-07-11','Blenheim','South Island',5268,'condimentum eget,',_binary 'b„k\ë³9œ&\n\İ>‡‰H',_binary 'R®R¤k†\ÙP<Çœ',_binary ' ¸\ì¸D©\É\Ş\n\ï\"šWjÁÓ»¬¹“/«›8\èû\'',_binary '=\×\Û7\Ï \×^ºB:VD@F',_binary '¦R\Ûõ¸?¯«\ïZ\Z+JX',_binary 'vY~fğ¾}hV¡Î˜Aq ram\Ä\Ã\å\\q’\Ş7'),(8,'Mr','1965-01-14','Blenheim','South Island',6222,'nisi magna sed dui.',_binary 'º\Ü08\ä\ê‡2f2\"',_binary 'Bg@\'@±\Î6Dü\Ò\Õ~\ß:\é',_binary '7iß½ø²6ªûSzX…’\îr\\¤%³•ò^Œò:	\Å\Ã',_binary '½êŒ‚\Ì\ÎqRö`ö\Ï\Û8',_binary 'u\àUÄ§Do\Ú$\ØÁù¾Z',_binary '\Ã\æüˆ\î]>%M\á¸ó¹i»¥i™§5‹şOwÁL}šn”‡'),(9,'Mr','1944-03-01','Dannevirke','South Island',2814,'semper cursus. Integer mollis. Integer tincidunt',_binary '\è¼\Ğ\Ï\Õˆ>ÁWÀ\î+',_binary 'J~¢’T\×\Í+ceø%77iˆ',_binary 'k\Êsi\ËJ$Md¨\áVMÿ\'3Ÿ#$%·y\Ó\Ê´³\İ3ªw',_binary 'Ÿ&\áÎ¼\Ò\æe©ÁA‹¥¶',_binary 'Ş»5Š\Ğ\ß\ÒB³\Åx#Æ½O',_binary 'u\å(Ì\ån!sˆ\Õsˆ—ü\ë¼;\0\'\Õ/ôKóKL'),(10,'Miss','1929-08-12','Thames','North Island',5139,'pharetra, felis',_binary '¾{W¸}™ón\ÃE€¬Šs>\Æ',_binary '½±\ä\r!ş­ı7…ƒW\È',_binary 'vYb¿9\ãNovŸBqy‡ø_ğ\æne\ßp\é\İ*~,Jƒ',_binary 'şA\ç2ø\ÙXD·k\ÜÇ¿o',_binary '²\Ô:Gaºù\á[‰Î¦\Õ\Ñ\â‚',_binary 'NÌ¤L¾]\å!\ïŞˆ»µq‚O>\æ\\(\Ä\Ô\Ê$u¶cµ¨'),(11,'Dr','1914-01-23','Palmerston North','South Island',1367,'Suspendisse tristique neque venenatis',_binary '\è€\'³\Âa›Z\Z\Ø\Ú/C\ß\æG',_binary '%\"%^¡`}z ZD\Î	~',_binary 'Vy\Ş<üX’\nP14¥´:SL*\Ú{0`r\Ä\×*_\Ï',_binary '8\ÊO\Ù\é\ÌB6\Ök\î3ú\Ù',_binary '^”/Áˆ\íõ“\Ø	C<^',_binary 'c—\ÕúrhpGƒ¢_}¹…;şG(;º¿9A¼t'),(12,'Miss','1953-04-22','Waitakere','South Island',6663,'sit amet,',_binary 'r\\/—\"’‹K&lÁk',_binary 'j{òe\Æ+94¾Ö“¨QU',_binary 'º\àtbö\Ë\é½\ÙK¨!\ÄV­±y³Ô¾ù!mv]›\Ó@',_binary '3 \â)1l\Ó5ÕŸh¤X¢2b',_binary 'pO„\âZ[\ï]V*<(5\Ú',_binary '­2´rˆu\Ü\0Áš>Z‡8\"\ÈxÿºE<>\Ëğ ;0fû\è2'),(13,'Ms','1923-08-23','Rangiora','North Island',9625,'Praesent interdum ligula eu enim.',_binary 'œlR½0{­·-‹›42',_binary 'uÛ¯\æ9e\æuYS\rÃ›M',_binary '.Gsxó¿\áxù1D\Úô,;£“_\åsû;\'Ÿ¿rÖò\Æ',_binary 'uU8\Ì-\ÇFwğ>ú…2\Ñx9',_binary '½j©B\Û\Â;^Ø¬£',_binary '\\\ÊÒ‘9¯\ÈX,\î: $“¹…;şG(;º¿9A¼t'),(14,'Miss','1955-05-30','Ashburton','North Island',4294,'metus urna convallis erat, eget tincidunt dui',_binary '\ä>°+\nCE[‹P',_binary '¹è¼¨C—±,¼oXóÕ·%',_binary '0|Ö²¹\ÎÎ‚ı\Üş\æ¨^¬\ÆTgš2\Õ^\Ë=QFk',_binary 'ØªX±2\n„%óY\Ğ[#',_binary '\Ú\ÆEivß·W?õ\'ù\âbVW',_binary '7\'tzŒÜ·¿ª¼Pòy»ù%q\åŞ®¬G—>\"sn\08'),(15,'Dr','1969-12-11','Taupo','North Island',5296,'non, cursus non, egestas a, dui. Cras pellentesque.',_binary 'kóònLŒL@ÊL²\æ\Ä',_binary '\nK`©ƒ²%Ğ°\Ş[|G¸6',_binary '\Üô\â¸J£.\È8f\nQx',_binary '­‚B]ü¶±†]\ÇJ\×t/ñ',_binary '2\0U—¬@‡ûO3s”\ÈyùK',_binary 'Q¡¥´P‚¿)’\ß\"\Å\ßjª_ğŸDc²˜¢\áy\Ü;4s¶U'),(16,'Mr','1954-02-07','Queenstown','North Island',3723,'nulla at sem molestie',_binary '‹y\0\íœ;?\Í\ßM¶0½òb\Z',_binary '\ØôAO.E`³fb\ŞXyõ$ª',_binary 'SWNÔ§.*ò)\î@_dò¤ô¼%•^\Ô<—½\ê\Ù!Z\Z',_binary '\ÕÑ¸0kÇ@‰œu5',_binary 'W¾?rFVWSO *Ä½\Ë',_binary 'ÿ\ï\Ü\É+Á\í­\ä=°I 9tıñ\Î|\ê[Q:şÜ¾õY/'),(17,'Ms','1945-10-23','Picton','North Island',4669,'erat vitae risus.',_binary 's•wL)Îµ–ş\Ş{{z',_binary '\ÕÌ’?ˆ€´\ãhÔ¶óˆ¥³',_binary '¨\Ä‰1Áµ€µaFùG\Î+˜;c¥Mdşû²m\ç\×]r2',_binary 'iÀµ´*1wxô\'t',_binary 'u\èƒ!	Gv\ZòIYu©\å“',_binary 'kwz¥N\ÊZ\é03ö\0xY\'ò\Ó÷\ÜmUi»«š\×	'),(18,'Mr','1935-01-24','Levin','South Island',5157,'Duis elementum, dui quis accumsan convallis, ante lectus convallis est,',_binary 'ş€‰ô#\ì%B }M\íRfo',_binary 'f`\Zƒ†û†\0S—ô¡\à\'',_binary 'A\Ù0 ³s‰Í˜şP°\ïq\åŞ®¬G—>\"sn\08',_binary '*6•¤–2mk½\r`ı',_binary '†¢‘H7jcu¯\Õ\ßPN\Ä',_binary '¶i\ĞEQ\"È‰¶÷\Ğö	I…&HºQT…8jø’1'),(19,'Dr','1961-03-19','Picton','South Island',9412,'laoreet posuere, enim nisl elementum purus, accumsan interdum',_binary '¢ƒ\Ã\æ¿q\ï©œ”\Z',_binary '“\î\É\é)•¬\Çyhu·',_binary ',4|M\Ë7jwGTpm\Ë›\'$9W\ØS¿\ë\ê\Ï\îY',_binary 'Š\Ï\ÉTóß‡\Ù\Ş\'‘\Ø\â\Z³',_binary 'n£Ó¨ö˜\Ã7•jÄ•Yu',_binary 'zı\Ş;•«\Z´%73A¤\Ï\ÍHòœÊŸ5MÎ¶\Ã\àÀ'),(20,'Miss','1936-12-03','Balclutha','South Island',2625,'est arcu ac orci.',_binary 'µ\Ğ]%6Œ\ÓNZ\è}L',_binary 'v>ñ~¸¢&E‘†\0\ä©H\ß',_binary 'W§Ahô‰\æ\í7\Èn´p…À*E¯ƒ&”\Íl–?',_binary 'ÂDYFW\ÆWq·G5\ÙG÷',_binary '¢umb\íp¡\Ø)\â\Ã\ä\ç”Q',_binary 'ş¦U6‡e\ÕI\ß(^\0\Ò-Æ­ñ\é˜‘ô|¶‹}jõeM');
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
INSERT INTO `worker` VALUES (1,'Mrs','Yes',_binary 'd\Â`«v\ë[+#¡Ë¦\ée\Ï',_binary '\ZbWì²\ÇjuŠZ¦\Ö',_binary '\"ƒı \0Æ«”HAet!\Å',_binary '}ln¦|\Ë\á=X=ü¹“ò\Ş‡¾gyKweE,BL'),(2,'Mrs','No',_binary '\ÖğoM\reh=¨\èÀ’\ç\ë',_binary 'A®?€¡0R\Ø=1uúó\Ã',_binary '\àB	HPˆ‚ùd\Şò_€·¦\n',_binary 'V\î¨xSF[\0§èº’+¯7^^Y†?\ÌPedjL\åû'),(3,'Sir','Yes',_binary 'Ş„ò\å³^Œ€z;õ	',_binary 'qÔ’?\Ê/\Ä4\Ü	®~2X@',_binary '6\ä\ØELPM¾UZ\\dw€',_binary '\Ò\Ç\Çx&¤˜9z´¦T\î\"\Í\Ñ«ÁÿBaw4²’\ÇH,\è'),(4,'Ms','No',_binary '=y\ê¤\İF|.oµ­ök',_binary 'ª7\å¾\ì@°«Ø•B°',_binary '\"†©€±{\ÔQ&\êXd',_binary 'eÁ4$5=‰Œ\Ú9\Z?\ã•\Ş¹…;şG(;º¿9A¼t'),(5,'Miss','No',_binary '\"¿	6\'\Ó¼º¤=•PC',_binary '¸KX\ä®0š¨DF\0GÀ',_binary '\r_P\ÏûL\İ(\ãZ.7w',_binary '’8I\n²¼\ì+ß¶\r\'Ã“¢ x`j¶Ğ®Y'),(6,'Miss','Yes',_binary '\Â\Ä[Š‡¦—2vI\à©lr|v',_binary 'G$w.:7‚/\Öö*\ç’\ïwm',_binary '`º5DÆq9|K•NM',_binary '¥ğ¬C¡U¢\ÒG”ıN2o1óA	\ä?—M\Ñ\r\ÊK•'),(7,'Ms','No',_binary 'Gq5Ô«‘?“\Â\" \Û\Zú',_binary 'ş,;\Òû\'|²0»Ç’\ÓõB',_binary '‡<\îuukt@·d\ì\àŒ\Ö',_binary 'µÕ½\Écf%\Ã\ÍM<À\æ\0+\"{\ŞnESN¢¯\Öü\Ì'),(8,'Mrs','Yes',_binary '¨—o©2¿\ÂWı€»;nƒ\Z',_binary 'k¯\í¿£¯V)Z¤]\'\îM?o',_binary 'ü\'j{\Ü\\p¥L®+©“\ä',_binary 'ñ]=\ãÍc²©1…Ù1\"9\ÚÀEŒ•82I¬´'),(9,'Ms','Yes',_binary '~oûT\Î¼£N#x¾ÿ\Ù2´',_binary 'o”,S¢>:¤î…·m',_binary '\×A®M-&\Z´j\Z\ée‹+',_binary '1\Å\à—\\_ÿı\æv²¾ó•!xŒÜ” § 7Ÿ\î]ü\èô'),(10,'Mrs','No',_binary '	x¶ı Ç¿\Ù\Ö;ı\\',_binary 'ÁşFJ¿\Ûbı­2L!9?l',_binary '	aE»¬<ˆ\"\0G(qY',_binary '¨¥À%4@\äq”¾ÿ‰\Ê4V¥‹p3O@§\0x“±7'),(11,'Mrs','No',_binary 'Á¯\Z}´\Ä7¦E:%zö',_binary 'Ü†\Îü—\â)\nls\\N\r\×',_binary '\Ò\í¦P|˜\Ì\r°\Ò	m[š',_binary 'xq_’v›£i@:Gœ\Z)¢d\Ì)Ÿ\ëK\Ú©›¡\Üc'),(12,'Mrs','No',_binary '>Ë\í\Ê\ÃhA™0l´¤',_binary '\ÎMÔ™á£¬µ8yh4tz',_binary 'j\Óš¿qhghÒ£@\Ó>[',_binary '{dB\\ô­£w”‚ù¦—²\Z;\äA\Ã\Ãv\ß-$r'),(13,'Miss','No',_binary '\n\İL=\ß:Z\Ä\'ù\ËP_',_binary 'İ„­¨´c¾\'R5y\æğ€',_binary '\È\ã@„Z\Î\ã’\çÎ¬e\'',_binary '&\ÚD\äz•³s¹ı\'ÿf1•p\á¤`I…˜Œ=µ×€n'),(14,'Miss','Yes',_binary '/3t!e‚2ÿ\Üw¨·\"',_binary '¿5æ¬€\Úö\á¯-\ä\ïHVM+',_binary '„\êımX\Æ]^\İ\ÏÁMŠ…\á',_binary 'ñ\ĞI\0\Ùh\ÒÙ‚;gµ\Í\Z8H´‚oµÆµ€€¢‘½'),(15,'Ms','Yes',_binary '™Ö±Â½˜¤Š®\èé®¾',_binary 'Eİ£\é\ÏL\r’™\È`\ì¸hN',_binary '4£•û8uoœ\ì',_binary '–ü\Å*=½\â­\ï¢,YG\\Pôk±®(ğ(µ\è\ì~P!Œ'),(16,'Mrs','Yes',_binary 'Lñµš£\Æõğš¼“W(n¹',_binary 'q¸–ş<¤rF1:*\áş³\Ğ9',_binary '··£\ãS\"*\ÜS™\Ö.:€E',_binary 'kwz¥N\ÊZ\é03öú&5%µ~Q{\Õk\ëHj6º'),(17,'Mr','No',_binary '*X\'¥\äE Ø¥X*c¿\Şm',_binary '\×^\Æ}\ZÀW¤tª]‰‚g',_binary 'µu·4YskoUV5®\Ìr',_binary '\æ\ë	:÷™šR\ä\Ím¢›ó#û\×$s§\ÜV\çvp’®;ó7õ'),(18,'Mrs','Yes',_binary 'C\éjõ\éö±¢¼\ço¶üõ”ş',_binary '\Ìp‚m†Ÿ$7‡Œö©Á­mT',_binary 'JÂ…P\æ\î«p¿²\é!ı',_binary 'üö­–‹lh†©sóu\Ñj\Ò'),(19,'Mrs','Yes',_binary '¬MjL¦\×\0`\Üfªc',_binary '\Õğ¶«²\Éz¹û\Ñ$‚ú!§',_binary 'r¬\Ğ\İ+aª\ØıHØ¤,ƒr',_binary '?Î‡§ø©\\z°\Ãƒ\ÔwI\ËYÙ”8\èU\0~±1F'),(20,'Ms','No',_binary '\Ø÷9gÿ\'wgu·\á7\Ş',_binary 'zŒm[»‡%¯Ğ©Š|µ',_binary '˜¬ú	ó\Ï3txN\Ò\âT\Ó',_binary 'i+\ŞAL\ÕY§~\â3¤¥?éšŸB\\\r¶¬!=ÀÎ¸ªh·\Ô\éöK§c\í]U,Ÿ¿');
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
