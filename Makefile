SRC := /srcs/docker_compose

all : NAME

SRC := docker_compose.yml

clean :

fclean : clean

re : fclean all

.PHONY : all clean fclean re