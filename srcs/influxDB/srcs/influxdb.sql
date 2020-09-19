CREATE DATABASE telegraf;
CREATE USER influx_user WITH PASSWORD 'password' WITH ALL PRIVILEGES;
CREATE USER test1212 WITH PASSWORD 'password';
GRANT ALL ON telegraf TO user_telegraf;
