FROM	alpine:3.7

RUN apk update \
&& apk upgrade \
&& apk add nginx  openrc wget

RUN set -x \
	&& adduser -u 82 -D -S -G www-data www-data

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 5050

ENTRYPOINT sh /entrypoint.sh
