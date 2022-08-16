use palliativeCare;







/* 4. Create a view of patients' information for a receptionist*/
create or replace view PatientInfo as
select  p.patientId, p.title, concat(p.firstName, ' ', p.lastName) as 'Patient fullname',
TIMESTAMPDIFF(YEAR, p.DOB, CURDATE()) AS Age, p.homePhone, p.mobilePhone, p.email
from patient p
order by p.patientId;
SELECT * FROM palliativecare.patientinfo;


