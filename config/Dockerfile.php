FROM wordpress:php8.3-fpm

RUN apt-get update && apt-get install -y iputils-ping

RUN pecl install xdebug && docker-php-ext-enable xdebug
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
