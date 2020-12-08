package modelo;

import javax.servlet.http.Part;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.util.Date;

public abstract class Usuario {

    private String dni;
    private String nombre;
    private String apellidos;
    private String clave;
    private String correo;
    private int telefono;
    private Date fecha_nacimiento;
    private String tarjeta;
    private int pin_tarjeta;


    public int getPin_tarjeta() {
        return pin_tarjeta;
    }

    public void setPin_tarjeta(int pin_tarjeta) {
        this.pin_tarjeta = pin_tarjeta;
    }

    //usuario
    public Usuario() {
    }

    //getters y setters
    public String getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getClave() {
        return clave;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }


    public String getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }
}
