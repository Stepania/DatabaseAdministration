drop database if exists Trigger_Happy;
create database Trigger_Happy;
use Trigger_Happy;

create table account
(
id integer ,
amount decimal (6,2)
) engine = innodb;

create table account_Trail
(
amount decimal (6,2)
) engine = innodb;

DELIMITER $$ 
/*NAME OF THE TRIGGER THEN FIRING TIME AND THEN EVENT CREATE TRIGGER account_sum (BEFORE/AFTER) (INSERT/UPDATE/DELETE) */ 
CREATE TRIGGER account_sum after INSERT
-- ON WHICH TABLE 
ON account
-- for each row we want this trigger to execute */
FOR EACH ROW 
BEGIN
update account_Trail

SET amount = (amount + new.amount); 
END$$ 

DELIMITER ; 
/*Test*/ 
insert into account values (1 ,1000.00); 
select * from account;
select * from account_Trail; 

-- drop trigger account_sum; 


/* More examples*/ 

drop database if exists trigger_Ex;

create database  trigger_Ex;

use trigger_Ex;
create table capital
(
id integer,
city varchar(30),
population integer 
)engine = innodb;

delimiter // 
create trigger Capital_bu
after update
on capital
for each row
begin
    set @id = old.id;
    set @capital_Old = old.city;
    set @capital_New = new.city;
end;
// 

delimiter ;
-- drop table capital;
use trigger_Ex;
insert into capital values (1, 'Wellington', 200000);
insert into capital values (2, 'Washington', 400000);
insert into capital values (3, 'New Delhi', 2000000);
insert into capital values (4, 'Canberra', 20000);
/* before Update */
select * from capital;

/* Update taking place */
update capital

set city = 'Washington D.C.'
where id = 2;

/* Output of the change that took place*/ 
select @id As 'ID', @capital_Old as 'Old Capital',  @capital_New as 'New Capital';
/* Final output showing the change*/
select * from capital;

use trigger_Happy;
drop table if exists percentage;
create table  percentage
(
percent int,
updateTime dateTime
) engine = innodb;

delimiter $

create trigger bi_percent before insert
on percentage
for each row
begin
set updateTime = new.updateTime;

if new.percent < 0 then
    set new.percent = 0;
elseif  new.percent > 100 then

    set new.percent = 100;

end if;


end
$
/*test */

delimiter ;
use trigger_Happy;

insert into percentage values (79, now());
select * from percentage;


/* amother example */

use trigger_Happy;
drop table if exists log;
create table  log
(
useDesc varchar(100),
updateTime dateTime
) engine = innodb;

delimiter $

create trigger bi_log after insert
on log
for each row
begin
set 
useDesc = new.useDesc,
updateTime = new.updateTime;

end

$
delimiter ;
use trigger_Happy;
insert into log values (user(), now());
select * from log;

-- drop trigger bi_log;
