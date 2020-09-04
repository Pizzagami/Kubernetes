FROM alpine

RUN apk update	\
&& apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir /var/www /utils										\
&&  cd /var/www												\
&&  wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz	\
&&  tar -zxf grafana-7.1.5.linux-amd64.tar.gz									\
&&  rm -f grafana-7.1.5.linux-amd64.tar.gz	


COPY ./grafana.sh /utils

EXPOSE 3000

CMD ["/bin/sh", "/utils/grafana.sh"]
