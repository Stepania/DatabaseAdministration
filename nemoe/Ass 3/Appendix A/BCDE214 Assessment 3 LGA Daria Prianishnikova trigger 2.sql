use stockauction;

/* 2. A counter of how many auctions a client has attended in the last year.*/
alter table auctionclient add Auctioncounter int default 0 after totalBought;

drop trigger if exists AuctionClient_Counter_ai$$;
delimiter $$
create trigger AuctionClient_Counter_ai
after insert on auctionclientatauction
for each row
begin
update auctionclient ac
set auctioncounter = (
	select count(acaa.auctionId)
	from auctionclientatauction acaa, auctionday ad
    where acaa.clientId = ac.id
    and acaa.auctionid=ad.id
    and year(ad.auctionday) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))
	group by acaa.clientId
)
where new.clientID = ac.id;
end;
$$
delimiter ;

drop trigger if exists AuctionClient_Counter_ad$$;
delimiter $$
create trigger AuctionClient_Counter_ad
after delete on auctionclientatauction
for each row
begin
update auctionclient ac
set auctioncounter = (
	select count(acaa.auctionId)
	from auctionclientatauction acaa, auctionday ad
    where acaa.clientId = ac.id
    and acaa.auctionid=ad.id
    and year(ad.auctionday) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))
	group by acaa.clientId
)
where old.clientID = ac.id;
end;
$$
delimiter ;

/*Tests*/
INSERT AuctionClientAtAuction (auctionId, clientNumber, clientID) VALUES (1620, 44, N'KIR77     ');

select acaa.clientId, count(acaa.auctionId)
from auctionclientatauction acaa, auctionclient ac, auctionday ad
where acaa.clientId = ac.id
and acaa.auctionid=ad.id
and year(ad.auctionday) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))
group by acaa.clientId;

select * from auctionclient
where id = 'KIR77';

-- inserting a future auction and seeing if the counter changes
INSERT AuctionDay (id, auctionDay) VALUES (1624, '2024-08-03');
INSERT AuctionClientAtAuction (auctionId, clientNumber, clientID) VALUES (1624, 44, N'KIR77     ');
select * from auctionclient
where auctioncounter >0;

-- test for the counter going down in case the client is un-enrolled
delete from AuctionClientAtAuction where auctionId = 1620
and clientId='KIR77'
and clientNumber = 44;
-- the counter went down
select * from auctionclient
where id = 'KIR77';