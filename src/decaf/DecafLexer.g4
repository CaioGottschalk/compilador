lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

//Separadores
LCURLY : '{';
RCURLY : '}';
LSQUARE: '[';
RSQUARE: ']';
LPARENT: '(';
RPARENT: ')';

//Palavras reservadas
PROGRAM: 'Program';
BOOLEAN : 'boolean';
CALLOUT : 'callout';
CLASS : 'class';
ELSE : 'else';
IF : 'if';
INT : 'int';
RETURN : 'return';
VOID : 'void';
FOR : 'for';
BREAK : 'break';
CONTINUE : 'continue';

BOOLEANLITERAL : ('false' | 'true');

ID  :  ('_' | [a-zA-Z]) [a-zA-Z0-9_]*;

WS_ : (' ' | '\n' | '\t' | '\r' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;


CHAR_LITERAL : '\'' SINGLE_CHARACTER '\'' | '\'' ESCAPE_SEQUENCE '\'';
fragment
SINGLE_CHARACTER : ~["'\\];
fragment
ESCAPE_SEQUENCE : '\\' [tnfr"'\\];


STRING : '"' (ESC|~'"')* '"';

//Números inteiros e hexadecimal
INTLITERAL: INTEGER | HEX;

//Inteiros
fragment
INTEGER: INTEGER_NUMERAL;

fragment
INTEGER_NUMERAL: '0'| DIGITS_NON_ZERO(DIGITS)*;

//Hexadecimal
fragment
HEX: HEXADECIMAL_DIGITS;

fragment
HEXADECIMAL_DIGITS: '0x' (HEXADECIMAL)+; 

fragment 
HEXADECIMAL: [0-9a-fA-F];

fragment
DIGITS_NON_ZERO: [1-9];

fragment 
DIGITS: [0-9];

DIGIT: [0-9];

fragment
ESC :  '\\' ('n'|'"');

//Operadores aritméticos
SUB: '-';
SUM: '+';
MUL: '*';
DIV: '/';
ATR: '=';
MOD: '%';
ATR_SUM: '+=';
ATR_SUB: '-=';

//Operadores lógicos
EQUALS: '==';
DIFF: ('<>' | '!=');
GREATER: '>';
LESS: '<';
GREATEREQ: '>=';
LESSEQ: '<=';
AND: '&&';
OR: '||';
NEG: '!';

//Operadores binários
AND_B: '&';
OR_B: '|';


//Terrmino
SEMI: ';';
COMMA: ',';
