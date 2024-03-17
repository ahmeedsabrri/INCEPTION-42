

mkdir -p var/www/html

cd var/www/html

set -x


wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|1" /etc/php/7.4/fpm/pool.d/www.conf

service php7.4-fpm start

wp core download --allow-root --force
wp config create --allow-root --dbname="$MARIADB_DATABASE" --dbuser="$MARIADB_USER" --dbpass="$MARIADB_PASSWORD" --dbhost=m"$MARIADB_HOST"
wp core install --allow-root --url="$DOMAIN_NAME" --title="$MARIADB_TITLE" --admin_user="$MARIADB_USER" --admin_password="$MARIADB_PASSWORD" --admin_email="$MARIADB_EMAIL" 
wp user create   --allow-root "$WORDP_SER" "$WORDP_SER_MAIL" --user_pass="$WORDP_SER_PASS" --role=author

service php7.4-fpm stop
php-fpm7.4 -F