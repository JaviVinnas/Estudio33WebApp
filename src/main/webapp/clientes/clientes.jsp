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
            <li class="seccion_destacada">
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
                                        <form method="post"
                                              action="${pageContext.request.contextPath}/IniciarSesionServlet">
                                            <input type="hidden" name="origen" value="clientes">
                                            <input type="submit" name="iniciar_sesion" value="Iniciar sesión">
                                        </form>
                                    </li>
                                    <li>
                                        <form method="post" action="RegistrarseServlet">
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
                            <div class="id_usuario"> Bienvenido <c:out value="${usuario.nombre}"/></div>
                            <div class="wrapper_icono_tienda">
                                <form method="post" action="TiendaServlet">
                                    <input type="image" name="submit"
                                           src="${pageContext.request.contextPath}/assets/shopping-cart.svg"
                                           alt="submit" height="40" width="40">
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