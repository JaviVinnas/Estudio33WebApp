package controlador;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public abstract class HttpServletRedireccionable extends HttpServlet {

    protected final void gotoPage(String address, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //creamos un objeto RequestDispatcher
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(resolverRuta(address));
        dispatcher.forward(request, response);
    }

    protected final void gotoPageRawRoute(String address, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //creamos un objeto RequestDispatcher
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }

    //resuelve un nombre de paquete tipo "nosotros" o "servicios" en la ruta que tendrá desde el Servlet (situado en root)
    private String resolverRuta(String pagOrigen) {
        String root = "/";
        if (pagOrigen.equals("index")) {
            return root + "index.jsp";
        } else {
            return root + pagOrigen + "/" + pagOrigen + ".jsp";
        }
    }

    @Override
    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

    @Override
    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
