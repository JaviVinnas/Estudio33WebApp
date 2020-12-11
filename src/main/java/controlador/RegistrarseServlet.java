package controlador;

import modelo.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "RegistrarseServlet")
public class RegistrarseServlet extends HttpServletRedireccionable {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //obtenemos la sesión
        HttpSession sesion = request.getSession(true);
        //no hay ningún dato en la solicitud (solo su origen) -> acabamos de llegar a la página
        if (request.getParameter("origen") != null) {
            sesion.setAttribute("error", null);
            sesion.setAttribute("origen", request.getParameter("origen"));
            //vamos a la página
            gotoPage("registrarse", request, response);
        } else {
            //estaremos introduciendo los datos del nuevo usuario
            BaseDatos bd = new BaseDatos(getServletContext(), response.getWriter());
            Usuario usuario;
            switch (request.getParameter("tipo_usuario")) {
                case "artista":
                    usuario = new UsuarioArtista();
                    break;
                case "manager":
                    usuario = new UsuarioManager();
                    break;
                case "normal":
                    usuario = new UsuarioNormal();
                    break;
                default:
                    throw new IllegalStateException("Unexpected value: " + request.getParameter("tipo_usuario"));
            }
            usuario.setDni(request.getParameter("dni"));
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setApellidos(request.getParameter("apellidos"));
            usuario.setClave(request.getParameter("password"));
            usuario.setCorreo(request.getParameter("correo"));
            usuario.setTelefono(Integer.parseInt(request.getParameter("telefono")));
            usuario.setFechaNacimiento(Date.valueOf(request.getParameter("fecha_nacimiento")));
            usuario.setTarjeta(request.getParameter("tarjeta"));
            usuario.setPinTarjeta(Integer.parseInt(request.getParameter("pin_tarjeta")));
            //si estuviera ya un usuario igual en la bd
            if (!bd.existeUsuario(usuario)) {
                bd.registrarUsuario(usuario);
                sesion.setAttribute("usuario", usuario);
                getServletContext().setAttribute("usuario", usuario);
                gotoPage((String) sesion.getAttribute("origen"), request, response);
            } else {
                sesion.setAttribute("error", true);
                gotoPage("registrarse", request, response);
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
