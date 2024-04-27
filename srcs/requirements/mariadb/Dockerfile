FROM debian:bullseye

ARG         MYSQL_DATABASE
ARG         MYSQL_USER
ARG         MYSQL_PASSWORD
ARG         MYSQL_ROOT_PASSWORD

RUN         apt -y update && apt -y upgrade
RUN         apt -y install mariadb-server mariadb-client

RUN			mkdir -p /var/lib/mysql /var/run/mysqld
RUN			chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN			chmod 777 /var/run/mysqld

RUN 		echo "[mysqld]"  >> /etc/mysql/my.cnf && echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf && echo "port=3306" >> /etc/mysql/my.cnf

COPY        ./tools/init-script.sh /usr/local/bin/
RUN         bash /usr/local/bin/init-script.sh

EXPOSE      3306

ENTRYPOINT  [ "mysqld_safe" ]
