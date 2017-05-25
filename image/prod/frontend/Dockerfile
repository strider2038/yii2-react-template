FROM node:boron
MAINTAINER strider2038

# supervisor configs
COPY ./conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    apt-transport-https \
    software-properties-common \
    nano \
    curl \
    telnet \
    iputils-ping \
    supervisor \
    locales && \
    locale-gen ru_RU.UTF-8

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:en
ENV LC_ALL ru_RU.UTF-8

# Create app directory
RUN mkdir -p /project/frontend
WORKDIR /project/frontend

CMD ["/usr/bin/supervisord"]

# Infinite loop
#RUN echo 'ping localhost &' > /bootstrap.sh
#RUN echo 'sleep infinity' >> /bootstrap.sh
#RUN chmod +x /bootstrap.sh

#CMD /bootstrap.sh
