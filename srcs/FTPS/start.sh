mkdir -p ftp/user
chown user:user ftp/user

exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21000 -opasv_address=192.168.99.127 /etc/vsftpd/vsftpd.conf
