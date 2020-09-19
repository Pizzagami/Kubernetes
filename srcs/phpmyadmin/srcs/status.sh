#!/bin/sh
ps > probe.txt
grep "php -S 0.0.0.0:5000 -t /var/www/phpMyAdmin-5.0.2-all-languages" probe.txt > status.txt
if [ -s status.txt ]; then
	exit 0
fi
exit 1
