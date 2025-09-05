grammar WhileLang;

program: statement+ EOF;

statement
    : assignment
    | whileStatement
    | ifStatement
    | breakStatement
    | continueStatement
    ;

assignment: ID ASSIGN expr SEMI;

whileStatement: WHILE LPAREN condition RPAREN LBRACE statement* RBRACE;

ifStatement: IF LPAREN condition RPAREN LBRACE statement* RBRACE 
             (ELSE LBRACE statement* RBRACE)?;

breakStatement: BREAK SEMI;
continueStatement: CONTINUE SEMI;

condition: expr operator expr;

expr: expr (PLUS | MINUS | MULT | DIV) expr
    | ID
    | NUMBER
    ;

operator: GT | LT | EQ | NE | GE | LE;

// Palabras clave
WHILE: 'while';
IF: 'if';
ELSE: 'else';
BREAK: 'break';
CONTINUE: 'continue';

// Símbolos
LPAREN: '(';
RPAREN: ')';
LBRACE: '{';
RBRACE: '}';
SEMI: ';';
ASSIGN: '=';

// Operadores relacionales
GT: '>';
LT: '<';
EQ: '==';
NE: '!=';
GE: '>=';
LE: '<=';

// Operadores aritméticos
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';

// Identificadores y números
ID: [a-zA-Z_][a-zA-Z_0-9]*;
NUMBER: [0-9]+;

// Ignorar espacios
WS: [ \t\r\n]+ -> skip;
