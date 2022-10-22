
--Users and Security				8 marks
--	Users			2 marks    
--	Roles			2 marks
--	Rights			2 marks
--	Implementation	2 marks
USE Vaccinations;
GO


GO
CREATE LOGIN [Client] -- just user or client
	WITH PASSWORD=N'SomeCr@zyPassw0rd!' 
	MUST_CHANGE, 
	DEFAULT_DATABASE=[Vaccinations], 
	CHECK_EXPIRATION=ON, 
	CHECK_POLICY=ON
GO
CREATE LOGIN [Admin] -- big head admin
	WITH PASSWORD=N'SomeCr@zyPassw0rd!' 
	MUST_CHANGE, 
	DEFAULT_DATABASE=[Vaccinations], 
	CHECK_EXPIRATION=ON, 
	CHECK_POLICY=ON
GO
CREATE LOGIN [Vaccinator] -- nurse,doctor
	WITH PASSWORD=N'SomeCr@zyPassw0rd!' 
	MUST_CHANGE, 
	DEFAULT_DATABASE=[Vaccinations], 
	CHECK_EXPIRATION=ON, 
	CHECK_POLICY=ON
GO
-- roles are the same as logins(users)
CREATE ROLE Vaccinator;-- or nurse,doctor
CREATE ROLE Administrator;-- in charge of database itself
CREATE ROLE Client;-- just a user or customer

--GRANT SELECT on viewPlaceVaccinator To Client;-- just an example

GO

Use Vaccinations
Select 
  [name]
From
  sysusers
Where
  issqlrole = 1


  -- just a view for a Client
create view viewPlaceVaccinator
as
select  v.preferredName as "Vaccinator name",pl.[longName],pl.[maxSlots]
from [dbo].[Appointment]a inner join [dbo].[Vaccinator] v on v.[iRDNumber]=a.[vaccinator]
inner join [dbo].[Place] pl on a.[placeId]=pl.[id]
go
select * from viewPlaceVaccinator;

