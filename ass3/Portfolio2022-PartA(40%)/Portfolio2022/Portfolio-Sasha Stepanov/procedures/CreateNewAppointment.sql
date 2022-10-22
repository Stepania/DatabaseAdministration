-- =============================================
-- Description:	Procedure to create an appointment
-- =============================================
USE Vaccinations

DROP PROCEDURE IF EXISTS createAppointment
GO

CREATE PROCEDURE createAppointment
	@placeId char(10) = '', 
	@slot tinyint = 1,
	@apptTime datetime2(0) = NULL
AS
BEGIN
	INSERT INTO [dbo].[Appointment](placeId,slot,apptTime) 
		VALUES (@placeId, @slot, @apptTime)
END


-- Test
-- SELECT * FROM [dbo].[Appointment]
-- EXEC createAppointment '0', 2, '2022-12-12 10:00:00';

go

