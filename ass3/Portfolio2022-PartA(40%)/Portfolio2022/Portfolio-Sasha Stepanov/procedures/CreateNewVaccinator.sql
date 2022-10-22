-- =============================================
-- Description:	Procedure to create a New Vaccinator
-- =============================================
USE Vaccinations

DROP PROCEDURE IF EXISTS createVaccinator
GO

CREATE PROCEDURE createVaccinator
	@iRDNumber char(10) = '', 
	@preferredName nchar(20) =''

AS
BEGIN
	INSERT INTO [dbo].[Vaccinator]([iRDNumber],[preferredName]) 
		VALUES (@iRDNumber, @preferredName)
END


-- Test
-- first check what vacinators there are 
SELECT * FROM [dbo].[Vaccinator]
-- call the procedure
EXEC createVaccinator '24578923', 'Sasha'
-- check if correct results
SELECT * FROM [dbo].[Vaccinator]