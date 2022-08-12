use PalliativeCare;


-- 1.Display all patients who older than 70 years and live in south Island
select concat(firstName, ' ',lastName) as 'Patient full name',TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS 'age'
from patient
where district = 'South Island'
and
TIMESTAMPDIFF(YEAR, DOB, CURDATE())>70;

-- 2. Display all carers who have more than 1 patient*/
select * from patientCarers;

select concat(c.firstName, ' ', c.lastName) as 'Carer fullname',count(c.carerId) as amountPatients, concat(p.firstName, ' ', p.lastName) as 'Patient full name',pc.relationshipToPatient
from patient p, carer c, patientCarers pc
where pc.patientId = p.patientId and pc.carerId = c.carerId
group by p.patientId
having  count(pc.patientId) > 1;



-- 3. How many times carer "Marcia Chaney" made a contact aka carerId-14 
select count(con.carerId) as amountCalls, concat(c.firstName, ' ', c.lastName) as 'Carer fullname'
from carer c
inner join Contactor con on con.carerId=c.carerId
where firstName = "Marcia"  and lastName = "Chaney";
-- checking or testing
select * from Contactor
where carerId=14;
-- right answer is 2!!







SELECT COUNT(b.[room_type_requested]) as 'Total_Family_Rooms'
FROM [dbo].[guest] g
INNER JOIN [dbo].[booking] b ON g.[id] = b.[guest_id]
WHERE b.[room_type_requested] = 'family'
