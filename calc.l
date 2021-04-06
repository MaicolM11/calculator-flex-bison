%{
#include "calc.tab.h"
%}
DIGITO [0-9]
%%
{DIGITO}+(\.{DIGITO}+)? {yylval.real=atof(yytext);  return(TKN_NUM);}
\*           return TKN_MULT ; 
\/           return TKN_DIV ; 
\+           return TKN_MAS ; 
\-           return TKN_MENOS ; 
\(           return TKN_PAA ; 
\)           return TKN_PAC ; 
\n           return END;
[\s\t]+     { }
.           { printf("Error: Lexical error on line %d!\n", yylineno);};
%%