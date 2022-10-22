use stockauction;

/*4. Load provided sales data*/
drop procedure if exists LoadAuctionSales_sp$$; 
delimiter $$
create procedure LoadAuctionSales_sp (in newAuctionType_p char(5), in newAuctionId_p smallint)
begin
	-- validating input parameter and whether the data loaded into temporary table before proceeding
	if (newAuctionId_p is not null
    and newAuctionType_p is not null)
    then
		-- depending on the auctiontype load data into cattelot or sheeplot
		case newAuctionType_p
		when 'C' then 
			-- concatinating the auctionId
			set @auctionId = concat(newAuctionType_p, newAuctionId_p);
            -- updating the cattlelot 
            update cattlelot cl
            inner join auctionsales as aus on aus.theLotNumber = cl.lotNumber
				and @auctionId = cl.auctionId
			set averageWeight = aus.theAverageWeight,
				sellingPricePerKg = aus.theSellingPrice,
				buyer = aus.theBuyer, 
				passedIn = aus.thePassedIn;
        when 'S' then 
			-- concatinating the auctionId
			set @auctionId = concat(newAuctionType_p, newAuctionId_p);
			-- updating the sheeplot 
            update sheeplot cl
            inner join auctionsales as aus on aus.theLotNumber = cl.lotNumber
				and @auctionId = cl.auctionId
			set 
				sellingPricePerHead = aus.theSellingPrice,
				buyer = aus.theBuyer, 
				passedIn = aus.thePassedIn;
    end case;
    -- deleting the temporary table
	drop temporary table AuctionSales;
	end if;
end $$
delimiter ;


-- Tests
select * from cattlelot where auctionId = 'C1621';
select * from sheeplot where auctionid = 'S1621';
CALL LoadAuctionSales_sp('A', 1621);

select * from cattlelot;
select * from auctionclientatauction;