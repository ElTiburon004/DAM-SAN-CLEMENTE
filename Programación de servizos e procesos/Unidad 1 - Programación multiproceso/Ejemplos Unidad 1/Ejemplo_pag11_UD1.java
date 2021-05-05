/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package psp_1ºunidad;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jmor
 */
public class Ejemplo_pag11_UD1 {
    
    public static void main(String[] args) {
        
        //Adaptar los comandos a vuestro sistema operativo
        ProcessBuilder pb = new ProcessBuilder("ls","/Users", "/Users/jmor");
        File fOut = new File ("salida.txt");
        File fError = new File ("error.txt");
        
        pb.redirectError(fError);
        pb.redirectOutput(fOut);
        
        try {
            pb.start();
        } catch (IOException ex) {

            System.err.println("Excepcion E/S");        
            System.exit(-1); 
        }
    }
}
