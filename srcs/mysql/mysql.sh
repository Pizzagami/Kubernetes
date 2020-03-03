DB_DATA_PATH="/var/lib/mysql"
DB_ROOT_PASS="mariadb_root_password"
DB_USER="mariadb_user"
DB_PASS="mariadb_user_password"
MAX_ALLOWED_PACKET="200M"

mysql_install_db --user=mysql --datadir=${DB_DATA_PATH}

rc boot

rc-service mariadb start

mysql -uroot < "/utils/init.sql"

tail -f /dev/null
