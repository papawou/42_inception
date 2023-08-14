#!/bin/sh

wp core install --url=$WP_DOMAINNAME --title=$WP_TITLE --admin_user=$WP_ADMINNAME --admin_password=$WP_ADMINPWD --admin_email=$WP_ADMINEMAIL --skip-email --allow-root
wp theme install inspiro --activate --allow-root

/usr/sbin/php-fpm7.3 -F