
main :sos.tab.o lex.yy.o main.o quadop.o


sos.tab.c: sos.y
	bison -d $<
lex.yy.c : sos.lex sos.tab.c
			flex -s $<

clean :
	rm -f \
			sos.tab.o sos.tab.c sos.tab.h sos.output\
			lex.yy lex.yy.c\
			main main.o  lex.yy.o a.out
