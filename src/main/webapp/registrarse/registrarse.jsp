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
        <p>Introduce tu identificación (DNI):</p>
        <label>
            <input type="text" required="required" autocomplete="on" name="dni" pattern="^[0-9]{8}[A-Za-z]$">
        </label>
    </section>
    <section>
        <p>Introduce tu nombre:</p>
        <label>
            <input type="text" required="required" autocomplete="on" name="nombre" pattern="^[A-Za-z]{1,}">
        </label>
    </section>
    <section>
        <p>Introduce tus apellidos:</p>
        <label>
            <input type="text" required="required" autocomplete="on" name="apellidos"
                   pattern="^[A-Z]{1}[a-z]{2,}[ ][A-Z]{1}[a-z]{2,}">
        </label>
    </section>
</form>


</body>
</html>
