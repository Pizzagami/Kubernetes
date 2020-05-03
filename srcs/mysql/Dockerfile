From alpine:3.7

RUN apk upgrade		                         				\
 && apk update						                        \
 && apk add mariadb mariadb-client openrc --no-cache --upgrade bash		\
 && rm -f /var/cache/apk/*			                         	\
 && mkdir /utils		

COPY ./mysql.sh /utils
COPY ./init.sql /utils

EXPOSE 3306

CMD ["sh", "/utils/mysql.sh"]
