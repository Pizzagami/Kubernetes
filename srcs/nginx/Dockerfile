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
&&  rm /etc/nginx/nginx.conf

COPY ./nginx.conf ./etc/nginx/

COPY ./index.nginx-debian.html ./var/www/html

COPY ./nginx.sh /utils

COPY ./sshd_config /etc/ssh/.

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
    -subj '/C=FR/ST=75/L=Paris/O=42/CN=selgrabl'\
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 80 443 22

CMD ["sh", "/utils/nginx.sh"]
