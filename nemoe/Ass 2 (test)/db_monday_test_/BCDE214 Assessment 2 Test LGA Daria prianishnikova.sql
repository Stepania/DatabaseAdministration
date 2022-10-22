USE ALEXMARA2020;
-- tables
-- Create a table called FeeHistory (SlipID, MarinaNum, ChangeDate, OldFee, NewFee) with a primary key of SlipID + MarinaNum. This table keeps track of Rental Fee changes. Only one Fee change is allowed each day.

create table FeeHistory (
SlipID int not null,
MarinaNum char(4) not null,
changedate datetime not null,
oldfee decimal(8,2) not null,
newFee decimal(8,2) not null,

primary key(slipid, marinanum)
)engine = innodb;

-- for the 'only one fee change is allowed each date'. it is tested in trigger #3 when i tried to change the rental price again
create unique index newFeeDate_idx on FeeHistory(MarinaNum, changedate);

-- triggers
-- 1.	When the rental fee in MarinaSlip is changed a row is added to the FeeHistory table. 
-- The ChangeDate is the system date. 
drop trigger if exists FeeHistoryUpdate_au$$;
delimiter $$
create trigger FeeHistoryUpdate_au
after update on MarinaSlip
for each row
begin 
	if (old.rentalFee <> new.rentalFee) then
		insert into FeeHistory (SlipID, MarinaNum, changedate, oldfee, newFee)
        values (old.slipId, old.MarinaNum, now(), old.rentalFee, new.rentalfee);
	end if;
end;
$$
delimiter ;

select * from marinaslip;
update marinaslip 
set rentalfee = 3900
where boatname = 'Anderson II' and slipid =1;
select * from feehistory;

select * from owner;
select * from marinaslip;

-- 2.	When inserting a row in the MarinaSlip table, add the rental fee to the total rental for the appropriate owner. 
drop trigger if exists newOwnerTotal_ai$$;
delimiter $$
create trigger newOwnerTotal_ai
after insert on MarinaSlip
for each row
begin
	update owner 
    set totalrental = totalrental + new.rentalfee
    where OwnerNum = new.ownerNum;
end;
$$
delimiter ;
insert into marinaslip (SlipID, MarinaNum, SlipNum, Length, RentalFee, BoatName, BoatType, OwnerNum)
values ('12', '2', '7', '40', '4200.00', 'Axxon II', 'Dolphin 40', 'TR72');
select * from marinaslip where ownerNum ='TR72';
select * from owner where ownerNum='TR72';

-- 3. When updating a row in the MarinaSlip table, add the difference between the new rental fee and the old rental fee to the total rental for the appropriate owner. 
drop trigger if exists newRentalFeeDifference_Owner_au$$;
delimiter $$
create trigger newRentalFeeDifference_Owner_au
after update on Marinaslip
for each row
begin
	if (old.rentalfee <> new.rentalfee) then
	update owner 
    set totalrental = totalrental + (new.rentalFee - old.rentalfee)
    where OwnerNum = new.ownerNum;
	end if;
end;
$$
delimiter ;

select * from marinaslip;
update marinaslip
set rentalfee = 3700
where slipid =12;

select * from owner where ownerNum='TR72';

-- i tried to test for the increase but this tested instead for a price change constraint
update marinaslip
set rentalfee = 4500
where slipid =12;

-- 4.	When deleting a row in the MarinaSlip table, subtract the rental fee from the total rental for the appropriate owner. 
drop trigger if exists SubstractTotalRentalFee_Owner_ad$$;
delimiter $$
create trigger SubstractTotalRentalFee_Owner_ad
after delete on marinaslip
for each row
begin
	update owner
	set totalrental = totalrental - old.rentalfee
    where OwnerNum = old.ownerNum;
end;
$$
delimiter ;

-- test
insert into marinaslip (SlipID, MarinaNum, SlipNum, Length, RentalFee, BoatName, BoatType, OwnerNum)
values ('13', '2', '7', '40', '4200.00', 'Axxon II', 'Dolphin 40', 'TR72');
select * from owner where ownerNum='TR72';
delete from marinaslip where slipId=13;
select * from owner where ownerNum='TR72';

-- views
-- 1.	Create a view named LargeSlip using the data in the MarinaNum, SlipNum, RentalFee, BoatName, Length and OwnerNum columns in the MarinaSlip table for those slips with lengths of 40 feet. Display the data in the view. 
drop view largeSlip;
create view LargeSlip as
select  MarinaNum, SlipNum, Length, RentalFee, BoatName, BoatType, OwnerNum 
from MarinaSlip
having length=40;

select * from LargeSlip;

-- 2.	Create a view named MarinaService using the SlipID, category number, category description, and estimated hours for every service request for which the spent hours are 5 or more. Display the data in the view. 
drop view MarinaService;
create view MarinaService as
select slipId, categoryNum, description, estHours
from servicerequest
group by slipId, categoryNum, description, estHours, spenthours
having SpentHours>=5
order by slipId
;

select * from MarinaService;

-- 3.	Create a view named TypesOfBoats using the boat type and a count of all boats of each type. Display the data in the view. 
drop view TypeOfBoats;
create view TypeOfBoats as
select boatType, count(boatName) as 'Number of boats'
from marinaslip
group by boatType;

select * from TypeOfBoats;

-- procedures
-- 1.	Write a procedure called ChangeRentalFee, which will change the rental fee of a slip with a given slipID. Test the procedure to change the rental fee of slip ID 3 to 3,700. 
drop procedure if exists ChangeRentalFee_sp$$;
delimiter $$
create procedure ChangeRentalFee_sp( in slipId_p int, in newRentalPrice_p decimal(8,2))
begin
	update marinaslip
    set rentalfee = newRentalPrice_p
    where slipId = slipId_p;
end;
$$
delimiter ;

select * from marinaslip where slipId = 3;
call ChangeRentalFee_sp(3, 3700);
select * from marinaslip where slipId = 3;

-- indexes 
-- 1.	Create an index named BoatIndex on the length and boatname fields in the MarinaSlip table where lengths are in descending order. 
create index BoatIndex_idx on MarinaSlip (length desc, boatname);
show indexes from MarinaSlip;
