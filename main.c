#include <stdio.h>
#include <string.h>

extern int yylex ();
extern int yyparse();
int nextemp=0;

char* newtemp()
{
	
    char *t="T";
	char a[20];
	sprintf(a,"%d",nextemp);
	strcat(t,a);
	nextemp++;
	return t;
}

int main()
{
   // printf("a==%s",newtemp());
    int r=yyparse();
    printf("->%d\n",r);

    return r;
}