%{
#include<stdio.h>
#include<stdlib.h>
// To avoid warning, we include below definitions:
int yylex();
void yyerror(const char *s);
%}

%token FOR WHILE IF NUM OPBR CLBR OPCBR CLCBR INC DEC ID SEMIC GE NE LT GT LE EQ EQU 
// Operator precedence and associativity:
%right '=' 
%left GE NE LT GT LE EQ  
%left '+' '-'  
%left '*' '/'  
%right '^'   

%%
// RULES SECTION: 

S : ST { printf("\nACCEPTED FOR LOOP\n"); exit(0); }

S : ST1 { printf("\nACCEPTED WHILE LOOP\n"); exit(0); }

S : ST2 { printf("\nACCEPTED IF LOOP\n"); exit(0); }


ST : FOR OPBR Expr1 SEMIC Expr2 SEMIC Expr3 CLBR 
| FOR OPBR SEMIC SEMIC CLBR	// for( ; ; )

ST1 : WHILE OPBR Expr4 CLBR OPCBR Expr5 SEMIC CLCBR
| WHILE OPBR CLBR OPCBR SEMIC CLCBR //while ( ) { ; }  

ST2 : IF OPBR Expr6 CLBR OPCBR Expr7 SEMIC CLCBR
|  IF OPBR CLBR OPCBR SEMIC CLCBR //if( ){ ; }

Expr1 : ID EQU ID
| ID EQU NUM

Expr2 : ID RELOP ID
| ID RELOP NUM

Expr3 : ID INC
| ID DEC

Expr4 : ID RELOP ID
| ID RELOP NUM

Expr5 : ID INC
| ID DEC

Expr6 : ID RELOP ID
| ID RELOP NUM

Expr7 : ID INC
| ID DEC


RELOP : LT  
| GT  
| EQ  
| LE  
| GE  
| NE 
;

%%

#include"lex.yy.c"  
int main() {   
	yyparse();  
	return yylex();  
}  

void yyerror(const char *s){ printf("\nERROR\n"); }
int yywrap(){ return 1; }
