%{
#include "sos.tab.h"
#include <stdio.h>
#include <stdlib.h>
extern int yylval;
char yy_name [32];
%}

%option nounput
%option noyywrap

PONCTUATION (\\t|" "|\\n|"("|")"|"{"|"}"|"["|"]"|"$")
OP_LOGIQUE ("|"|"&"|"!="|"-a"|"-o"|"=")
OP_ARITHMETIQUE ("+"|"-"|"/"|"*"|"%")
MOT_CLEF ("if"|"then"|"for"|"do"|"done"|"in"|"while"|"until"|"case"|"esac"|"echo"|"read"|"return"|"exit"|"local"|"elif"|"else"|"declare"|"test"|"expr")
NOT_MOT ({PONCTUATION}|{OP_ARITHMETIQUE}|{OP_LOGIQUE}|{MOT_CLEF})

%%

"[" return '[';
"]" return ']';
"(" return '(';
")" return ')';
"{" return '{';
"}" return '}';
"|" return '|';
"$" return '$';
"!" return '!';
";" return ';';
"\"" return '\"';
"\'" return '\'';
"?" return '?';

"+" return '+';
"-" return '-';
"*" return '*';
"/" return  '/';
"%" return  '%';
"=" return '=';

"-o" return tiret_o;
"-a" return tiret_a;
"-n" return tiret_n;
"-z" return tiret_z;
"-ne" return ne;
"-eq" return eq;
"-gt" return gt;
"-ge" return ge;
"-lt" return lt;
"-le" return le;
"!=" return diff;

"if" return IF;
"elif" return  ELIF;
"else" return ELSE;
"then" return THEN;
"for" return FOR;
"do" return DO;
"done" return DONE;
"in" return in;
"while" return WHILE;
"until" return UNTIL;
"case" return CASE;
"esac" return ESAC;
"echo" return Echo;
"read" return READ;
"return" return RETURN;
"exit" return EXIT;
"local" return LOCAL;
"fi" return FI;
"declare" return DECLARE;
"test" return TEST;
"expr" return expr;


[+|-]?[0-9]+ {yylval= atoi(yytext); printf("entier %d\n",yylval);return entier;}

(\"([^{NOT_MOT}\"\\]|\\.)*\") {strcpy(yy_name, yytext);printf("mot %s\n",yytext); return mot;}

(\"([^\"\\]|\\.)*\") {strcpy(yy_name, yytext); printf("chaine: %s\n",yytext); return chaine;}

[a-zA-Z_]([a-zA-Z_]|[0-9])* {strcpy(yy_name, yytext); printf("id: %s\n",yytext); return id;}
[[:space:]] ;

\#.* printf("commentaire\n");

. {fprintf(stderr,"ERREUR (%d)\n",yytext[0]); }

%%

