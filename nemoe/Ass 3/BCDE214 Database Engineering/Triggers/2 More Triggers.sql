-- TRIGGER 
CREATE DATABASE TRIGGERTEST;
USE TRIGGERTEST;
CREATE TABLE test1
(a1 INT
);
CREATE TABLE test2
(a2 INT
);
CREATE TABLE test3
(a3 INT not null auto_increment primary key
);
create table test4
(a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
b4 INT DEFAULT 0
);

-- CRATE TRIGGERS

DELIMITER $$

CREATE TRIGGER testref BEFORE INSERT ON test1
    for each row
    begin
        INSERT INTO test2 set a2 = new.a1;
        delete from test3 where a3 = new.a1;
        update test4 set b4 = b4 + 1 where a4 = new.a1;  
    
    end;
$$
delimiter ;

insert into test3 (a3) values 
(NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO test4(a4) values 
(0), (0), (0),(0), (0), (0),(0), (0), (0),(0);


insert into test1 values
(1), (3), (1), (7), (1), (8), (4), (4);

select * from triggertest.test1;
select * from triggertest.test2;
select * from triggertest.test3;
select * from triggertest.test4;

-- drop trigger testref;

-- drop table test1;
-- drop table test2;
-- drop table test3;
-- drop table test4;

