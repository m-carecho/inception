# Base image
FROM debian:bullseye

RUN apt update && apt install php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip curl -y

RUN apt install mariadb-client -y

RUN mkdir -p /var/run/php && chmod 777 /var/run/php

RUN echo "\nlisten = 0.0.0.0:9000\n" >>/etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /tmp

WORKDIR /tmp

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod a+x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && wp cli update

RUN mkdir -p /var/www/wordpress

RUN wp core download --path=/var/www/wordpress --allow-root

COPY conf /var/www/wordpress
COPY conf /var/www/html
COPY conf /var/lib/wordpress

RUN echo "env[MYSQL_HOST] = \$MYSQL_HOST" >>/etc/php/7.4/fpm/pool.d/www.conf
RUN echo "env[MYSQL_DATABASE] = \$MYSQL_DATABASE" >>/etc/php/7.4/fpm/pool.d/www.conf
RUN echo "env[MYSQL_USER] = \$MYSQL_USER" >>/etc/php/7.4/fpm/pool.d/www.conf
RUN echo "env[MYSQL_USER_PASSWORD] = \$MYSQL_USER_PASSWORD" >>/etc/php/7.4/fpm/pool.d/www.conf
RUN echo "env[DOMAIN_NAME] = \$DOMAIN_NAME" >>/etc/php/7.4/fpm/pool.d/www.conf
COPY tools /usr/local/bin

RUN chmod a+x /usr/local/bin/script.sh

EXPOSE 9000

ENTRYPOINT ["script.sh"]
