<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Cita" %>
<%@ page import="com.hospital.model.Paciente" %>
<%
    Paciente paciente = (Paciente) session.getAttribute("paciente");
    if (paciente == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    List<Cita> citas = (List<Cita>) request.getAttribute("citas");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mis Citas</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-actualizar-paciente.css">
</head>
<body>
<div class="container">
    <h2>Mis Citas</h2>
    <table>
        <thead>
        <tr>
            <th>Fecha y Hora</th>
            <th>Médico</th>
            <th>Motivo</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody>
        <% if (citas != null && !citas.isEmpty()) {
            for (Cita c : citas) { %>
        <tr>
            <td><%= c.getFechaHora() %></td>
            <td><%= c.getIdMedico() %></td> <!-- Podrías mostrar el nombre si tienes el DAO del médico -->
            <td><%= c.getMotivo() %></td>
            <td><%= c.getEstado() %></td>
        </tr>
        <%  }
        } else { %>
        <tr>
            <td colspan="4">No tienes citas registradas.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
