
ENV_FILE = ./srcs/.env
COMPOSE_FILE = ./srcs/docker-compose.yaml
MOUNT_DIR = ./wordpress

all: $(ENV_FILE) build

$(ENV_FILE):
	@echo "**********************************************"
	@echo "* ___                      _   _             *"
	@echo "*|_ _|_ __   ___ ___ _ __ | |_(_) ___  _ __  *"
	@echo "* | || '_ \ / __/ _ \ '_ \| __| |/ _ \| '_ \ *"
	@echo "* | || | | | (_|  __/ |_) | |_| | (_) | | | |*"
	@echo "*|___|_| |_|\___\___| .__/ \__|_|\___/|_| |_|*"
	@echo "*                   |_|                      *"
	@echo "**********************************************"
	@echo "\nLet's start filling some informations for our services\nbefore building them (make sure you fill them correctly 😉)\n"
	@read -p "Enter Database name: " DB_NAME; if [ -z "$$DB_NAME" ]; then echo "Databse name cannot be empty"; exit 1; fi; echo "MARIADB_DATABASE=$$DB_NAME\nWP_DB_NAME=$$DB_NAME" > $(ENV_FILE)
	@read -p "Enter Database user: " DB_USER; if [ -z "$$DB_USER" ]; then echo "Databse user cannot be empty"; rm $(ENV_FILE); exit 1; fi; echo "MARIADB_USER=$$DB_USER\nWP_DB_USER=$$DB_USER" >> $(ENV_FILE)
	@read -p "Enter Database password: " DB_PASSWD; if [ -z "$$DB_PASSWD" ]; then echo "Databse password cannot be empty"; rm $(ENV_FILE); exit 1; fi; echo "MARIADB_PASSWORD=$$DB_PASSWD\nWP_DB_PASSWORD=$$DB_PASSWD" >> $(ENV_FILE)
	@read -p "Enter wordpress url: " WP_URL; if [ -z "$$WP_URL" ]; then echo "Wordpress url cannot be empty"; rm -rf $(ENV_FILE); exit 1; fi; echo "WP_URL=$$WP_URL" >> $(ENV_FILE)
	@read -p "Enter wordpress title: " WP_TITLE; if [ -z "$$WP_TITLE" ]; then echo "Wordpress url cannot be empty"; rm -rf $(ENV_FILE); exit 1; fi; echo "WP_TITLE=$$WP_TITLE" >> $(ENV_FILE)
	@read -p "Enter wordpress admin username: " WP_ADMIN_USER; if [ -z "$$WP_ADMIN_USER" ]; then echo "Wordpress admin username cannot be empty"; rm -rf $(ENV_FILE); exit 1; fi; echo "WP_ADMIN_USER=$$WP_ADMIN_USER" >> $(ENV_FILE)
	@read -p "Enter wordpress admin password: " WP_ADMIN_PASSWD; if [ -z "$$WP_ADMIN_PASSWD" ]; then echo "Wordpress admin password cannot be empty"; rm -rf $(ENV_FILE); exit 1; fi; echo "WP_ADMIN_PASSWD=$$WP_ADMIN_PASSWD" >> $(ENV_FILE)
	@read -p "Enter wordpress admin email: " WP_ADMIN_EMAIL; if [ -z "$$WP_ADMIN_EMAIL" ]; then echo "Wordpress admin email cannot be empty"; rm -rf $(ENV_FILE); exit 1; fi; echo "WP_ADMIN_EMAIL=$$WP_ADMIN_EMAIL" >> $(ENV_FILE)
	@echo "\033[0;32m.env and secret password files created successfuly\033[0m"

build:
	@docker compose -f $(COMPOSE_FILE) up --build -d

container_logs:
	@docker compose -f $(COMPOSE_FILE) logs -f

volume_ls:
	@docker volume ls

network_ls:
	@docker network ls

docker_ps:
	@docker ps -a

mariadb_logs:
	@docker logs -f mariadb

wordpress_logs:
	@docker logs -f wordpress

nginx_logs:
	@docker logs -f nginx

clean:
	@if [ -f $(ENV_FILE) ]; then docker compose -f $(COMPOSE_FILE) down --volumes; fi
	@rm -rf $(MOUNT_DIR) $(ENV_FILE)
	@echo "\033[0;32mCLEANED SUCCESSFULY\033[0m"

fclean: clean
	@if [ -n "$$(docker images -a -q)" ]; then \
		docker rmi -f $$(docker images -a -q) 2>/dev/null || true; fi
	@docker system prune
	@echo "\033[0;32mFULLY CLEANED SUCCESSFULY\033[0m"

re: clean all

.PHONY: all build mariadb_logs wordpress_logs nginx_logs container_logs docker_ps volume_ls network_ls clean re
