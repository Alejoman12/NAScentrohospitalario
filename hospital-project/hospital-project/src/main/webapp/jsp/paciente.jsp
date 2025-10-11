<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = null;

    if (sesion != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
    }

    if (usuario == null || !"Paciente".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Paciente</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-vista-paciente.css">
</head>
<body>
<div class="dashboard">

    <aside class="sidebar">
        <h1>Hospital</h1>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/verCitasPaciente">Ver mis citas</a></li>
                <li><a href="actualizarPaciente.jsp">Actualizar datos</a></li>
            </ul>
        </nav>
        <form action="<%= request.getContextPath() %>/cerrarSesion" method="get">
            <button class="logout-btn" type="submit">Cerrar sesión</button>
        </form>
    </aside>

</div>
</body>
</html>
