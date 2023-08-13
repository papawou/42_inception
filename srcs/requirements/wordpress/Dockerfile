FROM debian:buster
ARG WP_PUBLICDIR

RUN apt-get update && apt-get install -y\
    curl \
    php \
    php-fpm \
    php-mysql \
    mariadb-client

RUN mkdir -p /run/php/php7.3-fpm/
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY --chmod=777 /tools/configure.sh /tmp/

WORKDIR $WP_PUBLICDIR
CMD /tmp/configure.sh