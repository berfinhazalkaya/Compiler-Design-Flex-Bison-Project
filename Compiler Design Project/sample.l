
%{  
	#include"y.tab.h"
	extern int yylval;
%}

%%
 /* RULES SECTION */
"for" {return FOR;}
"while" {return WHILE;}
"if" {return IF;}

"=" {return EQU;}
"++" {return INC;}  
"--" {return DEC;}
 /* RELATIONAL OPERATIONS: */
"<=" {return LE;}  
">=" {return GE;}  
">" {return GT;}  
"<" {return LT;}  
"!=" {return NE;}    
"==" {return EQ;}  
 /* --------------------- */
"(" {return OPBR;}
")" {return CLBR;}
";" {return SEMIC;}
"{" {return OPCBR;}
"}" {return CLCBR;}
 /* Convert string to integer and store it */
[0-9]+ {yylval=atoi(yytext);return NUM;}
 /* yytext[0] holds the first character of the text matched by the current token */ 
[a-zA-Z]+ {yylval=yytext[0];return ID;} 
%%