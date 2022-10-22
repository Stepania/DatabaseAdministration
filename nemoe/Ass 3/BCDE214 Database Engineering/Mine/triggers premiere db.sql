use premiere;

create table PartPriceHistory 
(partNum char(4), 
changeDate datetime, 
oldPrice decimal(6,2), 
onHand decimal(4,0));

/*1	Create another table PartPriceHistory 
(PartNum, ChangeDate, OldPrice, OnHand) 
and create a trigger which will write the PartNum, 
today’s date, old Price and OnHand to this table every time the Price is changed.*/
delimiter $$
drop trigger PartPriceHistory_au$$
create trigger PartPriceHistory_au
after update on part
for each row
begin
if (old.price  <> new.price) then
	insert into partPriceHistory(partNum, changeDate, oldPrice, onHand)
	values (old.partNum, now(), old.price, old.onHand);
end if;
end;
$$

delimiter ;
update part 
set price = 30
where partnum ='AT94';

select * from part;
select * from partPriceHistory;

/*2	Create a trigger so that if Part.OnHand falls
 below 10 for any part then write part details  to a ReOrder table (PartNum, Description,  OnHand, Today’s date).*/

create table ReOrder (
partNum char(4),
description varCHAR(15),
OnHand DECIMAL(4,0),
date datetime);

delimiter $$
drop trigger ReOrderParts_au$$
create trigger ReOrderParts_au
after update on part
for each row
begin
if (new.onHand < 10) then
insert into ReOrder (partNum, description, onHand, date)
values (old.partNum, old.description, new.onHand, now());
end if;
end;
$$

delimiter ;
update part
set onHand = 5
where partNum = 'DL71';

select * from ReOrder;

/*3	Create a trigger that will update the balance each time a new orderline is added.*/
delimiter $$
drop trigger Totalbalanse$$
create trigger totalBalance
after insert on orderLine
for each row
begin
declare customerNo smallint;
select customerNum into customerNo from orders
where orderNum = new.orderNum;
update customer
set balance = balance + (new.numOrdered *  new.QuotedPrice)
where customerNum = customerno;
end;
$$



