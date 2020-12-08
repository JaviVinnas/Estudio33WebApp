package modelo;

import javax.servlet.http.Part;
import java.time.LocalDate;

public abstract class Usuario {

    private String dni;
    private String nombre;
    private String apellidos;
    private String clave;
    private String correo;
    private int telefono;
    private LocalDate fecha_nacimiento;
    private Part foto_perfil;
    private String tarjeta;
    private int pin_tarjeta;

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

    public LocalDate getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public Part getFoto_perfil() {
        return foto_perfil;
    }

    public void setFoto_perfil(Part foto_perfil) {
        this.foto_perfil = foto_perfil;
    }

    public String getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }
}
