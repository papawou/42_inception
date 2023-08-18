#!/bin/sh

wp core install --url=$WP_DOMAINNAME --title=$WP_TITLE --admin_user=$WP_ADMINNAME --admin_password=$WP_ADMINPWD --admin_email=$WP_ADMINMAIL --skip-email --allow-root
wp theme install inspiro --activate --allow-root
wp user create $WP_USERNAME $WP_USERMAIL --user_pass=$WP_USERPWD --allow-root

/usr/sbin/php-fpm7.3 -F