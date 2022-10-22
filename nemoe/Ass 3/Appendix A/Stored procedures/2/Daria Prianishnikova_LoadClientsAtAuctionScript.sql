-- Script to load clients at a particular auction

-- The user will need to change teh file name in teh LOAD DATA INFILE statement
-- The user will need to change teh auction number in teh call statement

-- The Schema being used.  You may have to change teh name
USE StockAuction;

-- A temporary table for loading the client data into

DROP TABLE IF EXISTS ClientsAtAuctionDay;
CREATE TEMPORARY TABLE ClientsAtAuctionDay(
	theClientId CHAR(5),
    theClientNumber SMALLINT UNSIGNED
);

-- Load teh provided data - will have to manually change teh file name
-- LOAD DATA INFILE erequires a string literal I think
 LOAD DATA INFILE 'C:\\Temp\\AuctionData\\1621Clients.csv'
	-- LOAD DATA INFILE 'C:\\wamp64\tmp\\1621Clients.csv'
	IGNORE INTO TABLE ClientsAtAuctionDay 
	FIELDS TERMINATED BY ',' ENCLOSED BY '"'LINES TERMINATED BY '\n' 
    IGNORE 1 LINES
    -- Personal preference, I prefer to explicitely name teh input columns
    -- I don't trust teh data entry operators who provide teh input data
    -- It also stops variale scope problems
    (@nextId, @nextClientNumber)
    SET theClientId = @nextId, theClientNumber = @nextClientNumber
    ;

-- Call teh previously created stored procedure
CALL LoadClientsAtAuction_sp(1621);
