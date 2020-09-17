From alpine

RUN apk update && apk add mysql mysql-client openrc

RUN mkdir /utils

COPY ./mysql.sh /utils
COPY ./init.sql /utils
COPY ./status.sh /utils

EXPOSE 3306

MD ["/bin/sh", "/utils/mysql.sh"]
