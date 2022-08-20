create database PalliativeCare;

-- drop database palliativecare;
use PalliativeCare;

drop table if exists Patient;

create table Patient (
patientId int NOT NULL AUTO_INCREMENT,
firstName varchar(30) NOT NULL,
lastName varchar(50) NOT NULL,
title varchar(20) not null,
DOB date not null,
address varchar(60) NOT NULL,
city varchar(30) NOT NULL,
district varchar(50) not null,
postalCode int NOT NULL,
homePhone varchar(24) default null,
mobilePhone varchar(24) default null,
email varchar(100) default null,
notes text default null,

PRIMARY KEY  (patientId)
) ENGINE=InnoDB ;
-- select * from Patient;


drop table if exists Carer;

create table Carer (
carerId int NOT NULL AUTO_INCREMENT,
firstName varchar(30) NOT NULL,
lastName varchar(50) NOT NULL,
title varchar(20) not null,
DOB date not null,
address varchar(60) NOT NULL,
city varchar(30) NOT NULL,
district varchar(50) not null,
postalCode int NOT NULL,
homePhone varchar(24) default null,
mobilePhone varchar(24) default null,
email varchar(100) default null,
notes text default null,

PRIMARY KEY  (carerId)
) ENGINE=InnoDB ;

-- select * from Carer;

drop tables if exists PatientCarers;

create table PatientCarers (
patientId int not null,
carerId int not null,
relationshipToPatient varchar(100) not null,

foreign key(patientId) references Patient(patientId),
foreign key (carerId) references Carer(carerId)
)ENGINE=InnoDB ;

-- select * from PatientCarers;


drop table if exists Contactor;
create table Contactor (
contactorId int not null auto_increment,
-- description varchar(20) default null,
carerId int default null,
patientId int default null,

primary key(contactorId),
foreign key (carerId) references Carer(carerId),
foreign key (patientId) references Patient(patientId)
)ENGINE=InnoDB ;
-- select * from Contactor;


drop table if exists Worker;
create table Worker(
workerId int not null auto_increment,
firstName varchar(30) default NULL,
lastName varchar(50) default NULL,
title varchar(20) default NULL,
-- description varchar(30) default null,
available varchar(3), -- have a doubt about it 
phoneNumber varchar(24) default null,
email varchar(100) default null,

primary key (workerId)
)ENGINE=InnoDB ;

-- select * from Worker;

drop table if exists Contact;
create table Contact(
contactId int not null auto_increment,
contactorId int not null,
patientId int not null,
workerId int not null,
date datetime not null,
reasonCalling text default null,
actionsTaken text default null,
notes text default null,

primary key(contactId),
foreign key (contactorId) references Contactor(contactorId),
foreign key (patientId) references Patient(patientId),
foreign key (workerId) references Worker(workerId)
)ENGINE=InnoDB ;

-- select * from Contact;

drop table if exists Diagnosis;
create table Diagnosis (
diagnosisId integer not null auto_increment,
description varchar(50),
primary key (diagnosisId)
)ENGINE=InnoDB;

select * from Diagnosis;


drop tables if exists PatientDiagnoses;
create table PatientDiagnoses (
patientId int not null,
diagnosisId int not null,
notes text,
foreign key (patientId) references Patient(patientId),
foreign key (diagnosisId) references Diagnosis(diagnosisId)
)ENGINE=InnoDB;

-- Inserting some data
insert into Diagnosis(description) values ("ALS"), 
("Alzheimer’s Disease"),
("Breast Cancer"),
("Dementia"),
("Eosinophil Associated Disease (EAD)"),
("Congestive Heart Failure"),
("Huntington’s Disease"),
("Lymphoma"),
("Pancreatic Cancer"),
("Stroke"),
("Pulmonary Fibrosis"),
("Multiple Myeloma"),
("Parkinson’s Disease");
select * from Diagnosis;




insert into PatientDiagnoses (patientId, diagnosisId) values (4,9),(19,6),(1,1),(1,8),
(1,4),(15,13),(8,4),(9,7),(6,11),(7,1),(2,4),(4,13),(3,5),(5,10),(18,11);


select * from patientDiagnoses;
create index patNumb on PatientDiagnoses (patientId);
create index diagNumb on PatientDiagnoses (diagnosisId);



select * from patientCarers;
insert into patientCarers(patientId, carerId, relationshipToPatient) values 
(1, 11, "Friend"),
(5, 13, "Family member"),
(4, 12, "Friend"),
(8, 14, "District nurse"),
(8, 14, "District nurse"),
(10, 19, "Family member"),
(9, 18, "Friend"),
(2, 14, "District nurse"),
(7, 14, "District nurse");


select * from contactor;
insert into Contactor(patientId, carerId) values (null, 5),
 (null, 19), (null, 12), (null, 14),
 (4, null), (1, null), (2, null),
 (5, null),(null, 14);
 
 
 
select * from contact;
insert into contact (contactorId, patientId, workerId, date, reasonCalling, actionsTaken) values
(5, 4, 4, '2022-08-07 15:03', "Question aboutan appointment", "Checked the the timetable"),
(6, 1, 9, '2022-02-04 13:15', "Got bored", "Sang a song"),
(7, 2, 1, '2022-04-02 23:33', "Question about prescription", "Prescription was repeated"),
(8, 5, 1, '2022-05-07 12:11', "Serious injury,advise needed", "Ambulance was called");