FROM alpine:latest

RUN	apk add --no-cache vsftpd\
	&& apk add openssl \
	&& apk add openrc ;

RUN	openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=FR/ST=fr/L=Paris/O=selgrabl/CN=localhost" -keyout /etc/ssl/certs/vsftpd.pem -out /etc/ssl/certs/vsftpd.pem

RUN	chmod 755 /etc/ssl/certs/vsftpd.pem

ADD	vsftpd.conf /etc/vsftpd/vsftpd.conf

ADD	start.sh /

RUN { echo "password"; echo "password"; } | adduser user

RUN	chmod 775 start.sh

VOLUME	/ftp/ftp

EXPOSE	21 21000-21010

CMD	/start.sh
