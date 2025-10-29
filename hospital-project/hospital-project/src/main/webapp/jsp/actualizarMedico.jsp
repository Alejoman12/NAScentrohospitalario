<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario, com.hospital.model.Medico" %>
<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = (Usuario) sesion.getAttribute("usuario");
    Medico medico = (Medico) sesion.getAttribute("medico");

    if (usuario == null || medico == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Datos del Médico</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-Medico.css">
</head>
<body>

<div class="dashboard">
    <!-- Sidebar -->
    <aside class="sidebar">
        <h1><img src="../imgenes/IconMedico.svg" class="icono-logo" alt=""> Médico</h1>

        <nav>
            <ul>
                <li><a href="#"><img src="../imgenes/IconAgenda.svg" class="icono-menu" alt="">Citas del día</a></li>
                <li><a href="#"><img src="../imgenes/IconHistorialPaciente.svg" class="icono-menu" alt="">Historial de pacientes</a></li>
                <li><a href="#"><img src="../imgenes/IconDianostico.svg" class="icono-menu" alt="">Registrar diagnóstico</a></li>
                <li><a href="#" class="active"><img src="../imgenes/IconTuerca.svg" class="icono-menu" alt="">Actualizar datos</a></li>
            </ul>
        </nav>

        <form action="<%= request.getContextPath() %>/index.jsp" method="post">
            <button type="submit" class="logout-btn">
                <img src="../imgenes/IconFlechaIzquierda.svg" class="icono-menu" alt=""> Cerrar sesión
            </button>
        </form>
    </aside>

    <!-- Contenido principal -->
    <main class="contenido-principal">
        <div class="formulario-container">
            <h2>Actualizar Información Personal</h2>
            <form method="post" action="<%= request.getContextPath() %>/actualizarMedico" class="formulario">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombre() %>" required>

                <label for="especialidad">Especialidad:</label>
                <input type="text" id="especialidad" name="especialidad" value="<%= medico.getEspecialidad() %>" required>

                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" value="<%= medico.getTelefono() %>" required>

                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" value="<%= usuario.getCorreo() %>" required>

                <button type="submit" class="btn-actualizar">Actualizar Datos</button>
            </form>
        </div>
    </main>
</div>

</body>
</html>
