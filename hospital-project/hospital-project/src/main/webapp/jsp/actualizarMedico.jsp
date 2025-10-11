<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="com.hospital.model.Medico" %>
<%
  HttpSession sesion = request.getSession(false);
  Usuario usuario = null;
  Medico medico = null;

  if (sesion != null) {
    usuario = (Usuario) sesion.getAttribute("usuario");
    medico = (Medico) sesion.getAttribute("medico");
  }

  if (usuario == null || medico == null || !"Medico".equalsIgnoreCase(usuario.getRol())) {
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
<form method="post" action="<%= request.getContextPath() %>/actualizarMedico">
  <label>Nombre:</label>
  <input type="text" name="nombre" value="<%= usuario.getNombre() %>" required><br>

  <label>Dirección:</label>
  <input type="text" name="especialidad" value="<%= medico.getEspecialidad() %>" required><br>

  <label>Teléfono:</label>
  <input type="text" name="telefono" value="<%= medico.getTelefono() %>" required><br>

  <label>Correo:</label>
  <input type="email" name="correo" value="<%= usuario.getCorreo() %>" required><br>

  <input type="submit" value="Actualizar">
</form>

</body>
</html>
