#!/bin/bash

# Adjust bind-address in MariaDB configuration
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Create necessary directories and set permissions
mkdir -p /var/lib/mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
chmod 777 /var/lib/mysql /var/run/mysqld

# Start MariaDB service
# systemctl start mariadb.service
service mariadb start

# Create database and user
echo "CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD_ROOT';
FLUSH PRIVILEGES;" | mysql -u root -p$DB_PASSWORD_ROOT

# Check if the database exists
if mysql -u"$DB_USER" -p"$DB_PASSWORD" -e "use $DB_NAME" 2>/dev/null; then
  echo "Database '$DB_NAME' already exists."
else
  echo "Error creating database '$DB_NAME'."
  exit 1
fi

# Stop MariaDB service
# stop mariadb.service
service mariadb stop

# Start mysqld in the foreground
mysqld
