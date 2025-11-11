<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cambiar contraseña</title>
</head>
<body>
    <h2>Restablecer contraseña</h2>

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
    <c:if test="${not empty mensaje}">
        <p style="color:green;">${mensaje}</p>
    </c:if>

    <form action="../cambiarContrasena" method="post">
        <input type="hidden" name="token" value="${param.token}">
        <label>Nueva contraseña:</label><br>
        <input type="password" name="nuevaContrasena" required><br><br>

        <button type="submit">Guardar nueva contraseña</button>
    </form>
</body>
</html>
