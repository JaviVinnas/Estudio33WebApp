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
                                        <form method="post" action="${pageContext.request.contextPath}/IniciarSesionServlet">
                                            <input type="hidden" name="origen" value="estudio">
                                            <input type="submit" name="iniciar_sesion" value="Iniciar sesión">
                                        </form>
                                    </li>
                                    <li>
                                        <form method="post" action="${pageContext.request.contextPath}/RegistrarseServlet">
                                            <input type="hidden" name="origen" value="estudio">
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
                            <form method="post" action="${pageContext.request.contextPath}/IniciarSesionServlet">
                                <input id="cerrar_sesion" type="submit" name="cerrar_sesion" value="cerrar_sesion">
                                <input type="hidden" name="origen" value="estudio">
                                <div class="id_usuario" id="id_usuario"> Bienvenido <c:out
                                        value="${usuario.nombre}"/></div>
                            </form>
                            <div class="wrapper_icono_tienda">
                                <form method="post" action="${pageContext.request.contextPath}/TiendaServlet">
                                    <input id="ir_tienda" type="submit" name="tienda" value="tienda">
                                    <input type="hidden" name="origen" value="estudio">
                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                         width="40px" height="36px" xml:space="preserve" class="svg-icon"
                                         viewBox="0 0 20 20" id="icono-tienda">
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
<script src="${pageContext.request.contextPath}/assets/assets.js"></script>

</body>

</html>