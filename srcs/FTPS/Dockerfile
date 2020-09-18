FROM alpine:latest

RUN	apk add --no-cache vsftpd\
	&& apk add openssl \
	&& apk add openrc ;

RUN openssl req -x509 -nodes -subj '/C=FR/ST=PARIS/L=PARIS/O=selgrabl/CN=localhost' \
		-days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key \
		 -out /etc/ssl/certs/vsftpd.crt


ADD	vsftpd.conf /etc/vsftpd/vsftpd.conf

ADD	start.sh /

RUN mkdir /utils

COPY ./status.sh /utils

RUN { echo "password"; echo "password"; } | adduser user

RUN	chmod 775 start.sh

VOLUME	/ftp/ftp

EXPOSE	21 21000-21010

CMD	/start.sh
