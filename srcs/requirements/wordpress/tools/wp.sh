#!/bin/sh

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp core download --path=/var/www/html --locale=en_US --allow-root;
    wp core config --allow-root --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST};
    wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL};
    chmod -R 755 /var/www/html/
    chown -R www-data:www-data /var/www/html/
fi

echo "Script done successfuly";
exec "$@"
