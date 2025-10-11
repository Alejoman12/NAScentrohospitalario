<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = null;

    if (sesion != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
    }

    if (usuario == null || !"Administrador".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Administrador</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-vista-administrador.css">
</head>
<body>
<div class="dashboard">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="logo">
            <span>Health Care</span>
        </div>
        <nav>
            <ul>
                <li><a href="#">Rendimiento Hospital</a></li>
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Departamentos</a></li>
                <li><a href="#">Tablero de Tareas</a></li>
                <li><a href="#">Reportes</a></li>
                <li><a href="<%=request.getContextPath()%>/listaBusquedaUsuarios">Listado Usuarios</a></li>
                <li><a href="#">Perfil Médicos</a></li>
                <li><a href="<%=request.getContextPath()%>/listarUsuarios">Gestionar Usuarios</a></li>
                <li><a href="#">Configuraciones</a></li>
            </ul>
        </nav>
    </aside>

</div>
</body>
</html>
