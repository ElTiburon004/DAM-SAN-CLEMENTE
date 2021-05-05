package tallerManolo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import utilidades.Validaciones;

public class Principal {

    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(System.in);
        //Inicializamos el objeto
        Vehiculo vehiculo1 = new Vehiculo();
        /*  
            Menu
         */
        //Flag de control
        boolean salir = false;

        //Bucle del menu
        do {
            try {
                System.out.println("*****Menu Principal*****");
                System.out.println("1. Nuevo Vehículo.");
                System.out.println("2. Actualizar Kilómetros.");
                System.out.println("3. Ver Matrícula.");
                System.out.println("4. Ver Número de Kilómetros.");
                System.out.println("5. Ver años de antigüedad.");
                System.out.println("6. Ver propietario.");
                System.out.println("7. Ver reparación.");
                System.out.println("8. Ver importe factura.");
                System.out.println("9. Salir.");
                System.out.println("****************************");
                System.out.println("Selecciona un a opcion entre 1 y 9");
                int seleccion = Integer.parseInt(scanner.nextLine());
                System.out.println("****************************");
                System.out.flush();
                switch (seleccion) {
                    case 1:
                        //nuevo vehiculo
                        vehiculo1 = nuevoVeiculo(vehiculo1);
                        break;
                    case 2:
                        //Actualizar Kilómetros
                        if (vehiculo1.getContador() == 0) {
                            throw new Exception("Debe ingresar un Vehículo nuevo primero");
                        } else {
                            actualizaKilometros(vehiculo1);
                        }

                        break;
                    case 3:
                        //Ver Matrícula.
                        //Actualizar Kilómetros
                        if (vehiculo1.getContador() == 0) {
                            throw new Exception("Debe ingresar un Vehículo nuevo primero");
                        } else {
                            verMatricula(vehiculo1);
                        }
                        break;
                    case 4:
                        //Ver Número de Kilómetros.
                        //Actualizar Kilómetros
                        if (vehiculo1.getContador() == 0) {
                            throw new Exception("Debe ingresar un Vehículo nuevo primero");
                        } else {
                            verKilmetros(vehiculo1);
                        }
                        break;
                    case 5:
                        //Ver años de antigüedad.
                        //Actualizar Kilómetros
                        if (vehiculo1.getContador() == 0) {
                            throw new Exception("Debe ingresar un Vehículo nuevo primero");
                        } else {
                            verAintiguedad(vehiculo1);
                        }
                        break;
                    case 6:
                        //Ver propietario.
                        //Actualizar Kilómetros
                        if (vehiculo1.getContador() == 0) {
                            throw new Exception("Debe ingresar un Vehículo nuevo primero");
                        } else {
                            verPropietario(vehiculo1);
                        }
                        break;
                    case 7:
                        // Ver reparación//Actualizar Kilómetros
                        if (vehiculo1.getContador() == 0) {
                            throw new Exception("Debe ingresar un Vehículo nuevo primero");
                        } else {
                            verReparacion(vehiculo1);
                        }
                        break;
                    case 8:
                        //Ver importe factura.
                        //Actualizar Kilómetros
                        if (vehiculo1.getContador() == 0) {
                            throw new Exception("Debe ingresar un Vehículo nuevo primero");
                        } else {
                            verFactura(vehiculo1);
                        }
                        break;
                    case 9:
                        salir = true;
                        break;
                    default:
                        //No es una opcion del menu
                        break;
                }
            } catch (Exception e) {
                System.out.println("Ocurrió un error: ");
                System.out.println(e.getMessage());
                System.out.println("****************************");
                 //Espera 5 Segundos y continua
                Thread.sleep(5*1000);
            }
        } while (salir == false);

