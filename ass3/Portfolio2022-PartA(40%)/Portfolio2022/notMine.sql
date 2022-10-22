 
-- Description:	Create Procedure to Bulk Load Appointments
-- =============================================
select * from [dbo].[Appointment]
USE [Vaccinations]
GO
DROP PROCEDURE IF EXISTS bulkLoadAppointments
GO
CREATE PROCEDURE bulkLoadAppointments
	@fileName varchar(100) = ''
	AS
	BEGIN 
	-- create temp table to store file data
	DROP TABLE IF EXISTS #apptSessions
	CREATE TABLE #apptSessions (
		placeId char(10),			
		"day" datetime,				
		startTime time,	
		endTime time,
		timeBetween time,
		slots tinyint
	)
	-- bulk insert file data into temp table 
		DECLARE @bulkInsert varchar(512) = ''
		SET @bulkInsert = '
		BULK INSERT #apptSessions
		FROM ''' + @fileName + '''
		WITH (
		FORMAT = ''CSV'',
		FIRSTROW = 2,
		FIELDTERMINATOR = '','',
		ROWTERMINATOR=''\n''
	)'
	EXEC (@bulkInsert)
	-- test temp table 
	select * from #apptSessions
	-- declare all required variables
	DECLARE @sessions int
	DECLARE @placeId char(10)
	DECLARE @slot tinyint
	DECLARE @apptTime datetime2(0)
	DECLARE @sessionCount int
	DECLARE @currentSlot int
	DECLARE @timeBetween time
	DECLARE @slots int

	-- Declare Cursor
	DECLARE newAppointmentCursor CURSOR FOR
		SELECT placeId FROM #apptSessions
		-- Open Cursor
	OPEN newAppointmentCursor
	
	-- Loop through the cursor until there is no more data
	FETCH NEXT FROM newAppointmentCursor INTO @placeId
	WHILE @@FETCH_STATUS = 0
		BEGIN
		-- set @session and @slots variables to get total of sessions and the number of slots for that day
			SELECT @sessions = (DateDiff(minute, startTime, endTime) / DATEPART(minute, timeBetween)), @slots = slots 
			from #apptSessions WHERE placeId = @placeId
			-- set default to variables		
			SET @currentSlot = 1	
			-- while loop to iterate through slots 
			WHILE @currentSlot <= @slots
			--set time between to default	
				BEGIN
					SET @timeBetween = '00:00:00.00000000'
					SET @sessionCount = 0
				-- loop through all sessions 
					WHILE @sessions > @sessionCount
						BEGIN
							SELECT @apptTime = "day" + (CAST(@timeBetween as datetime) + CAST(startTime AS DATETIME))
								FROM #apptSessions
								WHERE placeId = @placeId
								EXEC createAppointment @placeId= @placeId, @slot=@currentSlot, @apptTime=@apptTime
								-- add to session count to iterate through
							SET @sessionCount = @sessionCount + 1
							-- add time between appointments 
							SET @timeBetween = CAST(@timeBetween AS DATETIME) + (select CAST( timeBetween AS DATETIME) FROM #apptSessions WHERE placeId = @placeId)
						END
					-- after sessions finished loop add slot
					SET @currentSlot = @currentSlot + 1
				END
		FETCH NEXT FROM newAppointmentCursor INTO @placeId
		END
		CLOSE newAppointmentCursor
	END

-- Testing data
--DELETE FROM Appointment

--SELECT * FROM Appointment

--EXEC bulkLoadAppointments @fileName = 'C:\toRestore\Vaccine2021Data\SiteSessionsAugust.csv'

--SELECT count(*) AS AppointmentCount FROM Appointment