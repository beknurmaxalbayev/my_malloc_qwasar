SRC=src
OBJ=obj
BIN=bin

CFLAGS +=-W  -Wall -g -Iinclude 
CC=gcc
TARGET=my_malloc
RM=rm -rf

$(shell mkdir -p obj)

SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(CFLAGS)

$(OBJ)/%.o: $(SRC)/%.c
	${CC} ${CFLAGS} -c $< -o $@

clean:
	$(RM) $(OBJ)/*.o 

fclean: clean
	$(RM) $(TARGET) $(OBJ)

re: 	fclean all

.PHONY: all clean fclean re

