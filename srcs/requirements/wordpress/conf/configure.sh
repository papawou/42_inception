#bin/sh

wp core download --path=wpclidemo.dev --allow-root
cd wpclidemo.dev
wp config create --dbname=$WP_DBNAME --dbuser=$WP_DBUSER --dbpass=$WP_DBPASSWORD --dbhost=mysql --skip-check --allow-root

success=0
while [ $success -eq 0 ]; do
    wp db check --allow-root
    if [ $? -eq 0 ]
    then
        success=1
    fi
done
wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org --allow-root
mkdir -p /run/php/php7.3-fpm/
/usr/sbin/php-fpm7.3 -F -R