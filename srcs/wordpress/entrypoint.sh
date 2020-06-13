wget -c https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www
chown -R www-data: /var/www/wordpress/
php -S 0.0.0.0:5050 -t /www/wordpress/
