<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="com.hospital.model.Cita" %>
<%@ page import="java.util.List" %>
<%
    HttpSession sesion = request.getSession(false);
    Usuario usuario = null;

    if (sesion != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
    }

    if (usuario == null || !"Paciente".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    List<Cita> citas = (List<Cita>) request.getAttribute("citas");

%>
<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Panel Paciente</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imgenes/logoHospital.jpg">

    <!-- Google Font: ejemplo (cambiar si prefieres otra) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-vista-paciente.css">
</head>
<body>
<div class="app-shell">
    <!-- Sidebar (colapsable en móvil) -->
    <aside class="sidebar" id="sidebar">
        <div class="brand">
            <img src="<%= request.getContextPath() %>/imgenes/Icono_rendimiento_hospital.svg" alt="Logo" class="brand__logo"/>
            <h1 class="brand__title">Paciente</h1>
        </div>

        <nav class="nav">
            <button class="nav__item btn-primary" type="button" data-action="ver-citas">
                <img src="${pageContext.request.contextPath}/imgenes/IconAgenda.svg" alt="">
                <span>Ver mis citas</span>
            </button>

            <form action="<%= request.getContextPath() %>/jsp/pacienteActua.jsp" method="post">
                <button class="nav__item btn-ghost" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/Icono_configuraciones.svg" alt="">
                    <span>Actualizar datos</span>
                </button>
            </form>
            <form action="<%= request.getContextPath() %>/" method="post">
                <button class="nav__item btn-danger" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt="">
                    <span>Cerrar sesión</span>
                </button>

            </form>
        </nav>

        <div class="user-card" aria-hidden="false">
            <div class="user-card__avatar">PT</div>
            <div class="user-card__info">
                <div class="user-card__name"><%= usuario.getNombre() != null ? usuario.getNombre() : "Paciente" %></div>
                <div class="user-card__email"><%= usuario.getCorreo() != null ? usuario.getCorreo() : "--" %></div>
            </div>
        </div>
    </aside>

    <!-- Main content -->
    <main class="main">
        <header class="main__header">
            <button id="sidebarToggle" class="toggle-btn" aria-label="Alternar menú">☰</button>
            <div>
                <h2>Citas pendientes</h2>
                <p id="fecha"></p>

                <script>
                    const fecha = new Date();
                    const opciones = { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' };
                    const fechaFormateada = fecha.toLocaleDateString('es-ES', opciones);

                    // Convertir la primera letra a mayúscula
                    document.getElementById("fecha").textContent =
                        fechaFormateada.charAt(0).toUpperCase() + fechaFormateada.slice(1);
                </script>

            </div>
        </header>

        <section class="card table-card" aria-labelledby="citas-heading">
            <h3 id="citas-heading" class="sr-only">Citas pendientes</h3>

            <div class="table-responsive">
                <table class="citas-table" role="table">
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

        </section>
    </main>
</div>

<script>
    // Toggle sidebar (responsive)
    (function(){
        const sidebar = document.getElementById('sidebar');
        const toggle = document.getElementById('sidebarToggle');
        toggle.addEventListener('click', () => {
            sidebar.classList.toggle('sidebar--collapsed');
        });

// Optional: hooks for nav actions (delegación)
        document.querySelector('.nav').addEventListener('click', (e) => {
            const btn = e.target.closest('[data-action]');
            if (!btn) return;
            const action = btn.getAttribute('data-action');
            if (action === 'ver-citas') {
// lógica: redirigir o mostrar sección
                console.log('Ver mis citas');
            }
            if (action === 'actualizar-datos') {
                console.log('Actualizar datos');
            }
        });
    })();
</script>
</body>
</html>
```

