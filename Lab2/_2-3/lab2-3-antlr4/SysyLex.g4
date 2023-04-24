lexer grammar SysyLex;

// keyword
INT : 'int';
FLOAT : 'float';
VOID : 'void';
CONST : 'const';
RETURN : 'return';
IF : 'if';
ELSE : 'else';
WHILE : 'while';
BREAK : 'break';
CONTINUE : 'continue'; 

// delimeter
LP : '(' ;
RP : ')' ;
LB : '[' ;
RB : ']' ;
LC : '{' ;
RC : '}' ;
COMMA : ',' ;
SEMICOLON : ';';
QUESTION : '?';
COLON : ':';

// operator
MINUS : '-';
NOT : '!';
ASSIGN : '=';
ADD : '+';
MUL : '*';
DIV : '/';
MOD : '%';
AND : '&&';
OR : '||';
EQ : '==';
NEQ : '!=';
LT : '<';
LE : '<=';
GT : '>';
GE : '>=';

// integer literal
 INT_LIT : ('0'[xX][0-9a-fA-F]+)|([1-9][0-9]*)|'0'[0-7]*;

// float literal
 FLOAT_LIT : [-+]?DIGIT*(('.'DIGIT*)|([eE][-+]?DIGIT+))[fF]?;

// fragment for float literal
 fragment
 DIGIT : [0-9];

 fragment
 LETTER : [a-zA-Z];

// identifier
 ID : (LETTER|'_')(LETTER|DIGIT|'_')*;

// string
STRING : '"'(ESC|.)*?'"';

// for string
fragment
ESC : '\\"'|'\\\\';

// whitespace
WS : 
    [ \t\r\n] -> skip
    ;

// comments
LINE_COMMENT : '//' .*? '\r'? '\n' -> skip;
BLOCK_COMMENT : '/*'.*?'*/'-> skip ;

// error
 LEX_ERR : ('0'[0-7]*[089]+[0-7]*)|('0'[xX][0-9a-fA-F]*[g-zG-Z]+[0-9a-fA-F]*)|([1-9]+LETTER+DIGIT*);
