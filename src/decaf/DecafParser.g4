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
