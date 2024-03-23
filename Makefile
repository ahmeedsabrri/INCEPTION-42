# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asabri <asabri@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/06 03:43:02 by asabri            #+#    #+#              #
#    Updated: 2024/03/22 00:32:04 by asabri           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DB_VOL_DIR := $(HOME)/data/mariadb-data
WP_VOL_DIR := $(HOME)/data/word-press


all:
	@mkdir -p $(DB_VOL_DIR) $(WP_VOL_DIR) || true
	@docker compose -f srcs/docker-compose.yml up --build  || true

down:
	@docker compose -f srcs/docker-compose.yml down || true

stop:
	@docker stop $$(docker ps -q) 2>/dev/null || true
	@docker rm $$(docker ps -aq) 2>/dev/null || true

fclean: down
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@docker rm $$(docker ps -qa) 2>/dev/null || true
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@docker network rm $$(docker network ls -q) 2>/dev/null || true
	@docker system prune -af || true
	@rm -rf $(DB_VOL_DIR) $(WP_VOL_DIR) || true

re: down all