FROM php:8.1-fpm

ENV NODE_VERSION=16.13.0
ENV COMPOSER_VERSION=2.3.5
ENV WORKDIR=/var/www/app
ENV UID=1000
ENV GID=1000
ENV USER=kanat
ENV GROUP=kanat
ENV PERMISSION=777


RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
       nodejs \
        npm \
        git \
        curl \
        htop \
        libmemcached-dev \
        cron\
        unzip \
        nano \
        libicu-dev \
        zlib1g-dev \
        libssl-dev \
        pkg-config \
        libzip-dev \
        libpq-dev \
        librabbitmq-dev \
        libssh-dev \
    && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && docker-php-ext-configure \
        intl \
    && docker-php-ext-install \
        intl \
        opcache \
        zip \
        pdo \
        pdo_mysql \
        bcmath \
        sockets \
    && pecl install \
        apcu \
        xdebug \
        redis \
        memcached \
        amqp \
        && rm -rf /tmp/pear \
    && docker-php-ext-enable \
        apcu \
        xdebug \
        redis \
        memcached \
        amqp


#RUN chown ${USER}  -R ${WORKDIR}
#RUN chmod ${PERMISSION} -R ${WORKDIR}



RUN \
  apt-get update && \
  apt-get install -y supervisor && \
  apt-get -y install systemctl  && \
  rm -rf /var/lib/apt/lists/*
  #sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

WORKDIR ${WORKDIR}
COPY . .


RUN groupadd -g ${GID} ${USER}
RUN useradd -u ${UID} -ms /bin/bash -g ${USER} ${GROUP}
RUN usermod -aG sudo ${USER}
RUN chmod 777 /var/run/
RUN groupadd supervisor;
run usermod -a -G supervisor kanat
RUN useradd -ms /bin/bash kanat


#RUN chown ${USER} -R /var
#RUN chmod 777 -R /var



#RUN apt install -y curl
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
#ENV NVM_DIR=/root/.nvm
#RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
#RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
#RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
#ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

#RUN . "$NVM_DIR/nvm.sh" && nvm install-latest-npm


#COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer
#ENV COMPOSER_ALLOW_SUPERUSER 1

#RUN mkdir -p /var/www/.composer && chown -R www-data /var/www/.composer



#RUN groupadd supervisor
#RUN usermod -a -G supervisor kanat



#CMD ["start", "systemctl start supervisor"]
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
#USER ${USER}
CMD ["php-fpm"]

