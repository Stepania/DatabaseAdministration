USE StockAuction;

-- A temporary table for loading the presales data into

DROP TABLE IF EXISTS AuctionSales;
CREATE TEMPORARY TABLE AuctionSales(
	theLotnumber smallint not null,
    theAverageWeight decimal (6,2) null,
    theSellingPrice decimal(5,2) null,
    theBuyer smallint unsigned null, 
    thePassedIn bit null
);


-- Load the cattle sales data
	LOAD DATA INFILE 'C:\\Temp\\AuctionData\\C1621Sales.csv'
	IGNORE INTO TABLE AuctionSales 
	FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (@newLotNumber, @newAverageWeight, @newSellingPrice, @newBuyer, @newPassedIn)
    SET theLotnumber = @newLotNumber, 
    theAverageWeight = IF(@newAverageWeight = '', NULL, @newAverageWeight),
    theSellingPrice = IF(@newSellingPrice = '', NULL, @newSellingPrice),
    theBuyer = IF(@newBuyer = '', NULL, @newBuyer),
	thePassedIn = @newPassedIn
    ;
    

select * from  AuctionSales;
-- Call the previously created stored procedure
CALL LoadAuctionSales_sp('C', 1621);




-- Create the table for the sheep sales data
DROP TABLE IF EXISTS AuctionSales;
CREATE TEMPORARY TABLE AuctionSales(
	theLotnumber smallint not null,
    theBuyer smallint unsigned null, 
    theSellingPrice decimal(5,2) null,
    thePassedIn bit null
);
-- Load the sheep data
	LOAD DATA INFILE 'C:\\Temp\\AuctionData\\S1621Sales.csv'
	IGNORE INTO TABLE AuctionSales 
	FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (@newLotNumber, @newBuyer, @newSellingPricePerHead, @newPassedIn)
    SET theLotnumber = @newLotNumber, 
    theSellingPrice = IF(@newSellingPricePerHead = '', NULL, @newSellingPricePerHead),
    theBuyer = IF(@newBuyer = '', NULL, @newBuyer),
	thePassedIn = IF(@newPassedIn = '', null, @newPassedIn)
    ;
    
select * from AuctionSales;
CALL LoadAuctionSales_sp('S', 1621);