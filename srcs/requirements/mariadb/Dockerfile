FROM debian:buster
ARG MARIADB_DATABASE
ARG MARIADB_USER
ARG MARIADB_PASSWORD

RUN apt-get update && apt-get install -y\
    mariadb-server

COPY /tools/configure.sh /tmp/configure.sh
RUN chmod 777 /tmp/configure.sh
WORKDIR /tmp
RUN ./configure.sh

CMD ["mysqld_safe"]