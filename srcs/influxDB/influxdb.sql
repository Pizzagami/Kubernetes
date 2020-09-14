CREATE DATABASE telegraf;
CREATE USER admin WITH PASSWORD 'admin' WITH ALL PRIVILEGES;
CREATE USER user_telegraf WITH PASSWORD 'password';
GRANT ALL ON telegraf TO user_telegraf;
