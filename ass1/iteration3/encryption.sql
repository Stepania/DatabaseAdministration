use palliativeCare;

ALTER TABLE `palliativecare`.`patient` 
ADD COLUMN `firstName_e` BLOB NULL AFTER `notes`,
ADD COLUMN `lastName_e` BLOB NULL AFTER `firstName_e`,
ADD COLUMN `address_e` BLOB NULL AFTER `lastName_e`,
ADD COLUMN `homePhone_e` BLOB NULL AFTER `address_e`,
ADD COLUMN `mobilePhone_e` BLOB NULL AFTER `homePhone_e`,
ADD COLUMN `email_e` BLOB NULL AFTER `mobilePhone_e`;

update patient set firstName_e = AES_ENCRYPT(firstName, '9f3e373385afcec7dd79f1b0df85a98c'),
lastName_e = AES_ENCRYPT(lastName, '9f3e373385afcec7dd79f1b0df85a98c'),
homePhone_e = AES_ENCRYPT(homePhone, '9f3e373385afcec7dd79f1b0df85a98c'),
mobilePhone_e = AES_ENCRYPT(MobilePhone, '9f3e373385afcec7dd79f1b0df85a98c'),
email_e = AES_ENCRYPT(email, '9f3e373385afcec7dd79f1b0df85a98c'),
address_e = AES_ENCRYPT(address, '9f3e373385afcec7dd79f1b0df85a98c');

alter table patient drop firstName, drop lastName, drop address, drop homePhone, drop mobilePhone, drop email;
ALTER TABLE `palliativecare`.`patient` 
CHANGE COLUMN `firstName_e` `firstName` VARBINARY(480) NULL DEFAULT NULL ,
CHANGE COLUMN `lastName_e` `lastName` BLOB NULL DEFAULT NULL ,
CHANGE COLUMN `homePhone_e` `homePhone` VARBINARY(364) NULL DEFAULT NULL ,
CHANGE COLUMN `mobilePhone_e` `mobilePhone` VARBINARY(384) NULL DEFAULT NULL ,
CHANGE COLUMN `email_e` `email` BLOB NULL DEFAULT NULL ,
CHANGE COLUMN `address_e` `address` BLOB NULL DEFAULT NULL ;



ALTER TABLE `palliativecare`.`carer` 
ADD COLUMN `firstName_e` BLOB NULL AFTER `notes`,
ADD COLUMN `lastName_e` BLOB NULL AFTER `firstName_e`,
ADD COLUMN `address_e` BLOB NULL AFTER `lastName_e`,
ADD COLUMN `homePhone_e` BLOB NULL AFTER `address_e`,
ADD COLUMN `mobilePhone_e` BLOB NULL AFTER `homePhone_e`,
ADD COLUMN `email_e` BLOB NULL AFTER `mobilePhone_e`;

update carer set firstName_e = AES_ENCRYPT(firstName, '9f3e373385afcec7dd79f1b0df85a98c'),
lastName_e = AES_ENCRYPT(lastName, '9f3e373385afcec7dd79f1b0df85a98c'),
homePhone_e = AES_ENCRYPT(homePhone, '9f3e373385afcec7dd79f1b0df85a98c'),
mobilePhone_e = AES_ENCRYPT(MobilePhone, '9f3e373385afcec7dd79f1b0df85a98c'),
email_e = AES_ENCRYPT(email, '9f3e373385afcec7dd79f1b0df85a98c'),
address_e = AES_ENCRYPT(address, '9f3e373385afcec7dd79f1b0df85a98c');

alter table carer drop firstName, drop lastName, drop address, drop homePhone, drop mobilePhone, drop email;

ALTER TABLE `palliativecare`.`carer` 
CHANGE COLUMN `firstName_e` `firstName` VARBINARY(480) NULL DEFAULT NULL ,
CHANGE COLUMN `lastName_e` `lastName` BLOB NULL DEFAULT NULL ,
CHANGE COLUMN `homePhone_e` `homePhone` VARBINARY(364) NULL DEFAULT NULL ,
CHANGE COLUMN `mobilePhone_e` `mobilePhone` VARBINARY(384) NULL DEFAULT NULL ,
CHANGE COLUMN `email_e` `email` BLOB NULL DEFAULT NULL ,
CHANGE COLUMN `address_e` `address` BLOB NULL DEFAULT NULL ;


ALTER TABLE `palliativecare`.`worker` 
ADD COLUMN `firstName_e` BLOB NULL AFTER `email`,
ADD COLUMN `lastName_e` BLOB NULL AFTER `firstName_e`,
ADD COLUMN `phoneNumber_e` BLOB NULL AFTER `lastName_e`,
ADD COLUMN `email_e` BLOB NULL AFTER `phoneNumber_e`;

update worker set firstName_e = AES_ENCRYPT(firstName, '9f3e373385afcec7dd79f1b0df85a98c'),
lastName_e = AES_ENCRYPT(lastName, '9f3e373385afcec7dd79f1b0df85a98c'),
phoneNumber_e = AES_ENCRYPT(phoneNumber, '9f3e373385afcec7dd79f1b0df85a98c'),
email_e = AES_ENCRYPT(email, '9f3e373385afcec7dd79f1b0df85a98c');

alter table worker drop firstName, drop lastName, drop phoneNumber, drop email;

ALTER TABLE `palliativecare`.`worker` 
CHANGE COLUMN `firstName_e` `firstName` BLOB NULL DEFAULT NULL ,
CHANGE COLUMN `lastName_e` `lastName` BLOB NULL DEFAULT NULL ,
CHANGE COLUMN `phoneNumber_e` `phoneNumber` BLOB NULL DEFAULT NULL ,
CHANGE COLUMN `email_e` `email` BLOB NULL DEFAULT NULL ;



SELECT CONVERT(email USING utf8),title FROM patient;


09:19:10	insert into Product(productName,price,description,stockStatus,productPicture,businessId) values("Screwdriver",35.00,"the best screwdriver you ever seen",50,"C:\study\2year\sem2year2\PHP\image\screwdriv.jpg",6), ("Shovel",85.00,"Dewalt,hight standarts.",5,"C:\study\2year\sem2year2\PHP\image\shovel.jpg",6), ("Hammer",85.00,"Eastwing. Best hammers in the market of hammers.",2,"C:\study\2year\sem2year2\PHP\image\hammer.jpg",6), ("Skill saw",250.00,"Makita,diameter is 165 mm",3,"C:\study\2year\sem2year2\PHP\image\skilly.jpg",6), ("Sledge Hammer",120.00,"Weight is 10 lbs.",25,"C:\study\2year\sem2year2\PHP\image\sledge.jpg",7), ("Multitool",200.00,"Boch. Easy to assemble,easier to use.",75,"C:\study\2year\sem2year2\PHP\image\makitaTool.jpg",8), ("Wrench set",55.00,"Stanley wrench",10,"C:\study\2year\sem2year2\PHP\image\wrenchset.jpg",9), ("Pencils.Box",50.00,"Box of a hard pencils,100pcs",50,"C:\study\2year\sem2year2\PHP\image\pencils.jpeg",10)	

Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
(`ecommerce`.`product`, CONSTRAINT `product_ibfk_1` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`))	0.015 sec

