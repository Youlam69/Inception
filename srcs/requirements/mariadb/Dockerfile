FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY ./srcs/wordpress.sql /tmp/wordpress.sql

COPY ./srcs/mariadb-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./srcs/init.sh /tmp/init.sh

RUN chmod 755 /tmp/init.sh

EXPOSE 3306

CMD ["/tmp/init.sh"]

# Path: srcs/requirements/wordpress/Dockerfile

