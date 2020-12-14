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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/clientes/clientes.css">
    <title>Estudio 33</title>
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
                                            <input type="hidden" name="origen" value="clientes">
                                            <input type="submit" name="iniciar_sesion" value="Iniciar sesión">
                                        </form>
                                    </li>
                                    <li>
                                        <form method="post" action="${pageContext.request.contextPath}/RegistrarseServlet">
                                            <input type="hidden" name="origen" value="clientes">
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
                                <input type="hidden" name="origen" value="clientes">
                                <div class="id_usuario" id="id_usuario"> Bienvenido <c:out
                                        value="${usuario.nombre}"/></div>
                            </form>
                            <div class="wrapper_icono_tienda">
                                <form method="post" action="${pageContext.request.contextPath}/TiendaServlet">
                                    <input id="ir_tienda" type="submit" name="tienda" value="tienda">
                                    <input type="hidden" name="origen" value="clientes">
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
    <section class="reseñas_de_artistas">
        <h1 class="titulo_seccion">
            ESTUDIO 33 ES UNA SUCESIÓN DE EXITOS
        </h1>

        <div class="fichas_artistas">
            <div class="animacion_artistas" id="artistas">
            </div>

        </div>

    </section>

    <section class="albumes_de_artistas">
        <h1 class="titulo_seccion">
            NUESTROS PROYECTOS DESTACADOS
        </h1>

        <div class="albumes">

            <article class="album">
                <a href="https://open.spotify.com/album/5DJc5qCdB5pPrDO97LXjeW?si=G4baQBtwSiu_DoASzyLH5g"
                   target="_blank">
                    <img src="${pageContext.request.contextPath}/clientes/images/one_more_love.jpg" alt="One More Love"
                         width="300" , height="300">
                </a>
            </article>

            <article class="album">
                <a href="https://open.spotify.com/album/58WSd6SDPOcbnnJ2tq0Ph8?si=bGzAOhq-TZm5t1gWg4gqLg"
                   target="_blank">
                    <img src="${pageContext.request.contextPath}/clientes/images/the_fame_monster.jpg"
                         alt="The Fame Monster" width="300" , height="300">
                </a>
            </article>

            <article class="album">
                <a href="https://open.spotify.com/album/2ODvWsOgouMbaA5xf0RkJe?si=EY5_y1G4QU6U9zYdF5EbfA"
                   target="_blank">
                    <img src="${pageContext.request.contextPath}/clientes/images/starboy.jpg" alt="Starboy" width="300"
                         , height="300">
                </a>
            </article>

            <article class="album">
                <a href="https://open.spotify.com/album/1xn54DMo2qIqBuMqHtUsFd?si=lN9eZ7w2Qqi5JQGgPqOPnA"
                   target="_blank">
                    <img src="${pageContext.request.contextPath}/clientes/images/x.jpg" alt="X" width="300"
                         height="300">
                </a>
            </article>

            <article class="album">
                <a href="https://open.spotify.com/album/5fPglEDz9YEwRgbLRvhCZy?si=QdlnFZGSS-OQJXNz1YMVGQ"
                   target="_blank">
                    <img src="${pageContext.request.contextPath}/clientes/images/graduation.jpg" alt="X" width="300" ,
                         height="300">
                </a>
            </article>

            <article class="album">
                <a href="https://open.spotify.com/album/4KdtEKjY3Gi0mKiSdy96ML?si=5KpVIvThSe-Y4g4gEJRE4Q"
                   target="_blank">
                    <img src="${pageContext.request.contextPath}/clientes/images/invasion_of_privacity.jpg" alt="X"
                         width="300" , height="300">
                </a>
            </article>

            <article class="album">
                <a href="https://open.spotify.com/album/7ycBtnsMtyVbbwTfJwRjSP?si=2lTOS8BYRaKop2pGqTpP0A"
                   target="_blank">
                    <img src="${pageContext.request.contextPath}/clientes/images/to_pimp_a_butterfly.jpg" alt="X"
                         width="300" , height="300">
                </a>
            </article>

            <article class="album">
                <a href="https://open.spotify.com/album/7mgdTKTCdfnLoa1HXHvLYM?si=aKkMJxbNQ0eeAjvC7sl34A"
                   target="_blank">
                    <img src="${pageContext.request.contextPath}/clientes/images/lil_uzi_vert_vs_the_world.jpg" alt="X"
                         width="300" , height="300">
                </a>
            </article>
        </div>


        <div class="mas_albumes">
            <p>
                ...Y MUCHOS MÁS
            </p>

            <form action="https://open.spotify.com/playlist/7cpsiaUizVTdQFm0nsF8RL?si=uYzIzHfrT1KkeSRLzJCi7Q"
                  target="_blank">
                <input type="submit" value="VER LA BIBLIOTECA COMPLETA"/>
            </form>
        </div>


    </section>


    <section class="texto_fin">
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <div class="texto_destacado_relleno">
            ¿A QUÉ ESPERAS PARA SER PARTE DE ESTA HISTORIA?
        </div>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
        <a class="texto_destacado_vacio">ESTUDIO 33 </a>
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
<script src="${pageContext.request.contextPath}/clientes/clientes.js"></script>
<script src="${pageContext.request.contextPath}/assets/assets.js"></script>
</body>

</html>