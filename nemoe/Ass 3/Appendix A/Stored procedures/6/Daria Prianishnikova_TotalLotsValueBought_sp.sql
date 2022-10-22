use stockauction;

/* 6.  Calculate the total value of all lots ever sold by an input buyer.  This should either be cattle, sheep or both, depending on user input. */
drop procedure if exists TotalLotsValueBought_sp$$;
delimiter $$
create procedure TotalLotsValueBought_sp (in buyerId_p char(10), in auctionType_p char(5), out lotsBoughtValue_p decimal(10,2))
begin
	if (buyerId_p is not null
	and auctionType_p is not null)
	then
		-- case depending on the second parameter determining which lots to sum
		case auctionType_p
        when 'C' then 
			select sum(cl.lotSellingPrice)
            into lotsBoughtValue_p 
            from cattlelot cl
            inner join auctionclientatauction aca on cl.buyer=aca.clientNumber
            inner join auctionclient ac on aca.clientID = ac.id
            where ac.id = buyerId_p;
		when 'S' then
			select sum(sl.lotSellingPrice)
            into lotsBoughtValue_p
            from sheeplot sl
            inner join auctionclientatauction aca on sl.buyer=aca.clientNumber
            inner join auctionclient ac on aca.clientID = ac.id
            where ac.id = buyerId_p;
            -- case for both lots types
          when 'All' then
            select 
            (select sum(cl.lotSellingPrice)
            from cattlelot cl
            inner join auctionclientatauction aca on cl.buyer=aca.clientNumber
            inner join auctionclient ac on aca.clientID = ac.id
            where ac.id = buyerId_p) 
            +
            (select sum(sl.lotSellingPrice)
            from sheeplot sl
            inner join auctionclientatauction aca on sl.buyer=aca.clientNumber
            inner join auctionclient ac on aca.clientID = ac.id
            where ac.id = buyerId_p)
            into lotsBoughtValue_p;
		end case;
	end if;
end $$
delimiter ;

-- Test for cattlelots
call TotalLotsValueBought_sp('MEG54', 'C', @TotalCattleLotsBought);
select @TotalCattleLotsBought;
-- testing it outside the stored procedure to see if the output is the same
select sum(cl.lotSellingPrice) from cattlelot cl
inner join auctionclientatauction aca on cl.buyer = aca.clientNumber
inner join auctionclient ac on aca.clientId = ac.id
where ac.id = 'MEG54';

-- Test for sheeplots
call TotalLotsValueBought_sp('MEG54', 'S', @TotalSheepLotsBought);
select @TotalSheepLotsBought;
-- Tetsing outside the stored procedure
select sum(sl.lotSellingPrice) from sheeplot sl
inner join auctionclientatauction aca on sl.buyer = aca.clientNumber
inner join auctionclient ac on aca.clientId = ac.id
where ac.id = 'MEG54';

-- Test for both
call TotalLotsValueBought_sp('MEG54', 'All', @TotalBought);
select @TotalBought;
-- I have manually calculated the output to be correct
