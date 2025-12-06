<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>

<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = (sesion != null) ? (Usuario) sesion.getAttribute("usuario") : null;

    if (usuario == null || !"Recepcionista".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Corrección: se quitó el "==" -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-vista-recepcionista.css">

    <link href="https://fonts.googleapis.com/css2?family=Arimo:wght@400;600&display=swap" rel="stylesheet">
</head>

<body>

<div class="layout">
    <!-- Menú lateral -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <img src="<%= request.getContextPath() %>/imgenes/Icono_rendimiento_hospital.svg" alt="Logotipo" class="container-icon">
            <h2 class="title">Recepcionista</h2>
        </div>

        <nav class="menu">
            <form action="<%= request.getContextPath() %>/jsp/agendarCita.jsp" method="get">
                <button class="menu-btn">
                    <img src="${pageContext.request.contextPath}/imgenes/IconAgenda.svg" alt="">
                    <span>Agendar cita</span>
                </button>
            </form>

            <form action="<%= request.getContextPath() %>/jsp/listadoPacientes.jsp" method="get">
                <button class="menu-btn">
                    <img src="${pageContext.request.contextPath}/imgenes/IconHistorialPaciente.svg" alt="">
                    <span>Ver listado de pacientes</span>
                </button>
            </form>

            <form action="<%= request.getContextPath() %>/jsp/consultarDisponibilidad.jsp" method="get">
                <button class="menu-btn">
                    <img src="${pageContext.request.contextPath}/imgenes/IconDianostico.svg" alt="">
                    <span>Consultar disponibilidad</span>
                </button>
            </form>

            <form action="<%= request.getContextPath() %>/" method="post">
                <button class="menu-btn logout">
                    <img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt="">
                    <span>Cerrar sesión</span>
                </button>
            </form>
        </nav>

        <div class="sidebar-footer">
            <div class="avatar-circle">
                <span>RC</span>
            </div>
            <div class="user-info">
                <div class="user-card__name"><%= usuario.getNombre() != null ? usuario.getNombre() : "Recepcionista" %></div>
                <div class="user-card__email"><%= usuario.getCorreo() != null ? usuario.getCorreo() : "--" %></div>
            </div>



        </div>
    </aside>

    <!-- Contenido -->
    <main class="content">
        <h1 class="welcome">Bienvenido a su puesto de trabajo</h1>
        <p class="subtitle">Seleccione una opción del menú lateral para comenzar</p>
    </main>
</div>

</body>
</html>
