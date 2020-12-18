<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="estudio, 33, estudio33"/>
    <meta name="author" content="Javier Rodríguez Viñas">
    <meta name="copyright" content="Javier Rodríguez Viñas"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/iniciar_sesion/iniciar_sesion.css">
    <title>Estudio 33</title>
</head>
<c:choose>
<c:when test="${not empty origen}">
<body class="<c:out value="${origen}"/>">
</c:when>
<c:otherwise>
<body>
</c:otherwise>
</c:choose>


<h1 class="titulo_pagina">
    Inicia sesión
</h1>

<div class="contenido_pop_up">
    <form method="post" action="IniciarSesionServlet">
        <p>Introduce tu identificación (DNI):</p>
        <label>
            <input type="text" required="required" id="dni" autocomplete="on" name="dni" pattern="^[0-9]{8}[A-Za-z]$"
                   title="El DNI se compone de 8 números y una letra mayúscula/minúscula">
        </label><br>
        <p>Introduce tu contraseña:</p>
        <label>
            <input type="password" required="required" name="password" autocomplete="on" pattern="\S{8,}"
                   title="La contraseña tiene que tener mínimo 8 caracteres">
        </label><br>
        <!-- Revisar formulario como lo tiene el men -->
        <input type="submit" value='Iniciar sesión'>
    </form>
</div>


<c:if test="${not empty error}">
    <span class="error_login">Error al iniciar sesión: no hay un usuario ese DNI y esa clave </span>
</c:if>


<span class="resgitrarse_desde_iniciar_sesion">¿Aún no estás registrado? Regístrate <a
        href="${pageContext.request.contextPath}/registrarse/registrarse.jsp" class="link_registro">aquí</a></span>


</body>
</html>
