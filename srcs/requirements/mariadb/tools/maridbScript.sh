#!/bin/sh

set -x

sed -i "s|# port = 3306|port = 3306|1" /etc/mysql/mariadb.cnf
sed -i "s|127.0.0.1|0.0.0.0|1" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"


service mariadb stop

mariadbd