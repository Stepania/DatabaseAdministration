use PalliativeCare;


-- 1.Display all patients who older than 70 years and live in south Island
select concat(firstName, ' ',lastName) as 'Patient full name',TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS 'age'
from patient
where district = 'South Island'




-- 2. Display all carers who have more than 1 patient*/
select * from patientCarers;

select c.carerId, concat(c.firstName, ' ', c.lastName) as 'Carer fullname',
p.patientId, concat(p.firstName, ' ', p.lastName) as 'Patient full name',pc.relationshipToPatient
from patient p, carer c, patientCarers pc
where pc.patientId = p.patientId and pc.carerId = c.carerId
group by p.patientId
having  count(pc.patientId) > 1;


