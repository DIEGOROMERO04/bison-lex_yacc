%{
/* Definition section */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *s);
%}

%union 
{
        int number;
}


%token DE BI
%token <number> NUMBER

/* Rule Section */
%%
entrada: 
	|entrada entradas
	;
entradas: 
	db | bd
	
	bd:
	BI NUMBER
	{
		
		int binario=$2;
		char bin[8]={0,0,0,0,0,0,0,0};
		int decimal=0;
		int potencia=1;
		sprintf(bin,"%d",binario); 
		for(int i=0;i<8;i++){
		switch(bin[i])
		{
		case '0':
		decimal += 0*potencia;
		potencia*=2;
		break;
		case '1':
		decimal +=1*potencia;
		potencia*=2;
		break;
		
		}
		}
		printf("\nBinario:%s a Decimal: %d \n",bin,decimal);
	}
	;
	
	db: 
	DE NUMBER
	{
		
		int n=$2;
		int de=n;
		int r,b=0,p=1;
		while(n>0)
		{
		r= n%2;
		b+=r*p;
		p*=10;
		n/=2;
		}
		printf("\nDecimal:%d a Binario: %d \n",de,b);
	}
	;
%%

//driver code
int main()
{
yyparse();
return 0;
}

yyerror(char *s)
{
fprintf(stdout, "\n%s", s);
}

