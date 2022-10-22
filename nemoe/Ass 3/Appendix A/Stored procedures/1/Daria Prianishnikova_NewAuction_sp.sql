use stockauction;

/*Given a date, auction number, and whether there are a cattle and/or sheep auction, create the appropriate auctions*/
drop procedure if exists NewAuction_sp$$;
delimiter $$
create procedure NewAuction_sp
 (in newAuctionId_p smallint, in newAuctionDate_p date,in auctionType_p char(5), in startTime_p time)
begin
-- checking for null parameters
if (startTime_p is not null 
	and newAuctionId_p is not null 
	and auctionType_p is not null 
    and newAuctionDate_p is not null) then
    -- if all in parameters are not null, then we can proceed
    -- if the entry does not exist, create it; skip, if it exists and continue with sheep/cattle auctions
    insert ignore into auctionDay (id, auctionDay) values (newAuctionId_p, newAuctionDate_p);
	case auctionType_p
		when 'C' then 
        -- create a row in auctionday only if the auctiontype is correct so there are no duplicate keys when we try to call the procedure again
			insert into cattleauction (id, auctionId, startTime)
			values (concat(auctionType_p, newAuctionId_p), newAuctionId_p, startTime_p);
        when 'S' then 
			insert into sheepauction (id, auctionId, startTime)
			values (concat(auctionType_p, newAuctionId_p), newAuctionId_p, startTime_p);
	end case;
    end if;
end $$
delimiter ;

/*Tests*/
call NewAuction_sp(1634, '2020-09-19','C', '11:00:00');
select * from auctionday where id=1634;
select * from cattleauction where auctionId = 1634;

call NewAuction_sp(1630, '2020-09-19','S', '11:00:00');
select * from auctionday where id=1630;
select * from sheepauction where auctionId = 1630;

call NewAuction_sp(1632, '2020-09-19','A', '11:00:00');
select * from auctionday where id=1632;

call NewAuction_sp(1632, '2020-09-19','C', null);
select * from auctionday where id=1632;

-- testing for two auctions at the same date
call NewAuction_sp(1621, '2021-09-19','C', '11:00:00');
call NewAuction_sp(1621, '2021-09-19','S', '11:00:00');
select * from auctionday where id=1621;
select * from sheepauction;
select * from cattleauction;
