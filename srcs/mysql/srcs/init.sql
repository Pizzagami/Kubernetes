CREATE DATABASE wordpress;

CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;

CREATE USER 'wordpressuser'@'%' IDENTIFIED BY 'pswd';
GRANT ALL PRIVILEGES ON wordpress.* TO  'wordpressuser' @'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
