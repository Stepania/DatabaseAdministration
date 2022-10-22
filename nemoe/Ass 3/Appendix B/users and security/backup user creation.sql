CREATE USER 'mysqlbackup'@'localhost' IDENTIFIED BY 'mysqlbackup';
GRANT SELECT, SHOW VIEW, LOCK TABLES, RELOAD, REPLICATION CLIENT
    ON *.* TO 'mysqlbackup'@'localhost';

grant index on stockauction.* to 'mysqlbackup'@'localhost';

