# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dohelee <dohelee@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/21 16:34:42 by dohelee           #+#    #+#              #
#    Updated: 2021/04/27 01:54:41 by dohelee          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ASM = nasm -f
ASM_OUTPUT_FORMAT = elf64
# MacOS format : macho64
# Linux format : elf64

CC = gcc 
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs

NAME = libasm.a

ASM_SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
ASM_OBJS = $(ASM_SRCS:.s=.o)

%.o: %.s
	$(ASM) $(ASM_OUTPUT_FORMAT) $^

$(NAME) : $(ASM_OBJS)
	$(AR) $@ $^

all: $(NAME)

clean:
	rm -f $(ASM_OBJS)
	rm -f main

fclean: clean
	rm -f $(NAME)

re: fclean all

main: all
	$(CC) main.c -L . -lasm -o main

.PHONY: all clean fclean re main
