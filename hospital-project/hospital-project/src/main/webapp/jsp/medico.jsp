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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Médico</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-Medico.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="dashboard">
    <aside class="sidebar">
        <h1><img src="../imgenes/IconMedico.svg" alt="Medico" class="icono-logo"> Medico</h1>

        <nav>
            <ul>
                <li><a href="#"><img src="../imgenes/IconAgenda.svg" class="icono-menu" alt="">Citas del día</a></li>
                <li><a href="#"><img src="../imgenes/IconHistorialPaciente.svg" class="icono-menu" alt="">Historial de pacientes</a></li>
                <li><a href="#"><img src="../imgenes/IconDianostico.svg" class="icono-menu" alt="">Registrar diagnóstico</a></li>
                <li><a href="<%=request.getContextPath()%>/jsp/actualizarMedico.jsp">
                    <img src="../imgenes/IconTuerca.svg" class="icono-menu" alt="">Actualizar datos</a></li>
            </ul>
        </nav>

        <!-- Botón de Cerrar Sesión con estilo -->
        <form action="<%= request.getContextPath() %>/index.jsp" method="post">
            <button type="submit" class="logout-btn">
                <img src="../imgenes/IconFlechaIzquierda.svg" class="icono-menu" alt="Cerrar sesion">
                Cerrar sesión
            </button>
        </form>
    </aside>

    <main class="contenido-principal">
        <h1>Bienvenido, Dr. Nicolás Cardona</h1>
        <p>Seleccione una opción del menú lateral para comenzar.</p>
    </main>
</div>
</body>
</html>
