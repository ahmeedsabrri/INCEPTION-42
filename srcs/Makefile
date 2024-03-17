# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asabri <asabri@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/06 03:43:02 by asabri            #+#    #+#              #
#    Updated: 2024/03/17 22:50:46 by asabri           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DB_VOLUME_DIR := $(HOME)/data/mariadb-data
WP_VOLUME_DIR := $(HOME)/data/word-press


all:
	@mkdir -p $(DB_VOLUME_DIR) $(WP_VOLUME_DIR) || true
	@docker compose -f docker-compose.yml up --build  || true

down:
	@docker compose -f docker-compose.yml down || true

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
	@sudo rm -rf $(DB_VOLUME_DIR) $(WP_VOLUME_DIR) || true

re: down all