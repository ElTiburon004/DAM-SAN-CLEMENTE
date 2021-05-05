/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package psp_1ºunidad;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jmor
 */
public class Ejemplo_pag6_UD1 {
    
     public static void main(String[] args) {
        
         Runtime r = Runtime.getRuntime();
         String comando = "ls -l";
         Process p= null;
         
         try {
             p= r.exec(comando); //capturamos el proceso resultante
             InputStream is = p.getInputStream();
             BufferedReader br= new BufferedReader (new InputStreamReader(is));

            String linea;
            // Mientras se haya leido alguna linea
            while ((linea = br.readLine())!=null)
               // Se escribe la linea en pantalla
                System.out.println (linea);
           
            br.close();
                
            int exitVal;
            try{
                exitVal = p.waitFor();
                System.out.println ("Valor de salida " + exitVal);

            }catch (InterruptedException e){
                e.printStackTrace();
            }
         
         } catch (IOException ex) {
             Logger.getLogger(Ejemplo_pag6_UD1.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
}
