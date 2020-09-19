
#!/bin/sh

echo -e "password : password" | adduser -h ftp/user -s /sbin/nologin user
mkdir -p ftp/user
chown user:user ftp/user

/usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21005 -opasv_address=172.17.0.5 /etc/vsftpd/vsftpd.conf
tail -f /dev/null
