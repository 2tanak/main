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



WORKDIR ${WORKDIR}
COPY . .

CMD ["php-fpm"]
