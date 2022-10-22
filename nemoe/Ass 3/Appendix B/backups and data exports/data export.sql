use stockauction;

select * from sheeplot; 
 -- exporting cattlelot data
select cattlelot.auctionId, cattlelot.auctionDay, cattlelot.lotNumber, 
cattlelot.seller, ac1.fullname as 'Seller Name', cattlelot.buyer, ac2.fullname as 'Buyer Name',
cattlelot.agent, sa1.fullname as 'Agent Name', cattlelot.auctioneer, sa2.fullname as 'Auctioneer Name',
cattlelot.breed, cattlelot.sex, cattlelot.age, cattlelot.quantity, cattlelot.reserve, cattlelot.averageWeight, cattlelot.sellingPricePerKg, cattlelot.lotSellingPrice, cattlelot.passedIn
from cattlelot
inner join AuctionClientAtAuction as aca1 on cattlelot.seller = aca1.clientNumber
inner join auctionclient as ac1 on aca1.clientID = ac1.id
inner join AuctionClientAtAuction as aca2 on cattlelot.buyer = aca2.clientNumber
inner join auctionclient as ac2 on aca2.clientID = ac2.id
inner join StockAgent as sa1 on cattlelot.agent = sa1.id
inner join StockAgent as sa2 on cattlelot.auctioneer = sa2.id
group by ac1.fullname, ac2.fullname, 
cattlelot.lotNumber, cattlelot.auctionId, sa1.fullname, sa2.fullname, cattlelot.breed, cattlelot.lotSellingPrice
order by cattlelot.auctionId, cattlelot.lotNumber
INTO OUTFILE 'C:\\Temp\\ExportedData\\CattleLot_ExportedData.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';

-- exporting sheeplot data
select sheeplot.auctionId, sheeplot.auctionDay, sheeplot.lotNumber, 
sheeplot.seller, ac1.fullname as 'Seller Name', sheeplot.buyer, ac2.fullname as 'Buyer Name',
sheeplot.agent, sa1.fullname as 'Agent Name', sheeplot.auctioneer, sa2.fullname as 'Auctioneer Name',
sheeplot.breed, sheeplot.sex, sheeplot.age, sheeplot.quantity, sheeplot.reserve, sheeplot.sellingPricePerHead, sheeplot.lotSellingPrice, sheeplot.passedIn
from sheeplot
inner join AuctionClientAtAuction as aca1 on sheeplot.seller = aca1.clientNumber
inner join auctionclient as ac1 on aca1.clientID = ac1.id
inner join AuctionClientAtAuction as aca2 on sheeplot.buyer = aca2.clientNumber
inner join auctionclient as ac2 on aca2.clientID = ac2.id
inner join StockAgent as sa1 on sheeplot.agent = sa1.id
inner join StockAgent as sa2 on sheeplot.auctioneer = sa2.id
group by ac1.fullname, ac2.fullname, 
sheeplot.lotNumber, sheeplot.auctionId, sa1.fullname, sa2.fullname, sheeplot.breed, sheeplot.lotSellingPrice
order by sheeplot.auctionId, sheeplot.lotNumber
INTO OUTFILE 'C:\\Temp\\ExportedData\\SheepLot_ExportedData.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';

-- exporting clientsdata
select ac.id, ac.fullname as 'Client name', ac.address1, ac.address2, ac.address3, ac.contactPerson, ac.phone, ac.phone2, ac.email, ac.preferredNumber
from auctionclientatauction acaa
inner join auctionclient as ac on acaa.clientId=ac.id
inner join cattlelot as cl on (cl.buyer=acaa.clientNumber or cl.seller=acaa.clientNumber)
inner join sheeplot as sl on (sl.buyer=acaa.clientNumber or sl.seller=acaa.clientNumber)
group by ac.id
INTO OUTFILE 'C:\\Temp\\ExportedData\\AuctionClient_ExportedData.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';

