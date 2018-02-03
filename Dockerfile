FROM php:7.1-fpm
RUN apt-get update && apt-get install -y libmcrypt-dev libjpeg62-turbo-dev libfreetype6-dev libpng-dev gzip tar
RUN docker-php-ext-install -j$(nproc) iconv mcrypt 
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN docker-php-ext-install -j$(nproc) gd
RUN pecl channel-update pecl.php.net
RUN docker-php-ext-install mysqli
# ENV PHPREDIS_VERSION php7.1

# RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \
#     && tar xfz /tmp/redis.tar.gz \
#     && rm -r /tmp/redis.tar.gz \
#     && mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \
#     && docker-php-ext-install redis
# RUN docker-php-ext-enable redis xdebug
COPY conf/php.ini /etc/php/7.1/fpm/conf.d/40-custom.ini