<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="java.util.List" %>
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
    <title>Gestionar Usuarios</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-gestion-usuarios.css">
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
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_dashboard.svg" alt="">Dashboard</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_rendimiento_hospital.svg" alt="">Rendimiento Hospital</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_departamentos.svg" alt="">Departamentos</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_tablero_tareas.svg" alt="">Tablero Tareas</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_reportes.svg" alt="">Reportes</li>
        <a href="${pageContext.request.contextPath}/listaBusquedaUsuarios"><li><img src="${pageContext.request.contextPath}/imgenes/Icono_listado_usuarios.svg" alt="">Listado Usuarios</li></a>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_perfil_medico.svg" alt="">Perfil Medico</li>
        <a href="${pageContext.request.contextPath}/listarUsuarios"><li class="active"><img src="${pageContext.request.contextPath}/imgenes/Icono_gestionar_usuarios.svg" alt="">Gestionar Usuarios</li></a>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_configuraciones.svg" alt="">Configuraciones</li>
      </ul>
    </nav>

    <div class="logout ">
    <li><img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt=""><a href="${pageContext.request.contextPath}/cerrarSesion">Cerrar seción</a></li>
  </div>
  </aside>

    <!-- Main Content -->
    <main class="main-content">
        <header class="header">
            <h2 class="title">Gestionar Usuarios</h2>
            <p>Bienvenido, <%=usuario.getNombre()%> (<%=usuario.getRol()%>)</p>
        </header>

        <%
            Usuario usuarioEditar = (Usuario) request.getAttribute("usuarioEditar");
            boolean esEdicion = usuarioEditar != null;
        %>
        <h3><%= esEdicion ? "Editar Usuario" : "Crear Usuario" %></h3>
        <form class="form" action="${pageContext.request.contextPath}/admin/crearUsuarioDesdeAdmin" method="post">
            <% if (esEdicion) { %>
            <input type="hidden" name="id" value="<%= usuarioEditar.getId() %>">
            <% } %>
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required value="<%= esEdicion ? usuarioEditar.getNombre() : "" %>">
            </div>
            <div class="form-group">
                <label for="correo">Email:</label>
                <input type="email" id="correo" name="correo" required value="<%= esEdicion ? usuarioEditar.getCorreo() : "" %>">
            </div>
            <div class="form-group">
                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" <%= esEdicion ? "" : "required" %> placeholder="<%= esEdicion ? "Dejar en blanco para no cambiar" : "" %>">
            </div>
            <div class="form-group">
                <label for="rol">Rol:</label>
                <select id="rol" name="rol" required onchange="mostrarCamposPorRol(this.value)">
                    <option value="">Seleccione un rol</option>
                    <option value="Administrador" <%= esEdicion && "Administrador".equalsIgnoreCase(usuarioEditar.getRol()) ? "selected" : "" %>>Administrador</option>
                    <option value="Médico" <%= esEdicion && "Médico".equalsIgnoreCase(usuarioEditar.getRol()) ? "selected" : "" %>>Médico</option>
                    <option value="Paciente" <%= esEdicion && "Paciente".equalsIgnoreCase(usuarioEditar.getRol()) ? "selected" : "" %>>Paciente</option>
                    <option value="Recepcionista" <%= esEdicion && "Recepcionista".equalsIgnoreCase(usuarioEditar.getRol()) ? "selected" : ""%>>Recepcionista</option>
                </select>
            </div>

            <!-- campos extra para paciente -->
            <div id="camposPaciente" style="display:none;">
                <div class="form-group">
                    <label for="documento">Documento de Identidad:</label>
                    <input type="text" id="documento" name="documento">
                </div>
                <div class="form-group">
                    <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento">
                </div>
                <div class="form-group">
                    <label for="genero">Género:</label>
                    <select id="genero" name="genero">
                        <option value="">Seleccione</option>
                        <option value="Masculino">Masculino</option>
                        <option value="Femenino">Femenino</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion">
                </div>
                <div class="form-group">
                    <label for="telefonoPaciente">Teléfono:</label>
                    <input type="text" id="telefonoPaciente" name="telefonoPaciente">
                </div>
            </div>

            <!--campos extra para medico-->
            <div id="camposMedico" style="display:none;">
                <div class="form-group">
                    <label for="especialidad">Especialidad:</label>
                    <input type="text" id="especialidad" name="especialidad">
                </div>
                <div class="form-group">
                    <label for="telefonoMedico">Teléfono:</label>
                    <input type="text" id="telefonoMedico" name="telefonoMedico">
                </div>
            </div>

            <!--campos extra para administrador-->
            <div id="camposAdministrador" style="display:none;">
                <div class="form-group">
                    <label for="telefonoAdministrador">Teléfono:</label>
                    <input type="text" id="telefonoAdministrador" name="telefonoAdministrador">
                </div>
            </div>

            <!--campos extra para recepcionista-->
            <div id="camposRecepcionista" style="display:none;">
                <div class="form-group">
                    <label for="turno">Turno:</label>
                    <select id="turno" name="turno">
                        <option value="">Seleccione</option>
                        <option value="Mañana">Mañana</option>
                        <option value="Tarde">Tarde</option>
                        <option value="Noche">Noche</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="telefonoRecepcionista">Teléfono:</label>
                    <input type="text" id="telefonoRecepcionista" name="telefonoRecepcionista">
                </div>
            </div>

            <button class="button-edit" type="submit"><%= esEdicion ? "Actualizar Usuario" : "Crear Usuario" %></button>
        </form>

        <script>
            function mostrarCamposPorRol(rol) {
            document.getElementById("camposPaciente").style.display = "none";
            document.getElementById("camposMedico").style.display = "none";
            document.getElementById("camposAdministrador").style.display = "none";
            document.getElementById("camposRecepcionista").style.display = "none";

            if (rol === "Paciente") {
                document.getElementById("camposPaciente").style.display = "block";
            } else if (rol === "Médico") {
                document.getElementById("camposMedico").style.display = "block";
            } else if (rol === "Administrador") {
                document.getElementById("camposAdministrador").style.display = "block";
            } else if (rol === "Recepcionista") {
                document.getElementById("camposRecepcionista").style.display = "block";
            }
        }

            // Al cargar la página, si es edición, mostrar campos según rol
            window.onload = function() {
                <% if (esEdicion) { %>
                mostrarCamposPorRol("<%= usuarioEditar.getRol() %>");
                <% } %>
            };
        </script>

        <!-- Lista de Usuarios -->
        <section class="user-list">
            <h3>Lista de Usuarios</h3>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Rol</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                    if (usuarios != null) {
                        for (Usuario u : usuarios) {
                %>
                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getNombre() %></td>
                    <td><%= u.getCorreo() %></td>
                    <td><%= u.getRol() %></td>
                    <td><%= u.isActivo() ? "Activo" : "Inactivo" %></td>
                    <td>
                        <form action="UsuarioServlet" method="post" style="display:inline;">
                            <input type="hidden" name="accion" value="editarForm">
                            <input type="hidden" name="id" value="<%= u.getId() %>">
                            <button class="btn-edit" type="submit">Editar</button>
                        </form>
                        <form action="UsuarioServlet" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de eliminar este usuario?');">
                            <input type="hidden" name="accion" value="eliminar">
                            <input type="hidden" name="id" value="<%= u.getId() %>">
                            <button class="btn-delete" type="submit">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </section>
    </main>
</body>
</html>