        System.runFinalization();
    }

    public static Vehiculo nuevoVeiculo(Vehiculo vehiculo1) throws Exception {
        Scanner scanner = new Scanner(System.in);
        //Variables 
        String marca;
        String matricula;
        int kilometros;
        LocalDate fechaMatriculacion;
        String reparacion;
        String nombrePropietario;
        String dniPropietario;
        double importeFactura = 00.00;

        try {
            //Marca
            System.out.println("Ingrse Marca");
            marca = scanner.nextLine();
            System.out.flush();
            System.out.println("****************************");

            //Matricula
            System.out.println("Ingrse matrícula");
            matricula = scanner.nextLine();
            System.out.flush();
            System.out.println("****************************");

            //Kilómetros
            System.out.println("Ingrse número de kilómetros");
            kilometros = Integer.parseInt(scanner.nextLine());
            if (kilometros == 0) {
                throw new Exception("los kilometros tienen que ser mayor que 0");
            }

            System.out.println("****************************");

            //Fecha matriculación
            DateTimeFormatter f = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate ahora = LocalDate.now();

            System.out.println("Ingrse la fecha de matriculación ej: 12/05/1987");
            fechaMatriculacion = LocalDate.parse(scanner.nextLine(), f);

            //comprobar fecha
            if (ahora.compareTo(fechaMatriculacion) < 0) {
                throw new Exception("La " + fechaMatriculacion.format(f) + " no puede ser posterior a la  " + ahora.format(f));
            } else {

            }

            System.out.flush();
            System.out.println("****************************");

            //Reparación
            System.out.println("Ingrse la reparación");
            reparacion = scanner.nextLine();
            System.out.flush();
            System.out.println("****************************");

            //Propietario
            System.out.println("Ingrse el nombre del propietario");
            nombrePropietario = scanner.nextLine();
            System.out.flush();
            System.out.println("****************************");

            //DNIPropietario
            //Validaciones validar = new Validaciones();
            System.out.println("Ingrse el dni del propietario ej: 12345678Z");
            dniPropietario = scanner.nextLine();
            if (!Validaciones.validarNIF(dniPropietario)) {
                 throw new Exception("DNI inválido: " + dniPropietario);
            }

            vehiculo1 = new Vehiculo(marca, matricula, kilometros, fechaMatriculacion, nombrePropietario, dniPropietario, reparacion, importeFactura);
           //vehiculo1 = vehiculo2;
           return vehiculo1;
        } catch (Exception e) {
            System.out.println("Ocurrió un error: ");
            System.out.println(e.getMessage());
            System.out.println("****************************");
             //Espera 5 Segundos y continua
            Thread.sleep(5*1000);
            return vehiculo1;
        }

    }

    public static void actualizaKilometros(Vehiculo vehiculo1) {
        Scanner scanner = new Scanner(System.in);
        int kilometros;
        try {
            //Kilómetros
            System.out.println("Ingrse número de kilómetros");
            kilometros = Integer.parseInt(scanner.nextLine());
            //Comprobar que los kilometros introducidos son mayores que los actuales
            if (vehiculo1.getKilometros() > kilometros) {
                throw new Exception("Los kilometros deben ser mas que los actuales.");
            } else {
                vehiculo1.setKilometros(kilometros);
            }
        } catch (Exception e) {
            System.out.println("Ocurrió un error: ");
            System.out.println(e.getMessage());
            System.out.println("****************************");
            return;
        }
    }

    public static void verMatricula(Vehiculo vehiculo1) throws InterruptedException {
        System.out.println("La matrícula es: " + vehiculo1.getMatricula());
        //Espera 5 Segundos y continua
        Thread.sleep(5*1000);
    }

    public static void verKilmetros(Vehiculo vehiculo1) throws InterruptedException {
        System.out.println("Los kilómetros son: " + vehiculo1.getKilometros());
        //Espera 5 Segundos y continua
        Thread.sleep(5*1000);
    }

    public static void verAintiguedad(Vehiculo vehiculo1) throws InterruptedException {
        System.out.println("La antiguedad es de  " + vehiculo1.get_Anios() + " años");
        //Espera 5 Segundos y continua
        Thread.sleep(5*1000);
    }

    public static void verPropietario(Vehiculo vehiculo1) throws InterruptedException {
        System.out.println("El propietario es: " + vehiculo1.getNombrePropietario() + " Nº DNI: " + vehiculo1.getDniPropietario());
        //Espera 5 Segundos y continua
        Thread.sleep(5*1000);
    }

    public static void verReparacion(Vehiculo vehiculo1) throws InterruptedException {
        System.out.println("La reparación  es  " + vehiculo1.getReparacion());
        System.out.println("con matrícula es :" + vehiculo1.getMatricula());
        System.out.println("los kilómetros son: " + vehiculo1.getMatricula());
        //Espera 5 Segundos y continua
        Thread.sleep(5*1000);

    }

    public static void verFactura(Vehiculo vehiculo1) {
        System.out.println("El importe de la factura es: " + vehiculo1.getImporteFactura());
    }

}
