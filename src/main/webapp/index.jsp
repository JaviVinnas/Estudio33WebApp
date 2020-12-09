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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index.css">
    <title>Estudio 33</title>

</head>

<body>
<script src="${pageContext.request.contextPath}/assets/jQuery.js"></script>
<nav>
    <ul>
        <li class="seccion_homepage">
            <form method="post" action="IndexServlet">
                <input type="hidden" name="origen" value="index">
                <input type="submit" name="self" value="33">
            </form>
        </li>
        <div class="resto_de_secciones">
            <li class="seccion_normal">
                <form method="post" action="EstudioServlet">
                    <input type="hidden" name="origen" value="index">
                    <input type="submit" name="estudio" value="El estudio">
                </form>
            </li>
            <li class="seccion_normal">
                <a href="./servicios/servicios.html">
                    Servicios
                </a>
            </li>
            <li class="seccion_normal">
                <a href="./clientes/clientes.html">
                    Clientes
                </a>
            </li>
            <li class="seccion_normal">
                <a href="./nosotros/nosotros.html">
                    Nosotros
                </a>
            </li>
            <li class="seccion_normal">
                <div class="wrapper_sesion">
                    <img class="imagen_navbar" src="${pageContext.request.contextPath}/assets/user-profile.svg"
                         alt="registrate">
                    <div class="dropdown_info">
                        <ul id="dropdown_list">
                            <c:choose>
                                <c:when test="${empty usuario}">
                                    <form method="post" action="IniciarSesionServlet">
                                        <input type="hidden" name="origen" value="index">
                                        <input type="submit" name="iniciar_sesion" value="Iniciar sesión">
                                    </form>
                                    <li id="registrarse">Registrarse</li>
                                </c:when>
                                <c:otherwise>
                                    <li id="cerrar_sesion">Cerrar sesión</li>
                                </c:otherwise>
                            </c:choose>

                        </ul>
                    </div>
                </div>
            </li>
        </div>
    </ul>


</nav>

<main>
    <section class="bienvenida">

        <img src="${pageContext.request.contextPath}/images/young_thug_estudio.jpg" alt="El estudio" height="400"
             width="400"/>

        <div class="info_bienvenida">
            <h1 class="mensaje_bienvenida">Donde nace la música</h1>
            <div class="saber_mas">
                <p>Saber más</p>
            </div>
            <p class="logo_completo_inferior">ESTUDIO 33</p>
        </div>
    </section>

    <section id="quesomos" class="quesomos">
        <a class="texto_destacado_vacio hover" id="easter_egg1">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover">QUE SOMOS </a>
        <a class="texto_destacado_vacio hover" id="easter_egg2">QUE SOMOS </a>
        <div class="loquesomos_flex">
            <div class="loquesomos_box">
                <p>
                    El estudio 13 ha sido desde su fundación el centro de producción musical más importante de España.
                    Actualmente está considerado como el <strong> mejor estudio de grabación y postprocesado de audio
                    español y el tercero del mundo </strong>
                </p>
            </div>
        </div>
    </section>

    <section class="quehacemos">
        <a class="texto_destacado_vacio hover" id="easter_egg3">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover">QUE HACEMOS </a>
        <a class="texto_destacado_vacio hover" id="easter_egg4">QUE HACEMOS </a>
        <div class="loquehacemos_flex">
            <div class="loquehacemos_box">
                <p> Nos dedicamos a la <strong>grabación de audio, mixing y mastering</strong> del mismo para todo tipo
                    de finalidades
                </p>
            </div>
        </div>
    </section>
</main>


<footer>
    <p class="texto_centrado_footer">
        Estudio 13 2020. Javier Rodríguez Viñas, DNI 39488522Y
    </p>
    <div>
        <p class="logo">33</p>
    </div>
</footer>

<!--PopUp que se superpone sobre las demás-->
<div id="mi_pop_up" class="pop_up">
    <div class="contenido_pop_up">
        <!-- X de cerrar el PopUp -->
        <span class="cerrar">&times;</span>
        <p>¡Has ganado un código de descuento del 30%!</p>
        <p><u>da898asd7</u></p>
        <p>Introdúcelo en la reserva de tu proxima sesión para disfrutar de él</p>
    </div>
</div>


<script src="${pageContext.request.contextPath}/index.js"></script>
</body>

</html>