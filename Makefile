# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: miouali <miouali@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/12 12:56:33 by miouali           #+#    #+#              #
#    Updated: 2026/02/16 20:39:20 by miouali          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

DEF_COLOR = \033[0;39m
CYAN    = \033[0;96m
GREEN = \033[0;92m
PURPLE  = \033[0;95m
YELLOW  = \033[0;93m
RED     = \033[0;91m
RESET   = \033[0m

ERR_LOG = .errors.log 

CC = cc
CFLAGS =  -O3 -Wall -Wextra -Werror -I includes
DFLAGS = -fsanitize=address -fsanitize=undefined -g -Wshadow

#Dossiers
SRCS_DIR = srcs/
OBJS_DIR = objs/
HEADER_DIR = includes/
#Sous-Dossiers
IS_DIR = is/
MEM_DIR = mem/
STR_DIR = str/
TO_DIR = to/
PUT_DIR = put/
LST_DIR = lst/
MATHS_DIR = maths/
PRINTF_DIR = ft_printf/
GNL_DIR = get_next_line/

SRCS_IS =  ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c
SRCS_MEM = ft_bzero.c ft_calloc.c ft_free_str_tab.c ft_memchr.c ft_memcmp.c \
			ft_memcpy.c ft_memmove.c ft_memset.c ft_realloc.c ft_print_memory.c
SRCS_STR = ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c \
          ft_strncmp.c ft_strnstr.c ft_strdup.c ft_substr.c ft_strjoin.c \
          ft_strtrim.c ft_split.c ft_strmapi.c ft_striteri.c ft_strjoin_free.c \
		  ft_strcmp.c
SRCS_TO = ft_toupper.c ft_tolower.c ft_atoi.c ft_itoa.c ft_atof.c
SRCS_PUT = ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
			ft_putnbr_base.c
SRCS_LST = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
          ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c
SRCS_MATHS = ft_pow.c ft_sqrt.c
SRCS_GNL = get_next_line.c get_next_line_utils.c
SRCS_PRINTF = ft_printf.c format_%.c format_big_x.c \
              format_c.c format_d.c format_i.c format_p.c \
              format_s.c format_tab.c format_u.c format_x.c \
              ft_size_base.c
		

ALL_SRCS = $(addprefix $(SRCS_DIR)$(IS_DIR), $(SRCS_IS)) \
			$(addprefix $(SRCS_DIR)$(MEM_DIR), $(SRCS_MEM)) \
			$(addprefix $(SRCS_DIR)$(STR_DIR), $(SRCS_STR)) \
			$(addprefix $(SRCS_DIR)$(TO_DIR), $(SRCS_TO)) \
			$(addprefix $(SRCS_DIR)$(PUT_DIR), $(SRCS_PUT)) \
			$(addprefix $(SRCS_DIR)$(LST_DIR), $(SRCS_LST)) \
			$(addprefix $(SRCS_DIR)$(PRINTF_DIR), $(SRCS_PRINTF)) \
			$(addprefix $(SRCS_DIR)$(GNL_DIR), $(SRCS_GNL)) \
			$(addprefix $(SRCS_DIR)$(MATHS_DIR), $(SRCS_MATHS))


OBJS = $(patsubst $(SRCS_DIR)%.c, $(OBJS_DIR)%.o, $(ALL_SRCS))

HEADER = $(HEADER_DIR)libft.h

AR = ar rcs
RM = rm -rf

all: header start_timer $(NAME) end_timer

header:
	@echo "$(YELLOW) Démarrage de la compilation de la Libft...$(RESET)"

start_timer:
	@rm -rf $(ERR_LOG)
	$(eval START_TIME := $(shell date +%s))

debug: header start_timer $(OBJS)
	@$(AR) $(NAME) $(OBJS)
	@echo "$(GREEN) Libft debug ready !$(DEF_COLOR)"

$(NAME): $(OBJS)
		@echo "\n\n$(CYAN) █████       █████ ███████████  ███████████ ███████████"  
		@sleep 0.1
		@echo '░░███       ░░███ ░░███░░░░░███░░███░░░░░░█░█░░░███░░░█'   
		@sleep 0.1
		@echo ' ░███        ░███  ░███    ░███ ░███   █ ░ ░   ░███  ░'    
		@sleep 0.1
		@echo ' ░███        ░███  ░██████████  ░███████       ░███ '     
		@sleep 0.1
		@echo ' ░███        ░███  ░███░░░░░███ ░███░░░█       ░███ '     
		@sleep 0.1
		@echo ' ░███      █ ░███  ░███    ░███ ░███  ░        ░███ '     
		@sleep 0.1
		@echo ' ███████████ █████ ███████████  █████          █████'     
		@sleep 0.1
		@echo "░░░░░░░░░░░ ░░░░░ ░░░░░░░░░░░  ░░░░░          ░░░░░ $(DEF_COLOR)"                                                                
		@$(AR) $(NAME) $(OBJS)
		@echo "\n\n$(GREEN) Libft is ready to be used !$(DEF_COLOR)"


# Variables pour la barre
TOTAL_FILES := $(words $(ALL_SRCS))
CURRENT_FILE := 0

$(OBJS_DIR)%.o: $(SRCS_DIR)%.c $(HEADER)
	@mkdir -p $(dir $@)
	@$(eval CURRENT_FILE=$(shell echo $$(($(CURRENT_FILE) + 1))))
	@$(eval PERCENT=$(shell echo $$(($(CURRENT_FILE) * 100 / $(TOTAL_FILES)))))
	@printf "\r$(CYAN)🛠️  Compiling Libft... [%-20s] %d%%" \
		"$(shell printf '#%.0s' $$(seq 1 $$(($(PERCENT) / 5))))" $(PERCENT)
	@$(CC) $(CFLAGS) -c $< -o $@ 2> .temp_err || \
		(printf "\n$(PURPLE)❌ Erreur dans $< :$(RESET)\n" && cat .temp_err >> $(ERR_LOG) && cat .temp_err && rm -f .temp_err && exit 1)
		

end_timer:
	@$(eval END_TIME := $(shell date +%s))
	@$(eval DURATION := $(shell echo $$(($(END_TIME) - $(START_TIME)))))
	@$(eval ERRORS := $(shell if [ -f $(ERR_LOG) ]; then grep -c "error:" $(ERR_LOG); else echo 0; fi))
	@echo "\n--------------------------------------------------"
	@if [ $(ERRORS) -eq 0 ]; then \
		echo "$(GREEN)✅ COMPILATION TERMINÉE !$(RESET)"; \
	else \
		echo "$(RED)❌ COMPILATION TERMINÉE AVEC DES ERREURS$(RESET)"; \
	fi
	@echo "Temps écoulé : $(DURATION) secondes"
	@echo "  Nombre d'erreurs : $(ERRORS)"
	@echo "--------------------------------------------------"
	@rm -f $(ERR_LOG)

clean:
	$(RM) $(OBJS_DIR)
	@echo "$(PURPLE) Objects cleaned!$(DEF_COLOR)"

fclean: clean
		$(RM) $(NAME)
		@echo "$(PURPLE) $(NAME) deleted!$(DEF_COLOR)"

re: fclean all

.PHONY : all clean fclean re debug
