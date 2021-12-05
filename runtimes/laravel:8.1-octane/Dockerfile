FROM php:8.1-cli-alpine3.15

WORKDIR /var/www/html

# STSTEM: Install required packages
RUN apk --no-cache upgrade && \
    apk --no-cache add bash git sudo openssh libxml2-dev postgresql-dev oniguruma-dev autoconf gcc g++ make npm freetype-dev libjpeg-turbo-dev libpng-dev libzip-dev

# COMPOSER: install binary and prestissimo
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# PHP: install extensions
RUN pecl channel-update pecl.php.net
RUN pecl install ssh2 swoole
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install mbstring xml pcntl gd zip sockets pdo pdo_pgsql pdo_mysql bcmath
RUN docker-php-ext-enable mbstring xml gd zip swoole pcntl sockets bcmath pdo pdo_pgsql pdo_mysql

EXPOSE 8000
CMD ["php","artisan","octane:start", "--host=0.0.0.0"]
