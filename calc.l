%{
#include "calc.tab.h"
%}
DIGITO [0-9]
%%
{DIGITO}+(\.{DIGITO}+)? {yylval.real=atof(yytext);  return(TKN_NUM);}    // se parsea el valor de yytext a floatante
\*           return TKN_MULT ; 
\/           return TKN_DIV ; 
\+           return TKN_MAS ; 
\-           return TKN_MENOS ; 
\(           return TKN_PAA ; 
\)           return TKN_PAC ; 
\n           return END;
[ \t]+         { }
.            return ERR;
%%