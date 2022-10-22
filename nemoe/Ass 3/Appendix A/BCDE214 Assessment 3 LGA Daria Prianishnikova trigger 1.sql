use stockauction;

/* Triggers */
/*1. •	When a lot is sold, there needs to be a field in the AuctionClientAtAuction table that is automatically updated with the total value the Client has purchased at the auction. 
 There should also be a total for each AuctionClient.  There should be similar updates for the clients acting as sellers.*/
alter table auctionclientatauction
add TotalSoldCattle decimal(10,2) default 0 after clientid,
add totalBoughtCattle decimal(10,2) default 0 after totalSoldCattle,
add totalSoldSheep decimal(10,2) default 0 after totalSoldCattle,
add totalBoughtSheep decimal(10,2) default 0 after totalSoldSheep;

-- alter table auctionclientatauction
 -- drop column totalsoldsheep, drop column totalsoldcattle, drop column totalboughtcattle, drop column totalboughtsheep;

alter table auctionclient
add TotalSold decimal(10,2) default 0 after preferredNumber,
add totalBought decimal(10,2) default 0 after totalSold;

 drop trigger if exists CattleAuction_ClientTotal_ai$$;
 delimiter $$
 create trigger CattleAuction_ClientTotal_ai
 after insert on cattlelot
 for each row
 begin
 -- updating cattle fields
	update auctionclientatauction acaa
    set acaa.totalBoughtCattle =  (
		select sum(lotSellingPrice)
		from cattlelot cl
		where (acaa.clientNumber = cl.buyer)
		and acaa.auctionId = cl.auctionDay
    )
    where (acaa.clientNumber = new.buyer)
	and acaa.auctionId = new.auctionDay;
    
    update auctionclientatauction acaa
    set acaa.totalSoldCattle = (
		select sum(lotSellingPrice)
		from cattlelot cl
		where (acaa.clientNumber = cl.seller)
		and acaa.auctionId = cl.auctionDay
    )
    where (acaa.clientNumber = new.seller)
	and acaa.auctionId = new.auctionDay;
 end;
 $$
 delimiter ;
 
 drop trigger if exists SheepAuction_ClientTotal_ai$$;
 delimiter $$
 create trigger SheepAuction_ClientTotal_ai
 after insert on Sheeplot
 for each row
 begin
	-- updating sheep fields
	update auctionclientatauction acaa
    set acaa.totalBoughtSheep = (
		select sum(lotSellingPrice)
		from Sheeplot cl
		where (acaa.clientNumber = cl.buyer)
		and acaa.auctionId = cl.auctionDay
    )
    where (acaa.clientNumber = new.buyer)
	and acaa.auctionId = new.auctionDay;
    
    update auctionclientatauction acaa
    set acaa.totalSoldSheep = (
		select sum(lotSellingPrice)
		from Sheeplot cl
		where (acaa.clientNumber = cl.seller)
		and acaa.auctionId = cl.auctionDay
    )
    where (acaa.clientNumber = new.seller)
	and acaa.auctionId = new.auctionDay;

 end;
 $$
 delimiter ;
 
 -- triggers when lots are deleted. redundant, yes, but fully completes the business logic and covers for every use case
 drop trigger if exists CattleAuction_ClientTotal_ad$$;
 delimiter $$
 create trigger CattleAuction_ClientTotal_ad
 after delete on cattlelot
 for each row
 begin
 -- updating cattle fields
	update auctionclientatauction acaa
    set acaa.totalBoughtCattle =  (
		select sum(lotSellingPrice)
		from cattlelot cl
		where (acaa.clientNumber = cl.buyer)
		and acaa.auctionId = cl.auctionDay
    )
    where (acaa.clientNumber = old.buyer)
	and acaa.auctionId = old.auctionDay;
    
    update auctionclientatauction acaa
    set acaa.totalSoldCattle = (
		select sum(lotSellingPrice)
		from cattlelot cl
		where (acaa.clientNumber = cl.seller)
		and acaa.auctionId = cl.auctionDay
    )
    where (acaa.clientNumber = old.seller)
	and acaa.auctionId = old.auctionDay;
 end;
 $$
 delimiter ;
 
 drop trigger if exists SheepAuction_ClientTotal_ad$$;
 delimiter $$
 create trigger SheepAuction_ClientTotal_ad
 after delete on Sheeplot
 for each row
 begin
	-- updating sheep fields
	update auctionclientatauction acaa
    set acaa.totalBoughtSheep = (
		select sum(lotSellingPrice)
		from Sheeplot cl
		where (acaa.clientNumber = cl.buyer)
		and acaa.auctionId = cl.auctionDay
    )
    where (acaa.clientNumber = old.buyer)
	and acaa.auctionId = old.auctionDay;
    
    update auctionclientatauction acaa
    set acaa.totalSoldSheep = (
		select sum(lotSellingPrice)
		from Sheeplot cl
		where (acaa.clientNumber = cl.seller)
		and acaa.auctionId = cl.auctionDay
    )
    where (acaa.clientNumber = old.seller)
	and acaa.auctionId = old.auctionDay;

 end;
 $$
 delimiter ;
 
 -- updating the total in auction client
 drop trigger if exists ClientTotal_au$$;
