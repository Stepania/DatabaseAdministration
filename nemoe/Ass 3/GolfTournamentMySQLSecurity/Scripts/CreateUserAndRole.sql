-- Done using mySQL 8 
-- Needed to import the database from backup first using Server/DataImport

-- Step 1. Create a user
CREATE USER GolfDayRunner@localhost IDENTIFIED BY 'Golf@2020';

-- Step 2.	User rights.
-- Give teh user access to a database
GRANT UPDATE, SELECT ON GolfTournament.Tournament TO GolfDayRunner@localhost; 
--  Reload privileges 
FLUSH PRIVILEGES;
-- What privileges does a user have?
SHOW GRANTS FOR GolfDayRunner@localhost;

-- Actually it was the wrong table
REVOKE UPDATE, SELECT ON GolfTournament.Tournament FROM GolfDayRunner@localhost; 
-- Can see all the Team details
GRANT SELECT ON GolfTournament.Team TO GolfDayRunner@localhost; 
-- Can update teh scores
GRANT UPDATE (day1Score, day2Player1Score, day2Player2Score)
	ON GolfTournament.Team TO GolfDayRunner@localhost; 
FLUSH PRIVILEGES;
SHOW GRANTS FOR GolfDayRunner@localhost;

-- Step 3.	Actually I only want this year's ones.
USE GolfTournament;
-- Stored procedures in separate files CreateTournamentDayDataView.sql, CreateTournamentDayDataUpdate.sql
CALL CreateTournamentDayDataView('OWT20'); -- Creates view for Select - non updateable
CALL CreateTournamentDayDataUpdate('OWT20'); -- Creates updateable view

-- Testting to demonstrate non updateable view
SELECT * FROM TournamentDayDataUpdate;
-- Check can update
UPDATE TournamentDayDataUpdate
	SET day1Score = 39 WHERE teamNumber = 1;
-- Below doesn't work
UPDATE TournamentDayDataView
	SET day1Score = 39 WHERE teamNumber = 1;    

-- Use the views
REVOKE UPDATE, SELECT ON GolfTournament.Team FROM GolfDayRunner@localhost;
GRANT SELECT ON GolfTournament.TournamentDayDataView TO GolfDayRunner@localhost;
GRANT UPDATE (day1Score, day2Player1Score, day2Player2Score)
	ON GolfTournament.TournamentDayDataUpdate TO GolfDayRunner@localhost;
FLUSH PRIVILEGES;
SHOW GRANTS FOR GolfDayRunner@localhost;

-- Step 4.  Granting rights to stored procedure
-- Create a stored procedure for entering scores called updatescore
-- Stored in separate file CreateUpdateScoreProcedure.sql
-- tested below.
CALL UpdateScore(2,0,39,@returnValue);
SELECT * FROM TournamentDayData WHERE teamNumber = 2;

-- Now all we really want is teh user to be able to execute teh stored procedure
-- Version 8 update - change authentication method
ALTER USER GolfDayRunner@localhost IDENTIFIED WITH mysql_native_password BY 'Golf@2020';
-- End Verions 8 update
SHOW GRANTS FOR GolfDayRunner@localhost;
REVOKE ALL PRIVILEGES, GRANT OPTION FROM GolfDayRunner@localhost;
GRANT EXECUTE ON PROCEDURE GolfTournament.UpdateScore TO GolfDayRunner@localhost;
GRANT SELECT ON GolfTournament.TournamentDayDataView TO GolfDayRunner@localhost;
FLUSH PRIVILEGES;
SHOW GRANTS FOR GolfDayRunner@localhost;


-- Stpe 5 Roles
-- now let's make a role which we can use instead
-- For this to work we app_updateScoresneed to be running version 8, not 5.
DROP ROLE IF EXISTS app_updateScores;
CREATE ROLE app_updateScores;
-- Give teh ROLE the smae rights as teh prviously created user
GRANT USAGE ON GolfTournament.* TO app_updateScores;
GRANT EXECUTE ON PROCEDURE GolfTournament.updatescore TO app_updateScores;
GRANT SELECT ON GolfTournament.TournamentDayDataView TO app_updateScores;
FLUSH PRIVILEGES;
SHOW GRANTS FOR app_updateScores;

-- Assign the user the role
REVOKE ALL PRIVILEGES, GRANT OPTION FROM GolfDayRunner@localhost;
GRANT app_updateScores TO GolfDayRunner@localhost;
-- Make sure teh USER always has teh ROLE
SET DEFAULT ROLE app_updateScores TO GolfDayRunner@localhost;
FLUSH PRIVILEGES;
SHOW GRANTS FOR GolfDayRunner@localhost USING app_updateScores;


-- REVOKE stahements below
-- SET DEFAULT ROLE NONE TO GolfDayRunner@localhost;
-- SREVOKE app_updateScores FROM GolfDayRunner@localhost;