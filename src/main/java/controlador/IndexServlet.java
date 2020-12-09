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


        gotoPage("./index.jsp", request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
