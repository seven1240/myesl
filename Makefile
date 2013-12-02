ESLPATH = /usr/src/freeswitch/libs/esl
CFLAGS  = -I$(ESLPATH)/src/include

all: myesl charge

myesl: myesl.c
	myesl.c $(ESLPATH)/libesl.a
	gcc $(CFLAGS) -o myesl myesl.c $(ESLPATH)/libesl.a

charge: charge.c
	gcc $(CFLAGS) -o charge charge.c $(ESLPATH)/libesl.a
