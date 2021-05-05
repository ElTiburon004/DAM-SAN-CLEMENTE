/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package psp_1ºunidad;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.Process;
import java.lang.Runtime;

/**
 *
 * @author jmor
 */
public class PSP_1ºUnidad {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        crearNuevoEditor();
        //nuevo();
    }
    
    
    
/**/

    
    public static void crearNuevoEditor() {
        Process nuevoProceso; //Definimos una variable de tipo Process
        try{
            //Obtenemos el nombre del SO
            String osName = System.getProperty("os.name");
            
            if (osName.toUpperCase().contains("WIN")){ //Windows
                nuevoProceso = Runtime.getRuntime().exec("java -jar "+
                    "Hola.jar");
            }else{                                      //Linux
             nuevoProceso = Runtime.getRuntime().exec("java -jar "+"Hola.jar");
            
            // Se obtiene el stream de salida del programa
            InputStream is = nuevoProceso.getInputStream();
            
            /* Se prepara un bufferedReader para poder leer la salida más comodamente. */
            BufferedReader br = new BufferedReader (new InputStreamReader (is));
            
            // Se lee la primera linea
            String aux = br.readLine();
            
            // Mientras se haya leido alguna linea
            while (aux!=null)
            {
                // Se escribe la linea en pantalla
                System.out.println (aux);
                
                // y se lee la siguiente.
                aux = br.readLine();
            }
              
              
            }
           
        }catch (SecurityException ex){
            System.out.println("Ha ocurrido un error de Seguridad."+
                    "No se ha podido crear el proceso por falta de permisos.");
        }catch (Exception ex){
            System.out.println("Ha ocurrido un error, descripción: "+
                    ex.toString());
        }
    }
    
   
    
}
