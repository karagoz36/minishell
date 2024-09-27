# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kyeh <kyeh@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/10 14:58:30 by kyeh              #+#    #+#              #
#    Updated: 2024/09/23 18:00:57 by kyeh             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors
BLUE		= \033[0;38;5;123m
LIGHT_PINK	= \033[0;38;5;200m
PINK		= \033[0;38;5;198m
DARK_BLUE 	= \033[1;38;5;110m
GREEN		= \033[1;32;111m
LIGHT_GREEN	= \033[0;38;5;121m
LIGHT_RED	= \033[0;31;5;110m
FLASH_GREEN	= \033[33;32m
WHITE_BOLD	= \033[37m
GREY		= \033[3;90m
ORANGE		= \033[3;91m
YELLOW		= \033[0;33m
NOCOLOR		= \033[0m

# Name
NAME	= minishell

# Compiler and flags
CC		= cc
CFLAGS	= -Wall -Wextra -Werror -g3 # -fsanitize=address

# Source files
SRC_LEX	=	$(addprefix lexer/, \
				lexer.c				tokens.c			lex_utils.c)
SRC_PAR	=	$(addprefix parser/, \
				parser.c			expansion.c			quote.c \
				parser_utils.c		expand_utils.c		heredoc.c)
SRC_BLD	=	$(addprefix builder/, \
				builder.c			builder_utils.c 	filename.c \
				arg.c)
SRC_EXEC	=	$(addprefix exec/, \
				exec.c				exec_cmd.c			exec_utils.c \
				redirs.c)
SRC_SIG	=	$(addprefix signal/, \
				signals.c)
SRC_ENV	=	$(addprefix env/, \
				env.c				env_utils.c			env_utils2.c)
SRC_UTILS	=	$(addprefix utils/, \
				utils.c)
SRC_BT	=	$(addprefix builtins/, \
				builtin.c			bt_pwd_echo_cd.c		bt_export_env_unset.c \
				bt_export_exit.c)
SRC_FILES	=	main.c $(SRC_LEX) $(SRC_PAR) $(SRC_BLD) $(SRC_EXEC) $(SRC_SIG) $(SRC_ENV) $(SRC_UTILS) $(SRC_BT)
SRC_PATH	=	src/
SRC			=	$(addprefix $(SRC_PATH), $(SRC_FILES))

HEADER		=	include/

# Object files
OBJ_FILES	=	$(SRC_FILES:%.c=%.o)
OBJ_PATH	=	obj/
OBJ			=	$(addprefix $(OBJ_PATH), $(OBJ_FILES))

RM		=	rm -rf

LIBFT	=	libft/libft.a
#######################################################

$(NAME): $(OBJ) $(LIBFT)
	@gcc $(CFLAGS) $^ -lreadline -o  $@
	@printf "	\033[2K\r$(DARK_BLUE)minishell\t: $(LIGHT_GREEN)Updated\n\033[0m"

all: $(OBJ_PATH) $(LIBFT) $(NAME) $(HEADER)

e:	exec
exec:
	@$(MAKE) all
	@./minishell

$(LIBFT):
	@$(MAKE) -C libft/

$(OBJ_PATH):
	@mkdir -p $(OBJ_PATH) 2> /dev/null

$(OBJ_PATH)%.o: $(SRC_PATH)%.c $(HEADER)/minishell.h Makefile
	@mkdir -p $(dir $@)
	@printf "\033[2K\r$(LIGHT_RED)Compiling...	\033[37m$<\033[36m \033[0m"
	@gcc $(CFLAGS) -I $(HEADER) -I libft/include -c $< -o $@

clean:
	@printf "\33[2K\r$(LIGHT_RED)Deleting minishell srcs/	\033[37m"
	@sleep 0.1
	@printf "\33[2K\r$(LIGHT_RED)Deleting minishell srcs/.	\033[37m"
	@sleep 0.1
	@printf "\33[2K\r$(LIGHT_RED)Deleting minishell srcs/..	\033[37m"
	@sleep 0.1
	@printf "\33[2K\r$(LIGHT_RED)Deleting minishell srcs/...	\033[37m"
	@sleep 0.1
	@printf "\33[2K\r$(LIGHT_RED)Deleting minishell srcs/	\033[37m"
	@sleep 0.1
	@printf "\33[2K\r$(LIGHT_RED)Deleting minishell srcs/.	\033[37m"
	@sleep 0.1
	@printf "\33[2K\r$(LIGHT_RED)Deleting minishell srcs/..	\033[37m"
	@sleep 0.1
	@printf "\33[2K\r$(LIGHT_RED)Deleting minishell srcs/...	\033[37m"
	@sleep 0.1
	@make -C libft/ clean
	@${RM} ${OBJ_PATH}
	@printf "\33[2K\r$(LIGHT_RED)Deleted successfully!\n\033[0m"

fclean: clean
	@$(RM) $(NAME)
	@make -C libft/ fclean

re:
	@$(MAKE) fclean
	@make -C libft/ re
	@$(MAKE) all

# lib:
# 	@$(MAKE) -C libft
# cleanlib:
# 	@$(MAKE) clean
# 	@$(MAKE) -C libft/ clean
# fcleanlib:
# 	@$(MAKE) fclean
# 	@$(MAKE) -C libft/ fclean
# relib:
# 	@$(MAKE) fclean
# 	@$(MAKE) -C libft/ re
# 	@$(MAKE) all

# test: all
# 	@sh tester/test.sh 0.01
# 	@printf "\33[2K\r$(GREEN)Test done\n\n\033[0m"

.PHONY: all e exec clean fclean re #lib cleanlib fcleanlib relib test
#	@mkdir -p $(dir $@) is used in Makefile rules to ensure that the directory where the object file will be placed exists before attempting to create the object file.
#		-p flag creates any missing parent directories in the specified path:
#			mkdir -p path/to/directory
#			it'll create path and path/to if either of them does not exist.
#		$(dir $@) retrieves the directory path from the target file path:
#			if $@ is obj/main.o, $(dir $@) will be obj/
