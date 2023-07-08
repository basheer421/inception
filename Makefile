all: up

build:
	docker compose -f srcs/docker-compose.yml up -d --build

up:
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

vclean:
	$(MAKE) down
	docker system prune  --all --force

fclean:
	@if [ ! -z "$$(docker ps -aq)" ]; then \
		docker stop $$(docker ps -aq); \
	fi
	@docker system prune --all --force --volumes
	@if [ ! -z "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@sudo rm -rf /home/${USER}/data


re: fclean
	$(MAKE) up

.PHONY	: all build down re clean fclean