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
	docker system prune -a

re: vclean
	$(MAKE) up

.PHONY	: all build down re clean fclean
