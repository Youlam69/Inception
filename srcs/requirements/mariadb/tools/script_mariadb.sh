#!/bin/bash

# Update MariaDB configuration
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Create and set permissions for MySQL data directory
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

# Create and set permissions for MySQL run directory
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

# Start MariaDB service
service mariadb start

# Sleep for a moment to ensure MariaDB has started
sleep 5

# Run SQL commands to set up databases and users
# echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;
# CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
# GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%';
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD_ROOT';
# FLUSH PRIVILEGES;" | mysql -u root -p$DB_PASSWORD_ROOT

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; \
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; \
CREATE USER IF NOT EXISTS '$DB_USER_2' IDENTIFIED BY '$DB_PASSWORD_2'; \
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'; \
GRANT SELECT ON $DB_NAME.* TO '$DB_USER_2'@'%'; \
FLUSH PRIVILEGES;" |  mysql -u root -p$DB_PASSWORD_ROOT

# Stop MariaDB service
service mariadb stop

# Sleep again before potentially terminating the script
sleep 3

# Uncomment the following line if you want to kill the mysqld process
# kill $(cat /var/run/mysqld/mysqld.pid)

# Start mysqld in the foreground (not recommended for production use)
mysqld