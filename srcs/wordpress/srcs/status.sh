#!/bin/sh
ps > probe.txt
grep "php -S 0.0.0.0:5050 -t /var/www/wordpress" probe.txt > status.txt
if [ -s status.txt ]; then
	exit 0
fi
exit 1

