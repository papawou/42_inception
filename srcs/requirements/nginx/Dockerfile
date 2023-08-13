FROM debian:buster
ARG NGINX_PUBLICDIR
ARG NGINX_DOMAINNAME

RUN apt-get update && apt-get install -y\
    nginx \
    openssl \
    gettext-base

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=${NGINX_DOMAINNAME}"

COPY conf/wordpress.conf.template /etc/nginx/conf.d/default.conf.template
RUN envsubst '${NGINX_PUBLICDIR} ${NGINX_DOMAINNAME}}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf


CMD ["nginx", "-g", "daemon off;"]