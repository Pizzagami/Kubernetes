#!/bin/sh
ps > probe.txt
grep "vsftpd" probe.txt > status.txt
if [ -s status.txt ]; then
	exit 0
fi
exit 1

