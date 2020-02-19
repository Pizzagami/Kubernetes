FROM alpine:3.7
RUN apk update			\
&&  apk upgrade			\
&&  apk add nginx		\
&&  mkdir /run/nginx		\
&&  mkdir /var/www/html		\
&& rm -rf /var/www/localhost	\
&& apk add openssl		\
&& apk add ca-certificates	\
&& mkdir /utils			\
&& apk add openssh vim sudo			\
&&	apk add openrc bash			\
&&	adduser -D test				\
&&	passwd -d test 				\
&&	rc-update add sshd			\
&&	rc boot					

COPY ./default.conf ./etc/nginx/conf.d/

COPY ./index.nginx-debian.html ./var/www/html

COPY ./nginx.sh /utils

COPY ./sshd_config /etc/ssh/.

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
    -subj '/C=FR/ST=75/L=Paris/O=42/CN=avan-pra'\
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 80 443 22

CMD ["sh", "/utils/nginx.sh"]
