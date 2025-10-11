<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("usuario") == null || session.getAttribute("recepcionista") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agendar Cita</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-agendar-cita.css">
</head>
<body>
<div class="container">
    <h2>Agendar Nueva Cita</h2>
    <form action="${pageContext.request.contextPath}/agendarCita" method="post">
        <div class="form-group">
            <label for="idPaciente">ID del Paciente:</label>
            <input type="text" name="idPaciente" id="idPaciente" required>
        </div>

        <div class="form-group">
            <label for="idMedico">ID del Médico:</label>
            <input type="text" name="idMedico" id="idMedico" required>
        </div>

        <div class="form-group">
            <label for="fecha">Fecha de la Cita:</label>
            <input type="date" name="fecha" id="fecha" required>
        </div>

        <div class="form-group">
            <label for="hora">Hora de la Cita:</label>
            <input type="time" name="hora" id="hora" required>
        </div>

        <div class="form-group">
            <label for="motivo">Motivo:</label>
            <textarea name="motivo" id="motivo" rows="3" required></textarea>
        </div>

        <div class="form-group">
            <label for="estado">Estado de la Cita:</label>
            <select name="estado" id="estado" required>
                <option value="Pendiente">Pendiente</option>
                <option value="Confirmada">Confirmada</option>
                <option value="Cancelada">Cancelada</option>
                <option value="Cancelada">Atendida</option>
            </select>
        </div>

        <button type="submit" class="btn-agendar">Agendar Cita</button>
    </form>
</div>
</body>
</html>
