use stockauction;

/* Views */
/*1. All lots of cattle sold in 2020.  Include the names of the buyers, sellers, agents and auctioneers, the number and type sold, and the price per lot.  Do not include passed in lots.
Temporary variables forextracting data twice from the same table? */
create view SoldCattleLots2020 as
select cattlelot.auctionId, auctionday.auctionDay, cattlelot.lotNumber, 
ac1.fullname as 'Seller', ac2.fullname as 'Buyer',
sa1.fullname as 'Agent', sa2.fullname as 'Auctioneer',
cattlelot.breed, cattlelot.lotSellingPrice
from cattlelot
inner join AuctionClientAtAuction as aca1 on cattlelot.seller = aca1.clientNumber
inner join auctionclient as ac1 on aca1.clientID = ac1.id
inner join AuctionClientAtAuction as aca2 on cattlelot.buyer = aca2.clientNumber
inner join auctionclient as ac2 on aca2.clientID = ac2.id
inner join StockAgent as sa1 on cattlelot.agent = sa1.id
inner join StockAgent as sa2 on cattlelot.auctioneer = sa2.id
inner join auctionday on cattlelot.auctionDay = auctionday.id  
where year(auctionday.auctionDay) = 2020
and cattlelot.passedIn is not true
group by ac1.fullname, ac2.fullname, 
cattlelot.lotNumber, cattlelot.auctionId, sa1.fullname, sa2.fullname, cattlelot.breed, cattlelot.lotSellingPrice
order by cattlelot.lotNumber;

select * from SoldCattleLots2020;

/*Tests*/
update cattlelot
set seller = 39
where lotNumber = 1
and auctionDay=1619;
select * from SoldCattleLots2020;

update cattlelot
set age = 4
where lotNumber = 1
and auctionDay=1619;
select * from SoldCattleLots2020;

/*2.All lots of sheep sold in 2020. !!!	THERE ARE NO SHEEP AUCTIONS IN 2020, so I used auctions from 2019
Include the names of the buyers, sellers, agents and auctioneers, the number and type sold, and the price per lot.  Do not include passed in lots.  */
create view SoldSheepLots2019 as
select sheeplot.auctionId, auctionday.auctionDay, sheeplot.lotNumber, 
ac1.fullname as 'Seller', ac2.fullname as 'Buyer',
sa1.fullname as 'Agent', sa2.fullname as 'Auctioneer',
sheeplot.breed, sheeplot.lotSellingPrice
from sheeplot
inner join AuctionClientAtAuction as aca1 on sheeplot.seller = aca1.clientNumber
inner join auctionclient as ac1 on aca1.clientID = ac1.id
inner join AuctionClientAtAuction as aca2 on sheeplot.buyer = aca2.clientNumber
inner join auctionclient as ac2 on aca2.clientID = ac2.id
inner join StockAgent as sa1 on sheeplot.agent = sa1.id
inner join StockAgent as sa2 on sheeplot.auctioneer = sa2.id
inner join auctionday on sheeplot.auctionDay = auctionday.id
where year(auctionday.auctionDay) = 2019
and sheeplot.passedIn is false or sheeplot.passedIn is null
group by ac1.fullname, ac2.fullname, 
sheeplot.lotNumber, sheeplot.auctionId, sa1.fullname, sa2.fullname, sheeplot.breed, sheeplot.lotSellingPrice
order by sheeplot.lotNumber;
 
select * from soldsheeplots2019;

update sheeplot
set seller = 67
where lotNumber =101
and auctionDay = 1620;
select * from soldsheeplots2019;

update sheeplot
set sex = 'W'
where lotNumber =101
and auctionDay = 1620;
select * from soldsheeplots2019;