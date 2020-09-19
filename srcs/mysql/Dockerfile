From alpine

RUN apk update && apk add mysql mysql-client openrc

RUN mkdir /utils

COPY ./srcs/mysql.sh /utils
COPY ./srcs/init.sql /utils
COPY ./srcs/status.sh /utils
COPY ./srcs/wordpress.sql /utils

EXPOSE 3306

CMD ["/bin/sh", "/utils/mysql.sh"]
