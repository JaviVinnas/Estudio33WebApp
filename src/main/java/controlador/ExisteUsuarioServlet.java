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
import java.sql.SQLException;

@WebServlet(name = "ExisteUsuarioServlet")
public class ExisteUsuarioServlet extends HttpServletRedireccionable {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            BaseDatos bd = new BaseDatos(getServletContext(), response.getWriter());
            Usuario usuario = new UsuarioNormal();
            usuario.setDni(request.getParameter("dni"));
            usuario.setClave(request.getParameter("password"));
            //consultamos la bd
            usuario = bd.existeUsuario(usuario);
            //si existiera lo metemos en la sesión
            if (usuario != null) {
                response.getWriter().println("no");
            }else {
                response.getWriter().println("si");
            }

        } catch (SQLException | ClassNotFoundException exception) {
            response.getWriter().println(exception);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
