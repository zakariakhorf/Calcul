// Specification JFlex

import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column


nb = [0-9]
ID = ([a-z]|[A-Z])+
at = "@"([a-zA-Z])+
atinit = "@"([a-zA-Z])+"="
EGAL = "="
p= "."(print|Print|PRINT)
snb = ("@"([a-zA-Z])+"["[0-9]+"]")

%%


{ID} {  return new Symbol(sym.ID, new String(yytext())); }
{EGAL} {  return new Symbol(sym.EGAL, new String(yytext())); }
{at} {return new Symbol(sym.ATT, new String(yytext()));}
"{"   { return new Symbol(sym.ACCOLADEOPEN); }
"}"   { return new Symbol(sym.ACCOLADECLOSE); }
","  { return new Symbol(sym.VIR); }
"+"	{ return new Symbol(sym.AJOUT); }
"-"	{ return new Symbol(sym.MINUS); }
"*"	{ return new Symbol(sym.MULTIPLY); }
":"	{ return new Symbol(sym.DIVISION); }
"("	{ return new Symbol(sym.PARENTHESEOUV); }
")"	{ return new Symbol(sym.PARENTHESEFERM); }
"^"   { return new Symbol(sym.CON); }
{p} {return new Symbol(sym.print, new String(yytext())); } 

{nb}+ { return new Symbol(sym.NOMBRE, new Integer(yytext())); }
{snb}+ { return new Symbol(sym.SOMMENB, new String(yytext())); }
\n { return new Symbol(sym.CLEAR, new String(yytext())); }
. {}
