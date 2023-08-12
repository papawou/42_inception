SRC := ./srcs/docker-compose.yml

all :
	docker-compose -f ${SRC} up

buid:
	docker-compose -f ${SRC} build

down:
	docker-compose -f ${SRC} down

fclean : down
	docker system prune --volumes -a -f

re : fclean all

.PHONY : all clean fclean re