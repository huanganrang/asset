CREATE USER 'asset'@'127.0.0.1' IDENTIFIED BY '123456';
flush privileges;
 create database asset character set utf8;
 grant all privileges on asset.* to asset@localhost identified by '123456';
 flush privileges;
 
 ---GRANT USAGE ON *.* TO 'appmonitor'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;