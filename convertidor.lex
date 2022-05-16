/* Lex program for decimal to binary conversion */
%{
/* Definition section */
#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#include"y.tab.h"
%}

/* Rule Section */
%%
d		return DE;
b		return BI;
[0-9]+		yylval.number=atoi(yytext); return NUMBER;
\n
[ \t]+	
%%
int yywrap(){
return 1;
}

