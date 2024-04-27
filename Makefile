# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcarecho <mcarecho@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/15 19:25:40 by mcarecho          #+#    #+#              #
#    Updated: 2024/04/27 17:41:02 by mcarecho         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= Inception  # Define o nome do projeto como "Inception".
USER			= mcarecho  # Define o nome do usuário.

all:
	nmap || sudo apt install nmap -y
	sudo chmod a+w /etc/hosts && sudo cat /etc/hosts | grep mcarecho.42.fr || \
	sudo echo "127.0.0.1 mcarecho.42.fr" >> /etc/hosts
	sudo mkdir -p /home/mcarecho/data/wordpress && sudo chmod 777 /home/mcarecho/data/wordpress
	sudo mkdir -p /home/mcarecho/data/mariadb && sudo chmod 777 /home/mcarecho/data/mariadb
	make up

port:
	sudo /etc/init.d/cups stop
	update-rc.d -f cups remove
	update-rc.d cups stop 20 2 3 4 5 .

up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	sudo -n sed '/127.0.0.1 mcarecho/d' /etc/hosts -n
	sudo rm -rf /home/mcarecho

fclean: clean
	sudo docker system prune --volumes --all --force

re: fclean all

.PHONY: all up down clean re fclean port
