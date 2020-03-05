FROM alpine:3.7

RUN apk update												\
&& apk upgrade												\
&& apk add openrc wget php7-fpm php7-pdo_mysql nginx

RUN set -x \
	&& adduser -u 82 -D -S -G www-data www-data

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 5000

ENTRYPOINT sh /entrypoint.sh
