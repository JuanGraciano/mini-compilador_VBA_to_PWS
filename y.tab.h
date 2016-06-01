/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IF = 258,
     ELSEIF = 259,
     WHILE = 260,
     UNTIL = 261,
     THEN = 262,
     SUB = 263,
     LOOP = 264,
     FUNCTION = 265,
     SELECT = 266,
     CASE = 267,
     TRUE = 268,
     FALSE = 269,
     DO = 270,
     ELSE = 271,
     FOR = 272,
     TO = 273,
     AS = 274,
     NUMBER = 275,
     IDENTIFIER = 276,
     SMALLER = 277,
     GREATER = 278,
     COMPARACION = 279,
     EQUAL = 280,
     AND = 281,
     OR = 282,
     NOT = 283,
     PLUS = 284,
     MINUS = 285,
     MULT = 286,
     SLASH = 287,
     COMA = 288,
     COMILLA = 289,
     OPEN_PARENTHESIS = 290,
     CLOSE_PARENTHESIS = 291,
     PRINT = 292,
     OPEN_BRACKET = 293,
     CLOSE_BRACKET = 294,
     ENDS = 295,
     EOL = 296,
     COMMENT = 297,
     END = 298,
     DOUBLE = 299,
     CHAR = 300,
     TYPE_BOOLEAN = 301,
     TYPE_INTEGER = 302,
     DIM = 303,
     DIFFERENT = 304,
     GREATEROREQ = 305,
     SMALLEROREQ = 306
   };
#endif
/* Tokens.  */
#define IF 258
#define ELSEIF 259
#define WHILE 260
#define UNTIL 261
#define THEN 262
#define SUB 263
#define LOOP 264
#define FUNCTION 265
#define SELECT 266
#define CASE 267
#define TRUE 268
#define FALSE 269
#define DO 270
#define ELSE 271
#define FOR 272
#define TO 273
#define AS 274
#define NUMBER 275
#define IDENTIFIER 276
#define SMALLER 277
#define GREATER 278
#define COMPARACION 279
#define EQUAL 280
#define AND 281
#define OR 282
#define NOT 283
#define PLUS 284
#define MINUS 285
#define MULT 286
#define SLASH 287
#define COMA 288
#define COMILLA 289
#define OPEN_PARENTHESIS 290
#define CLOSE_PARENTHESIS 291
#define PRINT 292
#define OPEN_BRACKET 293
#define CLOSE_BRACKET 294
#define ENDS 295
#define EOL 296
#define COMMENT 297
#define END 298
#define DOUBLE 299
#define CHAR 300
#define TYPE_BOOLEAN 301
#define TYPE_INTEGER 302
#define DIM 303
#define DIFFERENT 304
#define GREATEROREQ 305
#define SMALLEROREQ 306



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 19 "VBAcompilador.y"

       double val;
	   char* s;


/* Line 2058 of yacc.c  */
#line 165 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
