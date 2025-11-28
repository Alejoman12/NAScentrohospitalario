<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"> <meta name="viewport" content="initial-scale=1, width=device-width">
    <title>Citas del Día</title>

    <link rel="stylesheet" href="../css/Styles-CitaDiaMedico.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="dashboard">

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
                <img src="../imgenes/IconFlechaIzquierda.svg" class="icono-menu" alt="Cerrar sesion">
                Cerrar sesión
            </button>
        </form>
    </aside>

    <main class="contenido-principal">

        <div class="header-pagina">
            <div class="titulo-seccion">
                <img class="icon" alt="" src="../imgenes/IconAgenda.svg" style="width: 24px; vertical-align: middle; margin-right: 10px; filter: brightness(0.2);">
                <span>Citas del Día</span>
            </div>

            <div class="fecha-badge">
                <img class="icon2" alt="" src="../imgenes/IconAgenda.svg">
                <span>lunes, 24 de noviembre de 2025</span>
            </div>
        </div>

        <div class="barra-controles">
            <div class="texto-info">
                Mostrando <strong>3</strong> de 3 citas
            </div>

            <div class="botones-grupo">
                <button class="btn-accion btn-blanco">
                    <img class="icon2" alt="" src="../imgenes/IconDescargar.svg"> Exportar
                </button>
                <button class="btn-accion btn-verde">
                    <img class="icon2" alt="" src="../imgenes/IconDeUnMas.svg" style="filter: brightness(0) invert(1);"> Nueva Cita
                </button>
            </div>
        </div>

        <div class="tabla-card">
            <div class="titulo-tabla">Listado de Citas</div>

            <table class="tabla-citas">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>PACIENTE</th>
                    <th>MÉDICO</th> <th>FECHA</th>
                    <th>HORA</th>
                    <th>MOTIVO</th>
                    <th>ESTADO</th>
                    <th>ACCIONES</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>001</td>
                    <td>
                        <div class="info-usuario">
                            <img src="../imgenes/IconPersona.svg" alt="">
                            María González </div>
                    </td>
                    <td>Dr. Ramírez</td> <td>24/11/2025</td>
                    <td>09:00</td>
                    <td>Consulta general</td>
                    <td><span class="estado confirmada">Confirmada</span></td>
                    <td class="acciones-iconos">
                        <img src="../imgenes/IconLapiz.svg" alt="Editar">
                        <img src="../imgenes/IconBorrar.svg" alt="Borrar">
                    </td>
                </tr>

                <tr>
                    <td>002</td>
                    <td>
                        <div class="info-usuario">
                            <img src="../imgenes/IconPersona.svg" alt="">
                            Juan Pérez </div>
                    </td>
                    <td>Dra. López</td> <td>24/11/2025</td>
                    <td>10:30</td>
                    <td>Control de presión</td> <td><span class="estado pendiente">Pendiente</span></td>
                    <td class="acciones-iconos">
                        <img src="../imgenes/IconLapiz.svg" alt="Editar">
                        <img src="../imgenes/IconBorrar.svg" alt="Borrar">
                    </td>
                </tr>

                <tr>
                    <td>003</td>
                    <td>
                        <div class="info-usuario">
                            <img src="../imgenes/IconPersona.svg" alt="">
                            Ana Martínez </div>
                    </td>
                    <td>Dr. García</td> <td>24/11/2025</td>
                    <td>11:00</td>
                    <td>Resultados</td>
                    <td><span class="estado completada">Completada</span></td>
                    <td class="acciones-iconos">
                        <img src="../imgenes/IconLapiz.svg" alt="Editar">
                        <img src="../imgenes/IconBorrar.svg" alt="Borrar">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

    </main>
</div>

</body>
</html>