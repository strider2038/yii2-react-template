FROM strider2038:php-base
MAINTAINER strider2038

RUN apt-get update && \
    apt-get install -y \
    nano \
    telnet \
    iputils-ping && \
    docker-php-ext-install \
    phar && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require "fxp/composer-asset-plugin:^1.2.0" && \
#    composer config -g github-oauth.github.com <oauthtoken>
