<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="com.hospital.model.Paciente" %>
<%@ page import="com.hospital.model.Medico" %>
<%@ page import="com.hospital.model.Cita" %>
<%@ page session="true" %>
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
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, width=device-width">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-agendar-cita.css">
    <title>Agendar Cita - NAS</title>
</head>
<body>
<div class="formulario-de-agendar-cita">

    <!-- Sidebar -->
    <aside class="container33" aria-label="barra lateral">
        <div class="container34">
            <img class="container-icon7" src="${pageContext.request.contextPath}/imgenes/Icono_rendimiento_hospital.svg" alt="logo">
            <div class="heading-22"><div class="recepcionista">Recepcionista</div></div>
        </div>

        <nav class="list" aria-label="acciones recepcionista">
            <div class="list-item">
                <form action="<%= request.getContextPath() %>/jsp/agendarCita.jsp" method="get" style="margin:0">
                    <button class="button2" type="submit">
                        <img src="${pageContext.request.contextPath}/imgenes/IconAgenda.svg" alt="" style="width:20px;height:20px">
                        <span>Agendar cita</span>
                    </button>
                </form>
            </div>

            <div class="list-item">
                <form action="<%= request.getContextPath() %>/ListarPacientes" method="get">
                    <button class="button3" type="submit">
                        <img src="${pageContext.request.contextPath}/imgenes/IconHistorialPaciente.svg" alt="">
                        <span>Ver listado de pacientes</span>
                    </button>
                </form>
            </div>

            <div class="list-item">
                <form action="<%= request.getContextPath() %>/jsp/consultarDisponibilidad.jsp" method="get">
                    <button class="button3" type="submit">
                        <img src="${pageContext.request.contextPath}/imgenes/IconDianostico.svg" alt="" style="width:20px;height:20px">
                        <span>Consultar disponibilidad</span>
                    </button>
                </form>
            </div>

            <div class="list-item">
                <form action="<%= request.getContextPath() %>/" method="post" style="margin:0">
                    <button class="button5" type="submit">
                        <img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt="" style="width:20px;height:20px">
                        <span>Cerrar sesión</span>
                    </button>
                </form>
            </div>
        </nav>

        <div class="container35">
            <div class="primitivespan2"><div class="text6"><div class="rc">RC</div></div></div>
            <div style="margin-left:8px">
                <div class="recepcionista2"><%= usuario.getNombre() != null ? usuario.getNombre() : "Recepcionista" %></div>
                <div class="recepcionistahospitalcare"><%= usuario.getCorreo() != null ? usuario.getCorreo() : "--" %></div>
            </div>
        </div>
    </aside>

    <!-- Main -->
    <main class="main-area" role="main">
        <div class="hero-card">
            <!-- Left visual -->
            <div class="left-visual">
                <img class="imagewithfallback-icon" src="${pageContext.request.contextPath}/imgenes/imagenAgendarCita.jpg" alt="imagen">
                <div class="overlay">
                    <div style="display:flex;align-items:center;gap:12px">
                        <img class="container-icon" src="${pageContext.request.contextPath}/imgenes/.jpg" alt="">
                        <div>
                            <div style="font-weight:700">NAS Centro hospitalario</div>
                            <div class="paragraph">Sistema de Salud</div>
                        </div>
                    </div>

                    <div class="heading-3">Agenda tu cita <div class="mdica-fcilmente" style="font-weight:400">médica fácilmente</div></div>
                    <div class="paragraph2">Programa tus consultas de manera rápida y segura con nuestro sistema en línea.</div>

                    <div class="container10">
                        <div class="feature"><img src="${pageContext.request.contextPath}/imgenes/IconAgenda.svg" alt="" style="width:32px;height:32px;border-radius:999px"><div><strong>Agenda flexible</strong><div class="paragraph3">Elige la fecha y hora que mejor se ajuste a ti</div></div></div>
                        <div class="feature"><img src="${pageContext.request.contextPath}/imgenes/IconDosPersonasBlan.svg" alt="" style="width:32px;height:32px;border-radius:999px"><div><strong>Especialistas calificados</strong><div class="paragraph3">Médicos certificados y experimentados</div></div></div>
                        <div class="feature"><img src="${pageContext.request.contextPath}/imgenes/IconChuloEnCirculo.svg" alt="" style="width:32px;height:32px;border-radius:999px"><div><strong>Confirmación inmediata</strong><div class="paragraph3">Recibe notificación al instante</div></div></div>
                    </div>

                    <div style="margin-top:auto;font-size:14px;opacity:.7">© 2025 NAS Centro hospitalario. Todos los derechos reservados</div>
                </div>
            </div>

            <!-- Right form -->
            <section class="right-form">
                <div class="container18">
                    <div class="title">Agendar Nueva Cita</div>
                    <div class="subtitle">Complete el formulario para programar una nueva cita médica</div>
                </div>

                <!-- FORM: ajusta action según tu controlador/servlet -->
                <form class="form" action="<%= request.getContextPath() %>/agendarCita" method="post">

                    <div class="row">
                        <div class="col">
                            <label for="idPaciente">ID del Paciente *</label>
                            <div class="input-with-icon">
                                <img class="icon" src="${pageContext.request.contextPath}/imgenes/IconPersona.svg" alt="">
                                <input type="text" id="idPaciente" name="idPaciente" placeholder="Ingrese el ID del paciente" required>
                            </div>
                        </div>

                        <div class="col">
                            <label for="idMedico">ID del Médico *</label>
                            <div class="input-with-icon">
                                <img class="icon" src="${pageContext.request.contextPath}/imgenes/IconDosPersonasGris.svg" alt="">
                                <input type="text" id="idMedico" name="idMedico" placeholder="Ingrese el ID del médico" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="fecha">Fecha de la Cita *</label>
                            <input type="date" id="fecha" name="fecha" required>
                        </div>
                        <div class="col">
                            <label for="hora">Hora de la Cita *</label>
                            <input type="time" id="hora" name="hora" required>
                        </div>
                    </div>

                    <div>
                        <label for="motivo">Motivo *</label>
                        <div class="input-with-icon">
                            <textarea id="motivo" name="motivo" placeholder="Describa el motivo de la consulta" required></textarea>
                        </div>
                    </div>

                    <div>
                        <label>Estado de la Cita</label>
                        <div class="primitivebutton">
                            <select name="estado" aria-label="estado de la cita" style="border:0;background:transparent;font-size:14px">
                                <option value="Pendiente">Pendiente</option>
                                <option value="Confirmada">Confirmada</option>
                                <option value="Cancelada">Cancelada</option>
                                <option value="Completada">Completada</option>
                            </select>
                        </div>
                    </div>

                    <div>
                        <button class="button-submit" type="submit">
                            <img class="button3" src="${pageContext.request.contextPath}/imgenes/IconGuardar.svg" alt="">
                            <span>Agendar Cita</span>
                        </button>
                    </div>
                </form>

                <!-- Info boxes -->
                <div class="info-row">
                    <div class="info-box">
                        <div style="font-weight:700">24/7</div>
                        <div style="opacity:.9">Disponibilidad</div>
                    </div>
                    <div class="info-box" style="background:linear-gradient(180deg,#3d8ceb,#2878d9)">
                        <div style="font-weight:700">100%</div>
                        <div style="opacity:.9">Seguridad</div>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <!-- Decorativos -->
    <div class="bg-blur a"></div>
    <div class="bg-blur b"></div>
</div>
</body>
</html>
