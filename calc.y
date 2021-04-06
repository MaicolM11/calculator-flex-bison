%{
#include <stdio.h>   
#include <stdlib.h>
extern int yylex(void);
extern char *yytext;
void yyerror(char *s); 
extern FILE * yyin;
FILE * fsalida;
%}

%union { 
    float real;
}

%token <real> TKN_NUM
%token TKN_PAA
%token TKN_PAC
%token END

%type <real> Expresion

%left TKN_MAS TKN_MENOS
%left TKN_MULT TKN_DIV
%start Input

%%

Input: /* empty */
    | Input Line

Line: END
    | Expresion END { printf("Result: %.1f\n", $1); }
    | error END { printf("Syntax error on line\n");}

Expresion: TKN_PAA Expresion TKN_PAC  { $$ = $2; }
                | Expresion TKN_MAS Expresion { $$ = $1 + $3; }
                | Expresion TKN_MENOS Expresion { $$ = $1 - $3; }
                | Expresion TKN_MULT Expresion { $$ = $1 * $3; }
                | Expresion TKN_DIV Expresion { $$ = $1 / $3; }    
                | TKN_NUM { $$ = $1; }       
            ;
%%

void yyerror(char *s){
  //  printf("Error: %s\n", s);
}

int main(int argc, char **argv) {
	if(argc > 2) {
		yyin = fopen(argv[1],"r");
		fsalida = fopen(argv[2], "w");
	}
    yyparse();
    return 0;
}