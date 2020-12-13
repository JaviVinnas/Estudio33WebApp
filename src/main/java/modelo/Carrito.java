package modelo;

import java.util.Map;

public final class Carrito extends GrupoElementosTienda{

    public Carrito(){
        super();
    }

    public Float getPrecioTotal(){
        float precio = 0.0f;
        for(Map.Entry<ElementoCatalogo,Integer> item :this.entrySet()){
            precio += item.getKey().getPrecio()* item.getValue();
        }
        return precio;
    }

}
