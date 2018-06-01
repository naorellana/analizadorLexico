/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.norllanac.compiladores2018.Models;

import java.io.File;

/**
 *
 * @author ORELLANA CUY
 */
public class MainPruebas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //carga archivo dentro del proyeccto con la  gramatica,  expresiones
        //reegulares y reglas que se necessiten en eel anlizador    
        jflex.Main.generate(new File ("src\\main\\java\\com\\norllanac\\compiladores2018\\Models\\lexer.flex"));
        
        
    }
}
