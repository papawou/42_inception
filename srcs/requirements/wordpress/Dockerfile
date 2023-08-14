FROM debian:buster
ARG WP_PUBLICDIR
ARG WP_DBNAME
ARG WP_DBUSER
ARG WP_DBPASSWORD

RUN apt-get update && apt-get install -y\
    curl \
    php \
    php-fpm \
    php-mysql \
    mariadb-client

#PHP
RUN mkdir -p /run/php/php7.3-fpm/
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/

#WORDPRESS
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY --chmod=777 ./tools/configure.sh /tmp/

WORKDIR $WP_PUBLICDIR
RUN wp core download --allow-root
RUN wp config create --dbname=$WP_DBNAME --dbuser=$WP_DBUSER --dbpass=$WP_DBPASSWORD --dbhost=mysql --skip-check --allow-root

ENTRYPOINT ["/tmp/configure.sh"]