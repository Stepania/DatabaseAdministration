use stockauction;

/*3. Load provided presales data*/
-- I had to change cattlelot and sheeplot quantity field to unsigned tinyint because in sheeplot there is a 128 value but just tinyint only allows up to 127


drop procedure if exists LoadAuctionPresales_sp$$; 
delimiter $$
create procedure LoadAuctionPresales_sp (in newAuctionType_p char(5), in newAuctionId_p smallint)
begin

-- I had to change cattlelot and sheeplot quantity field to unsigned tinyint because in sheeplot there is a 128 value but just tinyint only allows up to 127
alter table sheeplot modify quantity tinyint unsigned; 
	-- validating input parameter and whether the data loaded into temporary table before proceeding
	if (newAuctionId_p is not null
    and newAuctionType_p is not null)
    then
		-- depending on the auctiontype load data into cattelot or sheeplot
		case newAuctionType_p
		when 'C' then 
			-- concatinating the auctionId
			set @auctionId = concat(newAuctionType_p, newAuctionId_p);
            -- delete pre-existing rows of data to avoid dumplicate keys errors
			delete from cattlelot where auctionId = @auctionId;
			insert into cattlelot(auctionId, lotNumber, auctionDay, seller, agent, breed, sex, 
            age, quantity, averageWeight, reserve, auctioneer, buyer, sellingPricePerKg, passedIn)
			select @auctionId, theLotNumber, newAuctionId_p, theSeller, theAgent, theBreed, theSex, 
            theAge, theQuantity, theAverageWeight, theReserve, theAuctioneer, theBuyer, theSellingPrice, thePassedIn from AuctionPresalesCattle;
            -- deleting the temporary table
			drop temporary table AuctionPresalesCattle;
        when 'S' then 
			-- concatinating the auctionId
			set @auctionId = concat(newAuctionType_p, newAuctionId_p);
			delete from sheeplot where auctionId = @auctionId;
			insert into sheeplot(auctionId, lotNumber, auctionDay, seller, agent, breed, sex, 
            age, quantity, reserve, auctioneer)
			select @auctionId, theLotNumber, newAuctionId_p, theSeller, theAgent, theBreed, theSex, 
            theAge, theQuantity, theReserve, theAuctioneer from AuctionPresalesSheep;
            -- deleting the temporary table
			drop temporary table AuctionPresalesSheep;
    end case;
	end if;
end;
$$
delimiter ;

-- Tests after running corresponding scripts
select * from cattlelot where auctionId='C1621';
select * from sheeplot where auctionId='S1621';


select * from AuctionPresalesCattle;
select * from AuctionPresalesSheep;

CALL LoadAuctionPresales_sp('S', null);
CALL LoadAuctionPresales_sp(null, null);