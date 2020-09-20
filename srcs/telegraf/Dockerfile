FROM alpine

RUN apk update	\
&& apk add wget

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN mkdir /var/www /utils \								
&&  cd /var/www \
&&  wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz \
&&  tar -xzf telegraf-1.15.2_linux_amd64.tar.gz \
&&  rm telegraf-1.15.2_linux_amd64.tar.gz

RUN cp -rf /var/www/telegraf-1.15.2/etc/* /etc/ \
&&  cp -rf /var/www/telegraf-1.15.2/usr/* /usr/

COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/status.sh /utils
COPY ./srcs/telegraf.sh /utils

EXPOSE 8125

CMD ["/bin/sh", "/utils/telegraf.sh"]
