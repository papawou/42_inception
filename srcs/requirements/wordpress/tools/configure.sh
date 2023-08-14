#!/bin/sh

wp core download --allow-root
wp config create --dbname=$WP_DBNAME --dbuser=$WP_DBUSER --dbpass=$WP_DBPASSWORD --dbhost=mysql --skip-check --allow-root

success=0
while [ $success -eq 0 ]; do
    wp db check --allow-root
    if [ $? -eq 0 ]
    then
        success=1
    fi
done

wp core install --url=$WP_DOMAINNAME --title=$WP_TITLE --admin_user=$WP_ADMINNAME --admin_password=$WP_ADMINPWD --admin_email=$WP_ADMINEMAIL --skip-email --allow-root
wp theme install inspiro --activate --allow-root

cd /
/usr/sbin/php-fpm7.3 -F