FROM debian:buster

RUN apt-get update && apt-get install -y curl\
    php \
    php-fpm \
    php-mysql \
    mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY --chmod=777 /conf/configure.sh /tmp
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/
WORKDIR /tmp

CMD ./configure.sh