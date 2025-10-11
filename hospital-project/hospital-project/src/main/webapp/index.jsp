<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Hospital NMS - Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/global.css" />
    <link rel="stylesheet" href="css/index-styles-figma.css" />
    <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet" />
</head>
<body>
<div class="login-hospital">
    <div class="app">
        <div class="container">
            <div class="login-hospital-container">
                <div class="container2">
                    <img class="imagewithfallback-icon" src="imgenes/HospitalFondo.jpg" alt="Imagen de fondo" />
                    <div class="container3"></div>
                </div>
                <div class="container4">
                    <div class="heading-1">
                        <b class="sistema-hospitalario">Sistema Hospitalario</b>
                    </div>
                    <div class="paragraph">
                        <div class="plataforma-integral-para">
                            Plataforma integral para la gestión médica y administrativa del hospital. Acceso seguro para profesionales de la salud.
                        </div>
                    </div>
                    <div class="container5">
                        <div class="container6">
                            <div class="container7"><b class="b">24/7</b></div>
                            <div class="container8"><div class="disponibilidad">Disponibilidad</div></div>
                        </div>
                        <div class="container9">
                            <div class="container7"><b class="b">100%</b></div>
                            <div class="container8"><div class="disponibilidad">Seguridad</div></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tarjeta de login -->
            <div class="card">
                <div class="cardheader">
                    <img class="hospitallogo-icon" src="imgenes/logoHospital.jpg" alt="Logo del hospital" />
                    <div class="cardtitle"><div class="b">HOSPITAL NMS</div></div>
                    <div class="carddescription"><div class="acceso-al-sistema">Acceso al sistema hospitalario</div></div>
                </div>

                <!-- Formulario funcional -->
                <form id="loginForm" action="loginUsuario" method="post" class="loginform" style="position: relative;">
                    <div class="container12" style="z-index: 1;">
                        <label for="correo" class="primitivelabel email-o-usuario">Email</label>
                        <input type="text" id="correo" name="correo" class="input doctorhospitalnmscom" placeholder="Ejemplo:doctor@gmail.com" required />
                        <p class="error-message" id="correo-error" style="color: red; display: none;">Por favor, ingrese un correo válido</p>
                    </div>

                    <div class="container13" style="z-index: 1;">
                        <label for="contrasena" class="primitivelabel email-o-usuario">Contraseña</label>
                        <input type="password" id="contrasena" name="contrasena" class="login-hospital-input doctorhospitalnmscom" placeholder="••••••••" required />
                        <p class="error-message" id="contrasena-error" style="color: red; display: none;">Las credenciales se requieren</p>
                    </div>

                    <div class="container15" style="z-index: 1;">
                        <label class="primitivelabel2">
                            <input type="checkbox" name="recordar" /> Recordar credenciales
                        </label>
                    </div>

                    <button type="submit" class="button" style="z-index: 1; left: -15px">
                        <div class="iniciar-sesin">Iniciar Sesión</div>
                    </button>

                    <div class="login-hospital-button" style="z-index: 1; left: 130px">
                        <a href="jsp/recuperar.jsp" class="recordar-credenciales">¿Olvidaste tu contraseña?</a>
                    </div>

                    <div class="register-link" style="position: absolute; top: 300px; left: 100px; z-index: 1;">
                        ¿No tienes cuenta? <a href="jsp/registrarPaciente.jsp">Regístrate</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="login-hospital-app">
        <div class="container16"></div>
        <div class="container17"></div>
    </div>
</div>

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