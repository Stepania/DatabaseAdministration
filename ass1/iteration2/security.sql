use palliativeCare;

show grants;
SHOW GRANTS FOR CURRENT_USER;
SHOW GRANTS FOR execut_1@localhost;

SHOW GRANTS 
FOR receptionist@localhost
USING palliativeCare_Read;

SELECT user AS role_name
FROM mysql.user
WHERE host = '%'
  AND NOT LENGTH(authentication_string);

-- select * from mysql.user;
select host, user from mysql.user;


create role if not exists palliativeCare_Exec, palliativeCare_Write, palliativeCare_Read;
    
grant all on pallaitiveCare.* to 'palliativeCare_Exec';

grant select on pallaitiveCare.* to 'palliativeCare_Read';

GRANT INSERT, UPDATE, DELETE ON pallaitiveCare.* TO 'palliativeCare_Write';

create user execut_1@localhost IDENTIFIED BY 'Password?1111';
ALTER USER execut_1@localhost PASSWORD EXPIRE INTERVAL 90 DAY
	PASSWORD HISTORY 2
	PASSWORD REUSE INTERVAL 365 DAY;
create user execut_2@localhost IDENTIFIED BY 'Password$1112';
ALTER USER execut_2@localhost PASSWORD EXPIRE INTERVAL 90 DAY
	PASSWORD HISTORY 2
	PASSWORD REUSE INTERVAL 365 DAY;

create user receptionist@localhost IDENTIFIED BY 'Password?1113';
ALTER USER receptionist@localhost PASSWORD EXPIRE INTERVAL 90 DAY
	PASSWORD HISTORY 2
	PASSWORD REUSE INTERVAL 365 DAY;
create user nurse1@localhost IDENTIFIED BY 'Password?1114';
ALTER USER nurse1@localhost PASSWORD EXPIRE INTERVAL 90 DAY
	PASSWORD HISTORY 2
	PASSWORD REUSE INTERVAL 365 DAY;
create user nurse2@localhost IDENTIFIED BY 'Password?1115';
ALTER USER nurse2@localhost PASSWORD EXPIRE INTERVAL 90 DAY
	PASSWORD HISTORY 2
	PASSWORD REUSE INTERVAL 365 DAY;
create user read1@localhost IDENTIFIED BY 'Password?1116';
ALTER USER read1@localhost PASSWORD EXPIRE INTERVAL 90 DAY
	PASSWORD HISTORY 2
	PASSWORD REUSE INTERVAL 365 DAY;

create user recordsAdmin@localhost IDENTIFIED BY 'Password?1117';
ALTER USER recordsAdmin@localhost PASSWORD EXPIRE INTERVAL 90 DAY
	PASSWORD HISTORY 2
	PASSWORD REUSE INTERVAL 365 DAY;
create user write1@localhost IDENTIFIED BY 'Password?1118';
ALTER USER write1@localhost PASSWORD EXPIRE INTERVAL 90 DAY
	PASSWORD HISTORY 2
	PASSWORD REUSE INTERVAL 365 DAY;

select host,user,authentication_string FROM mysql.user;



grant palliativeCare_Exec to execut_1@localhost, execut_1@localhost;
grant palliativeCare_Read to receptionist@localhost,nurse1@localhost, nurse1@localhost;
grant palliativeCare_Write to recordsAdmin@localhost, write1@localhost;

SET DEFAULT ROLE ALL TO read1@localhost;