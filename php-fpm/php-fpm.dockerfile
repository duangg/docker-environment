FROM php:7.1-fpm AS PHP
COPY sources.list /etc/apt/sources.list
# 通过 docker-php-ext-configure zip --with-zlib-dir=/usr 的方式设置依赖
# 安装 PHP 核心扩展，通过docker-php-ext-install
# 安装 PECL 扩展，通过 pecl install ext_name && docker-php-ext-enable ext_name 的形式
RUN apt-get update && \
    apt install -y zlib1g-dev libzip-dev && \
    docker-php-ext-install bcmath zip pdo pdo_mysql && \
    pecl install redis && \
    docker-php-ext-enable redis && \
    pecl install xdebug-2.9.8 && \
    docker-php-ext-enable xdebug

COPY docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
WORKDIR /app
EXPOSE 9000
EXPOSE 9001