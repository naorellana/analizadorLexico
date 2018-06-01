/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.norllanac.compiladores2018.Models.ejemplo2jflexycupcompi1;

import java.io.FileInputStream;
import java_cup.runtime.Symbol;

/**
 *
 * @author david
 */
public class EjemploHTML {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        System.out.println("-------------------------------");
        Symbol sin=new Sintactico(new Scanner(new FileInputStream("html.txt"))).parse();
        
    }
}
