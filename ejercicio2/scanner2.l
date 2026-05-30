Igual que antes, reemplazá todo el contenido con esto (sin comentarios con caracteres especiales para evitar el error de la versión vieja de Flex):
%pointer
%option noyywrap

digito          [0-9]
letra           [a-zA-Z_]
identificador   {letra}({letra}|{digito})*
digitoHexa      [0-9a-fA-F]

%%

0[xX]{digitoHexa}+       { printf("constante hexadecimal de longitud %d: %s\n", yyleng, yytext); }
[1-9]{digito}*           { printf("constante decimal de longitud %d: %s\n", yyleng, yytext); }
{identificador}          { printf("identificador de longitud %d: %s\n", yyleng, yytext); }
[ \t\n]                  { }
.                        { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
