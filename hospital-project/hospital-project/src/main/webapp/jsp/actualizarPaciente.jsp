<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="com.hospital.model.Paciente" %>
<%
  HttpSession sesion = request.getSession(false);
  Usuario usuario = null;
  Paciente paciente = null;

  if (sesion != null) {
    usuario = (Usuario) sesion.getAttribute("usuario");
    paciente = (Paciente) sesion.getAttribute("paciente");
  }

  if (usuario == null || paciente == null || !"Paciente".equalsIgnoreCase(usuario.getRol())) {
    response.sendRedirect(request.getContextPath() + "/index.jsp");
    return;
  }
%>
<html>
<head>
  <title>Title</title>
  <link href="<%= request.getContextPath() %>/css/styles-actualizar-paciente.css" rel="stylesheet">
</head>
<body>
<h2>Editar Información Personal</h2>
<form method="post" action="<%= request.getContextPath() %>/actualizarPaciente">
  <label>Nombre:</label>
  <input type="text" name="nombre" value="<%= usuario.getNombre() %>" required><br>

  <label>Dirección:</label>
  <input type="text" name="direccion" value="<%= paciente.getDireccion() %>" required><br>

  <label>Teléfono:</label>
  <input type="text" name="telefono" value="<%= paciente.getTelefono() %>" required><br>

  <label>Correo:</label>
  <input type="email" name="correo" value="<%= paciente.getCorreo() %>" required><br>

  <label>Género:</label>
  <select name="genero" required>
    <option value="Masculino" <%= paciente.getGenero().equals("Masculino") ? "selected" : "" %>>Masculino</option>
    <option value="Femenino" <%= paciente.getGenero().equals("Femenino") ? "selected" : "" %>>Femenino</option>
    <option value="Otro" <%= paciente.getGenero().equals("Otro") ? "selected" : "" %>>Otro</option>
  </select><br>

  <input type="submit" value="Actualizar">
</form>

</body>
</html>
