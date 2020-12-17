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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/servicios/servicios.css">
    <title>Estudio 33</title>
</head>

<body>
<div class="outer-loader">
    <div class="inner-loader-img">
        <p class="text_loader">Cargando las tarifas...</p>
    </div>
</div>
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
            <li class="seccion_destacada">
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
                                            <input type="hidden" name="origen" value="servicios">
                                            <input type="submit" name="iniciar_sesion" value="Iniciar sesión">
                                        </form>
                                    </li>
                                    <li>
                                        <form method="post" action="${pageContext.request.contextPath}/RegistrarseServlet">
                                            <input type="hidden" name="origen" value="servicios">
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
                                <input type="hidden" name="origen" value="servicios">
                                <div class="id_usuario" id="id_usuario"> Bienvenido <c:out
                                        value="${usuario.nombre}"/></div>
                            </form>
                            <div class="wrapper_icono_tienda">
                                <form method="post" action="${pageContext.request.contextPath}/TiendaServlet">
                                    <input id="ir_tienda" type="submit" name="tienda" value="tienda">
                                    <input type="hidden" name="origen" value="servicios">
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
            CONTAMOS CON DIVERSAS TARIFAS Y PRECIOS PARA ADAPTARNOS A TI
        </h1>
        <div class="tarifas">
            <article class="tarifa" id="tarifa1">
                <h2 class="nombre_tarifa">
                    TARIFA BÁSICA
                </h2>
                <ul class="caracteristicas_tarifa">
                    <li>
                        Acceso a las tres salas
                    </li>
                    <li>
                        Solo 3 personas por sala
                    </li>
                    <li>
                        Solo 3 instrumentos musicales disponibles
                    </li>
                </ul>
                <p class="precio_tarifa">
                    40€ LA HORA
                </p>
            </article>
            <article class="tarifa" id="tarifa2">
                <h2 class="nombre_tarifa">
                    TARIFA NORMAL
                </h2>
                <ul class="caracteristicas_tarifa">
                    <li>
                        Acceso a las tres salas
                    </li>
                    <li>
                        Solo 5 personas por sala
                    </li>
                    <li>
                        Solo 10 instrumentos musicales disponibles
                    </li>
                    <li>
                        Masterizado de triple banda a 30 hercios
                    </li>
                    <li>
                        Apoyo de nuestros expertos
                    </li>
                </ul>
                <p class="precio_tarifa">
                    70€ LA HORA
                </p>
            </article>
            <article class="tarifa" id="tarifa3">
                <h2 class="nombre_tarifa">
                    TARIFA PREMIUM
                </h2>
                <ul class="caracteristicas_tarifa">
                    <li>
                        Acceso a las tres salas
                    </li>
                    <li>
                        Solo 20 personas por sala
                    </li>
                    <li>
                        Solo 30 instrumentos musicales disponibles
                    </li>
                    <li>
                        Masterizado de triple banda a 90 hercios
                    </li>
                    <li>
                        Apoyo de nuestros expertos
                    </li>
                    <li>
                        Acceso completo de todo nuestro software
                    </li>
                    <li>
                        Acceso al minibar
                    </li>
                </ul>
                <p class="precio_tarifa">
                    120€ LA HORA
                </p>
            </article>
        </div>

    </section>

    <section>
        <div class="reserva_y_formulario">
            <div class="decoracion_formulario">
                <h2>
                    RESERVA AHORA TU SESIÓN EN ESTUDIO 33
                </h2>
                <img src="${pageContext.request.contextPath}/servicios/images/daft_punk.jpg"
                     alt="Reserva en el estudio">
            </div>

            <form id="formulario_reserva" action="javascript:alert('¡Se ha enviado correctamente! ');" , method="POST">
                <h2>RELLENE TODOS LOS CAMPOS Y CONFIRME</h2>
                <div id="cuerpo_formulario_reserva">
                    <input type="text" name="fname" placeholder="Nombre"><br>
                    <input type="text" name="fname" placeholder="Apellidos"><br>
                    <input type="text" name="fname" placeholder="DNI"><br>
                    <input type='number' name='numero' placeholder="Teléfono de contacto" step=5><br>
                    <p>Selecciona una día y hora para la sesión:</p>
                    <input type='time' name='tempo' min="00:00" max="24:00"></label><br>
                    <input type='date' name='dia' min="1979-12-31" max="2100-01-02">
                    <p>Selecciona las salas de las que quieras disponer:</p>
                    <div class="salas">
                        <article class="sala">
                            <img src="${pageContext.request.contextPath}/servicios/images/sala_1.jpg" alt="Sala 1" ,
                                 height="200" , width="200"><br>
                            <input type='checkbox'>Sala 1<br>
                        </article>

                        <article class="sala">
                            <img src="${pageContext.request.contextPath}/servicios/images/sala_2.jpg" alt="Sala 1" ,
                                 height="200" , width="200"><br>
                            <input type='checkbox'>Sala 2<br>
                        </article>

                        <article class="sala">
                            <img src="${pageContext.request.contextPath}/servicios/images/sala_3.jpg" alt="Sala 1" ,
                                 height="200" , width="200"><br>
                            <input type='checkbox'>Sala 3<br>
                        </article>
                    </div>
                    <p>Selecciona una tarifa:</p>
                    <ul>
                        <li>
                            <input type='radio' id="nm1" value="Básica"><label for="nm1">Básica</label>
                        </li>
                        <li>
                            <input type='radio' id="nm2" value="Normal"><label for="nm2">Normal</label>
                        </li>
                        <li>
                            <input type='radio' id="nm3" value="Premium"><label for="nm3">Premium</label>
                        </li>
                    </ul>
                    <input type="text" name="fname" placeholder="Código de descuento (opcional)"><br>
                    <input type='submit' name='enviar' value='Enviar formulario '>
                </div>

            </form>
        </div>
    </section>

    <section>
        <h1 class="titulo_seccion">
            PREGUNTAS FRECUENTES
        </h1>
        <div class="preguntas_y_respuestas">
            <article class="pregunta_respuesta" id="pregunta_respuesta1">
                <p class="pregunta" id="pregunta1">
                    1. ¿Es posible llevar equipo propio al estudio?
                </p>
                <img src="./images/flechas_preguntas.svg" alt="flecha" class="flecha_pregunta" id="flecha_pregunta1">
                <p class="respuesta" id="respuesta1">
                    Si, mientras no exceda 50 kg de peso o supere los 10 metros de ancho / alto
                </p>
            </article>
            <article class="pregunta_respuesta" id="pregunta_respuesta2">
                <p class="pregunta" id="pregunta2">
                    2. ¿Se puede fumar en el estudio?
                </p>
                <img src="./images/flechas_preguntas.svg" alt="flecha" class="flecha_pregunta" id="flecha_pregunta2">
                <p class="respuesta" id="respuesta2">
                    Para conservar todo el equipamiento en perfecto estado está prohibido fumar en las instalaciones
                </p>
            </article>
            <article class="pregunta_respuesta" id="pregunta_respuesta3">
                <p class="pregunta" id="pregunta3">
                    3. ¿Se puede pasar la noche en el estudio?
                </p>
                <img src="./images/flechas_preguntas.svg" alt="flecha" class="flecha_pregunta" id="flecha_pregunta3">
                <p class="respuesta" id="respuesta3">
                    En sesiones especialmente intensas ofrecemos la posibilidad de pernoctar en las instalaciones
                </p>
            </article>
        </div>


    </section>

    <section>
        <h1 class="titulo_seccion">
            ¿TIENES ALGUN PROBLEMA CON LA RESERVA?
        </h1>
        <form id="formulario_incidencias" action="mailto:estudio33@gmail.com" target="_blank" method="post">
            <input type="email" name="fname" placeholder="Correo electrónico"><br>
            <textarea name='texto' rows=5 cols=50 placeholder="Cuéntanos tu problema"></textarea><br>
            <input type='submit' name='enviar ' value='Enviar incidencia '>
        </form>
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

<script src="${pageContext.request.contextPath}/servicios/servicios.js"></script>
<script src="${pageContext.request.contextPath}/assets/assets.js"></script>

</body>

</html>