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
<body>

<h1 class="titulo_pagina">
    Inicia sesión
</h1>


<div class="contenido_pop_up">
    <form>
        <p>Introduce tu identificación (DNI):</p>
        <label>
            <input type="text" required="required" id="dni" name="dni" pattern="^[0-9]{8,8}[A-Za-z]$">
        </label><br>
        <p>Introduce tu contraseña:</p>
        <label>
            <input type="password" required="required" name="password" id="password" pattern="[A-Za-z0-9_]{8,}">
        </label><br>
        <!-- Revisar formulario como lo tiene el men -->
        <input id="boton_iniciar_sesion" type="button" value='Iniciar sesión'>
        <span id="error_inicio_sesion"></span>
    </form>
</div>

<c:when test="${not empty error_iniciar_sesion}">
    <span class="error_loguin">Error al iniciar sesión: <c:out value="${error_iniciar_sesion}"/> </span>
</c:when>


<span class="resgitrarse_desde_iniciar_sesion">¿Aún no estás registrado? Regístrate <a
        href="index.jsp">aquí</a></span>


</body>
</html>
