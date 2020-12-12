package modelo;

public class Existencia extends ElementoCatalogo{
    private int idExistencia;

    public Existencia(int idExistencia, ElementoCatalogo elemento) {
        super();
        this.idExistencia = idExistencia;
        setIdElementoCatalogo(elemento.getIdElementoCatalogo());
        setNombre(elemento.getNombre());
        setCategoria(elemento.getCategoria());
        setDescripcion(elemento.getDescripcion());
        setPrecio(elemento.getPrecio());
    }
    public Existencia(){
        super();
    }

    public int getIdExistencia() {
        return idExistencia;
    }

    public void setIdExistencia(int idExistencia) {
        this.idExistencia = idExistencia;
    }
}
