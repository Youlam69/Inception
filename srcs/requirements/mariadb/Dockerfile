FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y

COPY ./tools/script_mariadb.sh /

# COPY tools/database.conf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

RUN chmod +x /script_mariadb.sh

ENTRYPOINT ["/script_mariadb.sh"]