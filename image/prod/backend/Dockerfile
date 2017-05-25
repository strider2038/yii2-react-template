FROM php:fpm-alpine
MAINTAINER strider2038

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
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
    pdo_pgsql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /project/backend

CMD ["php-fpm"]
