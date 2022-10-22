USE [Vaccinations]
GO
-- recheck everything
------------------------------------------
CREATE OR ALTER TRIGGER afterdel_cancelAppointment ON [dbo].[Appointment] AFTER UPDATE AS
	DECLARE @id int
	DECLARE @personId char(12)
	SELECT @personId = DEL.[personId], @id = DEL.[id] FROM DELETED DEL
		INSERT INTO [dbo].[OldAppointment]([id], [personId], [reason], [missed])
		VALUES (@id, @personId, 'Changed Appointment', 1)

GO
-- TEST
SELECT * FROM [dbo].[OldAppointment] -- EMPTY TABLE
SELECT * FROM [dbo].[Appointment]
WHERE [personId] = 'IJU2579'-- FIND AN ID - IJU2579                              
UPDATE Appointment SET personId = NULL WHERE [personId] = 'IJU2579' -- CANCEL APPOINTMENT 
SELECT * FROM [dbo].[Appointment] WHERE [personId] = 'IJU2579' -- BEEN CANCELLED
SELECT * FROM [dbo].[OldAppointment] -- BEEN ADDED.