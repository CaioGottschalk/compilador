parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

//program: TK_class ID LCURLY field_decl* method_decl* RCURLY EOF;

//Programa
program: CLASS PROGRAM LCURLY field_decl* method_decl* RCURLY;

//Campo
field_decl: field_fragment (COMMA field_fragment)*;

field_fragment: type ID SEMI |type  ID LSQUARE INTLITERAL RSQUARE  SEMI;
 
//Metodo
method_decl: (type | VOID) ID LPARENT method_block* RPARENT block ;

method_block: method_fragment (COMMA method_fragment)*;

method_fragment: type ID;

//Bloco
block: LCURLY var_decl* statement* RCURLY;

//Variavel
var_decl: var_fragment (COMMA ID)* SEMI;

var_fragment: type ID ;

type: INT | BOOLEAN ;

//Declaracao
statement: location assign_op expr SEMI
	| method_call SEMI
	| IF LPARENT expr RPARENT block (ELSE block)* 
	| FOR LPARENT ID EQUALS expr SEMI expr SEMI block RPARENT 
	| RETURN (expr)  SEMI
	| BREAK SEMI
	| CONTINUE SEMI
	| block ; 

//Expressao
expr: location 
	| method_call 
	| literal 
	| expr bin_op expr 
	| expr assign_op expr SEMI
	| expr logical_op expr
	| SUB expr 
	| NEG expr 
	| LPARENT expr RPARENT 
	| expr arith_op expr (arith_op expr)* 
	| var_decl;

callout_args: expr | STRING;

assign_op: ATR | ATR_SUM | ATR SUB ;

//Metodo
method_call: method_name LPARENT method_call_fragment RPARENT
		| CALLOUT LPARENT string_literal  RPARENT;

method_call_fragment: expr (COMMA expr)*;
method_name: ID;

//Argumento
argument_call: argument_call_fragment (COMMA argument_call_fragment)*;

argument_call_fragment: expr | string_literal;

location: ID | ID LSQUARE expr RSQUARE | literal;

arith_op: SUB | SUM | MUL | DIV | MOD;

eq_op: EQUALS | DIFF;

cond_op: AND | OR;

logical_op: EQUALS | DIFF | GREATER | LESS | GREATEREQ | LESSEQ;

bin_op: AND_B | OR_B;

literal: BOOLEANLITERAL | CHAR_LITERAL | INTLITERAL;

string_literal: STRING;

digit: DIGIT;




