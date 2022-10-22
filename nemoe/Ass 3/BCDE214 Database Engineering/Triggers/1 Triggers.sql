-- TRIGGER

DELIMITER $$
/*NAME OF THE TRIGGER THEN FIRING TIME AND THEN EVENT 
CREATE TRIGGER account_sum (BEFORE/AFTER) (INSERT/UPDATE/DELETE) */
CREATE TRIGGER account_sum AFTER INSERT
-- ON WHICH TABLE
 ON account_tbl;
-- for each row we want this trigger to execute

FOR EACH ROW
BEGIN

UPDATE account_total SET amount = amount + NEW.amount;

END$$

DELIMITER ;

/*Test*/

insert into account_tbl values (1,1000.00);
select * from account_total;

drop trigger account_sum;

/* More examples*/


