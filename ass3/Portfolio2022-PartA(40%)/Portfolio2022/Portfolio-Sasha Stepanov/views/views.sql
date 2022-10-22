
use [Vaccinations];


--1)•	A view that shows each vaccination place, with the total number of vaccinations that could happen each day,
--and the number of vaccinations actually happening or booked each day.
Go
CREATE OR ALTER VIEW vPlaceCountPeople
WITH SCHEMABINDING AS
SELECT [placeId], CAST([apptTime] AS DATE) AS 'date', COUNT(*)AS Total, COUNT([personId]) AS booked
FROM [dbo].[Appointment]
GROUP BY CAST([apptTime] AS DATE), [placeId]
GO
SELECT * FROM vPlaceCountPeople
GO

SELECT * FROM [dbo].[Appointment] WHERE [placeId] = 'Tim_Heaton' -- 662 rows
SELECT * FROM [dbo].[Appointment] WHERE [placeId] = 'Tim_Heaton' AND [personId] IS NOT NULL -- 597 rows
SELECT * FROM vPlaceCountPeople WHERE [placeId] = 'Tim_Heaton' -- 
GO

--•	2)A view showing all people that have missed a booking, and do not have a later booking.
--We will want to contact these people, so include names and contact details.
CREATE OR ALTER VIEW viewMissedBooking
WITH SCHEMABINDING AS
SELECT [NHI], [preferredName],[phone], [eMail], [preferredContactMethod] 
FROM [dbo].[Person] P
INNER JOIN [dbo].[Appointment] A ON A.[personId]=P.[NHI]
WHERE [vialNumber] IS NULL AND [vaccinator] IS NULL AND [apptTime] < GETDATE()
GO

-- TEST
SELECT COUNT(*) FROM [dbo].[Appointment] WHERE [vialNumber] IS NULL AND [personId] IS NOT NULL -- 405
SELECT * FROM viewMissedBooking -- ROWS = 405
GO

 -- •3)	A view that can be used to show people broken down by age in decades as at the date of their first vaccination. 
--Only show people that have been vaccinated.
CREATE OR ALTER VIEW viewVaccinatedDecades 
WITH SCHEMABINDING AS
SELECT P.[NHI], [preferredName], left(cast(D.age as varchar(4)), len(D.age) - 1) + '0s' as decade, [eMail],
[phone], [preferredContactMethod] 
FROM [dbo].[Person] P
INNER JOIN [dbo].[Appointment] A ON A.[personId]=P.[NHI]
INNER JOIN 
(
SELECT [NHI], DATEDIFF(YEAR, [dateOfBirth], [apptTime]) AS age 
FROM [dbo].[Person] P
INNER JOIN [dbo].[Appointment] A ON A.[personId]=P.[NHI]
) AS D ON  D.[NHI] = P.[NHI]
where [vaccineNumber] = 1
GO
--TEST 
-- CHECK if DECADE IS CORRECT 

SELECT * FROM viewVaccinatedDecades WHERE NHI = 'AAB0008' -- 100s
SELECT * FROM [dbo].[Person] WHERE NHI = 'AAB0008' -- date of birth is 
SELECT * FROM viewVaccinatedDecades WHERE NHI = 'ACC0276' -- dacedas is 40s
SELECT * FROM [dbo].[Person] WHERE NHI = 'ACC0276'     -- date of birth is  1980



--•	4)A view showing the number of sessions and the number of vaccines all vaccinators have done. 
--Include those vaccinators that have yet to vaccinate anybody.*/
CREATE OR ALTER VIEW viewTotalVaccineSession 
WITH SCHEMABINDING AS
SELECT [iRDNumber], COUNT([apptTime]) AS'Total Sessions', COUNT(vialNumber) AS 'Total Vaccinations'
FROM [dbo].[Appointment] A
RIGHT JOIN [dbo].[Vaccinator] V ON V.[iRDNumber]=A.[vaccinator]
GROUP BY [iRDNumber]
GO

select * from viewTotalVaccineSession;


-- TEST
SELECT * FROM [dbo].[Vaccinator] -- 11 ROWS
SELECT DISTINCT [vaccinator] FROM [dbo].[Appointment] WHERE [vaccinator] IS NOT NULL -- 8 ROWS - 3 VACCINATORS HAVE NOT VACCINED ANYBODY
SELECT COUNT([apptTime]) AS 'SESSIONS', [vaccinator] -- SESSIONS 
FROM [dbo].[Appointment] WHERE [vaccinator] IS NOT NULL -- SESSIONS
GROUP BY [vaccinator] -- SESSIONS
SELECT COUNT(vialNumber) AS 'VACCINES', [vaccinator] -- VACCINES 
FROM [dbo].[Appointment] WHERE [vaccinator] IS NOT NULL -- VACCINES
GROUP BY [vaccinator] -- VACCINES
SELECT * FROM viewTotalVaccineSession
GO