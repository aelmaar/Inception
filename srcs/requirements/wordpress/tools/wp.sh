#!/bin/sh

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp core download --path=/var/www/html --locale=en_US --allow-root;
    wp core config --allow-root --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASSWORD} --dbhost=${WP_DB_HOST};
    wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL};
    wp user create othman email@example.com --role=editor --user_pass=1234 --allow-root;
    chmod -R 755 /var/www/html/
    chown -R www-data:www-data /var/www/html/
fi

exec "$@"
