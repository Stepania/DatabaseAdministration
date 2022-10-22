use stockauction;

/*5. Calculate the total value of all lots ever sold by an input seller.  This should either be cattle, sheep or both, depending on user input. */
drop procedure if exists TotalLotsValueSold_sp$$;
delimiter $$
create procedure TotalLotsValueSold_sp (in sellerId_p char(10), in auctionType_p char(5), out lotsSoldValue_p decimal(10,2))
begin
declare sheeplotsvalue, cattlelotsvalue decimal(10,2);
	if (sellerId_p is not null
	and auctionType_p is not null)
	then
		case auctionType_p
        when 'C' then 
			select sum(cl.lotSellingPrice)
            into lotsSoldValue_p
            from cattlelot cl
            inner join auctionclientatauction aca on cl.seller=aca.clientNumber
            inner join auctionclient ac on aca.clientID = ac.id
            where ac.id = sellerId_p;
		when 'S' then
			select sum(sl.lotSellingPrice)
            into lotsSoldValue_p
            from sheeplot sl
            inner join auctionclientatauction aca on sl.seller=aca.clientNumber
            inner join auctionclient ac on aca.clientID = ac.id
            where ac.id = sellerId_p;
          when 'All' then
            select 
            (select sum(cl.lotSellingPrice)
            from cattlelot cl
            inner join auctionclientatauction aca on cl.seller=aca.clientNumber
            inner join auctionclient ac on aca.clientID = ac.id
            where ac.id = sellerId_p) 
            +
            (select sum(sl.lotSellingPrice)
            from sheeplot sl
            inner join auctionclientatauction aca on sl.seller=aca.clientNumber
            inner join auctionclient ac on aca.clientID = ac.id
            where ac.id = sellerId_p)
            into lotsSoldValue_p;
		end case;
	end if;
end $$
delimiter ;

-- Test for cattlelots
call TotalLotsValueSold_sp('KIR77', 'C', @TotalCattleLotsSold);
select @totalCattleLotsSold;
-- testing it outside the stored procedure to see if the output is the same
select sum(cl.lotSellingPrice) from cattlelot cl
inner join auctionclientatauction aca on cl.seller = aca.clientNumber
inner join auctionclient ac on aca.clientId = ac.id
where ac.id = 'KIR77';

-- Test for sheeplots
call TotalLotsValueSold_sp('KIR77', 'S', @TotalSheepLotsSold);
select @TotalSheepLotsSold;
-- Tetsing outside the stored procedure
select sum(sl.lotSellingPrice) from sheeplot sl
inner join auctionclientatauction aca on sl.seller = aca.clientNumber
inner join auctionclient ac on aca.clientId = ac.id
where ac.id = 'KIR77';

-- Test for both
call TotalLotsValueSold_sp('KIR77', 'All', @TotalSold);
select @TotalSold;
-- I have manually calculated the output to be correct

