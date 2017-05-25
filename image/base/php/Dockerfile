FROM php:fpm
MAINTAINER strider2038

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    zip \
    unzip \
    curl \
    libcurl4-openssl-dev \
    libicu-dev \
    libpq-dev && \
    docker-php-ext-install \
    curl \
    intl \
    json \
    mbstring \
    pdo \
    pdo_pgsql

WORKDIR /project

CMD ["php-fpm"]
