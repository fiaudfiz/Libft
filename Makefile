# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fiaudfiz <fiaudfiz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/12 12:56:33 by miouali           #+#    #+#              #
#    Updated: 2026/03/26 17:12:15 by fiaudfiz         ###   ########.fr        #
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

#Flags commun a tout les modes de debug
DFLAGS_COMMON = -g -Wshadow -fno-omit-frame-pointer

#ASan + UBSan
DFLAGS_ASAN = $(DFLAGS_COMMON) \
			-fsanitize=address,undefined \
			-fno-sanitize-recover=all

#TSan
DFLAGS_TSAN = $(DFLAGS_COMMON) \
				-fsanitize=thread

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
	@printf "\n$(YELLOW)Démarrage de la compilation de la Libft...$(RESET)\n"

start_timer:
	@rm -rf $(ERR_LOG)
	$(eval START_TIME := $(shell date +%s))

debug debug_asan debug_tsan: \
    CFLAGS = -O0 -Wall -Werror -Wextra -I includes
	
#debug classique
debug: DFLAGS = $(DFLAGS_COMMON)
debug: header start_timer $(OBJS) end_timer
	@$(AR) $(NAME) $(OBJS)
	@printf "$(GREEN) Libft debug ready !$(DEF_COLOR)"

debug_asan: DFLAGS = $(DFLAGS_ASAN)
debug_asan: header start_timer $(OBJS) end_timer
	@$(AR) $(NAME) $(OBJS)
	@printf "$(GREEN) Libft debug [ASan+UBSan] ready !$(DEF_COLOR)"

debug_tsan: DFLAGS = $(DFLAGS_TSAN)
debug_tsan: header start_timer $(OBJS) end_timer
	@$(AR) $(NAME) $(OBJS)
	@printf "$(YELLOW) Libft debug [TSan] ready ! $(DEF_COLOR)"

$(NAME): $(OBJS)
		@printf "\n\n$(CYAN) █████       █████ ███████████  ███████████ ███████████\n"  
		@sleep 0.1
		@printf "░░███       ░░███ ░░███░░░░░███░░███░░░░░░█░█░░░███░░░█\n"   
		@sleep 0.1
		@printf " ░███        ░███  ░███    ░███ ░███   █ ░ ░   ░███  ░\n"    
		@sleep 0.1
		@printf " ░███        ░███  ░██████████  ░███████       ░███ \n"     
		@sleep 0.1
		@printf " ░███        ░███  ░███░░░░░███ ░███░░░█       ░███ \n"     
		@sleep 0.1
		@printf " ░███      █ ░███  ░███    ░███ ░███  ░        ░███ \n"     
		@sleep 0.1
		@printf " ███████████ █████ ███████████  █████          █████\n"     
		@sleep 0.1
		@printf "░░░░░░░░░░░ ░░░░░ ░░░░░░░░░░░  ░░░░░          ░░░░░ $(DEF_COLOR)\n"                                                                
		@$(AR) $(NAME) $(OBJS)
		@printf "\n\n$(GREEN) Libft is ready to be used !$(DEF_COLOR)"


# Variables pour la barre
TOTAL_FILES := $(words $(ALL_SRCS))
CURRENT_FILE := 0

$(OBJS_DIR)%.o: $(SRCS_DIR)%.c $(HEADER)
	@mkdir -p $(dir $@)
	@$(eval CURRENT_FILE=$(shell printf $$(($(CURRENT_FILE) + 1))))
	@$(eval PERCENT=$(shell printf $$(($(CURRENT_FILE) * 100 / $(TOTAL_FILES)))))
	@printf "\r$(CYAN)🛠️  Compiling Libft... [%-20s] %d%%" \
		"$(shell printf '#%.0s' $$(seq 1 $$(($(PERCENT) / 5))))" $(PERCENT)
	@$(CC) $(CFLAGS) -c $< -o $@ 2> .temp_err || \
		(printf "\n$(PURPLE)❌ Erreur dans $< :$(RESET)\n" && cat .temp_err >> $(ERR_LOG) && cat .temp_err && rm -f .temp_err && exit 1)
		

end_timer:
	@$(eval END_TIME := $(shell date +%s))
	@$(eval DURATION := $(shell printf $$(($(END_TIME) - $(START_TIME)))))
	@$(eval ERRORS := $(shell if [ -f $(ERR_LOG) ]; then grep -c "error:" $(ERR_LOG); else printf 0; fi))
	@printf "\n%s\n" "--------------------------------------------------"
	@if [ $(ERRORS) -eq 0 ]; then \
		printf "$(GREEN)✅ COMPILATION TERMINÉE !$(RESET)\n"; \
	else \
		printf "$(RED)❌ COMPILATION TERMINÉE AVEC DES ERREURS$(RESET)\n"; \
	fi
	@printf "Temps écoulé : $(DURATION) secondes\n"
	@printf "  Nombre d'erreurs : $(ERRORS)\n"
	@printf "%s\n" "--------------------------------------------------"
	@rm -f $(ERR_LOG)

clean:
	$(RM) $(OBJS_DIR)
	@printf "$(PURPLE) Objects cleaned!$(DEF_COLOR)\n"

fclean: clean
		$(RM) $(NAME)
		@printf "$(PURPLE) $(NAME) deleted!$(DEF_COLOR)\n"

re: fclean all

.PHONY: all clean fclean re debug debug_asan debug_tsan