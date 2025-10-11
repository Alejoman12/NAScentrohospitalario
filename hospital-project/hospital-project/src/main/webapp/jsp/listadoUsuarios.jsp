<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-listado-usuarios.css">
</head>
<body>

<h1>Listado de Usuarios</h1>

<form action="listaBusquedaUsuarios-" method="get">
    <input type="text" name="busqueda" placeholder="Buscar..." value="<%= request.getAttribute("busqueda") %>">
    <button type="submit">Buscar</button>
</form>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Correo</th>
        <th>Rol</th>
        <th>Estado</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
        if (usuarios != null && !usuarios.isEmpty()) {
            for (Usuario u : usuarios) {
    %>
    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getNombre() %></td>
        <td><%= u.getCorreo() %></td>
        <td><%= u.getRol() %></td>
        <td><%= u.isActivo() ? "Activo" : "Inactivo" %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="5">No se encontraron usuarios.</td>
    </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
