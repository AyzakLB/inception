#!/bin/bash

set -e

if [ ! -f /var/www/wp-config.php ]; then

until mariadb-admin -h mariadb -u $MARIADB_USER  -p"$MARIADB_PASSWORD"  ping -s ; do
    sleep 1
done

wp config create \
    --dbname=$MARIADB_DATABASE \
    --dbuser=$MARIADB_USER \
    --dbpass=$MARIADB_PASSWORD \
    --dbhost=mariadb \
    --allow-root

wp core install \
    --url=$WP_WEBSITE_URL \
    --title=$WP_WEBSITE_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --skip-email \
    --allow-root

wp user create \
    --user_login=$WP_USER \
    --user_pass=$WP_USER_PASSWORD \
    --user_email=$WP_USER_EMAIL \
    --skip-email \
    --allow-root

wp --allow-root plugin install redis-cache
until redis-cli -h redis ping ; do
    sleep 1
done
wp --allow-root config set WP_REDIS_HOST "redis"
wp --allow-root config set WP_REDIS_PORT "6379"
wp --allow-root config set WP_CACHE true --raw
wp --allow-root redis enable

fi

exec php-fpm7.4 -F