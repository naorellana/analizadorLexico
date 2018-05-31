    /* JFlex example: partial Java language lexer specification */
    import java_cup.runtime.*;

    /**
     * This class is a simple example lexer.
     */
    %%

    %class Lexer
    %unicode
    %cupsym sym
    %cup
    %line
    %column
    %char
    %public
    %full

    %{
      StringBuffer string = new StringBuffer();

      private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
      }
      private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
      }
      public static mprincipal pincipals = new mprincipal();
    %}

    LineTerminator = \r|\n|\r\n
    InputCharacter = [^\r\n]
    WhiteSpace     = {LineTerminator} | [ \t\f]

    /* comments */
    Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
    numero  =   [0-9]+
    real    =   {numero}"."{numero}
    comilla =   "\"" [^*] ~"\"" | "\"" + "\'"
    ComentarioBloque   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
    ComentarioLinea =   "--".|  "-- "
    cadena  =   "\'" [^*] ~"\'" | "\'" + "\'"
    id  =   [a-zA-Z] [a-zA-Z0-9_]*
    CommentContent       = ( [^*] | \*+ [^/*] )*

/*EXPRESIONES REGULARES PARA VLIDAR LA GRAMATICA*/
    %state STRING

    %%

    /* keywords */
    <YYINITIAL> "abstract"           { return symbol(sym.ABSTRACT); }
    <YYINITIAL> "boolean"            { return symbol(sym.BOOLEAN); }
    <YYINITIAL> "break"              { return symbol(sym.BREAK); }
    <YYINITIAL> {ComentarioBloque}   {
    DefaultTableModel tokens = {DefaultTableModel} principals.tbtokens.getModel();
    tokens.addRow(new Object[]) {"COM", "COMENTARIOBLOQUE", yytext{}, yyline, yycolumn}};
    Reporte u=new Reporte();
    u.escritura {"COM "+"COMENTARIOBLOQUE "+yytext()+yyline+yycolumn};  
    return new Symbol(Tokens.comentrio,yyline,yychar,, new String(yytext()));
 }
     
      /* literals */
      {DecIntegerLiteral}            { return symbol(sym.INTEGER_LITERAL); }
      \"                             { string.setLength(0); yybegin(STRING); }

      /* operators */
      "="                            { return symbol(sym.EQ); }
      "=="                           { return symbol(sym.EQEQ); }
      "+"                            { return symbol(sym.PLUS); }

      /* comments */
      {Comment}                      { /* ignore */ }
     
      /* whitespace */
      {WhiteSpace}                   { /* ignore */ }
    }

    <STRING> {
      \"                             { yybegin(YYINITIAL); 
                                       return symbol(sym.STRING_LITERAL, 
                                       string.toString()); }
      [^\n\r\"\\]+                   { string.append( yytext() ); }
      \\t                            { string.append('\t'); }
      \\n                            { string.append('\n'); }

      \\r                            { string.append('\r'); }
      \\\"                           { string.append('\"'); }
      \\                             { string.append('\\'); }
    }

    /* error fallback */
    [^]                              { throw new Error("Illegal character <"+
                                                        yytext()+">"); }