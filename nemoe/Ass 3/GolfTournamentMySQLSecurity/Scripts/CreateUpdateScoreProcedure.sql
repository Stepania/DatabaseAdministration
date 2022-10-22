USE GolfTournament;
DROP PROCEDURE IF EXISTS updatescore;
DELIMITER $$
CREATE PROCEDURE updatescore(IN theTeamNumber TINYINT, IN thePlayerNumber TINYINT UNSIGNED, IN theNewScore TINYINT UNSIGNED, OUT returnValue TINYINT)
/*
	Stored procedure for entering scores
    thePlayerNumber = 0 for day1Score, 1 for day2Player1Score, 2 for day2Player2Score
    
    Returns 
		theNewScore if valid
        -1 if thePlayerNumber not 0,1 or 2
        -2 if theTeamNumber is not a team in teh tournament
    
*/
BEGIN
	-- 
	SET returnValue = theNewScore;
	-- chack a valid TournamentDayDataUpdate
    IF (SELECT COUNT(*) FROM TournamentDayDataUpdate WHERE teamNumber = theTeamNumber) = 1 THEN
		IF thePlayerNumber = 0 THEN
			-- Team being updated
			UPDATE TournamentDayDataUpdate
				SET day1Score = theNewScore WHERE teamNumber = theTeamNumber;
		ELSEIF thePlayerNumber = 1 THEN
			-- Player 1 being updated
			UPDATE TournamentDayDataUpdate
				SET day2Player1Score = theNewScore WHERE teamNumber = theTeamNumber;
		ELSEIF thePlayerNumber = 1 THEN
			-- Player 2 being updated
			UPDATE TournamentDayDataUpdate
				SET day2Player2Score = theNewScore WHERE teamNumber = theTeamNumber;
		ELSE 
        -- invalid player number
			SET returnValue = -1;
		END IF;
	ELSE
		-- invlaid team number
		SET returnValue = -2;
	END IF;
END$$
DELIMITER ;
-- Test teh procedure
SELECT * FROM TournamentDayDataView WHERE teamNumber = 2;