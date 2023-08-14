FROM debian:buster
ARG MARIADB_DATABASE
ARG MARIADB_USER
ARG MARIADB_PASSWORD

RUN apt-get update && apt-get install -y\
    mariadb-server \
    net-tools \
    procps

COPY --chmod=777 /tools/configure.sh /tmp/configure.sh
WORKDIR /tmp
RUN ./configure.sh

CMD ["mysqld_safe"]