use PalliativeCare;

-- 1.Display all patients who older than 70 years and live in South Island, it means DOB myst be minimum on 1952
select concat(firstName, ' ',lastName) as 'Patient full name',TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS 'age'
from patient
where district = 'South Island'
and
TIMESTAMPDIFF(YEAR, DOB, CURDATE())>70;

-- checking or testing
select *from patient
where DOB < '1952-05-30'
and district = "South Island";
-- answer is 5 people 

-- 2. Display all carers who have more than 1 patient*/
select * from patientcarers;

select concat(c.firstName, ' ', c.lastName) as 'Carer fullname',count(c.carerId) as amountPatients,
concat(p.firstName, ' ', p.lastName) as 'Patient full name',pc.relationshipToPatient
from patient p, carer c, patientCarers pc
where pc.patientId = p.patientId and pc.carerId = c.carerId
group by p.patientId
having  count(pc.patientId) > 1;

-- checking/testing only caredId=14 have more than one patient
select * from patientcarers;

-- 3. How many times carer "Marcia Chaney" made a contact aka carerId-14 
select count(con.carerId) as amountCalls, concat(c.firstName, ' ', c.lastName) as 'Carer fullname'
from carer c
inner join Contactor con on con.carerId=c.carerId
where firstName = "Marcia"  and lastName = "Chaney";
-- checking or testing
select * from Contactor
where carerId=14;
-- right answer is 2!!

/* 4. Create a view of patients' information for a receptionist*/
create or replace view PatientInfo as
select  p.patientId, p.title, concat(p.firstName, ' ', p.lastName) as 'Patient fullname',
TIMESTAMPDIFF(YEAR, p.DOB, CURDATE()) AS Age, p.homePhone, p.mobilePhone, p.email
from patient p
order by p.patientId;
SELECT * FROM palliativecare.patientinfo;

/* 5. Display all patients with the Lymphoma Disease*/
select p.patientId, concat(p.firstName, ' ', p.lastName) as 'Patient fullname', 
d.description  as 'Diagnosis' from patient p, diagnosis d, patientDiagnoses pd
where p.patientId = pd.patientId
and d.diagnosisId = pd.diagnosisId
and pd.diagnosisId = 8
order by pd.diagnosisId asc;

-- checking or testing 
select * from patientdiagnoses
-- right answer is only one patient with ID 1

