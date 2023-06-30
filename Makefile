
up:
	mkdir -p /home/${USER}/data/mariadb
	docker compose -f srcs/docker-compose.yml up -d

vclean:
	docker system prune -a

re: vclean
	$(MAKE) up
