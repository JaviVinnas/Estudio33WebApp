package modelo;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class BaseDatos {

    private Connection conexion;
    private final PrintWriter out;

    //se necesita el contexto para pillar la ruta al archivo de properties
    public BaseDatos(ServletContext servletContext, PrintWriter out) {
        //
        this.out = out;
        //objetos para la lectura
        Properties configuracion = new Properties();
        InputStream archConfig;
        try {
            Class.forName("org.postgresql.Driver");
            //cargamos el archivo
            archConfig = servletContext.getResourceAsStream("/WEB-INF/baseDatos.properties");
            configuracion.load(archConfig);
            //creamos el usuario con el que accederemos a la base de datos
            Properties usuario = new Properties();
            usuario.setProperty("user", configuracion.getProperty("usuario"));
            usuario.setProperty("password", configuracion.getProperty("clave"));
            //creamos la conexión

            this.conexion = java.sql.DriverManager.getConnection("jdbc:" + configuracion.getProperty("gestor") + "://"
                            + configuracion.getProperty("servidor") + ":"
                            + configuracion.getProperty("puerto") + "/"
                            + configuracion.getProperty("baseDatos"),
                    usuario);
        } catch (ClassNotFoundException | IOException | SQLException ex) {
            out.println(ex.getMessage());
        }
        //lo leemos (o al menos lo intentamos)


    }

    public void cerrarConexion() {
        try {
            conexion.close();
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
    }


    public boolean existeUsuario(Usuario usuario) {
        //declaramos variables
        PreparedStatement stmUsuario = null;
        try {
            stmUsuario = conexion.prepareStatement("select * from usuarios where dni = ?");
            stmUsuario.setString(1, usuario.getDni());
            //comprobamos si hay un resultado
            return stmUsuario.executeQuery().next();
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmUsuario != null;
                stmUsuario.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
        return false;
    }

    /*se le pasa un usuario con
        --DNI
        --contraseña
        Y comprueba si existe en la bd ->
            --si existiera devuelve el usuario con todos sus campos
            --si no existiera devuelve nulo
        devuelve un usuario con toda su informacion que este en la base de datos
        */
    public Usuario autenticarUsuario(Usuario usuario) {
        //declaramos variables
        Usuario usuarioBd = null;
        PreparedStatement stmUsuario = null;
        ResultSet rsUsuario;
        try {
            stmUsuario = conexion.prepareStatement("select dni, nombre, apellidos, clave, correo, telefono, fecha_nacimiento, tipo_usuario, tarjeta, pin_tarjeta from usuarios where dni = ? and clave = ?");
            stmUsuario.setString(1, usuario.getDni());
            stmUsuario.setString(2, usuario.getClave());
            rsUsuario = stmUsuario.executeQuery();
            if (rsUsuario.next()) {
                switch (rsUsuario.getString("tipo_usuario")) {
                    case "manager":
                        usuarioBd = new UsuarioManager();
                        break;
                    case "artista":
                        usuarioBd = new UsuarioArtista();
                        break;
                    case "normal":
                    default:
                        usuarioBd = new UsuarioNormal();
                }
                usuarioBd.setDni(rsUsuario.getString("dni"));
                usuarioBd.setNombre(rsUsuario.getString("nombre"));
                usuarioBd.setApellidos(rsUsuario.getString("apellidos"));
                usuarioBd.setClave(rsUsuario.getString("clave"));
                usuarioBd.setCorreo(rsUsuario.getString("correo"));
                usuarioBd.setTelefono(rsUsuario.getInt("telefono"));
                usuarioBd.setFechaNacimiento(rsUsuario.getDate("fecha_nacimiento"));
                usuarioBd.setTarjeta(rsUsuario.getString("tarjeta"));
                usuarioBd.setPinTarjeta(rsUsuario.getInt("pin_tarjeta"));
                //obtenemos el carrito del usuario llamando al método privado
                usuarioBd.setCarrito(this.getCarritoUsuario(usuarioBd));
            }
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmUsuario != null;
                stmUsuario.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
        return usuarioBd;
    }



    /*
     * Le pasamos un usuario con al menos los campos obligatorios llenos ( HTML lo fuerza )
     * Introduce esta información en la base de datos
     * devuelve el usuario actualizado
     * */

    public Usuario registrarUsuario(Usuario nuevoUsuario) {

        PreparedStatement stmUsuario = null;
        try {
            stmUsuario = conexion.prepareStatement("insert into usuarios(dni, nombre, apellidos, clave, correo, telefono, fecha_nacimiento, tipo_usuario, tarjeta, pin_tarjeta) VALUES (?,?,?,?,?,?,?,?,?,?)");
            stmUsuario.setString(1, nuevoUsuario.getDni());
            stmUsuario.setString(2, nuevoUsuario.getNombre());
            stmUsuario.setString(3, nuevoUsuario.getApellidos());
            stmUsuario.setString(4, nuevoUsuario.getClave());
            stmUsuario.setString(5, nuevoUsuario.getCorreo());
            stmUsuario.setInt(6, nuevoUsuario.getTelefono());
            stmUsuario.setDate(7, nuevoUsuario.getFechaNacimiento());
            if (nuevoUsuario instanceof UsuarioArtista) {
                stmUsuario.setString(8, "artista");
            } else if (nuevoUsuario instanceof UsuarioManager) {
                stmUsuario.setString(8, "manager");
            } else {
                stmUsuario.setString(8, "normal");
            }
            stmUsuario.setString(9, nuevoUsuario.getTarjeta());
            stmUsuario.setInt(10, nuevoUsuario.getPinTarjeta());
            //ejecutamos el update correspondiente
            stmUsuario.executeUpdate();
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmUsuario != null;
                stmUsuario.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
        return autenticarUsuario(nuevoUsuario);
    }

    /*
     * Para un usuario dado busca los elemntos que figuren en la base de
     * datos como que están en su carrito (asignados y no vendidos)
     * */

    private Carrito getCarritoUsuario(Usuario usuario) {
        ElementoCatalogo item;
        Carrito carrito = new Carrito();
        PreparedStatement stmCarrito = null;
        ResultSet rsCarrito;
        try {
            stmCarrito = conexion.prepareStatement("select ca.id, ca.nombre,\n" +
                    "       ca.categoria,\n" +
                    "       ca.descripcion,\n" +
                    "       ca.precio,\n" +
                    "       count(ex.id) as cantidad\n" +
                    "from usuarios as usr,\n" +
                    "     existencias as ex,\n" +
                    "     catalogo_tienda as ca\n" +
                    "where ca.id = ex.tipo\n" +
                    "  and usr.dni = ex.usuario\n" +
                    "  and ex.usuario = ?\n" +
                    "  and ex.vendida = false\n" +
                    "group by ca.id\n" +
                    "having count(ex.id) > 0 order by ca.id");
            stmCarrito.setString(1, usuario.getDni());
            rsCarrito = stmCarrito.executeQuery();
            while (rsCarrito.next()) {
                //reiniciamos el elemeno que metemos en el catálogo
                item = new ElementoCatalogo();
                //lo cargamos
                item.setIdElementoCatalogo(rsCarrito.getString("id"));
                item.setNombre(rsCarrito.getString("nombre"));
                item.setCategoria(rsCarrito.getString("categoria"));
                item.setDescripcion(rsCarrito.getString("descripcion"));
                item.setPrecio(rsCarrito.getFloat("precio"));
                //se lo añadimos al catálogo
                carrito.put(item, rsCarrito.getInt("cantidad"));
            }
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmCarrito != null;
                stmCarrito.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
        return carrito;
    }


    /*
     * Devuelve el catálogo con los items de la tienda en los que
     * hay al menos una unidad posible para seleccionar. Se describirán
     * las carácteristicas de cada elemnto del catálogo junto con la
     * cantidad de items de ese tipo que hay.
     *
     * Si no hubiera ningún elemnto disponible devolvería null
     * */
    public CatalogoTienda getItemsCatalogoDisponibles() {
        ElementoCatalogo item;
        CatalogoTienda catalogo = new CatalogoTienda();
        PreparedStatement stmCatalogo = null;
        ResultSet rsCatalogo;
        try {
            stmCatalogo = conexion.prepareStatement("select catalogo_tienda.id,\n" +
                    "       catalogo_tienda.nombre,\n" +
                    "       catalogo_tienda.categoria,\n" +
                    "       catalogo_tienda.descripcion,\n" +
                    "       catalogo_tienda.precio,\n" +
                    "       count(existencias.id) as cantidad\n" +
                    "from catalogo_tienda,\n" +
                    "     existencias\n" +
                    "where catalogo_tienda.id = existencias.tipo\n" +
                    "  and existencias.usuario isnull\n" +
                    "  and existencias.vendida = false\n" +
                    "group by catalogo_tienda.id\n");
            rsCatalogo = stmCatalogo.executeQuery();
            while (rsCatalogo.next()) {
                //reiniciamos el elemeno que metemos en el catálogo
                item = new ElementoCatalogo();
                //lo cargamos
                item.setIdElementoCatalogo(rsCatalogo.getString("id"));
                item.setNombre(rsCatalogo.getString("nombre"));
                item.setCategoria(rsCatalogo.getString("categoria"));
                item.setDescripcion(rsCatalogo.getString("descripcion"));
                item.setPrecio(rsCatalogo.getFloat("precio"));
                //se lo añadimos al catálogo
                catalogo.put(item, rsCatalogo.getInt("cantidad"));
            }
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmCatalogo != null;
                stmCatalogo.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
        return catalogo;
        //todo: cambiar esta función como combinación de las dos funciones de abajo (por hacer)
    }
    /*
    * Devuelve los elementos del catálogo que haya (NO EXISTENCIAS)
    * */
    private List<ElementoCatalogo> elementosDelCatalogo(){return null;}
    /*
    * Para un elemnto del catálogo devuelve las cantidad de existencias que hubiera de el
    * */
    private Integer cantidadExistenciasDe(ElementoCatalogo elementoCatalogo){return null;}

    /*
     * Para un usuario pasado por argumentos se le reservan tantas
     * Existencias de elementos del catálogo como se desee.
     * Si no hubiera tantas como se piden se reservarían tantas como fuera posible.
     * El usuario se actualiza despues de esto
     * */

    public Usuario addAlCarrito(Usuario usuario, ElementoCatalogo elemento, int cantidad) {


        //vemos la lista de existencias asignables
        List<Existencia> existenciasDisponibles = this.existenciasAsignadasA(elemento, null);

        //si hubiera tantas o más disponibles de las que se solicitan
        if (existenciasDisponibles.size() >= cantidad) {
            for (int i = 0; i < cantidad; i++) {
                this.reservarExistencia(usuario, existenciasDisponibles.get(i));
            }
        } else {
            //si hubiera menos existencias disponibles de las que se solicitan
            existenciasDisponibles.forEach(existencia -> this.reservarExistencia(usuario, existencia));
        }
        return this.autenticarUsuario(usuario);
    }

    /*
     * Devuelve una lista con las existencias de un tipo concreto
     * de elemento del catálogo que tiene un usuario en el carrito
     *
     * Si usuario fuera null de mostraría las existencias de ese elemnto que
     * estuvieran disponibles para seleccionar por parte de un usuario
     * */

    private List<Existencia> existenciasAsignadasA(ElementoCatalogo elemento, Usuario usuario) {
        List<Existencia> existencias = new ArrayList<>();
        PreparedStatement stmExistencias = null;
        ResultSet rsExistencias;
        try {
            if (usuario == null) {
                stmExistencias = conexion.prepareStatement("select existencias.id\n" +
                        "from existencias\n" +
                        "where existencias.tipo = ?\n" +
                        "  and existencias.usuario isnull\n" +
                        "  and existencias.vendida = false");
                stmExistencias.setString(1, elemento.getIdElementoCatalogo());
            } else {
                stmExistencias = conexion.prepareStatement("select existencias.id\n" +
                        "from existencias\n" +
                        "where existencias.tipo = ?\n" +
                        "  and existencias.usuario = ?\n" +
                        "  and existencias.vendida = false");
                stmExistencias.setString(1, elemento.getIdElementoCatalogo());
                stmExistencias.setString(2, usuario.getDni());
            }
            rsExistencias = stmExistencias.executeQuery();
            while (rsExistencias.next()) {
                existencias.add(new Existencia(rsExistencias.getInt("id"), elemento));
            }
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmExistencias != null;
                stmExistencias.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
        return existencias;
    }

    /*
     * Para un usuario dado le reserva (mete en el carrito) la existencia pasada por argumentos
     * */

    private void reservarExistencia(Usuario usuario, Existencia existencia) {
        PreparedStatement stmExistencias = null;
        try {
            stmExistencias = conexion.prepareStatement("update existencias\n" +
                    "set usuario = ?\n" +
                    "where id = ?\n" +
                    "  and tipo = ?;");
            stmExistencias.setString(1, usuario.getDni());
            stmExistencias.setInt(2, existencia.getIdExistencia());
            stmExistencias.setString(3, existencia.getIdElementoCatalogo());
            stmExistencias.executeUpdate();
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmExistencias != null;
                stmExistencias.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
    }


    /*
     * Dado un usuario y un elemento del catálogo borra x cantidad de existencias
     * de ese tipo que el usuario pueda tener en us carrito
     * */


    public Usuario borrarDelCarrito(Usuario usuario, ElementoCatalogo elemento, int cantidad) {
        //1º-> Obtenemos las existencias del tipo-elemento concreto que tiene el usuario en el carrito
        List<Existencia> existenciasDelUsuario = this.existenciasAsignadasA(elemento, usuario);
        //2º-> Vemos si hay más existencias como se pide para eliminar
        if (existenciasDelUsuario.size() > cantidad) {
            for (int i = 0; i < cantidad; i++) {
                this.eliminarExistencia(existenciasDelUsuario.get(i));
            }
        } else {
            //si no borraríamos todas las que tuviera en el carrito
            existenciasDelUsuario.forEach(this::eliminarExistencia);
        }
        return autenticarUsuario(usuario);
    }

    /*
     * Marca un item determinado del carrito como
     * */

    private void eliminarExistencia(Existencia existencia) {
        PreparedStatement stmExistencias = null;
        try {
            stmExistencias = conexion.prepareStatement("update existencias\n" +
                    "set usuario = null\n" +
                    "where id = ? and tipo = ?\n");
            stmExistencias.setInt(1, existencia.getIdExistencia());
            stmExistencias.setString(2, existencia.getIdElementoCatalogo());
            stmExistencias.executeUpdate();
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmExistencias != null;
                stmExistencias.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }


    }


    /*
     * Añade las existencias del usuario que tuviera en su carrito como pagadas,
     *  y vacía su carrito
     * */

    public Usuario pasarPorCaja(Usuario usuario) {

        usuario.getCarrito().keySet().forEach(elementoCatalogo -> existenciasAsignadasA(elementoCatalogo, usuario).forEach(this::marcarExistenciaComoVendida));

        return autenticarUsuario(usuario);

    }

    private void marcarExistenciaComoVendida(Existencia existencia) {
        PreparedStatement stmExistencias = null;
        try {
            stmExistencias = conexion.prepareStatement("update existencias\n" +
                    "set vendida = true\n" +
                    "where id = ? and tipo = ?");
            stmExistencias.setInt(1, existencia.getIdExistencia());
            stmExistencias.setString(2, existencia.getIdElementoCatalogo());
            stmExistencias.executeUpdate();
        } catch (SQLException e) {
            out.println(e.getMessage());
        } finally {
            try {
                assert stmExistencias != null;
                stmExistencias.close();
            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        }
    }


}
