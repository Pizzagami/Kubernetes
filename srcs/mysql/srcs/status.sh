#!/bin/sh
ps > probe.txt
grep "/usr/bin/mysqld" probe.txt > status.txt
if [ -s status.txt ]; then
	exit 0
fi
exit 1

