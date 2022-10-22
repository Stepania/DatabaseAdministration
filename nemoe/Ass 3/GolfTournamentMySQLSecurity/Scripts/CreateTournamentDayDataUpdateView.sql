DROP PROCEDURE IF EXISTS CreateTournamentDayDataUpdate;
DELIMITER $$
CREATE PROCEDURE CreateTournamentDayDataUpdate(IN theTournamentID CHAR(5))
BEGIN
DECLARE executeStatement VARCHAR(255);
	DROP VIEW IF EXISTS TournamentDayDataUpdate;
    SET @sqlStatement = concat("
    CREATE VIEW TournamentDayDataUpdate AS
	SELECT  teamNumber, day1StartTime, day1TeeNumber, day2StartTime, day2TeeNumber,
		player1Id, player1CourseHandicap,
        player2Id, player2CourseHandicap,
        day1Score, day2Player1Score, day2Player2Score
	FROM Team
    WHERE tournamentId='",theTournamentId,"'");
    
    PREPARE executeStatement FROM @sqlStatement;
    EXECUTE executeStatement;
    DEALLOCATE PREPARE executeStatement;
END$$
DELIMITER ;