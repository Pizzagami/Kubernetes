FROM alpine:3.7
RUN apk update												\
&&  apk upgrade												\
&&  apk add nginx openssl ca-certificates openssh vim sudo openrc					\
&&  mkdir /run/nginx											\
&&  mkdir /var/www/html											\
&&  rm -rf /var/www/localhost										\
&&  mkdir /utils											\
&&  rc-update add sshd											\
&&  rc boot												\
&&  sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers	\
&&  adduser -D billy											\
&&  passwd -d  billy											\
&&  sed -e 's/^wheel:\(.*\)/wheel:\1,billy/g' -i /etc/group						\
&&  rm /etc/nginx/nginx.conf										\
&& mkdir /etc/nginx/sites-available									\
&& mkdir /etc/nginx/sites-enabled									\
&& rm /etc/nginx/conf.d/default.conf									\
&& apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype

COPY ./nginx.conf ./etc/nginx/

COPY ./index.nginx-debian.html ./var/www/html
COPY ./index.php /var/www/html

COPY ./nginx.sh /utils

COPY ./sshd_config /etc/ssh/.

COPY ./Default /etc/nginx/sites-available
COPY ./Default /etc/nginx/sites-enabled

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
    -subj '/C=FR/ST=75/L=Paris/O=42/CN=selgrabl'\
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 80 443 22

CMD ["sh"]
