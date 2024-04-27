FROM debian:bullseye AS nginx

# Define build arguments passed from docker-compose.yml
ARG			DOMAIN_NAME

# Update and upgrade system & install Nginx and OpenSSL
RUN 		apt -y update && apt -y upgrade
RUN 		apt -y install nginx openssl

# Generate self-signed certificate
RUN 		openssl req -x509 -sha256 -nodes \
	-newkey rsa:4096 \
	-days 365 \
	-subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42SP/OU=Inception/CN=mcarecho.42.fr" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

#save conf file on container
RUN rm -rf /etc/nginx/sites-enabled/default
COPY conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/mcarecho.42.fr /etc/nginx/sites-enabled/

# Expose ports
EXPOSE 		443

# Run Nginx
ENTRYPOINT	[ "nginx", "-g", "daemon off;" ]
