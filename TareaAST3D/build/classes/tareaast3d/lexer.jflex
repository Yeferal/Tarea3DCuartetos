package tareaast3d;

import java_cup.runtime.*;
import java.util.ArrayList;
import java.util.Stack;

%%
%{

    //coidgo de usuario en sintaxis java
    public void printConsole(String s){
        System.out.print(s+" ");
    }
    String cadena="";

    

%}

    //directivas
%public 
%class LexicalAnalyzer
%cupsym SymbolCode
%cup
%char
%unicode
%line
%column
%full
//%ignorecase



Signo               = [-_.!@#%&*|/]
Letra               = [a-záéíóúA-ZÁÉÍÓÚÑñ]
Digito              = [0-9]
Numero              = {Digito} {Digito}*
Palabra             = {Letra}+
Cadena              = ("\"" ([^\"]* | {Letra}) "\"" )
LqSea               =  ({Signo}|{Letra}|{Numero}|{Cadena})*
Espacio             = [" "\r\t\b\n]+
Blancos               = [" "\r\t\b\f""]
%%


<YYINITIAL> {

    //signos o simbolos reservados
    "("                                     {return new Symbol(SymbolCode.pa_a , yycolumn, yyline, yytext());}
    ")"                                     {return new Symbol(SymbolCode.pa_c , yycolumn, yyline, yytext());}
    ";"                                     {return new Symbol(SymbolCode.punto_coma , yycolumn, yyline, yytext());}
    "="                                     {return new Symbol(SymbolCode.igual , yycolumn, yyline, yytext());}

    //operadores aritmeticos
    "+"                                     {return new Symbol(SymbolCode.mas , yycolumn, yyline, yytext());}
    "-"                                     {return new Symbol(SymbolCode.menos , yycolumn, yyline, yytext());}
    "*"                                     {return new Symbol(SymbolCode.por , yycolumn, yyline, yytext());}
    "/"                                     {return new Symbol(SymbolCode.div , yycolumn, yyline, yytext());}

    //REGULARES
    ({Letra}({Letra}|{Numero})*)            {return new Symbol(SymbolCode.identificador , yycolumn, yyline, yytext());}
    ({Numero})                              {return new Symbol(SymbolCode.numero , yycolumn, yyline, yytext());}
    ({Numero}("\."){Numero})                {return new Symbol(SymbolCode.decimal , yycolumn, yyline, yytext());}
    {Espacio}                               {/*Ignore*/}
    .                                       {//System.out.println("CUALQUIER_SIM: "+yytext()); 
                                            //ErrorG e = new ErrorG(yyline+1, yycolumn+1,yytext(),"Lexico","Error Lexico token: " + yytext()+"   Linea: " + (yyline+1) + " ,    Columna: " + (yycolumn+1));
                                            //listaErrores.add(e);
                                            //return new Symbol(Simbolos.CUALQUIER_SIM , yycolumn, yyline, yytext());
                                            //printConsole("ERR: "+yytext()+"\n");  /*return new Symbol(SymbolCode.OTROS , yycolumn, yyline, yytext());*/
                                    }
    
}