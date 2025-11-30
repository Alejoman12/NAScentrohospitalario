<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = (sesion != null) ? (Usuario) sesion.getAttribute("usuario") : null;

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
    <title>Historial de Pacientes</title>

    <link rel="stylesheet" href="../css/styles-HistorialPaciente.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="dashboard">

    <!-- ========== SIDEBAR ========== -->
    <aside class="sidebar">
        <h1><img src="../imgenes/IconMedico.svg" class="icono-logo" alt=""> Médico</h1>

        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/jsp/CitasDelDiaMedico.jsp">
                    <img src="../imgenes/IconAgenda.svg" class="icono-menu" alt=""> Citas del día</a></li>
                <li><a href="<%=request.getContextPath()%>/jsp/HistorialPacienteMedico.jsp">
                    <img src="../imgenes/IconHistorialPaciente.svg" class="icono-menu" alt="">Historial de pacientes</a></li>
                <li><a href="<%=request.getContextPath()%>/jsp/registrarDianostico.jsp">
                    <img src="../imgenes/IconDianostico.svg" class="icono-menu" alt="">Registrar diagnóstico</a></li>
                <li><a href="<%=request.getContextPath()%>/jsp/actualizarMedico.jsp">
                    <img src="../imgenes/IconTuerca.svg" class="icono-menu" alt="">Actualizar datos</a></li>
            </ul>
        </nav>

        <form action="<%= request.getContextPath() %>/index.jsp" method="post">
            <button type="submit" class="logout-btn">
                <img src="../imgenes/IconFlechaIzquierda.svg" class="icono-menu" alt=""> Cerrar sesión
            </button>
        </form>
    </aside>

    <!-- ========== CONTENIDO PRINCIPAL ========== -->
    <main class="contenido-principal">

        <header class="top-header">
            <h1>Historial de Pacientes</h1>
        </header>

        <!-- FILTROS Y BUSQUEDA -->
        <section class="filtros">
            <button class="btn-filtrar">
                <img src="../imgenes/Icono_lupa.svg"> Filtrar
            </button>

            <div class="busqueda">
                <input type="text" placeholder="Buscar por ID historia, ID paciente o descripción...">
                <img src="../imgenes/Icono_lupa.svg">
            </div>
        </section>

        <!-- INFO DE REGISTROS -->
        <section class="info-registros">
            <p>Mostrando <strong>5</strong> de 5 registros</p>

            <div class="acciones-tabla">
                <button class="btn-accion">Exportar</button>
                <button class="btn-accion">Nuevo Historial</button>
            </div>
        </section>

        <!-- TABLA DE HISTORIALES -->
        <section class="tabla-historial">
            <h2>Listado de Historiales</h2>

            <table class="patient-table">
                <thead>
                <tr>
                    <th>DESCRIPCIÓN</th>
                    <th>FECHA REGISTRO</th>
                    <th>ACTIVO</th>
                    <th>ACCIONES</th>
                </tr>
                </thead>
                <tbody>
                <%
                    String[][] data = {
                            {"Consulta inicial - Dolor abdominal agudo", "19/11/2025", "Activo"},
                            {"Seguimiento de diabetes tipo 2", "21/11/2025", "Activo"},
                            {"Control post-operatorio de cirugía", "22/11/2025", "Activo"},
                            {"Revisión de resultados de laboratorio", "23/11/2025", "Activo"},
                            {"Consulta por hipertensión arterial", "24/11/2025", "Inactivo"}
                    };

                    for (String[] row : data) {
                %>
                <tr>
                    <td><%= row[0] %></td>
                    <td><%= row[1] %></td>
                    <td><%= row[2] %></td>
                    <td>
                        <ul class="acciones">
                            <li><img src="../imgenes/IconOjo.svg" alt="Ver"></li>
                            <li><img src="../imgenes/IconLapiz.svg" alt="Editar"></li>
                            <li><img src="../imgenes/IconBorrar.svg" alt="Eliminar"></li>
                        </ul>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </section>

    </main>
</div>

</body>
</html>