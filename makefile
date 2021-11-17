export

CC = g++
CFLAG = -std=c++17 -Wall 
INCLUDE = -I$(shell pwd)/include
DEFINE = -Dregister
FLAGS = ${CFLAG} ${INCLUDE} ${DEFINE}

LD = ld
LFLAGS = -r

RM = -@rm -f

.PHONY: subdir all 

all: main.o subdir 
	${CC} ${CFLAGS} main.o lex/lex.o -o MyParser

subdir:
	${MAKE} -C lex lex.o

main.o: main.cpp
	${CC} ${FLAGS} -c main.cpp

clean:
	${MAKE} -C lex clean
	${RM} *.o
	${RM} *.log
	${RM} MyParser
