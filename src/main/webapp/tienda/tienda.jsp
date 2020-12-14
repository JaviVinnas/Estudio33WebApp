<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="estudio, 33, estudio33"/>
    <meta name="author" content="Javier Rodríguez Viñas">
    <meta name="copyright" content="Javier Rodríguez Viñas"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/tienda/tienda.css">
    <title>Estudio 33</title>
</head>
<body>

<script src="${pageContext.request.contextPath}/assets/jQuery.js"></script>


<nav>
    <ul>
        <li class="seccion_homepage">
            <a href="${pageContext.request.contextPath}/index.jsp">
                33
            </a>
        </li>
        <div class="resto_de_secciones">
            <li class="seccion_normal">
                <a href="${pageContext.request.contextPath}/estudio/estudio.jsp">
                    El estudio
                </a>
            </li>
            <li class="seccion_normal">
                <a href="${pageContext.request.contextPath}/servicios/servicios.jsp">
                    Servicios
                </a>
            </li>
            <li class="seccion_normal">
                <a href="${pageContext.request.contextPath}/clientes/clientes.jsp">
                    Clientes
                </a>
            </li>
            <li class="seccion_normal">
                <a href="${pageContext.request.contextPath}/nosotros/nosotros.jsp">
                    Nosotros
                </a>
            </li>
            <c:choose>
                <c:when test="${empty usuario}">
                    <li class="seccion_normal">
                        <div class="wrapper_sesion">
                            <img class="imagen_navbar" src="${pageContext.request.contextPath}/assets/user-profile.svg"
                                 alt="registrate">
                            <div class="dropdown_info">
                                <ul id="dropdown_list">
                                    <li>
                                        <form method="post" action="IniciarSesionServlet">
                                            <input type="hidden" name="origen" value="index">
                                            <input type="submit" name="iniciar_sesion" value="Iniciar sesión">
                                        </form>
                                    </li>
                                    <li>
                                        <form method="post" action="RegistrarseServlet">
                                            <input type="hidden" name="origen" value="index">
                                            <input type="submit" name="registrarse" value="Registrarse">
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="seccion_normal">
                        <div class="banner_usuario">
                            <form method="post" action="IniciarSesionServlet">
                                <input id="cerrar_sesion" type="submit" name="cerrar_sesion" value="cerrar_sesion">
                                <input type="hidden" name="origen" value="index">
                                <div class="id_usuario" id="id_usuario"> Bienvenido <c:out
                                        value="${usuario.nombre}"/></div>
                            </form>
                            <div class="wrapper_icono_tienda">
                                <form method="post" action="TiendaServlet">
                                    <input id="ir_tienda" type="submit" name="tienda" value="tienda">
                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                         width="40px" height="36px" xml:space="preserve" class="svg-icon"
                                         viewBox="0 0 20 20">
                                        <path d="M17.671,13.945l0.003,0.002l1.708-7.687l-0.008-0.002c0.008-0.033,0.021-0.065,0.021-0.102c0-0.236-0.191-0.428-0.427-0.428H5.276L4.67,3.472L4.665,3.473c-0.053-0.175-0.21-0.306-0.403-0.306H1.032c-0.236,0-0.427,0.191-0.427,0.427c0,0.236,0.191,0.428,0.427,0.428h2.902l2.667,9.945l0,0c0.037,0.119,0.125,0.217,0.239,0.268c-0.16,0.26-0.257,0.562-0.257,0.891c0,0.943,0.765,1.707,1.708,1.707S10,16.068,10,15.125c0-0.312-0.09-0.602-0.237-0.855h4.744c-0.146,0.254-0.237,0.543-0.237,0.855c0,0.943,0.766,1.707,1.708,1.707c0.944,0,1.709-0.764,1.709-1.707c0-0.328-0.097-0.631-0.257-0.891C17.55,14.182,17.639,14.074,17.671,13.945 M15.934,6.583h2.502l-0.38,1.709h-2.312L15.934,6.583zM5.505,6.583h2.832l0.189,1.709H5.963L5.505,6.583z M6.65,10.854L6.192,9.146h2.429l0.19,1.708H6.65z M6.879,11.707h2.027l0.189,1.709H7.338L6.879,11.707z M8.292,15.979c-0.472,0-0.854-0.383-0.854-0.854c0-0.473,0.382-0.855,0.854-0.855s0.854,0.383,0.854,0.855C9.146,15.596,8.763,15.979,8.292,15.979 M11.708,13.416H9.955l-0.189-1.709h1.943V13.416z M11.708,10.854H9.67L9.48,9.146h2.228V10.854z M11.708,8.292H9.386l-0.19-1.709h2.512V8.292z M14.315,13.416h-1.753v-1.709h1.942L14.315,13.416zM14.6,10.854h-2.037V9.146h2.227L14.6,10.854z M14.884,8.292h-2.321V6.583h2.512L14.884,8.292z M15.978,15.979c-0.471,0-0.854-0.383-0.854-0.854c0-0.473,0.383-0.855,0.854-0.855c0.473,0,0.854,0.383,0.854,0.855C16.832,15.596,16.45,15.979,15.978,15.979 M16.917,13.416h-1.743l0.189-1.709h1.934L16.917,13.416z M15.458,10.854l0.19-1.708h2.218l-0.38,1.708H15.458z"></path>
                                    </svg>

                                </form>
                            </div>
                        </div>
                    </li>
                </c:otherwise>
            </c:choose>
        </div>
    </ul>
