package utilidades;

/**
 *
 * @author xenk_
 */
public class Validaciones {

    private static char calcularLetras(int dni) {
        String letrasDni = "TRWAGMYFPDXBNJZSQVHLCKE";
        char letraDni = letrasDni.charAt(dni % 23);
        return letraDni;
    }

    private static char extraerLetraDNI(String dni) {
        char letra = dni.charAt(dni.length() - 1);
        return letra;
    }

    private static int extraerNumeroDNI(String dni) {
        int numero = Integer.parseInt(dni.substring(0, dni.length() - 1));
        return numero;
    }

    public static boolean validarNIF(String dni) {
        boolean valido = true; // Suponemos el NIF válido mientras no se encuentre algún fallo
        char letra_calculada;
        char letra_leida;
        int dni_leido;
        if (dni == null) { // El parámetro debe ser un objeto no vacío
            valido = false;
        } else if (dni.length() < 8 || dni.length() > 9) { // La cadena debe estar entre 8(7+1) y 9(8+1) caracteres
            valido = false;

        } else {
            letra_leida = extraerLetraDNI(dni); // Extraemos la letra de NIF (letra)
            dni_leido = extraerNumeroDNI(dni); // Extraemos el número de DNI (int)
            letra_calculada = calcularLetras(dni_leido); // Calculamos la letra de NIF a partir del número extraído
            if (Character.toUpperCase(letra_leida) == letra_calculada) { // Comparamos la letra extraída con la calculada
            // Todas las comprobaciones han resultado válidas. El NIF es válido.
                valido = true;
            } else {
                valido = false;
            }
        }
        return valido;
    }

}
