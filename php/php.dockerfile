# 使用 multi stage，将 composer bin 文件 copy 至 php:7.4-cli 中，解决扩展安装的问题
FROM composer:1.10.20 AS composer

FROM php:7.1-cli AS PHP
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY sources.list /etc/apt/sources.list
RUN mkdir /app /root/.composer && \
    apt-get update && \
    apt-get install -y libzip-dev zip unzip git && \
    docker-php-ext-install bcmath zip pdo pdo_mysql
WORKDIR /app
ENV COMPOSER_HOME=/root/.composer