</nav>

<main>
    <div id="parte-catalogo">
        <c:forEach var="entry" items="${catalogo}" varStatus="status">
            <div class="elemento-catalogo">
                <form method="post" action="TiendaServlet">
                    <!-- ID (invisible) -->
                    <input type="hidden" name="idElementoCatalogo" value="${entry.key.idElementoCatalogo}">
                    <!-- Nombre -->
                    <div>${entry.key.nombre}</div>
                    <!-- Categoria -->
                    <div>Categoria: ${entry.key.categoria}</div>
                    <!-- Descripcion -->
                    <div>Descripcion: ${entry.key.descripcion}</div>
                    <!-- Precio -->
                    <div>Precio: ${entry.key.precio}</div>
                    <c:choose>
                        <c:when test="${entry.value eq 0}">
                            <div>SOLD OUT</div>
                        </c:when>
                        <c:otherwise>
                            <!-- Existencias -->
                            <div>Existencias disponibles: ${entry.value}</div>
                            <label>Selecciona el número de elementos que quieras añadir
                                <input type="number" required min="1" max="${entry.value}" name="numero_existencias">
                            </label>
                            <!-- Boton de enviar -->
                            <input type="submit" name="add_al_carrito" value="Añadir">
                        </c:otherwise>
                    </c:choose>

                </form>
            </div>
        </c:forEach>
    </div>
    <hr>
    <div id="parte-carrito">
        <c:forEach var="itemCarrito" items="${usuario.carrito}" varStatus="status">
            <div class="elemento-carrito">
                <form method="post" action="TiendaServlet">
                    <!-- ID (invisible) -->
                    <input type="hidden" name="idElementoCatalogo" value="${itemCarrito.key.idElementoCatalogo}">
                    <!-- Nombre -->
                    <div>${itemCarrito.key.nombre}</div>
                    <!-- Precio -->
                    <div>Precio: ${itemCarrito.key.precio}</div>
                    <!-- Existencias -->
                    <div>Cantidad en el carrito: ${itemCarrito.value}</div>

                    <label>Selecciona el número de elementos que quieras quitar
                        <input type="number" min="1" max="${itemCarrito.value}" required name="numero_existencias">
                        <input type="submit" name="eliminar_numero" value="Quitar">
                    </label>
                </form>
                <form method="post" action="TiendaServlet">
                    <!-- ID (invisible) -->
                    <input type="hidden" name="idElementoCatalogo" value="${itemCarrito.key.idElementoCatalogo}">
                    <input type="hidden" name="num_items" value="${itemCarrito.value}">
                    <label>O bien
                        <input type="submit" name="eliminar_todos" value="Quitar todos">
                    </label>
                </form>


            </div>
        </c:forEach>
        <div>Precio total: ${precio_total}</div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/assets/assets.js"></script>
</body>
</html>
