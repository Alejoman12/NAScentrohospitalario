<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Dashboard - NAS Centro Hospitalario</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-vista-administrador.css" />
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
        <li class="active"><img src="${pageContext.request.contextPath}/imgenes/Icono_dashboard.svg" alt="">Dashboard</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_rendimiento_hospital.svg" alt="">Rendimiento Hospital</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_departamentos.svg" alt="">Departamentos</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_tablero_tareas.svg" alt="">Tablero Tareas</li>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_reportes.svg" alt="">Reportes</li>
        <a href="${pageContext.request.contextPath}/jsp/listadoUsuarios.jsp"><li><img src="${pageContext.request.contextPath}/imgenes/Icono_listado_usuarios.svg" alt="">Listado Usuarios</li></a>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_perfil_medico.svg" alt="">Perfil Medico</li>
        <a href="${pageContext.request.contextPath}/jsp/gestionUsuarios.jsp"><li><img src="${pageContext.request.contextPath}/imgenes/Icono_gestionar_usuarios.svg" alt="">Gestionar usuarios</li></a>
        <li><img src="${pageContext.request.contextPath}/imgenes/Icono_configuraciones.svg" alt="">Configuraciones</li>
      </ul>
    </nav>

    <div class="logout ">
    <li><img src="${pageContext.request.contextPath}/imgenes/Icono_cerrar_secion.svg" alt=""><a href="${pageContext.request.contextPath}/index.jsp">Cerrar secíon</a></li>
  </div>
  </aside>

  <!-- ======= CONTENIDO PRINCIPAL ======= -->
  <main class="main-content">

    <!-- HEADER SUPERIOR -->
    <header class="main-header">
      <div class="welcome">
        <h2>Bienvenido, Administrador</h2>
        <p>Resumen general del centro hospitalario</p>
      </div>
      <div class="user-info">
        <img src="${pageContext.request.contextPath}/imgenes/Icono_gestionar_usuarios.svg" alt="Usuario" class="user-avatar" />
        <span class="username">Administrador</span>
      </div>
    </header>

    <!-- TARJETAS DE RESUMEN -->
    <section class="cards-section">
      <div class="card">
        <img src="${pageContext.request.contextPath}/imgenes/Icono_pacientes.svg" alt="">
        <div>
          <h3>Pacientes</h3>
          <p>256 activos</p>
        </div>
      </div>
      <div class="card">
        <img src="${pageContext.request.contextPath}/imgenes/Icono_citas.svg" alt="">
        <div>
          <h3>Citas</h3>
          <p>34 programadas</p>
        </div>
      </div>
      <div class="card">
        <img src="${pageContext.request.contextPath}/imgenes/Icono_doctores.svg" alt="">
        <div>
          <h3>Doctores</h3>
          <p>18 en turno</p>
        </div>
      </div>
      <div class="card">
        <img src="${pageContext.request.contextPath}/imgenes/Icono_emergencias.svg" alt="">
        <div>
          <h3>Emergencias</h3>
          <p>5 activas</p>
        </div>
      </div>
    </section>

    <!-- GRÁFICOS Y REPORTES -->
    <section class="charts-section">
      <div class="chart-box">
        <h3>Estadisticas de Pacientes</h3>
        <img src="imgenes/grafico1.svg" alt="Grafico de pacientes" class="chart" />
      </div>
      <div class="chart-box">
        <h3>Citas por especialidad</h3>
        <img src="imgenes/grafico2.svg" alt="Grafico de citas" class="chart" />
      </div>
    </section>

    <!-- TABLA DE REGISTROS -->
    <section class="table-section">
      <h3>Ultimos registros de pacientes</h3>
      <table>
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Documento</th>
            <th>Fecha ingreso</th>
            <th>Area</th>
            <th>Estado</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Maria Gomez</td>
            <td>CC 10234567</td>
            <td>22/10/2025</td>
            <td>Pediatria</td>
            <td><span class="estado activo">Activo</span></td>
          </tr>
          <tr>
            <td>Carlos Lopez</td>
            <td>CC 10098342</td>
            <td>21/10/2025</td>
            <td>Urgencias</td>
            <td><span class="estado inactivo">Inactivo</span></td>
          </tr>
          <tr>
            <td>Laura Torres</td>
            <td>CC 10456322</td>
            <td>21/10/2025</td>
            <td>Medicina general</td>
            <td><span class="estado activo">Activo</span></td>
          </tr>
        </tbody>
      </table>
    </section>

  </main>

</body>
</html>
