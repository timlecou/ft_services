CREATE DATABASE db_wordpress;
CREATE USER 'db_user'@'%' IDENTIFIED BY 'db_password';
GRANT ALL PRIVILEGES ON *.* TO 'db_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;