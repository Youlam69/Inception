FROM debian:bullseye
#first we update and upgrade the system word press needs php and php-mysql

RUN apt-get update && apt-get upgrade -y && apt-get install -y php php-mysql wget

#we download wordpress

RUN wget https://wordpress.org/latest.tar.gz

#we extract wordpress

RUN tar -xzvf latest.tar.gz

#we move wordpress to the right place

RUN mv wordpress /var/www/html/

#we copy the wp-config.php file to the right place

COPY ./srcs/wp-config.php /var/www/html/wordpress

#we copy the index.html file to the right place

COPY ./srcs/index.html /var/www/html

#we change the ownership of the files


RUN chown -R www-data:www-data /var/www/html

#we change the permissions of the files

RUN chmod -R 755 /var/www/html

#we expose the ports

EXPOSE 443

