use stockauction;

/* 2. Set up and load the clients for a provided auction number.*/
drop procedure if exists LoadClientsAtAuction_sp$$; 

delimiter $$
create procedure LoadClientsAtAuction_sp (in AuctionId_p smallint)
begin
	-- validating input parameter and whether the data loaded into temporary table before proceeding
	if (auctionId_p is not null
    -- checking if the temporary table with loaded data exists and is populated
    and exists (select 1 from ClientsAtAuctionDay))
    then
		-- i had rows of data produced during triggers' tests which created duplicate keys errors. 
        -- to avoid this, i delete all the existing rows of data for the input auctionId before copying the data from a temporary table
		delete from auctionclientatauction where auctionId = AuctionId_p;
        -- setting a static auctionId using the input parameter 
		set @auctionId = AuctionId_p;
        insert into auctionclientatauction(auctionId, clientNumber, clientID)
        select @auctionId, theClientNumber, theClientId from ClientsAtAuctionDay;
        -- since we do not need the temporary table anymore, we can delete it
        drop temporary table ClientsAtAuctionDay;
	end if;
end $$
delimiter ;

CALL LoadClientsAtAuction_sp(1621);
-- making sure the temporary table is deleted and the stored procedure worked
select * from ClientsAtAuctionDay;

select * from auctionclientatauction where auctionid = 1621;

-- checking if the data will change if the temporary table is empty or does not exist
delete from auctionclientatauction where auctionid = 1621;
call LoadClientsAtAuction_sp(1621);

-- checking if the the stored procedure will work with no auctionid
-- before this, i loaded data into the temporary table
call LoadClientsAtAuction_sp(null);
select * from auctionclientatauction where auctionid = 1621;
-- just me playing with parameter types
call LoadClientsAtAuction_sp('fnjdfvg');
