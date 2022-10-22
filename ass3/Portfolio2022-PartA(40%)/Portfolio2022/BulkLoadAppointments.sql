-- something is wrong : Bulk load data conversion error (type mismatch or invalid character for the specified codepage) for row 2, column 1 (id).


-- Description:	Create Procedure to Bulk Load Appointments
-- =============================================
USE Vaccinations
GO
select * from [dbo].[Appointment]
-- Write your code here
USE Vaccinations
GO
DROP PROCEDURE IF EXISTS bulkLoadAppointments
GO
-- Create the procedure
CREATE PROCEDURE bulkLoadAppointments 
	-- Loads a file of appointments into the Appointment table.  No error checking.
	@fileName varchar(100) = ''	-- The file naem where the data is being loaded from
AS
BEGIN
	DECLARE @sqlString varchar(512) = '' -- The string that is being executed to bulk load the data
	
	--  Create the temporary table to load the data by copying the structure
	DROP TABLE IF EXISTS #newAppointment
	--SELECT TOP 0 * INTO #newAppointment FROM [dbo].[Appointment]
	create table #newAppointment (
		placeId char(10),			
		"day" datetime,				
		startTime time,	
		endTime time,
		timeBetween time,
		slots tinyint
	)

	-- Create and execute the sql string.  The quotes are important
	SET @sqlString = '
	BULK INSERT #newAppointment
	FROM '''  + @fileName + '''
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = '','',
		ROWTERMINATOR=''\n''
	)'
	EXECUTE (@sqlString)

		-- Use a cursor to loop through the temporary table, and load the data into the permanent table
	-- Variables data read from
	DECLARE @sessions int
	DECLARE @placeId char(10)
	DECLARE @slot tinyint
	DECLARE @apptTime datetime2(0)
	DECLARE @sessionCount int
	DECLARE @currentSlot int
	DECLARE @timeBetween time
	DECLARE @slots int

	-- the cursor declared 
	DECLARE newAppointmentCursor CURSOR FOR
		SELECT placeId FROM #newAppointment
		-- Open Cursor
	OPEN newAppointmentCursor

		-- Loop through the cursor until there is no more data
	FETCH NEXT FROM newAppointmentCursor INTO @placeId
	-- We have not started fetching yet!!
	WHILE @@FETCH_STATUS = 0
		BEGIN
			-- Get the data from the temporary table
				exec createWholeDayAppointments @placeId=@placeId, @day=@day, @startTime=@startTime, @endTime=@endtime, @timeBetween=@timeBetween


				select @day ="day", @startTime=startTime, @endtime=endTime, @timeBetween=timeBetween, @slots=slots from #newAppointment		
				WHERE placeId = @placeId
				exec createWholeDayAppointments;
			-- Run the procedure that enters the data
			--EXEC createAppointment @placeId = @placeId ,@slot=@slot,@apptTime=@apptTime
	

			select * from Appointment;
			
			FETCH NEXT FROM newAppointmentCursor INTO @id
		END

		-- Tidy up
	CLOSE newAppointmentCursor -- close the cursor
	DEALLOCATE newAppointmentCursor -- Free up the memory
	DROP TABLE #newAppointment -- Purge the Temp Table
END 
GO

delete from Appointment;

GO
SELECT * FROM Appointment
GO
EXEC bulkLoadAppointments @fileName = 'C:\toRestore\Vaccine2021Data\SiteSessions2August.csv'
GO
SELECT count(*) AS AppointmentCount FROM Appointment
