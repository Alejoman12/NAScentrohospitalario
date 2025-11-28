<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.hospital.model.Usuario" %>
<%@ page import="com.hospital.model.Paciente" %>

<%
    // --- Validar sesión y rol ---
    HttpSession sesion = request.getSession(false);
    Usuario usuario = null;
    Paciente paciente = null;

    if (sesion != null) {
        usuario = (Usuario) sesion.getAttribute("usuario");
        paciente = (Paciente) sesion.getAttribute("paciente");
    }

    // Si no hay usuario/paciente o no es Paciente, redirigir al index
    if (usuario == null || paciente == null || !"Paciente".equalsIgnoreCase(usuario.getRol())) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    // Valores seguros (evitar NPE)
    String nombreSeguro = (paciente.getNombre() != null && !paciente.getNombre().isEmpty())
            ? paciente.getNombre()
            : "";
    String correoSeguro = (paciente.getCorreo() != null && !paciente.getCorreo().isEmpty())
            ? paciente.getCorreo()
            : "";
    String direccionSeguro = (paciente.getDireccion() != null && !paciente.getDireccion().isEmpty())
            ? paciente.getDireccion()
            : "";
    String telefonoSeguro = (paciente.getTelefono() != null && !paciente.getTelefono().isEmpty())
            ? paciente.getTelefono()
            : "";

    String inicial = "PT";
    if (paciente.getNombre() != null && !paciente.getNombre().isEmpty()) {
        inicial = paciente.getNombre().substring(0, 1).toUpperCase();
    }

    // Email a mostrar en sidebar (prioriza email del usuario si existe en sesión)
    String sidebarEmail = (usuario != null && usuario.getCorreo() != null && !usuario.getCorreo().isEmpty())
            ? usuario.getCorreo()
            : (correoSeguro.isEmpty() ? "Sin correo" : correoSeguro);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Actualizar Paciente</title>

    <!-- Hoja de estilos principal (usada: styles-actualizar-paciente.css) -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles-actualizar-paciente.css">
    <!-- Google Font (opcional) -->
    <link href="https://fonts.googleapis.com/css2?family=Arimo:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>

