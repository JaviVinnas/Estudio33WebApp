package controlador;

import controlador.HttpServletRedireccionable;
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
import java.sql.SQLException;

@WebServlet(name = "IndexServlet")
public class IndexServlet extends HttpServletRedireccionable {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            //obtenemos la sesión
            HttpSession sesion = request.getSession(true);
            //creamos una instancia de la base de datos
            BaseDatos bd = new BaseDatos(getServletContext(), response.getWriter());
            //vemos por que se ha llamado
            //1º -> de iniciar sesión desde la pantalla de inicio
            if (request.getParameter("dni") != null && request.getParameter("password") != null) {
                Usuario usuario = new UsuarioNormal();
                usuario.setDni(request.getParameter("dni"));
                usuario.setClave(request.getParameter("password"));
                //consultamos la bd
                usuario = bd.existeUsuario(usuario);
                //si existiera lo metemos en la sesión
                if (usuario != null) {
                    sesion.setAttribute("usuario", usuario);
                }
                gotoPage("./index.jsp", request, response);
            }

        } catch (SQLException | ClassNotFoundException exception) {
            response.getWriter().println(exception);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
