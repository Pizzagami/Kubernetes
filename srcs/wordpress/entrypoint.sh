wget -c https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www
chown -R www-data: /var/www/wordpress
