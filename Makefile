ESLPATH = /usr/src/freeswitch/libs/esl
CFLAGS  = -ggdb -I$(ESLPATH)/src/include
# LIBESL  = $(ESLPATH)/libesl.a             # 1.2
LIBESL  = $(ESLPATH)/.libs/libesl.a         # 1.4


all: myesl charge acd icharge

myesl: myesl.c
	gcc $(CFLAGS) -o myesl myesl.c $(LIBESL)

charge: charge.c
	gcc $(CFLAGS) -o charge charge.c $(LIBESL)

acd: acd.c
	gcc $(CFLAGS) -o acd acd.c $(LIBESL)

icharge: icharge.c
	gcc $(CFLAGS) -o icharge icharge.c $(LIBESL)

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
	rm -f myesl charge acd icharge *.beam event_stat
	rm -rf *.o *.so *.dSYM


