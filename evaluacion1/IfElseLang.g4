grammar IfElseLang;

program: statement+ EOF;

statement: assignment | ifStatement;

assignment: ID ASSIGN expr SEMI;

ifStatement: IF LPAREN condition RPAREN LBRACE statement* RBRACE 
             (ELSE LBRACE statement* RBRACE)?;

condition: expr operator expr;

expr: ID | NUMBER ;

operator: LT | GT | EQ | GE | LE | NE;

// Palabras clave
IF: 'if';
ELSE: 'else';

// Símbolos
LPAREN: '(';
RPAREN: ')';
LBRACE: '{';
RBRACE: '}';
SEMI: ';';
ASSIGN: '=';

// Operadores
LT: '<';
GT: '>';
EQ: '==';
GE: '>=';
LE: '<=';
NE: '!=';

// Identificadores y números
ID: [a-zA-Z_][a-zA-Z_0-9]*;
NUMBER: [0-9]+;

// Ignorar espacios
WS: [ \t\r\n]+ -> skip;
