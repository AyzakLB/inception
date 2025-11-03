
BASE_DIR = /home/amarzaq/data
MARIADB_DIR = $(BASE_DIR)/mariadb
WORDPRESS_DIR = $(BASE_DIR)/wordpress
PORTAINER_DIR = $(BASE_DIR)/portainer

all:
	mkdir -p $(MARIADB_DIR) $(WORDPRESS_DIR) $(PORTAINER_DIR)
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

up:
	docker compose -f srcs/docker-compose.yml up -d

clean:
	rm -rf $(MARIADB_DIR) $(WORDPRESS_DIR) $(PORTAINER_DIR)
	docker system prune -af

re: down clean all
