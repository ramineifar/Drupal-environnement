FROM php:8.1-fpm

ENV TZ=Europe/Paris

RUN docker-php-ext-install opcache

RUN apt-get update && apt-get install -y \
		libfreetype-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
        libzip-dev \
        zip \
        git \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure zip \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install mysqli pdo pdo_mysql zip

RUN pecl install xdebug-3.2.1 \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
	&& docker-php-ext-enable xdebug pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ARG USER_ID
ARG GROUP_ID

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
    userdel -f www-data &&\
    if getent group www-data ; then groupdel www-data; fi &&\
    groupadd -g ${GROUP_ID} www-data &&\
    useradd -l -u ${USER_ID} -g www-data www-data &&\
    install -d -m 0755 -o www-data -g www-data /home/www-data \
;fi

USER www-data
