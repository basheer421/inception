
up:
	sudo docker compose -f srcs/docker-compose.yml up -d

fclean:
	sudo docker system prune -a --volumes