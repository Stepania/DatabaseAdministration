Procedure Demo - Build Database (pg1)
CREATE DATABASE CURSORDEMO;
USE CURSORDEMO;

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
`employeeNumber` int(11) NOT NULL,
`lastName` varchar(50) NOT NULL,
`firstName` varchar(50) NOT NULL,
`extension` varchar(10) NOT NULL,
`email` varchar(100) NOT NULL,
`jobTitle` varchar(50) NOT NULL,
PRIMARY KEY (`employeeNumber`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employees` */

insert into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`jobTitle`) values
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','President'),
(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','VP Sales'),
(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','VP Marketing'),
(1088,'Patterson','William','x4871','wpatterson@classicmodelcars.com','Sales Manager (APAC)'),
(1102,'Bondur','Gerard','x5408','gbondur@classicmodelcars.com','Sale Manager (EMEA)'),
(1143,'Bow','Anthony','x5428','abow@classicmodelcars.com','Sales Manager (NA)'),
(1165,'Jennings','Leslie','x3291','ljennings@classicmodelcars.com','Sales Rep'),
(1166,'Thompson','Leslie','x4065','lthompson@classicmodelcars.com','Sales Rep'),
(1188,'Firrelli','Julie','x2173','jfirrelli@classicmodelcars.com','Sales Rep'),
(1216,'Patterson','Steve','x4334','spatterson@classicmodelcars.com','Sales Rep'),
(1286,'Tseng','Foon Yue','x2248','ftseng@classicmodelcars.com','Sales Rep'),
(1323,'Vanauf','George','x4102','gvanauf@classicmodelcars.com','Sales Rep'),
(1337,'Bondur','Loui','x6493','lbondur@classicmodelcars.com','Sales Rep'),
(1370,'Hernandez','Gerard','x2028','ghernande@classicmodelcars.com','Sales Rep'),
(1401,'Castillo','Pamela','x2759','pcastillo@classicmodelcars.com','Sales Rep'),
(1501,'Bott','Larry','x2311','lbott@classicmodelcars.com','Sales Rep'),
(1504,'Jones','Barry','x102','bjones@classicmodelcars.com','Sales Rep'),
(1611,'Fixter','Andy','x101','afixter@classicmodelcars.com','Sales Rep'),
(1612,'Marsh','Peter','x102','pmarsh@classicmodelcars.com','Sales Rep'),
(1619,'King','Tom','x103','tking@classicmodelcars.com','Sales Rep'),
(1621,'Nishi','Mami','x101','mnishi@classicmodelcars.com','Sales Rep'),
(1625,'Kato','Yoshimi','x102','ykato@classicmodelcars.com','Sales Rep'),
(1702,'Gerard','Martin','x2312','mgerard@classicmodelcars.com','Sales Rep');
Last modified: Monday, 14 May 2018, 8:59 AM