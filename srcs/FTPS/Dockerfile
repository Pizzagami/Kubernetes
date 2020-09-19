FROM alpine

RUN apk update \
&& apk add vsftpd && apk add openssl

RUN openssl req -x509 -nodes -subj '/C=FR/ST=PARIS/L=PARIS/O=avan-pra/CN=localhost' \
		-days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key \
		 -out /etc/ssl/certs/vsftpd.crt

RUN mkdir /utils
COPY ./srcs/start.sh /utils
COPY ./srcs/status.sh /utils

RUN { echo "password"; echo "password"; } | adduser user

COPY	./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

VOLUME	/ftp/ftp

EXPOSE	20 21 21000-21005

CMD ["/bin/sh", "/utils/start.sh"]
