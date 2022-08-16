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
create user execut_2@localhost IDENTIFIED BY 'Password$1112';

create user receptionist@localhost IDENTIFIED BY 'Password?1113';
create user nurse1@localhost IDENTIFIED BY 'Password?1114';
create user nurse2@localhost IDENTIFIED BY 'Password?1115';
create user read1@localhost IDENTIFIED BY 'Password?1116';

create user recordsAdmin@localhost IDENTIFIED BY 'Password?1117';
create user write1@localhost IDENTIFIED BY 'Password?1118';

grant palliativeCare_Exec to execut_1@localhost, execut_1@localhost;
grant palliativeCare_Read to receptionist@localhost,nurse1@localhost, nurse1@localhost;
grant palliativeCare_Write to recordsAdmin@localhost, write1@localhost;

SET DEFAULT ROLE ALL TO read1@localhost;