#!/bin/sh
service nginx status
ret_nginx=$?
service sshd status
ret_ssh=$?
if [ $ret_nginx = 0 ] && [ $ret_ssh = 0 ];then
	exit 0
fi
exit 1
