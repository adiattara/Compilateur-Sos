%{
#include "sos.tab.h"
#include <stdio.h>
#include <stdlib.h>
extern int yylval;



%}

%option nounput
%option noyywrap


LETTRE [a-zA-Z]
MOT {LETTRE}+
IDENT (?i:{MOT})
AFFECT ":="
ELT  1?[0-9]|3[0-2]
EOL  "\n"
VIRG ","
OACC "{"
CACC "}"

%%


"(" return yytext[0];

")" return yytext[0];
"+" return PLUS;

"-" return MOIN;

"*" return STAR;

[0-9]+ {yylval=atoi(yytext); return ENTIER; }



[[:SPACE:]] ;

. {fprintf(stderr,"Erreur (%d\n",yytext[0]);};

%%

