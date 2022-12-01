#include <stdio.h>

extern int yylex ();
extern int yyparse();

//extern int yydebug;
int main()
{
   // // yydebug=1;
   //(\"([^{NOT_MOT}\"\\]|\\.)*\") {strcpy(yy_name, yytext);printf("mot %s\n",yytext); return mot;}
   //(\"([^{NOT_MOT}\"\\]|\\.)*\") {strcpy(yy_name, yytext);printf("mot %s\n",yytext); return mot;}

    int r=yyparse();
    printf("->%d\n",r);

    return r;
}