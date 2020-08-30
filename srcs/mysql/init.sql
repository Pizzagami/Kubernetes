CREATE DATABASE wordpress;

CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;

CREATE USER 'wordpressuser'@'%' IDENTIFIED BY 'pswd';
GRANT ALL PRIVILEGES ON wordpress.* TO  'wordpressuser' @'%' WITH GRANT OPTION;

CREATE USER 'selgrabl'@'%' IDENTIFIED BY 'pswd';
GRANT ALL PRIVILEGES ON wordpress.* TO  'selgrabl' @'%' WITH GRANT OPTION;

CREATE USER 'billy'@'%' IDENTIFIED BY 'pswd';
GRANT ALL PRIVILEGES ON wordpress.* TO  'billy' @'%' WITH GRANT OPTION;

CREATE USER 'arth'@'%' IDENTIFIED BY 'pswd';
GRANT ALL PRIVILEGES ON wordpress.* TO  'arth' @'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
