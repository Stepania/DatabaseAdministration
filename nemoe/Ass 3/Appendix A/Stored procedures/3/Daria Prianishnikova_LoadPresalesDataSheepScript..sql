USE StockAuction;

-- A temporary table for loading the presales data into

DROP TABLE IF EXISTS AuctionPresalesSheep;
CREATE TEMPORARY TABLE AuctionPresalesSheep(
	theLotnumber smallint not null,
    theSeller smallint not null,
    theAgent nchar(10) not null,
    theAuctioneer nchar(10) not null,
    theBreed nchar(20) not null,
    theSex nchar(1) not null,
    theAge tinyint not null,
    -- has to be unsigned because there is a 128 value in pre-sales data
    theQuantity tinyint unsigned not null,
    theReserve smallint null
);

-- Load the provided data - will have to manually change teh file name
	LOAD DATA INFILE 'C:\\Temp\\AuctionData\\S1621.csv'
	IGNORE INTO TABLE AuctionPresalesSheep
	FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (@newLotNumber, @newSeller, @newAgent, @newAuctioneer, @newBreed, @newSex, @newAge, @newQuantity, @newReserve)
    SET theLotnumber = @newLotNumber, 
    theSeller =  @newSeller,
    theAgent = @newAgent,
    theAuctioneer = @newAuctioneer,
    theBreed = @newBreed,
    theSex = @newSex,
    theAge = @newAge,
    theQuantity = @newQuantity,
    theReserve = IF(@newReserve = '', NULL, @newReserve)
    ;
    

select * from AuctionPresalesSheep ;
-- Call the previously created stored procedure
CALL LoadAuctionPresales_sp('S', 1621);
