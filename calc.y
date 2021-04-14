%{
#include <stdio.h>   
#include <stdlib.h>
extern int yylex(void);
extern char *yytext;
void yyerror(char *s); 
extern FILE * yyin;
%}

%union { 
    float real;     // declaramos real como flotante
}

%token <real> TKN_NUM            // se declara el token de tipo real
%token TKN_PAA TKN_PAC END ERR   // Declaracion de los demas tokens

%type <real> Expresion

%left TKN_MAS TKN_MENOS         // declaraciones tokens de precedencia
%left TKN_MULT TKN_DIV          // los primeros en ser declarados tienen menos precedencia
%start Input                    // se le indica la Produccion por cual empezar (axioma)

%%

Input: /* empty */
    | Input Line       // entrada vacia o recursividad

Line: END 
    | ERR END { printf("Lexical error in line\n");}         // evaluar el error lexico
    | Expresion END { printf("%.1f\n", $1); }               // evaluar una linea hasta un salto de linea
    | error END { printf("Syntax error in line\n");};       // control de errores

// manejo de operaciones
Expresion: TKN_PAA Expresion TKN_PAC  { $$ = $2; }
                | Expresion TKN_MAS Expresion { $$ = $1 + $3; }
                | Expresion TKN_MENOS Expresion { $$ = $1 - $3; }
                | Expresion TKN_MULT Expresion { $$ = $1 * $3; }
                | Expresion TKN_DIV Expresion { $$ = ( $3 == 0 ) ? 0 : ($1 / $3); }    // si es division por 0 iguala a 0
                | TKN_NUM { $$ = $1; }     
            ;

%%

void yyerror(char *s){
  //  printf("Error: %s\n", s);
}

int main(int argc, char **argv) {
    yyin = (argc > 1) ? fopen(argv[1],"r") : stdin;  // si hay argumentos cargue el archivo como entrada
    yyparse();
    return 0;
}