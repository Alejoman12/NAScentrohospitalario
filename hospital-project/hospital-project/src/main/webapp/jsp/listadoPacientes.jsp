<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Paciente" %>
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

            <form action="<%= request.getContextPath() %>/ListarPacientes" method="get">
                <button class="nav-btn primary" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/IconHistorialPaciente.svg" alt="">
                    <span>Ver listado de pacientes</span>
                </button>
            </form>


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

            <!-- BUSCADOR FUNCIONAL -->
            <form class="search-form" action="<%= request.getContextPath() %>/ListarPacientes" method="get">

                <!-- Campo de búsqueda -->
                <input
                        class="search-input"
                        type="text"
                        name="busqueda"
                        value="${busqueda}"
                        placeholder="Buscar por nombre, ID o documento..."
                        aria-label="Buscar por nombre o ID"
                />

                <!-- Select para filtrar -->
                <select name="estado" class="select-estado">
                    <option value="todos"   ${estado == "todos"   ? "selected" : ""}>Todos</option>
                    <option value="activo"  ${estado == "activo"  ? "selected" : ""}>Activos</option>
                    <option value="inactivo"${estado == "inactivo"? "selected" : ""}>Inactivos</option>
                </select>

                <button type="submit" class="search-submit">Buscar</button>
            </form>


            <!-- TARJETAS DE ESTADÍSTICAS -->
            <div class="stats">
                <div class="stat card-accent">
                    <div class="stat-title">Total Pacientes</div>
                    <div class="stat-value">${totalPacientes}</div>
                </div>
                <div class="stat card-light">
                    <div class="stat-title">Activos</div>
                    <div class="stat-value">${activosPacientes}</div>
                </div>
                <div class="stat card-light">
                    <div class="stat-title">Inactivos</div>
                    <div class="stat-value">${inactivosPacientes}</div>
                </div>
            </div>
        </section>

        <!-- TABLA: mantuve el contenido de filas igual al original -->
        <section class="table-wrap">
            <table class="patients-table" aria-label="Listado de pacientes">
                <thead>
                <tr>
                    <th>ID</th><th>Nombre</th><th>Fecha de Nacimiento</th><th>Género</th><th>Teléfono</th><th>Documento</th><th>Estado</th>
                </tr>
                </thead>
                <%
                    List<Paciente> pacientes = (List<Paciente>) request.getAttribute("pacientes");
                    if (pacientes != null && !pacientes.isEmpty()) {
                        for (Paciente p : pacientes) {
                %>
                <tr>
                    <td><%= p.getIdPaciente() %></td>
                    <td><%= p.getNombreUsuario() %></td>
                    <td><%= p.getFechaNacimiento() %></td>
                    <td><%= p.getGenero() %></td>
                    <td><%= p.getTelefono() %></td>
                    <td><%= p.getDocumentoIdentidad() %></td>
                    <td><%= p.isActivo() ? "Activo" : "Inactivo" %></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5">No se encontraron pacientes.</td>
                </tr>
                <% } %>
                </tbody>
            </table>

            <div class="table-footer">
                Mostrando ${totalPacientes} pacientes

            </div>
        </section>
    </main>
</div>
</body>
</html>
