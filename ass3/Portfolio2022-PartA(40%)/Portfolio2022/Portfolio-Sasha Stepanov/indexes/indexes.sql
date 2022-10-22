/*
 those indexes will speed up searches/queries.
Index is s performance tool that is small, fast, and optimized for quick lookups.
 
 Alternative solution:;
*/

use [Vaccinations];

--•	Assist with searching for who has vaccinated people
drop view vaccinatorView;
go

create view vaccinatorView
with schemabinding
as
select  v.iRDNumber,v.preferredName as "Vaccinator name", COUNT_BIG(*) AS countBig
from [dbo].[Appointment]a inner join [dbo].[Vaccinator] v on v.[iRDNumber]=a.[vaccinator]
where v.iRDNumber IS NOT NULL
group by v.iRDNumber, v.preferredName
go

select iRDNumber, [Vaccinator name] from vaccinatorView where [Vaccinator name] ='Judy' 
select * from Appointment;


select * from vaccinatorView;
create unique clustered index  idx_vaccinatorView
ON vaccinatorView ([iRDNumber],[Vaccinator name])

sp_helpindex 'vaccinatorView'
--CHECKING PERFOMANCE
select iRDNumber, [Vaccinator name] from vaccinatorView where [Vaccinator name] ='Judy' 


-- •	Who has been vaccinated

drop view patientView;
go

create view patientView
with schemabinding
as
select  NHI,preferredName as "Patient name",COUNT_BIG(*) AS countBig
from [dbo].[Appointment]a inner join [dbo].[Person] p on p.[NHI]=a.[personId]
where NHI IS NOT NULL
group by NHI, p.preferredName
go

select * from patientView;
SELECT NHI, [Patient name] FROM patientView WHERE NHI ='AAB0008'     


create unique clustered index  idx_patientView
ON patientView (NHI,[Patient name])

SELECT NHI, [Patient name] FROM patientView WHERE NHI ='AAB0008' 

go
sp_helpindex 'patientView'

-- •	Where vaccinations have occurred

drop view placeView;
go

create view placeView
with schemabinding
as
select  pl.id,pl.longName as "Place name",COUNT_BIG(*) AS countBig
from [dbo].[Appointment]a inner join [dbo].[Place] pl on pl.[id]=a.[placeId]
where pl.id IS NOT NULL
group by pl.id, pl.longName
go

select * from placeView;
SELECT id, [Place name] FROM placeView WHERE id ='Tim_High'

create unique clustered index  idx_placeView
ON placeView (id,[Place name])

SELECT id, [Place name] FROM placeView WHERE id ='Tim_High';

sp_helpindex 'placeView'


--OPTIMIZATION
SET STATISTICS IO ON
set statistics time on

SET STATISTICS IO off
set statistics time off