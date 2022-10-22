use stockauction;

-- Write a script to create the following SQL users with the provided rights.  They should not be able to do anything else.  Make the passwords the same as the Login name and do not enforce the password policy. 

create user 'AuctionCreator'@'localhost' identified by 'AuctionCreator';
grant insert, update on stockauction.auctionday to 'AuctionCreator'@'localhost';
grant insert, update on stockauction.cattleauction to 'AuctionCreator'@'localhost'; 
grant insert, update on stockauction.sheepauction to 'AuctionCreator'@'localhost'; 

create user 'ClientLoader'@'localhost' identified by 'ClientLoader';
grant insert, update on stockauction.auctionclient to 'ClientLoader'@'localhost';
grant insert, update on stockauction.auctionclientatauction to 'ClientLoader'@'localhost';
-- needed for running the procedures
grant CREATE TEMPORARY TABLES on stockauction.* to 'ClientLoader'@'localhost';
grant file on *.* to 'ClientLoader'@'localhost';

create user 'StockLoader'@'localhost' identified by 'StockLoader';
grant insert, update on stockauction.sheeplot to 'StockLoader'@'localhost';
grant insert, update on stockauction.cattlelot to 'StockLoader'@'localhost';
-- needed for running the procedures
grant CREATE TEMPORARY TABLES on stockauction.* to 'StockLoader'@'localhost';
grant file on *.* to 'StockLoader'@'localhost';

create user 'AuctionDayDataEntry'@'localhost' identified by 'AuctionDayDataEntry';
grant update on stockauction.sheeplot to 'AuctionDayDataEntry'@'localhost';
grant update on stockauction.cattlelot to 'AuctionDayDataEntry'@'localhost';


create user 'AuctionDaySupervisor'@'localhost' identified by 'AuctionDaySupervisor';
grant insert, update on stockauction.auctionclient to 'AuctionDaySupervisor'@'localhost';
grant insert, update on stockauction.auctionclientatauction to 'AuctionDaySupervisor'@'localhost';
grant insert, update on stockauction.sheeplot to 'AuctionDaySupervisor'@'localhost';
grant insert, update on stockauction.cattlelot to 'AuctionDaySupervisor'@'localhost';
-- needed for running the procedures
grant CREATE TEMPORARY TABLES on stockauction.* to 'AuctionDaySupervisor'@'localhost';
grant file on *.* to 'AuctionDaySupervisor'@'localhost';

create user 'SaleDayAdmin'@'localhost' identified by 'SaleDayAdmin';
grant all on stockauction.* to 'SaleDayAdmin'@'localhost';

create user 'Reporter'@'localhost' identified by 'Reporter';
grant select on stockauction.* to 'Reporter'@'localhost';

create user 'DailyReporter'@'localhost' identified by 'DailyReporter';
grant select, show view on stockauction.SoldSheepLots2019 to 'DailyReporter'@'localhost';
grant select, show view on stockauction.SoldCattleLots2020 to 'DailyReporter'@'localhost';

-- Testing
show grants for 'AuctionCreator'@'localhost';
show grants for 'ClientLoader'@'localhost';
show grants for 'StockLoader'@'localhost';
show grants for 'AuctionDayDataEntry'@'localhost';
show grants for 'AuctionDaySupervisor'@'localhost';
show grants for 'SaleDayAdmin'@'localhost';
show grants for 'Reporter'@'localhost';
show grants for 'DailyReporter'@'localhost';