<div class="app-root">

    <!-- SIDEBAR -->
    <aside class="sidebar" aria-label="Navegación paciente">
        <div class="brand">
            <img src="<%= request.getContextPath() %>/imgenes/Icono_rendimiento_hospital.svg" alt="Logotipo" class="brand__img">
            <h1 class="brand__title">Paciente</h1>
        </div>

        <nav class="nav" aria-label="Acciones">
            <form action="<%= request.getContextPath() %>/jsp/paciente.jsp" method="get">
                <button class="btn btn--primary" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/IconAgenda.svg" alt="">
                    <span>Ver mis citas</span>
                </button>
            </form>

            <button class="btn btn--ghost" type="submit">
                <img src="${pageContext.request.contextPath}/imgenes/Icono_configuraciones.svg" alt="">
                <span>Actualizar datos</span>
            </button>

            <form action="<%= request.getContextPath() %>/logout" method="post">
                <button class="btn btn--danger" type="submit">
                    <img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt="">
                    <span>Cerrar sesión</span>
                </button>
            </form>
        </nav>

        <div class="sidebar__user" aria-hidden="false">
            <div class="avatar"><%= inicial %></div>
            <div class="user__info">
                <div class="user-card__name"><%= usuario.getNombre() != null ? usuario.getNombre() : "Paciente" %></div>
                <div class="user-card__email"><%= usuario.getCorreo() != null ? usuario.getCorreo() : "--" %></div>
            </div>
        </div>
    </aside>

    <!-- CONTENIDO PRINCIPAL -->
    <main class="content">
        <header class="content__header">
            <div class="accent" aria-hidden="true"></div>
            <div>
                <h2>Editar Información Personal</h2>
                <p class="muted">Mantén tu información actualizada y segura</p>
            </div>

            <aside class="summary-cards" aria-label="Resumen">
                <section class="card card--secure" aria-hidden="false">
                    <div class="card__icon" aria-hidden="true">
                        <img src="<%= request.getContextPath() %>/imgenes/IconCandado.svg" alt="Seguridad" style="width:100%;height:100%;object-fit:contain;">
                    </div>
                    <h3>Seguridad de tus datos</h3>
                    <p>Tu información está protegida con encriptación de nivel empresarial. Solo tú tienes acceso a estos datos.</p>
                </section>

                <section class="card" aria-hidden="false">
                    <h3>Resumen de Perfil</h3>
                    <div class="profile-stats">
                        <div class="stat"><span>Completado</span><strong>100%</strong></div>
                        <div class="stat"><span>Última actualización</span><strong>Hoy</strong></div>
                        <div class="stat"><span>Estado</span><strong class="status status--active">Activo</strong></div>
                    </div>
                </section>

                <section class="card" aria-hidden="false">
                    <h3>Consejos</h3>
                    <ul class="tips">
                        <li>Mantén tu información actualizada</li>
                        <li>Verifica tu correo electrónico</li>
                        <li>Usa un número de contacto válido</li>
                    </ul>
                </section>
            </aside>
        </header>

        <!-- PANEL principal: formulario de edición -->
        <section class="panel" aria-label="Editar información">
            <div class="card" role="region" aria-labelledby="info-personal-title">
                <div class="app6" style="display:flex;align-items:center;gap:16px;">
                    <img src="<%= request.getContextPath() %>/imgenes/Icon_escudo.svg" alt="Info personal" class="container-icon3" style="width:52px;height:52px;border-radius:12px;">
                    <div>
                        <h3 id="info-personal-title" class="heading-3">Información Personal</h3>
                        <p class="paragraph5">Completa tus datos personales</p>
                    </div>
                </div>

                <!-- FORMULARIO: engloba todos los campos -->
                <form action="<%= request.getContextPath() %>/actualizarPaciente" method="post" class="app7" aria-label="Formulario de actualización de paciente">

                    <!-- Nombre -->
                    <div class="container22" style="margin-bottom:6px;">
                        <div class="list-item" aria-hidden="true">
                            <img src="<%= request.getContextPath() %>/imgenes/Icono_pacientes.svg" alt="Paciente" class="container-icon4" style="width:40px;height:40px;">
                            <div class="nombre-completo">Nombre Completo</div>
                        </div>

                        <div class="app9" style="margin-top:4px;">
                            <div class="text-input">
                                <input type="text" name="nombre" id="nombre" placeholder="Sin nombre" value="<%= nombreSeguro %>" aria-label="Nombre completo">
                            </div>
                            <img class="container-icon5" src="<%= request.getContextPath() %>/imgenes/IconChuloEnCirculo.svg" alt="OK" style="width:40px;height:40px;">
                        </div>
                    </div>

                    <!-- Dirección -->
                    <div class="container22" style="margin-bottom:6px;">
                        <div class="list-item" aria-hidden="true">
                            <img src="<%= request.getContextPath() %>/imgenes/IconMapa.svg" alt="Dirección" class="container-icon4" style="width:40px;height:40px;">
                            <div class="nombre-completo">Dirección</div>
                        </div>

                        <div class="app9" style="margin-top:4px;">
                            <div class="text-input">
                                <input type="text" name="direccion" id="direccion" placeholder="No registrada" value="<%= direccionSeguro %>" aria-label="Dirección">
                            </div>
                            <img class="container-icon5" src="<%= request.getContextPath() %>/imgenes/IconChuloEnCirculo.svg" alt="OK" style="width:40px;height:40px;">
                        </div>
                    </div>

                    <!-- Teléfono & Correo (lado a lado en desktop) -->
                    <div class="container24" style="display:flex;gap:16px;flex-wrap:wrap;">
                        <div class="container25" style="flex:1;min-width:220px;">
                            <div class="list-item" aria-hidden="true">
                                <img src="<%= request.getContextPath() %>/imgenes/IconTelefono.svg" alt="Teléfono" class="container-icon4" style="width:40px;height:40px;">
                                <div class="nombre-completo">Teléfono</div>
                            </div>
                            <div class="app9" style="margin-top:8px;">
                                <div class="phone-input">
                                    <input type="tel" name="telefono" id="telefono" placeholder="No registrado" value="<%= telefonoSeguro %>" aria-label="Teléfono de contacto">
                                </div>
                                <img class="container-icon9" src="<%= request.getContextPath() %>/imgenes/IconChuloEnCirculo.svg" alt="OK" style="width:40px;height:40px;">
                            </div>
                        </div>

                        <div class="container26" style="flex:1;min-width:220px;">
                            <div class="list-item" aria-hidden="true">
                                <img src="<%= request.getContextPath() %>/imgenes/IconMensaje.svg" alt="Correo" class="container-icon4" style="width:40px;height:40px;">
                                <div class="nombre-completo">Correo Electrónico</div>
                            </div>
                            <div class="app9" style="margin-top:8px;">
                                <div class="text-input">
                                    <input type="email" name="correo" id="correo" placeholder="Sin correo" value="<%= correoSeguro %>" aria-label="Correo electrónico">
                                </div>
                                <img class="container-icon9" src="<%= request.getContextPath() %>/imgenes/IconChuloEnCirculo.svg" alt="OK" style="width:40px;height:40px;">
                            </div>
                        </div>
                    </div>

                    <!-- Botón Actualizar -->
                    <div class="button4" style="margin-top:18px;">
                        <button type="submit" class="btn btn--primary btn--large" aria-label="Actualizar información">
                            <img class="icon3" src="<%= request.getContextPath() %>/imgenes/IconGuardar.svg" alt="Guardar" style="width:20px;height:20px;">
                            <span class="actualizar-informacin">Actualizar Información</span>
                        </button>
                    </div>
                </form>

            </div>
        </section>

    </main>
</div>

</body>
</html>
