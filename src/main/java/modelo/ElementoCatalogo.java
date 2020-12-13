package modelo;

import java.util.Objects;

public class ElementoCatalogo implements Comparable {
    private String idElementoCatalogo;
    private String nombre;
    private String categoria;
    private String descripcion;
    private float precio;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ElementoCatalogo that = (ElementoCatalogo) o;
        return Float.compare(that.precio, precio) == 0 &&
                Objects.equals(idElementoCatalogo, that.idElementoCatalogo) &&
                Objects.equals(nombre, that.nombre) &&
                Objects.equals(categoria, that.categoria) &&
                Objects.equals(descripcion, that.descripcion);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idElementoCatalogo, nombre, categoria, descripcion, precio);
    }

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

    @Override
    public int compareTo(Object o) {
        if (this == o) return 0;
        if (o == null || getClass() != o.getClass()) return 0;
        ElementoCatalogo that = (ElementoCatalogo) o;
        return this.getNombre().compareTo(that.getNombre());
    }
}
