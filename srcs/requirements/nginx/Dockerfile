FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=MA/L=KHOURIBGA/O=42/OU=1337/CN=ylamraou" \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./conf/default /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]
