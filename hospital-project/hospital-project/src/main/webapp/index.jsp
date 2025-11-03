<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Hospital NMS - Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/index-styles-figma.css" />
    <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet" />
</head>

<body>

  <main class="login-page">
    <!-- Panel izquierdo -->
    <section class="info-panel">
      <img src="imgenes/HospitalFondo.jpg" alt="Implementos médicos" class="background-img">
      <div class="info-content">
        <h1 class="title">Sistema Hospitalario</h1>
        <p class="description">
          Plataforma integral para la gestión médica y administrativa del hospital.
          Acceso seguro para profesionales de la salud.
        </p>
      </div>
    </section>

    <!-- Panel derecho (Login) -->
    <section class="login-card">
      <div class="card-header">
        <img src="imgenes/logoHospital.jpg" alt="Logo Hospital" class="hospital-logo">
        <h2>HOSPITAL NMS</h2>
        <p>Acceso al sistema hospitalario</p>
      </div>

      <form action="loginUsuario" method="post" class="login-form">
        <label for="correo">Email</label>
        <input type="email" id="correo" name="correo" placeholder="Ejemplo: doctor@gmail.com" required>

        <label for="contrasena">Contraseña</label>
        <input type="password" id="contrasena" name="contrasena" placeholder="••••••••" required>

        <div class="remember">
          <input type="checkbox" id="recordar" name="recordar">
          <label for="recordar">Recordar credenciales</label>
        </div>

        <button type="submit" class="btn">Iniciar Sesión</button>

        <div class="links">
          <a href="${pageContext.request.contextPath}/jsp/OlvidarContrasena.jsp">¿Olvidaste tu contraseña?</a>
          <p>¿No tienes cuenta? <a href="${pageContext.request.contextPath}/jsp/registrarPaciente.jsp">Regístrate</a></p>
        </div>
      </form>
    </section>
  </main>

<!-- Validación visual -->
<script>
    document.getElementById('loginForm').addEventListener('submit', function (e) {
        const correo = document.getElementById('correo');
        const contrasena = document.getElementById('contrasena');
        const correoError = document.getElementById('correo-error');
        const contrasenaError = document.getElementById('contrasena-error');

        let valid = true;

        if (!correo.value.includes('@') || correo.value.trim() === '') {
            correoError.style.display = 'block';
            valid = false;
        } else {
            correoError.style.display = 'none';
        }

        if (contrasena.value.trim() === '') {
            contrasenaError.style.display = 'block';
            valid = false;
        } else {
            contrasenaError.style.display = 'none';
        }

        if (!valid) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>