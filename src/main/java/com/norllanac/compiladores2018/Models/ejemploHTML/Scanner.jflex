package ejemplo2jflexycupcompi1;
import java_cup.runtime.Symbol;

%%
%cupsym Simbolo
%class Scanner
%cup
%public
%unicode
%line
%char
%ignorecase

numero =[0-9]+ "."? [0-9]*
palabra =[a-zA-ZÑñ]+

%%
"<html>"         {return new Symbol(Simbolo.ihtml, yychar,yyline); }     
"<head>"         {return new Symbol(Simbolo.ihead, yychar,yyline); }     
"<title>"        {return new Symbol(Simbolo.ititle, yychar,yyline); }     
"</title>"       {return new Symbol(Simbolo.ftitle, yychar,yyline); }     
"</head>"        {return new Symbol(Simbolo.fhead, yychar,yyline); }     
"<body>"         {return new Symbol(Simbolo.ibody, yychar,yyline); }     
"<h1>"           {return new Symbol(Simbolo.ih1, yychar,yyline); }     
"</h1>"          {return new Symbol(Simbolo.fh1, yychar,yyline); }     
"</body>"        {return new Symbol(Simbolo.fbody, yychar,yyline); }     
"</html>"        {return new Symbol(Simbolo.fhtml, yychar,yyline); }     

{numero}         {return new Symbol(Simbolo.numero, yychar,yyline,new String(yytext()));}
{palabra}        {return new Symbol(Simbolo.palabra, yychar,yyline,new String(yytext()));}

/* BLANCOS */
[ \t\r\f\n]+       { /* Se ignoran */}

/* Cualquier Otro */
.   { System.out.println("Error lexico: "+yytext()); }