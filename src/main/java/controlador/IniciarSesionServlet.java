package controlador;

import modelo.BaseDatos;
import modelo.Usuario;
import modelo.UsuarioNormal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "IniciarSesionServlet")
public class IniciarSesionServlet extends HttpServletRedireccionable {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //obtenemos la sesión
        HttpSession sesion = request.getSession(true);


        if (request.getParameter("origen") != null) {
            //no hay ningún dato en la solicitud (solo su origen) -> acabamos de llegar a la página
            sesion.setAttribute("error", null);
            sesion.setAttribute("origen", request.getParameter("origen"));
            sesion.setAttribute("animaciones", true);
            //vamos a la página
            gotoPage("iniciar_sesion", request, response);
        } else if (request.getParameter("dni") != null && request.getParameter("password") != null) {
            //asumimos que no tienen valores no válidos ni están vacíos (filtramos los formularios)
            Usuario usuario = new UsuarioNormal();
            usuario.setDni(request.getParameter("dni"));
            usuario.setClave(request.getParameter("password"));
            //creamos una instancia de la base de datos
            BaseDatos bd = new BaseDatos(getServletContext(), response.getWriter());
            usuario = bd.existeUsuario(usuario);
            //cerramos la conexion con la bd
            bd.cerrarConexion();
            //si hemos encontrado usuario
            if (usuario != null) {
                sesion.setAttribute("usuario", usuario);
                getServletContext().setAttribute("usuario", usuario);
                //volvemos a la página origen
                gotoPage((String) sesion.getAttribute("origen"), request, response);
            } else {
                sesion.setAttribute("animaciones", false);
                sesion.setAttribute("error", true);
                gotoPage("iniciar_sesion", request, response);
            }
        } else {
            throw new ServletException();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
