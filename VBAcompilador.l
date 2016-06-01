%{
    #include "y.tab.h"
    #include <stdio.h>
	#include <stdlib.h>
	
	int linea=1;
%}

character \"[A-Za-z]{1}\"
integer [0-9]+
string [A-Za-z]+[0-9]*

%%

" "
"\t"		{fprintf(yyout,"\t");}
"'"			return COMMENT;
exit   	{exit(0);}
If 			return (IF);
ElseIf		return (ELSEIF);
Sub      	return (SUB);
Then		return  (THEN);
And 		return (AND);
Or 			return (OR);
Not 		return (NOT);
As			return (AS);
While		return (WHILE);
Until		return (UNTIL);
Do			return (DO);
Else		return (ELSE);
printf		return (PRINT);
End			return (ENDS);
For			return (FOR);
To			return (TO);
Dim 		return (DIM);
Double 		return (DOUBLE);
Loop 			return (LOOP);
True			return (TRUE);
False 		return (FALSE);
Select		return (SELECT);
Case			return (CASE);
Boolean		return (TYPE_BOOLEAN);
Integer		return (TYPE_INTEGER);
{integer}  	{yylval.val= atof(yytext); return (NUMBER);}
{string}	{yylval.s = strdup(yytext); return (IDENTIFIER);}
{character}	{yylval.s = strdup(yytext); return (CHAR);}
"("			return (OPEN_PARENTHESIS);
")"			return (CLOSE_PARENTHESIS);
","			return (COMA);
"<"			return (SMALLER);
">"			return (GREATER);
"="			return (EQUAL);
"+"			return (PLUS);
"-"			return (MINUS);
"*"			return (MULT);
"/"			return (SLASH);
["]			return (COMILLA);
"\n"     	{linea++; return (END);}
"<>"		return DIFFERENT;
"<="		return SMALLEROREQ;
">="		return GREATEROREQ;


.			printf("LINE ERROR %d\n",linea);
%%

yywrap()
{
	return 1;
}