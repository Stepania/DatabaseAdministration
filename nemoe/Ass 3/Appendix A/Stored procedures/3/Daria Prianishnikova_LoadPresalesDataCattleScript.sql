USE StockAuction;

-- A temporary table for loading the presales data into

DROP TABLE IF EXISTS AuctionPresalesCattle;
CREATE TEMPORARY TABLE AuctionPresalesCattle(
	theLotnumber smallint not null,
    theSeller smallint not null,
    theAgent nchar(10) not null,
    theAuctioneer nchar(10) not null,
    theBreed nchar(20) not null,
    theSex nchar(1) not null,
    theAge tinyint not null,
    -- has to be unsigned because there is a 128 value in pre-sales data
    theQuantity tinyint unsigned not null,
    theAverageWeight decimal (6,2) null,
    theReserve decimal(5,2) null,
    theBuyer smallint unsigned null, 
    theSellingPrice decimal(5,2) null,
    thePassedIn bit null
);

-- Load the provided data - will have to manually change teh file name
	LOAD DATA INFILE 'C:\\Temp\\AuctionData\\C1621.csv'
-- LOAD DATA INFILE 'C:\\Temp\\AuctionData\\S1621.csv'
	IGNORE INTO TABLE AuctionPresalesCattle 
	FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (@newLotNumber, @newSeller, @newAgent, @newAuctioneer, @newBreed, @newSex, @newAge, @newQuantity, @newAverageWeight, @newReserve,
    @newBuyer, @newSellingPricePerKg, @newPassedIn)
    SET theLotnumber = @newLotNumber, 
    theSeller =  @newSeller,
    theAgent = @newAgent,
    theAuctioneer = @newAuctioneer,
    theBreed = @newBreed,
    theSex = @newSex,
    theAge = @newAge,
    theQuantity = @newQuantity,
    theAverageWeight = IF(@newAverageWeight = '', NULL, @newAverageWeight),
    theReserve = IF(@newReserve = '', NULL, @newReserve),
    theBuyer = IF(@newBuyer = '', NULL, @newBuyer),
    theSellingPrice = IF(@newSellingPricePerKg = '', NULL, @newSellingPricePerKg),
	thePassedIn = null
    ;
    

select * from AuctionPresalesCattle ;
-- Call the previously created stored procedure
CALL LoadAuctionPresales_sp('C', 1621);
