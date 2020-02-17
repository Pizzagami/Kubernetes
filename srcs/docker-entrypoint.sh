#!/bin/bash

service nginx start 
service mysql start 
service php7.3-fpm start 

wget -c https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www
chown -R www-data: /var/www/wordpress

wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz -O - | tar -xz -C /var/www
mv var/www/phpMyAdmin-4.9.2-english var/www/phpmyadmin
chown -R www-data: /var/www/phpadmin

cp srcs_docker/nginx-block /etc/nginx/sites-available/nginx-block
ln -s /etc/nginx/sites-available/nginx-block  /etc/nginx/sites-enabled/nginx-block
rm /etc/nginx/sites-enabled/default

mysql < srcs_docker/data_base.sql

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < srcs_docker/certificate

service nginx restart
/bin/bash
