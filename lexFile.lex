%{

/* Declarations section */
#include <stdio.h>
#include "parser.tab.hpp"
#include "source.hpp"
#include "typeEnums.h"

void showToken(char *);

#define YYSTYPE Node*


%}

%option yylineno
%option noyywrap

%%

void        		        {yylval = new Type(TYPE_VOID); return VOID;}
int         			{yylval = new Type(TYPE_INT); return INT;}
b          			{yylval = new Type(TYPE_B); return B;}
byte         		        {yylval = new Type(TYPE_BYTE); return BYTE;}
bool                		{yylval = new Type(TYPE_BOOL); return BOOL;}
and          			{yylval = new Op(OP_AND); return AND;}
or          			{yylval = new Op(OP_OR); return OR;}
not          			{yylval = new Op(OP_NOT); return NOT;}
true              		{yylval = new BoolVal(BOOLVAL_TRUE); return TRUE;}
false             		{yylval = new BoolVal(BOOLVAL_FALSE); return FALSE;}
return            		{yylval = new CmdWord(CMD_RETURN); return RETURN;}
if          			{yylval = new CmdWord(CMD_IF); return IF;}
else              		{yylval = new CmdWord(CMD_ELSE); return ELSE;}
while             		{yylval = new CmdWord(CMD_WHILE); return WHILE;}
break             		{yylval = new CmdWord(CMD_BREAK); return BREAK;}
continue          		{yylval = new CmdWord(CMD_CONTINUE); return CONTINUE;}
\@pre              		{yylval = new CmdWord(CMD_PRECOND); return PRECOND;}
\;         			{yylval = new CmdWord(CMD_SECTION); return SC;}
\,          			{yylval = new CmdWord(CMD_COMMA); return COMMA;}
\(          			{yylval = new ScopeVal(SCOPE_LPAREN); return LPAREN;}
\)          			{yylval = new ScopeVal(SCOPE_RPAREN); return RPAREN;}
\{          			{yylval = new ScopeVal(SCOPE_LBRACE); return LBRACE;}
\}          			{yylval = new ScopeVal(SCOPE_RBRACE); return RBRACE;}
\=          			{yylval = new CmdWord(CMD_ASGN); return ASSIGN;}
(\=\=|\!\=|<|>|<=|>=)           {yylval = new Op(yytext); return RELOP;}
[\+\-\*\/]               	{yylval = new Op(yytext); return BINOP;}
(0|[1-9][0-9]*) 		{yylval = new NumVal(yytext); return NUM;}
[a-zA-Z][a-zA-Z0-9]*          	{yylval = new IdVal(yytext); return ID;}
([^\n\r\"\\]|\\[rnt"\\])+       {yylval = new StrVal(yytext); return STRING;}
.		                printf("Lex doesn't know what that is!\n");

%%

void showToken(char * name)
{
        printf("Lex found a %s, the lexeme is %s and its length is %d\n", name, yytext, yyleng);
}

