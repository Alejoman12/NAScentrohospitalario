<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = null;

    if (sesion != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
    }

    if (usuario == null || !"Medico".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Médico</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-vista-medico.css">
</head>
<body>
<div class="dashboard">

    <aside class="sidebar">
        <h1>Hospital</h1>
        <nav>
            <ul>
                <li><a href="#">Citas del día</a></li>
                <li><a href="#">Historial de pacientes</a></li>
                <li><a href="#">Registrar diagnóstico</a></li>
                <!-- ✅ Enlace corregido con contextPath -->
                <li><a href="<%= request.getContextPath() %>/jsp/actualizarMedico.jsp">Actualizar datos</a></li>
            </ul>
        </nav>
        <form action="<%= request.getContextPath() %>/cerrarSesion" method="get">
            <button class="logout-btn" type="submit">Cerrar sesión</button>
        </form>
    </aside>

</div>
</body>
</html>
