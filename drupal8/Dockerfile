FROM php:7.3.0-apache-stretch

ENV APACHE_DOCUMENT_ROOT=/var/www/html/web
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_NO_INTERACTION=1
ENV APACHE_RUN_USER=www-data

RUN a2enmod rewrite
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    unzip \
    mysql-client \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libpq-dev \
    libxml2-dev \
    libssl-dev \
    libcurl3 \
    libcurl3-dev \
    libsqlite3-dev

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) \
    gd \
    opcache \
    iconv \
    zip \
    pdo \
    tokenizer \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    xml \
    curl \
    dom \
    session \
    mbstring \
    json

RUN composer create-project drupal-composer/drupal-project:8.x-dev . --stability dev --no-interaction

WORKDIR ${APACHE_DOCUMENT_ROOT}
