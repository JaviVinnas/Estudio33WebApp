package controlador;

import modelo.BaseDatos;
import modelo.CatalogoTienda;
import modelo.ElementoCatalogo;
import modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "TiendaServlet")
public class TiendaServlet extends HttpServletRedireccionable {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //obtenemos la sesión
        HttpSession sesion = request.getSession(true);
        //creamos una instancia de la BD
        BaseDatos bd = new BaseDatos(getServletContext(), response.getWriter());
        //acabamos de llegar
        if (request.getParameter("origen") != null) {
            //metemos el origen en la sesión y el contexto
            sesion.setAttribute("origen", request.getParameter("origen"));
            //cargamos una variable catálogo con la cantidad de elementos disponibles de cada clase
            CatalogoTienda catalogo = bd.getItemsCatalogoDisponibles();
            //la metemos en la sesión
            sesion.setAttribute("catalogo", catalogo);
            //metemos en la sesión el usuario
            Usuario usuario = (Usuario) getServletContext().getAttribute("usuario");
            sesion.setAttribute("usuario", usuario);
            //metemos además el precio total del carrito actual del usuario
            sesion.setAttribute("precio_total", usuario.getCarrito().getPrecioTotal());
            //cerramos la conexion
            bd.cerrarConexion();
            //vamos a la página de la tienda
            gotoPage("tienda", request, response);
        } else if (request.getParameter("add_al_carrito") != null || request.getParameter("eliminar_numero") != null || request.getParameter("eliminar_todos") != null) {

            ElementoCatalogo elemento = new ElementoCatalogo();
            elemento.setIdElementoCatalogo(request.getParameter("idElementoCatalogo"));
            int cantidad;
            if(request.getParameter("eliminar_todos") == null){
                cantidad = Integer.parseInt(request.getParameter("numero_existencias"));
            }else {
                cantidad = Integer.parseInt(request.getParameter("num_items"));
            }
            Usuario usuarioAntiguo = (Usuario) sesion.getAttribute("usuario");
            Usuario usuarioActualizado;

            if(request.getParameter("add_al_carrito") != null){
                usuarioActualizado = bd.addAlCarrito(usuarioAntiguo, elemento, cantidad);
            }else {
                usuarioActualizado = bd.borrarDelCarrito(usuarioAntiguo, elemento, cantidad);
            }
            getServletContext().setAttribute("usuario", usuarioActualizado);
            sesion.setAttribute("usuario", usuarioActualizado);
            //metemos además el precio total del carrito actual del usuario
            sesion.setAttribute("precio_total", usuarioActualizado.getCarrito().getPrecioTotal());
            //cargamos una variable catálogo con la cantidad de elementos disponibles de cada clase
            CatalogoTienda catalogo = bd.getItemsCatalogoDisponibles();
            //la metemos en la sesión
            sesion.setAttribute("catalogo", catalogo);
            //cerramos la conexión con la bd
            bd.cerrarConexion();
            gotoPage("tienda", request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
