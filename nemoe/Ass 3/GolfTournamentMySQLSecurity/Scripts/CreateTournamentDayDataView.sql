USE GolfTournament;
DROP PROCEDURE IF EXISTS CreateTournamentDayDataView;
DELIMITER $$
CREATE PROCEDURE CreateTournamentDayDataView(IN theTournamentID CHAR(5))
BEGIN
DECLARE executeStatement VARCHAR(255);
	DROP VIEW IF EXISTS TournamentDayDataView;
    SET @sqlStatement = concat("
    CREATE VIEW TournamentDayDataView AS
	SELECT  teamNumber, day1StartTime, day1TeeNumber, day2StartTime, day2TeeNumber,
		player1Id, (SELECT concat(firstName,' ', lastName) FROM Player WHERE Player.id=player1Id) AS Player1Name, player1CourseHandicap,
        player2Id, (SELECT concat(firstName,' ', lastName) FROM Player WHERE Player.id=player1Id) AS player2Name, player2CourseHandicap,
        day1Score, day2Player1Score, day2Player2Score
	FROM Team
    WHERE tournamentId='",theTournamentId,"'");
    
    PREPARE executeStatement FROM @sqlStatement;
    EXECUTE executeStatement;
    DEALLOCATE PREPARE executeStatement;
END$$
DELIMITER ;


	