#!/bin/bash

openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart

mysql -uroot < "/utils/init.sql"

tail -f /dev/null
