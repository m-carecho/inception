#!/bin/bash
# install Alterar a senha do usuário admin padrão
if ! wp core is-installed --allow-root --path=/var/www/wordpress; then
	wp core install --allow-root --path=/var/www/wordpress --url=$PHP_URL --title=$PHP_TITLE --admin_user=$PHP_ROOT_USER --admin_password=$PHP_ROOT_PASS --admin_email=$PHP_ROOT_EMAIL

	wp user create --allow-root --path=/var/www/wordpress $PHP_USER $PHP_USER_EMAIL --role=author --user_pass=$PHP_USER_PASS

	wp plugin uninstall --allow-root --path=/var/www/wordpress akismet hello

	wp option update --allow-root --path=/var/www/wordpress blogdescription "$PHP_SUB_TITLE"

	wp plugin update --all --allow-root --path=/var/www/wordpress

	chown -R www-data:www-data /var/www/wordpress

	chmod -R 774 /var/www/wordpress
else
	yes | cp -r /var/lib/wordpress/* /var/www/wordpress
fi

php-fpm7.4 -F
