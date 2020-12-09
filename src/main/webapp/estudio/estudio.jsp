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
    <title>Estudio 33</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estudio/estudio.css">
</head>

<body>
<nav>
    <ul>
        <li class="seccion_homepage">
            <form method="post" action="IndexServlet">
                <input type="hidden" name="origen" value="estudio">
                <input type="submit" name="self" value="33">
            </form>
        </li>
        <div class="resto_de_secciones">
            <li class="seccion_destacada">
                <a href="./estudio.jsp">
                    El estudio
                </a>
            </li>
            <li class="seccion_normal">
                <a href="../servicios/servicios.html">
                    Servicios
                </a>
            </li>
            <li class="seccion_normal">
                <a href="../clientes/clientes.html">
                    Clientes
                </a>
            </li>
            <li class="seccion_normal">
                <a href="../nosotros/nosotros.html">
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
                                        <input type="hidden" name="origen" value="estudio">
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
    <section>
        <h1 class="titulo_seccion">
            EL ESTUDIO ES DONDE SUCEDE LA MAGIA
        </h1>
        <div class="salas_seccion">
            <p>
                Nuestro estudio se divide en tres grandes salas con diversas finalidades que se complementan para
                ayudarte a materializar tus ideas
            </p>
            <div class="salas">
                <article class="info_sala" id="info_sala_1">
                    <div class="numero_sala">1</div>
                    <p>
                        La sala de instrumentos es donde realizamos todas las grabaciones con teclados, guitarras etc
                        para procesarlas posteriormente
                    </p>
                    <img class="flecha" src="${pageContext.request.contextPath}/estudio/images/flechas_de_bajar.svg"
                         alt="" height="200px">
                    <div class="videos">
                        <iframe class="video1" width="300" height="300" src="https://www.youtube.com/embed/nZObMvBZjKw"
                                frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                        <iframe class="video2" width="300" height="300" src="https://www.youtube.com/embed/k3GSCjzEZIg"
                                frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                    </div>
                </article>
                <article class="info_sala" id="info_sala_2">
                    <div class="numero_sala">2</div>
                    <p>
                        La sala de voces tiene todo lo necesario para grabar voces a la máxima calidad
                    </p>
                    <img class="flecha" src="${pageContext.request.contextPath}/estudio/images/flechas_de_bajar.svg"
                         alt="" height="200px">
                    <div class="videos">
                        <iframe width="300" height="300" src="https://www.youtube.com/embed/hehIVwF1Wro" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                        <iframe width="300" height="300" src="https://www.youtube.com/embed/WbVrMRfHqVU" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                    </div>
                </article>
                <article class="info_sala" id="info_sala_3">
                    <div class="numero_sala">3</div>
                    <p>
                        La sala de masterizado es donde procesamos todas las pistas grabadas previamente y donde las
                        convertimos en el producto final
                    </p>
                    <img class="flecha" src="${pageContext.request.contextPath}/estudio/images/flechas_de_bajar.svg"
                         alt="" height="200px">
                    <div class="videos">
                        <iframe width="300" height="300" src="https://www.youtube.com/embed/yht8-MOeN5Y" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                        <iframe width="300" height="300" src="https://www.youtube.com/embed/Ex85UBvDrgQ" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                    </div>
                </article>
            </div>
        </div>

    </section>

    <section>
        <h1 class="titulo_seccion">
            UN BUEN ESTUDIO SE MIDE POR LA CALIDAD DE SU EQUIPO
        </h1>

        <div class="main_div_equipamiento">

            <div class="lista_equipamiento">
                <div class="selector_lista">
                    <input type="button" value="HARWARE" id="boton_selector_hardware">
                    <input type="button" value="SOFTWARE" id="boton_selector_software">
                </div>
                <div class="info_hardware_software">
                    <article class="info_hardware" id='hardware'>

                    </article>
                    <article class="info_software" id="software">
                        <ul>
                            <li class="elemento_software">
                                <img src="${pageContext.request.contextPath}/estudio/images/fl_studio.png"
                                     alt="FL Studio" height="100" width="100"> Fl Studio
                                <a href="https://www.image-line.com/">
                                    <img src="${pageContext.request.contextPath}/estudio/images/download.svg" alt="">
                                </a>
                            </li>
                            <li class="elemento_software">
                                <img src="${pageContext.request.contextPath}/estudio/images/ableton.png" alt="Ableton"
                                     height="100" width="100"> Ableton 10 Lite
                                <a href="https://www.ableton.com/en/products/live-lite/">
                                    <img src="${pageContext.request.contextPath}/estudio/images/download.svg" alt="">
                                </a>
                            </li>
                            <li class="elemento_software">
                                <img src="${pageContext.request.contextPath}/estudio/images/garageband.png"
                                     alt="Garageband" height="100" width="100"> Garageband
                                <a href="https://www.apple.com/es/ios/garageband/">
                                    <img src="${pageContext.request.contextPath}/estudio/images/download.svg" alt="">
                                </a>
                            </li>
                            <li class="elemento_software">
                                <img src="${pageContext.request.contextPath}/estudio/images/pro_tools.png"
                                     alt="Garageband" height="100" width="100"> Pro Tools
                                <a href="https://www.avid.com/es/pro-tools">
                                    <img src="${pageContext.request.contextPath}/estudio/images/download.svg" alt="">
                                </a>
                            </li>
                        </ul>
                    </article>
                </div>
            </div>
            <div class="contenedor_flecha">
                <img class="flecha" src="${pageContext.request.contextPath}/estudio/images/flechas_de_bajar.svg" alt=""
                     height="200px">
            </div>
            <p>
                Tenemos más de 200 instrumentos musicales y sintetizadores diferentes para usar en nuestras salas junto
                con más de 1000 licencias de software especializado para tener el control absoluto de tu música
            </p>

        </div>


        <div class="certificados">
            <h2>ADEMÁS CONTAMOS CON MAS DE <span class="destacado_certificados">1000</span> CERTIFICACIONES DE CALIDAD
                POR PARTE DE EMPRESAS ESPECIALIZADAS</h2>
            <div class="imagenes_certificados">
                <img src="${pageContext.request.contextPath}/estudio/images/hi_res_audio.jpg" alt="Hi-Res audio"
                     height="150">
                <img src="${pageContext.request.contextPath}/estudio/images/aptx.webp" alt="APTX" height="150">
                <img src="${pageContext.request.contextPath}/estudio/images/flac.jpg" alt="FLAC" height="150">
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

<script src="${pageContext.request.contextPath}/assets/jQuery.js"></script>
<script src="${pageContext.request.contextPath}/estudio/estudio.js"></script>

</body>

</html>