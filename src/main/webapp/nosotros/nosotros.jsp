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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/nosotros/nosotros.css">

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
            <li class="seccion_destacada">
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
                                            <input type="hidden" name="origen" value="nosotros">
                                            <input type="submit" name="iniciar_sesion" value="Iniciar sesión">
                                        </form>
                                    </li>
                                    <li>
                                        <form method="post" action="${pageContext.request.contextPath}/RegistrarseServlet">
                                            <input type="hidden" name="origen" value="nosotros">
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
                                <input type="hidden" name="origen" value="nosotros">
                                <div class="id_usuario" id="id_usuario"> Bienvenido <c:out
                                        value="${usuario.nombre}"/></div>
                            </form>
                            <div class="wrapper_icono_tienda">
                                <form method="post" action="${pageContext.request.contextPath}/TiendaServlet">
                                    <input id="ir_tienda" type="submit" name="tienda" value="tienda">
                                    <input type="hidden" name="origen" value="nosotros">
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

        <h1 class="titulo_seccion">NUESTRO FUNDADOR: ALBERTO GARCÍA</h1>

        <div class="main_div_fundador">

            <img src="${pageContext.request.contextPath}/nosotros/images/alberto_garcia.jpg" alt="Alberto García"
                 height="550">

            <div>
                <ul>
                    <li id="dato1">Alberto García es el productor musical más importante de España</li>
                    <li id="dato2">Ha producido álbumes para artistas de talla mundial como The Beatles, Spice Girls y
                        2PAC
                    </li>
                    <li id="dato3">En <strong>1992</strong> Alberto funda Estudio 33 con el objetivo de que en España
                        haya unos estudios de producción modernos capaces de rivalizar con los más importantes del mundo
                    </li>
                </ul>
            </div>

        </div>
    </section>
    <section>
        <h1 class="titulo_seccion">DESDE ENTONCES HA PASADO TODO ESTO</h1>


        <div class="w3-content w3-display-container slideshow">
            <article class="w3-display-container mySlides">
                <img src="${pageContext.request.contextPath}/nosotros/images/daft_punk_tour.jpg"
                     alt="Daft Punk en el tour Alive 2007" height="375" width="500"
                     class="imagen_logro">
                <div class="w3-display-bottom  w3-container w3-padding-16 ">
                    <p class="fecha">15 DE AGOSTO DE 2007</p>
                    <p>La gira del album de Daft Punk producido en nuestro estudio <em>Musique Vol 1</em> vende más de
                        un millón de entradas alrededor del mundo</p>
                </div>
            </article>

            <article class="w3-display-container mySlides">
                <img src="${pageContext.request.contextPath}/nosotros/images/the_weeknd_grammy.jpg"
                     alt="The Weeknd con un Grammy" height="375" width="500"
                     class="imagen_logro">
                <div class="w3-display-bottom  w3-container w3-padding-16">
                    <p class="fecha">17 DE OCTUBRE DE 2015</p>
                    <p>Un album producido en nuestro estudio gana un grammy: Beauty Behind the Madness de The Weeknd</p>
                </div>
            </article>

            <article class="w3-display-container mySlides">
                <img src="${pageContext.request.contextPath}/nosotros/images/billboard.jpg" alt="Billboard" height="375"
                     width="500" class="imagen_logro">
                <div class="w3-display-bottom  w3-container w3-padding-16">
                    <p class="fecha">12 DE DICIEMBRE DE 2017</p>
                    <p>La revista Billboard nos cataloga dentro de su top 50 mejores estudios de grabación</p>
                </div>
            </article>

            <button class="w3-button w3-display-left w3-black boton_slideshow" onclick="plusDivs(-1)">&#10094;</button>
            <button class="w3-button w3-display-right w3-black boton_slideshow" onclick="plusDivs(1)">&#10095;</button>
        </div>

        <script>
            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
                showDivs(slideIndex += n);
            }

            function showDivs(n) {
                var i;
                var x = document.getElementsByClassName("mySlides");
                if (n > x.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = x.length
                }
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                x[slideIndex - 1].style.display = "block";
            }
        </script>

        <h2 class="frase_enfasis_fin_de_seccion">Y SOLO ACABA DE EMPEZAR</h2>

    </section>

    <section>
        <h1 class="titulo_seccion">CONTACTA CON NOSOTROS</h1>
        <div class="main_div_contacto">
            <div class="todo_menos_ubicacion">
                <p>Correo electrónico: <a href="mailto:estudio33@gmail.com">estudio33@gmail.com</a></p>
                <p>Número de teléfono: 656 44 55 96</p>
                <div class="redes_sociales">
                    <a href="https://www.instagram.com/">
                        <img src="${pageContext.request.contextPath}/nosotros/images/instagram.png" alt="Instagram"
                             height="50" width="50">
                    </a>
                    <a href="https://www.twitter.com/">
                        <img src="${pageContext.request.contextPath}/nosotros/images/twitter.png" alt="Twitter"
                             height="50" width="50">
                    </a>
                </div>
                <section class="enviar_curriculum">
                    <h2>¿Quieres trabajar con nosotros?</h2>
                    <form action="javascript:alert('¡Se ha enviado correctamente!');" method="post">

                        <b>Deposita tu currículum aquí</b> <input type='file' id="curriculum" size=30>

                        <input type='submit' name='enviar' value='Enviar currículum'>
                    </form>
                </section>
            </div>

            <section class="ubicacion">
                <h2>UBICACIÓN: CALLE REAL 156 BARCELONA</h2>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d95777.52881590926!2d2.0787278077049933!3d41.394768814516006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a49816718e30e5%3A0x44b0fb3d4f47660a!2sBarcelona!5e0!3m2!1ses!2ses!4v1602950862785!5m2!1ses!2ses"
                        width="400" height="300" frameborder="0" style="border:0;" allowfullscreen=""
                        aria-hidden="false" tabindex="0"></iframe>
            </section>
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
<script src="${pageContext.request.contextPath}/assets/assets.js"></script>

</body>

</html>