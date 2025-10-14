NAME=inception

all:
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker system prune -af

re: down clean all