delimiter $$
 create trigger ClientTotal_au
 after update on auctionclientatauction
 for each row
 begin
	update auctionclient ac
    set ac.totalBought = new.totalBoughtSheep + new.totalBoughtCattle
    where new.clientID = ac.id;
    
    update auctionclient ac
    set ac.totalSold = new.totalSoldSheep + new.totalSoldCattle
    where new.clientID = ac.id;
 end;
 $$
 delimiter ;
 
 /*tests*/
 -- testing cattlelot
 insert CattleLot (auctionId, auctionDay, lotNumber, seller, agent, breed, sex, age, quantity, averageWeight, reserve, auctioneer, buyer, sellingPricePerKg, passedIn) VALUES (N'C1620', 1620, 245, 74, N'F_Don     ', N'Angus X             ', N'S', 3, 17,980.00, NULL, N'F_Don     ', 75, 2.9000, 0);

-- calculating how much they have earned/spent at cattle auctions
select sum(lotSellingPrice) as 'Total bought'
		from cattlelot cl, auctionclientatauction acaa
		where (acaa.clientNumber = cl.seller)
		and acaa.auctionId = cl.auctionDay
        and cl.buyer = 75
        and cl.auctionDay = 1620;

select sum(lotSellingPrice) as 'total sold'
		from cattlelot cl, auctionclientatauction acaa
		where (acaa.clientNumber = cl.seller)
		and acaa.auctionId = cl.auctionDay
        and cl.seller = 74
        and cl.auctionDay = 1620;
	

select * from auctionclientatauction
where totalBoughtCattle > 0
or totalSoldCattle >0;
 
select * from auctionclient
where totalBought > 0
or totalSold >0;

-- testing sheeplot with the same people as cattlelot
-- this is done to see if the value will be overwritten or summed up together
 
INSERT SheepLot (auctionId, auctionDay, lotNumber, seller, agent, breed, sex, age, quantity, reserve, auctioneer, buyer, sellingPricePerHead, passedIn) VALUES (N'S1620', 1620, 364, 74, N'P_Jan     ', N'Merino              ', N'R', 10, 75, NULL, N'P_Jan     ', 75, 88.0000, NULL); 
-- delete from sheeplot where auctionid='S1620' and lotnumber = 364;
-- calculating how much they have earned/spent at sheep auctions
select sum(lotSellingPrice)
		from Sheeplot cl, auctionclientatauction acaa
		where (acaa.clientNumber = cl.seller)
		and acaa.auctionId = cl.auctionDay
        and cl.buyer = 75
        and cl.auctionDay = 1620;
        
select sum(lotSellingPrice)
		from Sheeplot cl, auctionclientatauction acaa
		where (acaa.clientNumber = cl.seller)
		and acaa.auctionId = cl.auctionDay
        and cl.seller = 74
        and cl.auctionDay = 1620;

select * from auctionclientatauction
where totalBoughtSheep > 0
or totalSoldSheep >0;

select * from auctionclient
where totalBought > 0
or totalSold >0;

-- testing for the deletion of cattle/sheep lots

delete from cattlelot where auctionid = 'C1620' and lotnumber = 245;
delete from sheeplot where auctionid ='S1620' and lotnumber = 364;
select * from auctionclientatauction
where totalBoughtCattle > 0
or totalSoldCattle >0;
 
select * from auctionclient
where totalBought > 0
or totalSold >0;
