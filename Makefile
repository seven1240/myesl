ESLPATH = /usr/src/freeswitch/libs/esl
CFLAGS  = -ggdb -I$(ESLPATH)/src/include

all: myesl charge acd icharge

myesl: myesl.c
	gcc $(CFLAGS) -o myesl myesl.c $(ESLPATH)/libesl.a

charge: charge.c
	gcc $(CFLAGS) -o charge charge.c $(ESLPATH)/libesl.a

acd: acd.c
	gcc $(CFLAGS) -o acd acd.c $(ESLPATH)/libesl.a

icharge: icharge.c
	gcc $(CFLAGS) -o icharge icharge.c $(ESLPATH)/libesl.a

# Erlang

erl: echarge fsmcharge

echarge: echarge.erl
	erlc echarge.erl

echarge-run:
	erl -pa . -setcookie ClueCon -sname test@localhost

fsmcharge: fsmcharge.erl
	erlc fsmcharge.erl

fsmcharge-run:
	erl -pa . -setcookie ClueCon -sname test@localhost

clean:
	rm myesl charge acd icharge *.beam

