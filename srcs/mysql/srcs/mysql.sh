#!/bin/bash


mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/old_mariadb-server.cnf
sed 's/^skip-networking/#&/' /etc/my.cnf.d/old_mariadb-server.cnf > /etc/my.cnf.d/mariadb-server.cnf
rm /etc/my.cnf.d/old_mariadb-server.cnf
openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart

mysql -uroot < "/utils/init.sql"

tail -f /dev/null
