#!/bin/bash


sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# mkdir -p /var/lib/mysql \
#     && chown -R mysql:mysql /var/lib/mysql \
#     && chmod 777 /var/lib/mysql

# mkdir -p /var/run/mysqld \
#     && chown -R mysql:mysql /var/run/mysqld \
#     && chmod 777 /var/run/mysqld

service mariadb start

echo "CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%';
ALTER USER 'ylamraou'@'localhost' IDENTIFIED BY '$DB_PASSWORD_ROOT';
FLUSH PRIVILEGES;" | mysql -u root -p$DB_PASSWORD_ROOT



# echo	"CREATE DATABASE $DB_NAME;" | mysql -u root -p$DB_PASSWORD_ROOT

# echo	"CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -u root -p$DB_PASSWORD_ROOT

# echo	"GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" | mysql -u root -p$DB_PASSWORD_ROOT

# echo	"ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD_ROOT';" | mysql -u root -p$DB_PASSWORD_ROOT

# echo	"FLUSH ALL PRIVILEGES;" | mysql -u root -p$DB_PASSWORD_ROOT

# service mariadb stop
sleep(3)
# kill    $(cat /var/run/mysqld/mysqld.pid)

# mysqld
