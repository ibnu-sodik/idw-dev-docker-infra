FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git curl unzip libpq-dev libzip-dev \
    libonig-dev libxml2-dev libpng-dev \
    libicu-dev libfreetype-dev \
    && docker-php-ext-configure gd --with-freetype \
    && docker-php-ext-install \
    pdo pdo_mysql pdo_pgsql mysqli pgsql \
    mbstring xml zip bcmath intl gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
