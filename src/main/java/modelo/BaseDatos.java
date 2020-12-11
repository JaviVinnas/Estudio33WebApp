package modelo;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class BaseDatos {

    private Connection conexion;
    PrintWriter out;

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


    public boolean existeUsuario(Usuario usuario){
        //declaramos variables
        PreparedStatement stmUsuario = null;
        try{
            stmUsuario = conexion.prepareStatement("select * from usuarios where dni = ?");
            stmUsuario.setString(1, usuario.getDni());
            //comprobamos si hay un resultado
            return stmUsuario.executeQuery().next();
        }catch (SQLException e) {
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
     * Si hubiera un repetido no lo metería
     * */

    public void registrarUsuario(Usuario nuevoUsuario) {

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
    }
}
