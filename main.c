#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char* newtemp();
extern int yylex ();
extern int yyparse();



int main()
{
    printf("%s\n",newtemp());
    printf("%s\n",newtemp());
    printf("%s\n",newtemp());
    printf("%s\n",newtemp());
    printf("%s\n",newtemp());
    printf("%s\n",newtemp());
    int r=yyparse();
    printf("->%d\n",r);

    return r;
}