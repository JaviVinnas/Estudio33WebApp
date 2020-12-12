package modelo;

public class ElementoCatalogo {
    private String idElementoCatalogo;
    private String nombre;
    private String categoria;
    private String descripcion;
    private float precio;

    public String getIdElementoCatalogo() {
        return idElementoCatalogo;
    }

    public void setIdElementoCatalogo(String idElementoCatalogo) {
        this.idElementoCatalogo = idElementoCatalogo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
}
