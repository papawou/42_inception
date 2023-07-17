FROM debian:buster

RUN apt-get update && apt-get install -y \
    wordpress \
    curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY --chmod=777 ./conf/configure.sh ./tmp
RUN ./tmp/configure.sh
