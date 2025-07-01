FROM php:8.3-fpm-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN install-php-extensions pcntl sockets pdo_mysql opcache

COPY . /var/www
COPY .env.example /var/www/.env

WORKDIR /var/www

RUN composer install --no-dev --optimize-autoloader

EXPOSE 9000

CMD ["php-fpm"]