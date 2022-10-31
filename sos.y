%{
#include <stdio.h>
extern int yylex ();
extern void yyerror (const char * msg);
%}


%token '(' ')'
%token PLUS
%token MOIN
%token ENTIER
%token NUM
%token STAR

%right STAR
%right PLUS

%start E

%%

E :
 E PLUS E{
 	$$=$1+$3;
 	printf("E+E=%d\n",$$);
 }
 |E STAR E{
 	$$=$1*$3;
 	printf("E*E=%d\n",$$);
 }
 |'('E')'{
  	printf("(E)=(%d)\n",$$);
  }
 | ENTIER{
 	printf("ENTIER=%d\n",$$);
 }
%%

void yyerror (const char * msg)
{
    fprintf (stderr, "%s\n", msg);
}