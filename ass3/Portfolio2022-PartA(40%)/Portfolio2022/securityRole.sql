USE Vaccinations
GO

CREATE LOGIN [<domainName>\<loginName>] FROM WINDOWS;  
GO 


CREATE LOGIN [ARA_User] 
	WITH PASSWORD=N'SomeCr@zyPassw0rd!' 
	MUST_CHANGE, 
	DEFAULT_DATABASE=[master], 
	CHECK_EXPIRATION=ON, 
	CHECK_POLICY=ON
GO


USE Vaccinations;
CREATE LOGIN [Jess] WITH PASSWORD = N'SomeCr@zyPassw0rd!' ;
USE Vaccinations;
CREATE USER [Hiru] FOR LOGIN [Jess];