FROM alpine

RUN apk update	\
&& apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir /var/www /utils										\
&&  cd /var/www												\
&&  wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz	\
&&  tar -zxf phpMyAdmin-5.0.2-all-languages.tar.gz							\
&&  rm -f phpMyAdmin-5.0.2-all-languages.tar.gz

COPY ./config.inc.php /var/www/phpMyAdmin-5.0.2-all-languages/
COPY ./phpmyadm.sh /utils
COPY ./status.sh /utils

EXPOSE 5000

CMD ["/bin/sh", "/utils/phpmyadm.sh"]
