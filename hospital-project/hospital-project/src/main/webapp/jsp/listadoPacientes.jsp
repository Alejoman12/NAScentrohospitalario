<%@ page import="com.hospital.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = (sesion != null) ? (Usuario) sesion.getAttribute("usuario") : null;

    if (sesion != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
    }

    if (usuario == null || !"Recepcionista".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, width=device-width">
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/styles-listadoPacientes.css" />
    <!-- Mantengo la referencia a la fuente como la tenías (no modifiqué rutas ni estilos) -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=[object Object]&display=swap" />
    <title>Listado de Pacientes</title>
</head>
<body>
<div class="app">
    <!-- SIDEBAR: botones laterales (se mantienen con sus rutas originales) -->
    <aside class="sidebar">
        <div class="branding">
            <img class="logo" src="${pageContext.request.contextPath}/imgenes/Icono_rendimiento_hospital.svg" alt="logo">
            <div class="role">Recepcionista</div>
        </div>

        <nav class="nav">
            <form action="<%= request.getContextPath() %>/jsp/agendarCita.jsp" method="get">
                <button class="nav-btn" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/IconAgenda.svg" alt="">
                    <span>Agendar cita</span>
                </button>
            </form>

            <button class="nav-btn primary" type="button">
                <img src="${pageContext.request.contextPath}/imgenes/IconHistorialPaciente.svg" alt="">
                <span>Ver listado de pacientes</span>
            </button>

            <form action="<%= request.getContextPath() %>/jsp/consultarDisponibilidad.jsp" method="get">
                <button class="nav-btn" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/IconDianostico.svg" alt="">
                    <span>Consultar disponibilidad</span>
                </button>
            </form>

            <form action="<%= request.getContextPath() %>/" method="get">
                <button class="nav-btn danger" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt="">
                    <span>Cerrar sesión</span>
                </button>
            </form>
        </nav>

        <div class="profile">
            <div class="avatar">RC</div>
            <div class="profile-info">
                <div class="user-card__name"><%= usuario.getNombre() != null ? usuario.getNombre() : "Recepcionista" %></div>
                <div class="user-card__email"><%= usuario.getCorreo() != null ? usuario.getCorreo() : "--" %></div>
            </div>
        </div>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="main">
        <header class="main-header">
            <h1>Listado de Pacientes</h1>
            <p>Gestiona y consulta la información de todos los pacientes registrados</p>
        </header>

        <section class="controls">
            <div class="filters">
                <select name="estado" class="select-estado">
                    <option>Todos los estados</option>
                    <option>Activo</option>
                    <option>Inactivo</option>
                </select>
            </div>

            <!-- BUSCADOR FUNCIONAL -->
            <form class="search-form" action="<%= request.getContextPath() %>/jsp/listadoPacientes.jsp" method="get">
                <input
                        class="search-input"
                        type="text"
                        name="q"
                        placeholder="Buscar por nombre o ID..."
                        aria-label="Buscar por nombre o ID"
                />
                <button type="submit" class="search-submit">Buscar</button>
            </form>

            <!-- TARJETAS DE ESTADÍSTICAS -->
            <div class="stats">
                <div class="stat card-accent">
                    <div class="stat-title">Total Pacientes</div>
                    <div class="stat-value">8</div>
                </div>
                <div class="stat card-light">
                    <div class="stat-title">Activos</div>
                    <div class="stat-value">6</div>
                </div>
                <div class="stat card-light">
                    <div class="stat-title">Inactivos</div>
                    <div class="stat-value">2</div>
                </div>
            </div>
        </section>

        <!-- TABLA: mantuve el contenido de filas igual al original -->
        <section class="table-wrap">
            <table class="patients-table" aria-label="Listado de pacientes">
                <thead>
                <tr>
                    <th>ID</th><th>Nombre</th><th>Edad</th><th>Género</th><th>Teléfono</th><th>Última Visita</th><th>Estado</th>
                </tr>
                </thead>
                <tbody>
                <tr><td>P-001</td><td>María García López</td><td>35</td><td>Femenino</td><td>+34 612 345 678</td><td>14 de noviembre de 2025</td><td class="status active">Activo</td></tr>
                <tr><td>P-002</td><td>Juan Martínez Ruiz</td><td>42</td><td>Masculino</td><td>+34 623 456 789</td><td>19 de noviembre de 2025</td><td class="status active">Activo</td></tr>
                <tr><td>P-003</td><td>Ana Rodríguez Sánchez</td><td>28</td><td>Femenino</td><td>+34 634 567 890</td><td>4 de octubre de 2025</td><td class="status active">Activo</td></tr>
                <tr><td>P-004</td><td>Carlos Fernández Torres</td><td>56</td><td>Masculino</td><td>+34 645 678 901</td><td>27 de noviembre de 2025</td><td class="status active">Activo</td></tr>
                <tr><td>P-005</td><td>Laura Pérez Gómez</td><td>31</td><td>Femenino</td><td>+34 656 789 012</td><td>11 de septiembre de 2025</td><td class="status inactive">Inactivo</td></tr>
                <tr><td>P-006</td><td>Miguel Ángel Díaz</td><td>47</td><td>Masculino</td><td>+34 667 890 123</td><td>29 de noviembre de 2025</td><td class="status active">Activo</td></tr>
                <tr><td>P-007</td><td>Isabel Moreno Cruz</td><td>39</td><td>Femenino</td><td>+34 678 901 234</td><td>24 de noviembre de 2025</td><td class="status active">Activo</td></tr>
                <tr><td>P-008</td><td>Francisco López Martín</td><td>63</td><td>Masculino</td><td>+34 689 012 345</td><td>19 de agosto de 2025</td><td class="status inactive">Inactivo</td></tr>
                </tbody>
            </table>

            <div class="table-footer">
                Mostrando 8 de 8 pacientes
            </div>
        </section>
    </main>
</div>
</body>
</html>
