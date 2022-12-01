%{
#include "sos.tab.h"
#include <stdio.h>
#include <stdlib.h>
extern int yylval;
char yy_name[32];
%}

%option nounput
%option noyywrap

%%

"[" printf("ponct %s\n",yytext); return '[';
"]" printf("ponct %s\n",yytext); return ']';
"(" printf("ponct %s\n",yytext); return '(';
")" printf("ponct %s\n",yytext); return ')';
"{" printf("ponct %s\n",yytext); return '{';
"}" printf("ponct %s\n",yytext); return '}';
"|" printf("ponct %s\n",yytext); return '|';
"$" printf("ponct %s\n",yytext); return '$';
"!" printf("ponct %s\n",yytext); return '!';
";" printf("ponct %s\n",yytext); return ';';
";;" printf("ponct %s\n",yytext); return double_virgule;
"?" printf("ponct %s\n",yytext); return '?';

"+" printf("arithmetique %s\n",yytext); return '+';
"-" printf("arithmetique %s\n",yytext); return '-';
"*" printf("arithmetique %s\n",yytext); return '*';
"/" printf("arithmetique %s\n",yytext); return  '/';
"%" printf("arithmetique %s\n",yytext); return  '%';
"=" printf("arithmetique %s\n",yytext); return '=';

"-o" printf("logique %s\n",yytext); return tiret_o;
"-a" printf("logique %s\n",yytext); return tiret_a;
"-n" printf("logique %s\n",yytext); return tiret_n;
"-z" printf("logique %s\n",yytext); return tiret_z;
"-ne" printf("logique %s\n",yytext); return ne;
"-eq" printf("logique %s\n",yytext); return eq;
"-gt" printf("logique %s\n",yytext); return gt;
"-ge" printf("logique %s\n",yytext); return ge;
"-lt" printf("logique %s\n",yytext); return lt;
"-le" printf("logique %s\n",yytext); return le;
"!=" printf("logique %s\n",yytext); return diff;

"if" printf("mot clef %s\n",yytext); return IF;
"elif" printf("mot clef %s\n",yytext); return  ELIF;
"else" printf("mot clef %s\n",yytext); return ELSE;
"then" printf("mot clef %s\n",yytext); return THEN;
"for" printf("mot clef %s\n",yytext); return FOR;
"do" printf("mot clef %s\n",yytext); return DO;
"done" printf("mot clef %s\n",yytext); return DONE;
"in" printf("mot clef %s\n",yytext); return in;
"while" printf("mot clef %s\n",yytext); return WHILE;
"until" printf("mot clef %s\n",yytext); return UNTIL;
"case" printf("mot clef %s\n",yytext); return CASE;
"esac" printf("mot clef %s\n",yytext); return ESAC;
"echo" printf("mot clef %s\n",yytext); return Echo;
"read" printf("mot clef %s\n",yytext); return READ;
"return" printf("mot clef %s\n",yytext); return RETURN;
"exit" printf("mot clef %s\n",yytext); return EXIT;
"local" printf("mot clef %s\n",yytext); return LOCAL;
"fi" printf("mot clef %s\n",yytext); return FI;
"declare" printf("mot clef %s\n",yytext); return DECLARE;
"test" printf("mot clef %s\n",yytext); return TEST;
"expr" printf("mot clef %s\n",yytext); return expr;



[+|-]?[0-9]+ {printf("entier : %s\n",yytext);return entier;}
[a-zA-Z_]([a-zA-Z_]|[0-9])* {strcpy(yy_name, yytext); printf("id: %s\n",yytext); return id; }

\"([^\"\\]|\\.)*\"|\'([^\"\\]|\\.)*\' { strcpy(yy_name, yytext);printf("chaine:: %s\n",yytext); return chaine;}

[[:space:]] ;

\#.* printf("commentaire: %s\n",yytext);

. {fprintf(stderr,"ERREUR (%d)\n",yytext[0]); }

%%

