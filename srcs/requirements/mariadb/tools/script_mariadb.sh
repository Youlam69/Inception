#!/bin/bash

sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

service mariadb start

sleep 5


echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; \
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; \
CREATE USER IF NOT EXISTS '$DB_USER_2' IDENTIFIED BY '$DB_PASSWORD_2'; \
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'; \
GRANT SELECT ON $DB_NAME.* TO '$DB_USER_2'@'%'; \
FLUSH PRIVILEGES;" |  mysql -u root -p$DB_PASSWORD_ROOT

service mariadb stop

sleep 3

mysqld