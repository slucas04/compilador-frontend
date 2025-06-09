import java_cup.runtime.Symbol;

%%

%class Scanner
%unicode
%cup
%line
%column

WHITESPACE   = [ \t\n\r]+
LETTER       = [a-zA-Z_]
DIGIT        = [0-9]
ID           = {LETTER}({LETTER}|{DIGIT})*
INT_CONST    = {DIGIT}+
FLOAT_CONST  = {DIGIT}+"."{DIGIT}+

%%

<YYINITIAL> <<EOF>> {
    return new Symbol(sym.EOF);
}

<YYINITIAL> {
    {WHITESPACE}        { /* skip whitespace */ }

    "if"                { return new Symbol(sym.IF); }
    "else"              { return new Symbol(sym.ELSE); }
    "while"             { return new Symbol(sym.WHILE); }
    "return"            { return new Symbol(sym.RETURN); }

    "int"               { return new Symbol(sym.INT); }  
    "float"             { return new Symbol(sym.FLOAT); }
    "void"              { return new Symbol(sym.VOID); }

    {ID}                { return new Symbol(sym.ID, yytext()); }
    {FLOAT_CONST}       { return new Symbol(sym.FLOAT_CONST, Double.parseDouble(yytext())); }
    {INT_CONST}         { return new Symbol(sym.INT_CONST, Integer.parseInt(yytext())); }

    "=="                { return new Symbol(sym.EQ); }
    "!="                { return new Symbol(sym.NE); }
    ">"                 { return new Symbol(sym.GT); }
    "<"                 { return new Symbol(sym.LT); }
    "="                 { return new Symbol(sym.ASSIGN); }

    "+"                 { return new Symbol(sym.PLUS); }
    "-"                 { return new Symbol(sym.MINUS); }
    "*"                 { return new Symbol(sym.TIMES); }
    "/"                 { return new Symbol(sym.DIVIDE); }

    ";"                 { return new Symbol(sym.SEMI); }
    ","                 { return new Symbol(sym.COMMA); }
    "{"                 { return new Symbol(sym.LBRACE); }
    "}"                 { return new Symbol(sym.RBRACE); }
    "("                 { return new Symbol(sym.LPAREN); }
    ")"                 { return new Symbol(sym.RPAREN); }

    "//".*              { /* single-line comment */ }
    "/*"([^*]*\*+)*?"/" { /* multi-line comment */ }

    . { 
      System.err.println(
        "Erro léxico: caractere inesperado \"" 
        + yytext() + "\" na linha " + (yyline + 1)
      ); 
      // ignora
    }
}

