From alpine

RUN apk update && apk add openrc influxdb

RUN mkdir /utils

COPY ./influxdb.sh /utils
COPY ./influxdb.sql /utils

EXPOSE 8086

CMD ["/bin/sh", "/utils/influxdb.sh"]
