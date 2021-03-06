<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="estudio, 33, estudio33"/>
    <meta name="author" content="Javier Rodríguez Viñas">
    <meta name="copyright" content="Javier Rodríguez Viñas"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/registrarse/registrarse.css">
    <title>Estudio 33</title>
</head>


<!-- Formato del color de la página -->
<c:choose>
<c:when test="${not empty origen}">
<body class="<c:out value="${origen}"/>">
</c:when>
<c:otherwise>
<body>
</c:otherwise>
</c:choose>

<h1 class="titulo_pagina">
    Regístrate
</h1>

<form method="post" action="RegistrarseServlet">
    <section>
        <p>Introduce tu DNI (obligatorio):</p>
        <c:if test="${not empty error}">
            <p class="error">Error en el registro: ya hay un usuario con este DNI</p>
        </c:if>
        <label>
            <input type="text" required="required" autocomplete="on" name="dni" pattern="^[0-9]{8}[A-Za-z]$">
        </label>
    </section>
    <section>
        <p>Introduce tu nombre (obligatorio):</p>
        <label>
            <input type="text" required="required" autocomplete="on" name="nombre"
                   pattern="^\S+( \S+)?$" title="El nombre no puede contener números">
        </label>
    </section>
    <section>
        <p>Introduce tus apellidos (obligatorio):</p>
        <label>
            <input type="text" required="required" autocomplete="on" name="apellidos"
                   pattern="^\S+ \S+$"
                   title="Solo puede haber dos apellidos y solo pueden contener letras">
        </label>
    </section>
    <section>
        <p>Introduce tu contraseña (obligatorio):</p>
        <label>
            <input type="password" required="required" name="password" autocomplete="on" pattern="\S{8,}"
                   title="La contraseña tiene que tener mínimo 8 caracteres">
        </label>
    </section>
    <section>
        <p>Introduce un correo electrónico de contacto (obligatorio):</p>
        <label>
            <input type="email" required="required" name="correo" autocomplete="on" pattern="^\S+@\S+\.\S+$"
                   title="Una dirección de correo debe contener una símbolo '@' y un punto">
        </label>
    </section>
    <section>
        <p>Introduce un teléfono (obligatorio):</p>
        <label>
            <input type="text" required="required" name="telefono" autocomplete="on" pattern="^[0-9]{9}$"
                   title="Un número de teléfono solo puede contener 9 cifras numéricas">
        </label>
    </section>
    <section>
        <p>Introduce una fecha de nacimiento (obligatorio):</p>
        <label>
            <input type="date" required="required" name="fecha_nacimiento" min="1900-1-1" max="2000-1-1"
                   title="Recuerda que debes tener más de 18 años para registrarte">
        </label>
    </section>
    <section>
        <p>Selecciona el tipo de usuario que eres (obligatorio):</p>
        <ul>
            <li>
                <input type="radio" id="r1" name="tipo_usuario" value="manager" required="required"><label for="r1">Soy mánager de un artista o grupo musical</label>
            </li>
            <li>
                <input type="radio" id="r2" name="tipo_usuario" value="artista"><label for="r2">Soy un artista o
                grupo musical</label>
            </li>
            <li>
                <input type="radio" id="r3" name="tipo_usuario" value="normal"><label for="r3">Otro</label>
            </li>
        </ul>
    </section>
    <section>
        <p>Introduce tu número de tarjeta bancaria para futuras compras:</p>
        <input type="text" autocomplete="on" id="tarjeta" name="tarjeta"
               pattern="^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}$"
               title="Las tarjetas bancarias tienen 4 grupos de 4 cifras numéricas separadas por guiones '-'">
    </section>
    <section>
        <p>Introduce el código CSC de la tarjeta</p>
        <input type="text" id="pin_tarjeta" name="pin_tarjeta" autocomplete="on" pattern="^[0-9]{4,6}$"
               title="El pin de una tarjeta tiene entre 4 y 6 cifras numéricas" disabled>
    </section>
    <input type="submit" value="Registrarse en Estudio33">
</form>


<script src="${pageContext.request.contextPath}/assets/jQuery.js"></script>
<script src="${pageContext.request.contextPath}/registrarse/registrarse.js"></script>


</body>
</html>
