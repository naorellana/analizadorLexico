/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.norllanac.compiladores2018.Models.ejemploHTML;

import java.io.FileInputStream;

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
        //el archivo esta en la carpeta razi de este proyecto y puede editarse
        new Sintactico(new Scanner(new FileInputStream("HTML.txt"))).parse();
    }
}
