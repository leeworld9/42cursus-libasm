# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dohelee <dohelee@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/21 16:34:42 by dohelee           #+#    #+#              #
#    Updated: 2021/04/21 16:45:23 by dohelee          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ASM_CC = nasm -f
ASM_OUTPUT_FORMAT = elf64			# MacOS : macho64 

CC = gcc 

NAME = libasm

SRCS = main.c
OBJS = $(SRCS:.c=.o)

ASM_SRCS = ft_strlen.s
ASM_OBJS = $(ASM_SRCS:.s=.o)

%.o: %.s
	$(ASM_CC) $(ASM_OUTPUT_FORMAT) $^

%.o: %.c
	$(CC) -c $^ -o $@

$(NAME) : $(OBJS) $(ASM_OBJS)
	$(CC) $(OBJS) $(ASM_OBJS) -o $(NAME) -m64

all: $(NAME)

clean:
	rm -f $(OBJS) $(ASM_OBJS)

fclean: clean
	rm -f $(NAME)
	
re: fclean all

.PHONY: all clean fclean re
