

mkdir -p var/www/wordpress

cd var/www/wordpress

set -x


wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|1" /etc/php/7.4/fpm/pool.d/www.conf


wp core download --allow-root --force
wp config create --allow-root --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_USER_PASS" --dbhost="$DB_HOST"
wp core install --allow-root --url="$URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_MAIL" 
wp user create   --allow-root "$WP_USER" "$WP_USER_MAIL" --user_pass="$WP_USER_PASS" --role=author

service php7.4-fpm start
service php7.4-fpm stop

php-fpm7.4 -F