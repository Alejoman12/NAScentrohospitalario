<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Dashboard - NAS Centro Hospitalario</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-listado-usuarios.css" />
</head>
<body>

  <!-- ======= SIDEBAR ======= -->
  <aside class="sidebar">
    <div class="sidebar-header">
      <img src="${pageContext.request.contextPath}/imgenes/logoHospital.jpg" alt="Logo NAS" class="sidebar-logo" />
      <h1>NAS Centro Hospitalario</h1>
    </div>

    <nav class="sidebar-menu">
      <ul>
        <a href="${pageContext.request.contextPath}/jsp/administrador.jsp"><li><img src="${pageContext.request.contextPath}/imgenes/Icono_dashboard.svg" alt="">Dashboard</li></a>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_rendimiento_hospital.svg" alt="">Rendimiento Hospital</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_departamentos.svg" alt="">Departamentos</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_tablero_tareas.svg" alt="">Tablero Tareas</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_reportes.svg" alt="">Reportes</li>
        <li class="active"><img src="${pageContext.request.contextPath}/imgenes/Icono_listado_usuarios.svg" alt="">Listado Usuarios</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_perfil_medico.svg" alt="">Perfil Medico</li>
        <a href="${pageContext.request.contextPath}/listarUsuarios"><li><img src="${pageContext.request.contextPath}/imgenes/Icono_gestionar_usuarios.svg" alt="">Gestionar Usuarios</li></a>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_configuraciones.svg" alt="">Configuraciones</li>
      </ul>
    </nav>

    <div class="logout ">
    <a href="${pageContext.request.contextPath}/CerrarSesionServlet.java"><li><img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt="">Cerrar sesión</li></a>
  </div>
  </aside>

  <!-- ======= CONTENIDO PRINCIPAL ======= -->
  <main class="main-content">

    <form action="${pageContext.request.contextPath}/listaBusquedaUsuarios" method="get">
      <input type="text" name="busqueda" placeholder="Buscar..." value="<%= request.getAttribute("busqueda") != null ? request.getAttribute("busqueda") : "" %>">
      <button type="submit">Buscar</button>
    </form>
    
    <!-- TABLA DE REGISTROS -->
    <section class="table-section">
      <h3>Listado de Usuarios</h3>
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
    </section>
  </main>

</body>
</html>
