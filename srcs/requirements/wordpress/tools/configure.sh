#bin/sh

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

wp core install --url=www.login.1337.ma  --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org --skip-email --allow-root
wp theme install inspiro --activate --allow-root

cd /
/usr/sbin/php-fpm7.3 -F