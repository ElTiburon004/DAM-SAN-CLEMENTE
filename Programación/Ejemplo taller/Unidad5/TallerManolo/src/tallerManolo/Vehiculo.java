package tallerManolo;

import java.time.LocalDate;
import java.time.Period;
import java.util.Date;

public class Vehiculo {

    //Atributos de clase
    private String marca;
    private String matricula;
    private int kilometros;
    private LocalDate fechaMatriculacion;
    private String nombrePropietario;
    private String dniPropietario;
    private String reparacion;
    private double importeFactura;
    //control de objetos
    private static int contador;

    //Constructor default
    public Vehiculo() {

    }

    //Constructor con argumentos
    public Vehiculo(String marca, String matricula, int kilometros, LocalDate fechaMatriculacion, String nombrePropietario, String dniPropietario, String reparacion, double importeFactura) {
        this.marca = marca;
        this.matricula = matricula;
        this.kilometros = kilometros;
        this.fechaMatriculacion = fechaMatriculacion;
        this.nombrePropietario = nombrePropietario;
        this.dniPropietario = dniPropietario;
        this.reparacion = reparacion;
        this.importeFactura = importeFactura;
        Vehiculo.contador++;
    }

    /**
     * *********************
     * Metodos Get and Set* * *********************
     */
    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public int getKilometros() {
        return kilometros;
    }

    public void setKilometros(int kilometros) {
        this.kilometros = kilometros;
    }

    public LocalDate getFechaMatriculacion() {
        return fechaMatriculacion;
    }

    public void setFechaMatriculacion(LocalDate fechaMatriculacion) {
        this.fechaMatriculacion = fechaMatriculacion;
    }

    public String getNombrePropietario() {
        return nombrePropietario;
    }

    public void setNombrePropietario(String nombrePropietario) {
        this.nombrePropietario = nombrePropietario;
    }

    public String getDniPropietario() {
        return dniPropietario;
    }

    public void setDniPropietario(String dniPropietario) {
        this.dniPropietario = dniPropietario;
    }

    public String getReparacion() {
        return reparacion;
    }

    public void setReparacion(String reparacion) {
        this.reparacion = reparacion;
    }

    public double getImporteFactura() {
        return importeFactura;
    }

    public void setImporteFactura(Float importeFactura) {
        this.importeFactura = importeFactura;
    }

    public static int getContador() {
        return contador;
    }

    public int get_Anios() {
        LocalDate fechaActual = LocalDate.now();
        Period periodo = Period.between(this.fechaMatriculacion, fechaActual);
        int anios =  periodo.getYears();
        return anios;
    }
}
