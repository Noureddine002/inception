curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download  --path="/var/www/html/" --allow-root

sleep 10

./wp-cli.phar config create \
    --dbhost=mariadb        \
    --dbname=$DB_NAME       \
    --dbuser=$DB_USER       \
    --dbpass=$DB_UPASSWORD  \
    --path=/var/www/html/ --allow-root

./wp-cli.phar core install               \
    --url=$URL                           \
    --title=$TITLE                       \
    --admin_user=$ADMIN                  \
    --admin_password=$SQL_ROOT_PASSWORD  \
    --admin_email=$EMAIL2                \
    --path=/var/www/html/ --allow-root

./wp-cli.phar user create $DB_USER $EMAIL   \
    --role=author                           \
    --user_pass=$DB_UPASSWORD               \
    --path=/var/www/html/ --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

php-fpm7.3 -F 