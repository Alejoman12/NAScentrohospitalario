<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>Registrar Diagnóstico</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-RegistrarDianostico.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="dashboard">

    <aside class="sidebar">
        <h1><img src="../imgenes/IconMedico.svg" alt="" style="width: 24px;"> Medico</h1>
        <nav>
            <ul>
                <li>
                    <a href="<%= request.getContextPath() %>/jsp/CitasDelDiaMedico.jsp">
                        <img src="../imgenes/IconAgenda.svg" alt=""> Citas del día
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/jsp/HistorialPacienteMedico.jsp">
                        <img src="../imgenes/IconHistorialPaciente.svg" alt=""> Historial de pacientes
                    </a>
                </li>
                <li>
                    <a href="#" class="activo">
                        <img src="../imgenes/IconDianostico.svg" alt=""> Registrar diagnóstico
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/jsp/actualizarMedico.jsp">
                        <img src="../imgenes/IconTuerca.svg" alt=""> Actualizar datos
                    </a>
                </li>
            </ul>
        </nav>
        <form action="<%= request.getContextPath() %>/index.jsp" method="post">
            <button type="submit" class="logout-btn">
                <img src="../imgenes/IconFlechaIzquierda.svg" class="icono-menu" alt="Cerrar sesion">
                Cerrar sesión
            </button>
        </form>
    </aside>

    <main class="contenido-principal">

        <header class="header-pagina">
            <h2>
                <img src="../imgenes/IconDianostico.svg" style="width:28px" alt="">
                Registrar Diagnóstico
            </h2>
            <p>Complete el formulario para registrar un nuevo diagnóstico médico</p>
        </header>

        <div class="layout-grid">

            <div class="columna-formulario">

                <form action="<%= request.getContextPath() %>/registrarDiagnostico" method="post">

                    <div class="card">
                        <div class="titulo-seccion">
                            <div class="barra-color verde"></div>
                            Información Básica
                        </div>
                        <div class="card-body">
                            <div class="fila-inputs">
                                <div class="grupo-input">
                                    <label>ID Paciente *</label>
                                    <input type="text" name="idPaciente" class="input-box" placeholder="Ej: P001" required>
                                </div>
                                <div class="grupo-input">
                                    <label>ID Médico *</label>
                                    <input type="text" name="idMedico" class="input-box" value="<%= (usuario != null) ? usuario.getNombre() : "M001" %>" readonly>
                                </div>
                            </div>
                            <div class="fila-inputs">
                                <div class="grupo-input">
                                    <label>Fecha de Diagnóstico *</label>
                                    <input type="date" name="fechaDiag" class="input-box" required>
                                </div>
                                <div class="grupo-input">
                                    <label>Estado *</label>
                                    <select name="estado" class="input-box">
                                        <option>Activo</option>
                                        <option>En seguimiento</option>
                                        <option>Finalizado</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="titulo-seccion">
                            <div class="barra-color azul"></div>
                            Diagnóstico
                        </div>
                        <div class="card-body">
                            <div class="grupo-input">
                                <label>Descripción del Diagnóstico *</label>
                                <textarea name="descDiagnostico" class="input-box" placeholder="Describa el diagnóstico detalladamente..."></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="titulo-seccion">
                            <div class="barra-color naranja"></div>
                            Tratamiento
                        </div>
                        <div class="card-body">
                            <div class="grupo-input">
                                <label>Tratamiento Prescrito *</label>
                                <textarea name="tratamiento" class="input-box" placeholder="Medicamentos, dosis y frecuencia..."></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="titulo-seccion">
                            <div class="barra-color morado"></div>
                            Observaciones Adicionales
                        </div>
                        <div class="card-body">
                            <div class="grupo-input">
                                <label>Observaciones</label>
                                <textarea name="observaciones" class="input-box" placeholder="Notas adicionales..."></textarea>
                            </div>
                        </div>
                    </div>

                </form>
            </div>

            <div class="columna-historial">
                <div class="titulo-seccion" style="border:none; padding-left:0; background:transparent;">
                    <div class="barra-color rojo"></div>
                    Diagnósticos Recientes
                </div>

                <div class="historial-item">
                    <div class="historial-top">
                        <div style="display:flex; gap:10px; align-items:center;">
                            <img src="../imgenes/IconHistorialPaciente.svg" class="icono-historial" alt="">
                            <div class="info-meta">
                                <h4>D001</h4>
                                <span>Paciente: P001</span>
                            </div>
                        </div>
                        <span class="badge bg-naranja-badge">En seguimiento</span>
                    </div>
                    <div class="diagnostico-texto">Gastritis aguda</div>
                    <div class="fecha-texto">Fecha: 19/11/2025</div>
                </div>

                <div class="historial-item">
                    <div class="historial-top">
                        <div style="display:flex; gap:10px; align-items:center;">
                            <img src="../imgenes/IconHistorialPaciente.svg" class="icono-historial" alt="">
                            <div class="info-meta">
                                <h4>D002</h4>
                                <span>Paciente: P002</span>
                            </div>
                        </div>
                        <span class="badge bg-verde-badge">Activo</span>
                    </div>
                    <div class="diagnostico-texto">Diabetes tipo 2</div>
                    <div class="fecha-texto">Fecha: 21/11/2025</div>
                </div>

            </div>

        </div> </main>
</div>

</body>
</html>