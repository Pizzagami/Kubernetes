FROM alpine:3.7
RUN apk update			\
&&  apk upgrade			\
&&  apk add nginx		\
&&  mkdir /run/nginx		\
&&  nginx			\
&&  mkdir /var/www/html		\
&& rm -rf /var/www/localhost	\
&& apk add openssl		\
&& apk add ca-certificates


COPY ./srcs/nginx/default.conf ./etc/nginx/conf.d/

COPY ./srcs/nginx/index.nginx-debian.html ./var/www/html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
    -subj '/C=FR/ST=75/L=Paris/O=42/CN=avan-pra'\
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 80 443
