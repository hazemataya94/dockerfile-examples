FROM php:7.4.7-apache

LABEL maintainer="hazem.ataya94@gmail.com"

WORKDIR /var/www/html/

COPY . .

ENTRYPOINT ["/bin/bash", "-c", "apachectl -D FOREGROUND"]

EXPOSE 80