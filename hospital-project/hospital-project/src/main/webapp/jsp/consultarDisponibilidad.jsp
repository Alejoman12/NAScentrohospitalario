<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="com.hospital.dao.PacienteDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = (sesion != null) ? (Usuario) sesion.getAttribute("usuario") : null;

    if (usuario == null || !"Recepcionista".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>

<%
    // ==== CORREGIDO ====
    String idMedico = request.getParameter("medicoId");
    String fechaHora = request.getParameter("fechaHora");  // <--- este era el error

    String mensaje = null;

    if (idMedico != null && fechaHora != null && !idMedico.isEmpty() && !fechaHora.isEmpty()) {

        try {
            PacienteDAO dao = new PacienteDAO();
            boolean disponible = dao.tieneDisponibilidad(idMedico, fechaHora);

            if (disponible) {
                mensaje = "El médico con ID " + idMedico + " SÍ tiene disponibilidad el día y hora: " + fechaHora.replace('T',' ');
            } else {
                mensaje = "El médico con ID " + idMedico + " NO tiene disponibilidad el día y hora: " + fechaHora.replace('T',' ');
            }

        } catch (Exception e) {
            mensaje = "Ocurrió un error validando disponibilidad.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, width=device-width">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-consultarDisponibilidad.css" />
    <title>Consultar Disponibilidad</title>
</head>
<body>
<div class="page">

    <!-- SIDEBAR -->
    <aside class="sidebar" aria-label="Menú lateral">
        <header class="sidebar-header">
            <img class="brand-img" alt="" src="${pageContext.request.contextPath}/imgenes/Icono_rendimiento_hospital.svg" />
            <div class="brand-info">
                <div class="role">Recepcionista</div>
            </div>
        </header>

        <nav class="sidebar-menu" aria-label="Acciones">
            <form action="<%= request.getContextPath() %>/jsp/agendarCita.jsp" method="get">
                <button type="submit" class="menu-btn">
                    <img src="${pageContext.request.contextPath}/imgenes/IconAgenda.svg" alt="">
                    <span>Agendar cita</span>
                </button>
            </form>

            <form action="<%= request.getContextPath() %>/ListarPacientes" method="get">
                <button class="menu-btn" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/IconHistorialPaciente.svg" alt="">
                    <span>Ver listado de pacientes</span>
                </button>
            </form>

            <button class="menu-btn active" aria-current="page">
                <img src="${pageContext.request.contextPath}/imgenes/IconDianostico.svg" alt="">
                <span>Consultar disponibilidad</span>
            </button>

            <form action="<%= request.getContextPath() %>/Logout" method="post">
                <button class="menu-btn logout" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt="">
                    <span>Cerrar sesión</span>
                </button>
            </form>
        </nav>

        <footer class="sidebar-footer">
            <div class="avatar">RC</div>
            <div class="user-info">
                <div class="user-card__name"><%= usuario.getNombre() != null ? usuario.getNombre() : "Recepcionista" %></div>
                <div class="user-card__email"><%= usuario.getCorreo() != null ? usuario.getCorreo() : "--" %></div>
            </div>
        </footer>
    </aside>

    <!-- CONTENIDO PRINCIPAL -->
    <main class="main-content" role="main">
        <section class="hero">
            <div class="hero-wrapper">
                <img class="hero-image" src="${pageContext.request.contextPath}/imgenes/imagenAgendarCita.jpg" alt="imagen">

                <div class="hero-overlay">
                    <div class="brand">
                        <div class="brand-text">
                            <h1>NAS Centro hospitalario</h1>
                            <p class="tagline">Sistema de Salud</p>
                        </div>
                    </div>

                    <h2 class="title">Agenda tu cita</h2>
                    <p class="subtitle">médica fácilmente</p>
                    <p class="description">Programa tus consultas de manera rápida y segura con nuestro sistema en línea.</p>

                    <div class="cards">
                        <div class="card">
                            <div class="card-title">Agenda flexible</div>
                            <div class="card-text">Elige la fecha y hora que mejor se ajuste a ti</div>
                        </div>
                        <div class="card">
                            <div class="card-title">Especialistas calificados</div>
                            <div class="card-text">Médicos certificados y experimentados</div>
                        </div>
                        <div class="card">
                            <div class="card-title">Confirmación inmediata</div>
                            <div class="card-text">Recibe notificación al instante</div>
                        </div>
                    </div>

                    <p class="copyright">© 2025 NAS Centro hospitalario. Todos los derechos reservados</p>
                </div>
            </div>
        </section>

        <!-- PANEL CONSULTA -->
        <aside class="panel">
            <h3>Consultar Disponibilidad</h3>
            <p class="panel-sub">Busque horarios disponibles para su consulta médica</p>

            <form class="search-form" method="get" action="">
                <label for="medicoId" class="label">ID del Médico</label>
                <input id="medicoId" name="medicoId" type="text" placeholder="Ingrese el ID del médico" class="input" />

                <label for="fechaHora" class="label">Fecha y hora *</label>
                <input id="fechaHora" name="fechaHora" type="datetime-local" class="input" required />

                <label for="especialidad" class="label">Especialidad</label>
                <select id="especialidad" name="especialidad" class="select">
                    <option value="">Seleccione una especialidad</option>
                    <option>Cardiología</option>
                    <option>Dermatología</option>
                    <option>Pediatría</option>
                    <option>Traumatología</option>
                    <option>Neurología</option>
                </select>

                <button type="submit" class="primary-btn">Buscar Disponibilidad</button>

                <% if (mensaje != null) { %>
                <div style="margin-top:15px; padding:12px; background:#e8f0fe; color:#0b57d0; border-radius:8px;">
                    <%= mensaje %>
                </div>
                <% } %>
            </form>

        </aside>
    </main>
</div>
</body>
</html>
