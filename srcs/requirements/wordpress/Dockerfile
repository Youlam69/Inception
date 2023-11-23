FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y \
    php7.4-fpm\
    php7.4-mysql \
    wget
	
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script_wp.sh /tmp/worpress.sh

EXPOSE 9000

CMD ["bash"]