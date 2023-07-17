
NAME := name_makefile


all : NAME

SRC := docker_compose.yml

NAME : SRC
	docker-docker_compose

clean : 

fclean : clean

re : fclean all

.PHONY : all clean fclean re $(NAME)