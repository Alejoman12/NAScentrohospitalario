<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Hospital NAS - Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index-styles.css">
    <link rel="icon" href="imgenes/logoHospital.jpg">
    <meta name="robots" content="noarchive">
</head>
<body>

<div class="login-wrapper">
    <!-- Sección izquierda -->
    <section class="info-section">
        <img src="imgenes/ImagenLogin.jpg" alt="Hospital" class="background-image">

        <div class="info-content">
            <h1 class="system-title">
                <img src="imgenes/logoHospital.jpg" alt="Logo Hospital" class="logo-icon">
                Sistema Hospitalario NAS
            </h1>

            <p class="system-description">
                Plataforma integral para la gestión médica y administrativa del hospital.
                Acceso seguro para profesionales de la salud.
            </p>

            <div class="features">
                <div class="feature"><strong>24/7</strong><br>Disponibilidad</div>
                <div class="feature"><strong>100%</strong><br>Seguridad</div>
                <div class="feature"><strong>5K+</strong><br>Usuarios</div>
                <div class="feature"><strong>99.9%</strong><br>Uptime</div>
            </div>
        </div>
    </section>

    <!-- Sección derecha -->
    <section class="form-section">
        <div class="login-card">
            <img src="imgenes/logoHospital.jpg" alt="Logo NAS" class="login-logo">
            <h2 class="hospital-name">CENTRO HOSPITALARIO</h2>
            <p class="login-subtitle">Portal de acceso seguro</p>

            <form id="loginForm" action="loginUsuario" method="post" class="login-form">
                <label for="correo" class="form-label">Correo electrónico</label>
                <input type="text" id="correo" name="correo" placeholder="doctor@hospitalnas.com" required class="form-input">

                <label for="contrasena" class="form-label">Contraseña</label>
                <input type="password" id="contrasena" name="contrasena" placeholder="••••••••" required class="form-input">

                <div class="remember-box">
                    <input type="checkbox" id="recordar" name="recordar">
                    <label for="recordar" class="remember-label">Recordar mis credenciales</label>
                </div>

                <button type="submit" class="btn-login">Iniciar Sesión</button>

                <a href="jsp/OlvidarContrasena.jsp#" class="forgot-link">¿Olvidaste tu contraseña?</a>
            </form>

            <div class="register-section">
                <p>¿No tienes una cuenta?</p>
                <a href="jsp/registrarPaciente.jsp#" class="btn-register">Registrarse</a>
            </div>
        </div>
    </section>
</div>

<script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        const correo = document.getElementById('correo');
        const contrasena = document.getElementById('contrasena');
        if (!correo.value.includes('@') || correo.value.trim() === '' || contrasena.value.trim() === '') {
            e.preventDefault();
            alert('Por favor, complete todos los campos correctamente.');
        }
    });
</script>

</body>
</html>
