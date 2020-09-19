From alpine

RUN apk update && apk add openrc influxdb

RUN mkdir /utils

COPY ./srcs/influxdb.sh /utils
COPY ./srcs/influxdb.sql /utils

EXPOSE 8086

CMD ["/bin/sh", "/utils/influxdb.sh"]
