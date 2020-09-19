#!/bin/sh
ps > probe.txt
grep "/usr/sbin/vsftpd" probe.txt > status.txt
if [ -s status.txt ]; then
	exit 0
fi
exit 1

