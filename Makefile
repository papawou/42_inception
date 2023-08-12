SRC := ./srcs/docker-compose.yml

all: down build up

build:
	docker-compose -f ${SRC} build

up:
	docker-compose -f ${SRC} up

down:
	docker-compose -f ${SRC} down

fclean: down
	docker system prune --volumes -a -f

re : fclean all

.PHONY : all clean fclean re