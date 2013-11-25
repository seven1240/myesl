ESLPATH = /usr/src/freeswitch/libs/esl
CFLAGS  = -I$(ESLPATH)/src/include

all: myesl.c $(ESLPATH)/libesl.a
	gcc $(CFLAGS) -o myesl myesl.c $(ESLPATH)/libesl.a
