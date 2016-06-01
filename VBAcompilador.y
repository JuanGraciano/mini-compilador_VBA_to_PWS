%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include "y.tab.h"
#include "string.h"
	
	extern int yylex(void);
	extern FILE *yyin;
	extern FILE *yyout;
	extern int linea;

	void yyerror(char *s);

	/**1 Si no se necesita que sea una variable (tener el simbolo de peso)*/
	int variable = 0;
	
%}
%union{
       double val;
	   char* s;
}
/**Definicion de tokens*/

%token IF ELSEIF WHILE UNTIL THEN SUB LOOP FUNCTION
%token SELECT CASE TRUE FALSE
%token DO ELSE FOR TO AS 
%token <val> NUMBER
%token <s> IDENTIFIER
%token SMALLER GREATER COMPARACION EQUAL AND OR NOT
%token PLUS MINUS MULT SLASH
%token COMA COMILLA OPEN_PARENTHESIS CLOSE_PARENTHESIS
%token PRINT
%token OPEN_BRACKET CLOSE_BRACKET
%token ENDS EOL COMMENT
%token END
%token DOUBLE
%token <s> CHAR
%token TYPE_BOOLEAN
%token TYPE_INTEGER
%token DIM
%token DIFFERENT
%token GREATEROREQ
%token SMALLEROREQ

/**Definicion de tipos de reglas que se necesitan*/

%type <s> VTYPE
%type <s> CONDITION
%type <s> SUBS
%type <s> OPERATOR
%type <s> IF_ELSE_STATEMENT
%type <s> ENDING
%type <s> PARAMETERS
%type <s> PARAMETER_LIST
%type <s> ASSIGNMENT
%type <s> COMPARISON
%type <s> SWITCH_STATEMENT
%type <s> DO_WHILE_STATEMENT
%type <s> EXPRESSION
%type <s> SUB_DECLARE
%type <s> IFS
%type <s> ELSEIFS
%type <s> WHILES
%type <s> UNTILS
%type <s> IDENTIFIERS
%type <s> OP
%type <s> CP
%type <s> COMAS
%type <s> EQUALS
%type <s> BLOCK
%type <s> THENS
%type <s> ELSES
%type <s> CASE_EXPRESSIONS
%type <s> DOS
%type <s> CASES
%type <s> COMPOPERATOR
%type <s> SEPARATOR
%type <s> CALL_SUB
%type <s> CALL_PARAMETER_LIST
%type <s> COMMENT_DEF
%type <s> COMMENTS
%type <s> DECLARE_VAR



%start input
%%
input: line
       | input line
       ;
/**Definimos lo que es una linea*/
line: END {fprintf(yyout,"\n");};
	  | ASSIGNMENT
	  | ENDING
	  | FOR PARAMETERS
    | IF_ELSE_STATEMENT
	  | SUB_DECLARE OP PARAMETER_LIST CP {fprintf(yyout,"{ ");};
	  | SUB_DECLARE OP CP {fprintf(yyout,"{ ");};
	  | SWITCH_STATEMENT
	  | DO_WHILE_STATEMENT
	  | CALL_SUB CALL_PARAMETER_LIST
	  | COMMENTS
	  |DECLARE_VAR
	;
/**Definimos lo que es un bloque*/
BLOCK: line ;
			| BLOCK line;

/**Definiciones de operadores aritméticos*/
OPERATOR: PLUS  {fprintf(yyout,"+ ");};
		| MINUS {fprintf(yyout,"- ");};
		| MULT {fprintf(yyout,"* ");};	
		| SLASH {fprintf(yyout,"/ ");};

/**Definiciones de operadores de comparación */
COMPOPERATOR: GREATER {fprintf(yyout,"-gt ");};
		| SMALLER {fprintf(yyout,"-lt ");};
		| GREATEROREQ {fprintf(yyout,"-ge ");};
		| SMALLEROREQ {fprintf(yyout,"-le ");};
		| DIFFERENT  {fprintf(yyout,"-ne ");};


/**Definiciones de separadores */
SEPARATOR: AND  {fprintf(yyout,"-and ");};
		| OR  {fprintf(yyout,"-or ");};	
		| NOT {fprintf(yyout,"-not ");};

