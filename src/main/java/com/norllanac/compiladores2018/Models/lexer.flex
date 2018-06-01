
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
      private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
      }
      private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
      }
      public static mprincipal pincipals = new mprincipal();
    %}
    Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
    numero  =   [0-9]+
    real    =   {numero}"."{numero}
    comilla =   "\"" [^*] ~"\"" | "\"" + "\'"
    ComentarioBloque   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
    ComentarioLinea =   "--".|  "-- "
    cadena  =   "\'" [^*] ~"\'" | "\'" + "\'"
    id  =   [a-zA-Z] [a-zA-Z0-9_]*
    CommentContent       = ( [^*] | \*+ [^/*] )*

    %%
    <YYINITIAL> {ComentarioBloque}   {
    DefaultTableModel tokens = {DefaultTableModel} principals.tbtokens.getModel();
    tokens.addRow(new Object[]) {"COM", "ComentarioBloque", yytext{}, yyline, yycolumn});
    Reporte u=new Reporte();
    u.escritura {"COM "+"COMENTARIOBLOQUE "+yytext()+yyline+yycolumn};  
    return new Symbol(Tokens.comentario,yyline,yychar, new String(yytext()));}