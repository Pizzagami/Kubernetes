CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON wordpress.* TO username @'%' IDENTIFIED BY 'password'

CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO  'root' @'%' WITH GRANT OPTION;

CREATE USER 'selgrabl'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO  'selgrabl' @'localhost' WITH GRANT OPTION;

CREATE USER 'billy'@'%' IDENTIFIED BY 'billy';
GRANT UPDATE, SELECT, DROP,  ON wordpress.* TO  'billy' @'%' WITH GRANT OPTION;

CREATE USER 'viewer'@'%' IDENTIFIED BY 'view';
GRANT ALL PRIVILEGES ON wodpress.* TO  'viewer' @'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
