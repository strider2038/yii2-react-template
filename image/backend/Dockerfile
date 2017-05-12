FROM ubuntu:16.04
MAINTAINER strider2038

# supervisor configs
COPY ./conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./conf/supervisor/php-fpm.conf /etc/supervisor/conf.d/php-fpm.conf

# xdebug config
COPY ./conf/php/xdebug.ini /etc/php/7.1/fpm/conf.d/20-xdebug.ini
# xdebug config for cli
RUN echo 'XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9001 remote_host=0.0.0.0 remote_connect_back=1"' >> /etc/environment
#RUN echo 'PHP_IDE_CONFIG="serverName="' >> /etc/environment

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    apt-transport-https \
    software-properties-common \
    nano \
    curl \
    openssh-server \
    telnet \
    iputils-ping \
    supervisor \
    locales && \
    locale-gen ru_RU.UTF-8

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:en
ENV LC_ALL ru_RU.UTF-8

RUN add-apt-repository ppa:ondrej/php && \
    apt-get remove php7.0 && \
    apt-get update && \
    apt-get install -y \
    postgresql-client \
    zip \
    unzip \
    php7.1 \
    php7.1-fpm \
    php7.1-mbstring \
    php7.1-xml \
    php7.1-pgsql \
    php7.1-curl \
    php-xdebug \
    php7.1-zip && \
    mkdir -p /run/php && \
    # Enable php-fpm listen on port 9000
    sed -i 's/^listen \=.*$/listen\ =\ 0.0.0.0:9000/' /etc/php/7.1/fpm/pool.d/www.conf && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require "fxp/composer-asset-plugin:^1.2.0"

RUN echo 'root:123' | chpasswd && \
    #sed -ri 's/^Port\s+.*/Port 25/' /etc/ssh/sshd_config && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


RUN mkdir -p /project/backend
WORKDIR /project/backend

EXPOSE 22 9001

CMD ["/usr/bin/supervisord"]
