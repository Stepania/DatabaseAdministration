USE [Vaccinations]
GO
/****** Object:  StoredProcedure [dbo].[bulkLoadAppointments]    Script Date: 21/10/2022 10:56:29 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the procedure
ALTER PROCEDURE [dbo].[bulkLoadAppointments] 
	-- Loads a file of appointments into the Appointment table.  No error checking.
	@fileName varchar(100) = ''	-- The file naem where the data is being loaded from
AS
BEGIN
	DECLARE @sqlString varchar(512) = '' -- The string that is being executed to bulk load the data
	
	--  Create the temporary table to load teh data into to loop through
	DROP TABLE IF EXISTS #newAppointments
	CREATE TABLE #newAppointments (
		placeId char(10),				-- The place
		apptDay date,					-- The day
		startTime time,					-- First appointment time
		endTime time,					-- Last appointment time
		timeBetweenAppointments time,	-- The time between appointments
		slots tinyint				-- Number of slots
	)

	-- Create and execute teh sql string.  The quotes are important
	SET @sqlString = '
	BULK INSERT #newAppointments
	FROM '''  + @fileName + '''
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = '','',
		ROWTERMINATOR=''\n''
	)'
	EXECUTE (@sqlString)

	-- Use a cursor to loop through teh temporary table, and load the data into the permanent table
	-- Variables data read from
	DECLARE @placeId char(10)				-- The place
	DECLARE @apptDay date					-- The day
	DECLARE @startTime time					-- First appointment time
	DECLARE @endTime time					-- Last appointment time
	DECLARE @timeBetweenAppointments time	-- The time between appointments
	DECLARE @slots tinyint					-- Number of slots

	-- the cursor declared and opened
	DECLARE newAppointmentCursor CURSOR FOR
		SELECT * FROM #newAppointments	-- Want all teh fields, avoiding the next selece
	OPEN newAppointmentCursor
	
	-- Loop through the cursor until there is no more data
	FETCH NEXT FROM newAppointmentCursor INTO @placeId,@apptDay,@startTime,@endTime,@timeBetweenAppointments,@slots
	WHILE @@FETCH_STATUS = 0
		BEGIN
			-- Get teh data from teh temporary table
			-- Run teh procedure that enters the data
			EXEC CreateWholeDayAppointments @placeId=@placeId,@day=@apptDay,@startTime=@startTime,@endTime=@endTime,
			@timeBetweenAppointments=@timeBetweenAppointments,@slots=@slots
			-- Get the next lot of data
			FETCH NEXT FROM newAppointmentCursor INTO @placeId,@apptDay,@startTime,@endTime,@timeBetweenAppointments,@slots
		END

	-- Tidy up
	CLOSE newAppointmentCursor
	DEALLOCATE newAppointmentCursor
	DROP TABLE #newAppointments
END 

-- Testing data
--DELETE FROM Appointment

--SELECT * FROM Appointment

--EXEC bulkLoadAppointments @fileName = 'C:\toRestore\Vaccine2021Data\SiteSessionsAugust.csv'

--SELECT count(*) AS AppointmentCount FROM Appointment