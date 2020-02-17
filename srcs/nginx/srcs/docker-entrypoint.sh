#!/bin/bash

service nginx start 

cp srcs_docker/nginx-block /etc/nginx/sites-available/nginx-block
ln -s /etc/nginx/sites-available/nginx-block  /etc/nginx/sites-enabled/nginx-block
rm /etc/nginx/sites-enabled/default

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt < srcs_docker/certificate

service nginx restart
/bin/bash
