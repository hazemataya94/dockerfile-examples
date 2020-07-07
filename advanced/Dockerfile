FROM php:7.4.7-apache

ARG YII2_ENV=Production

LABEL maintainer="hazem.ataya94@gmail.com"

#install composer, or you can use apt-get install if you started with OS image
COPY --from=composer:1.10.7 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . .

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get install -y git zip unzip \
    #install missing extensions, or you can use apt-get install if you started with OS image
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && printf '<Directory /var/www/html>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
    </Directory>' >> /etc/apache2/apache2.conf \
    && a2enmod rewrite \
    && php init --env=${YII2_ENV} --overwrite=All \
    && composer install \
    && mkdir -p backend/web/{images,export,import} \
    && chown -R www-data:www-data . \
    && chmod +x start.sh

ENV MYSQL_HOST="host.docker.internal" \
    MYSQL_DATABASE="advanced_db" \
    MYSQL_USERNAME="root" \
    MYSQL_PASSWORD="" \
    MANDRILL_USERNAME="username" \
    MANDRILL_PASSWORD="password" \
    BASE_URL="http://127.0.0.1" \
    APACHE_PORT="80"

ENTRYPOINT ./start.sh

EXPOSE ${APACHE_PORT}