/**Definiciones de palabras clave*/
IFS: IF {fprintf(yyout,"If (");};
ELSEIFS: ELSEIF {fprintf(yyout,"}\nElseIf  (");};
WHILES: WHILE {fprintf(yyout,"} While ( ");};
UNTILS: UNTIL {fprintf(yyout,"} Until ( ");};
SUBS: SUB {fprintf(yyout,"function "); variable = 1;};
IDENTIFIERS: IDENTIFIER  { if(variable==1) fprintf(yyout,"%s ",$$); else fprintf(yyout,"$%s ",$$); variable = 0;};
OP: OPEN_PARENTHESIS {fprintf(yyout,"(");};
CP: CLOSE_PARENTHESIS {fprintf(yyout,")");};
COMAS: COMA {fprintf(yyout,",");}
EQUALS: EQUAL {fprintf(yyout," = ");};
THENS: THEN {fprintf(yyout,") { ");};
ELSES: ELSE {fprintf(yyout,"}\nElse { ");};
DOS: DO {fprintf(yyout,"Do {\n");};
COMMENT_DEF: COMMENT {fprintf(yyout,"#"); variable = 1;};

/**Definiciones de tipos de variables */

VTYPE: DOUBLE {fprintf(yyout,"[Float]");};
| TYPE_BOOLEAN {fprintf(yyout,"[Bool]");};
| TYPE_INTEGER {fprintf(yyout,"[Int]");};

/**Definicion de expresion*/
EXPRESSION:	IDENTIFIERS;
		|	NUMBER {fprintf(yyout,"%.0f ",$1);};
		|	CHAR {fprintf(yyout,"%s",$1);};
		|	EXPRESSION OPERATOR EXPRESSION
		;

/**Definicion de declaracion de variable*/
DECLARE_VAR: DIM IDENTIFIER AS VTYPE {fprintf(yyout,"$%s", $2);};


/** Definicion de comentario*/
COMMENTS: COMMENT_DEF line;
		| COMMENT_DEF IDENTIFIERS {variable = 1;};

/**Definicion de asignacion*/
ASSIGNMENT: IDENTIFIERS EQUALS EXPRESSION
		;

/**Definicion de declaracion de funcion sub (funcion sin retorno) */
SUB_DECLARE: SUBS IDENTIFIERS;

/**Definicion de llamada de funcion */
CALL_SUB: IDENTIFIERS {variable = 1;};

/**Definicion de parametro*/
PARAMETERS:  IDENTIFIERS 
		|  IDENTIFIERS AS VTYPE

/**Definicion de lista de parametros para declaracion de funcion*/
PARAMETER_LIST:  PARAMETERS ;
			|  PARAMETER_LIST COMAS PARAMETERS;

/**Definicion de lista de parametros para llamada de funcion*/
CALL_PARAMETER_LIST: PARAMETERS ;
			|  CALL_PARAMETER_LIST COMA PARAMETERS;

/**Definicion de partes de un switch*/
SWITCH_STATEMENT: SELECT_CASE IDENTIFIERS {fprintf(yyout,") { \n default {");};
    	| CASE_EXPRESSIONS BLOCK ;


/**Traduccion de Select case a switch*/
SELECT_CASE: SELECT CASE {fprintf(yyout,"switch ( ");};

/**Cierre de case al seguir al proximo caso*/
CASES: CASE {fprintf(yyout,"} \n");};

/**Definiciones de tipos de cases */
CASE_EXPRESSIONS: CASES EXPRESSION {fprintf(yyout, "{");};
								| CASES NUMBER TO NUMBER { fprintf(yyout, "{(($_ -ge %.0f) -and ($_ -le %.0f))} {", $2, $4); } ;

/**Definicion de comparacion*/
COMPARISON: EXPRESSION COMPOPERATOR EXPRESSION;

/**Definicion de condicion*/
CONDITION: COMPARISON ;
		| CONDITION SEPARATOR COMPARISON;

/**Definicion de statements de IF_ELSE*/
IF_ELSE_STATEMENT: IFS CONDITION THENS BLOCK ;
			|	ELSEIFS CONDITION THENS BLOCK;
			|	ELSES BLOCK;

/**Definiciones de statements do while*/
DO_WHILE_STATEMENT: DOS BLOCK;
		| LOOP WHILES CONDITION {fprintf(yyout,") ");};  
		| LOOP UNTILS CONDITION {fprintf(yyout,") ");};

/**Definiciones de cierres de statements */
ENDING: ENDS IF {fprintf(yyout,"}");};	
	  | ENDS {fprintf(yyout,"}");};
	  | ENDS SUB {fprintf(yyout,"$null \n }");};
	  | ENDS SELECT  {fprintf(yyout,"}}");}
	  ;

%%
void yyerror(char *s) {
	printf("Parse error!  Message: %s",s);
}
int main (int argc, char **argv)
{
	if(argc>1)
		yyin = fopen(argv[1],"rt");
	else
		yyin = fopen("VBA.bas","rt");
	
	if ( argc > 2 ) {
	yyout = fopen(argv[2],"wt");
	}
	else {
	yyout = fopen("PSScript.psm1","wt");
}
    yyparse();

	
	fclose(yyin);
	fclose(yyout);
	return 0;
}