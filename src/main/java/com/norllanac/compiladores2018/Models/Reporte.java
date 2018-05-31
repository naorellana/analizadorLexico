/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.norllanac.compiladores2018.Models;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author ORELLANA CUY
 */
public class Reporte {
        public void escritura(String parametro){
            File f;
            f= new File("Salida.txt");
            try{
                FileWriter w=new FileWriter(f,true);
            }catch(IOException e){
                System.out.println("NO SE PUDO ESCRIBIR EN EL ARCHIVO: "+e);
            };
        };
    
}
