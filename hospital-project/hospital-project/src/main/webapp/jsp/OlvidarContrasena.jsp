<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Recuperar contraseña - NAS Centro hospitalario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/indexOlvidarContrasena.css">
</head>

<body>
    <main class="olvidar-contrasea">
        <div class="background-blur"></div>
        <div class="card">

            <!-- Lado izquierdo -->
            <section class="card-left">
                <div> 
                    <img src="${pageContext.request.contextPath}/imgenes/ImagenOlvidarContrasena.jpg" alt="imagen fondo" class="imagen-fondo" />"
                </div>
                <div class="overlay"></div>
                <header class="brand">
                    <img src="${pageContext.request.contextPath}/imgenes/logoHospital.jpg" alt="NAS Logo" class="brand-logo" />
                    <div>
                        <h2>NAS Centro hospitalario</h2>
                        <p>Sistema de Salud</p>
                    </div>
                </header>

                <div class="intro">
                    <h3>Recupera tu cuenta de forma segura</h3>
                    <p>Protegemos tus datos con los más altos estándares de seguridad médica.</p>

                    <div class="features">
                        <div class="feature">
                            <img src="${pageContext.request.contextPath}/imgenes/IconEscudo.svg" alt="Seguridad" />
                            <div>
                                <h4>Proceso seguro</h4>
                                <p>Enlace cifrado de un solo uso</p>
                            </div>
                        </div>
                        <div class="feature">
                            <img src="${pageContext.request.contextPath}/imgenes/IconCandado.svg" alt="Protección" />
                            <div>
                                <h4>Datos protegidos</h4>
                                <p>Tu información siempre segura</p>
                            </div>
                        </div>
                        <div class="feature">
                            <img src="${pageContext.request.contextPath}/imgenes/IconChuloEnCirculo.svg" alt="Rápido" />
                            <div>
                                <h4>Recuperación rápida</h4>
                                <p>Acceso en minutos</p>
                            </div>
                        </div>
                    </div>

                    <footer class="footer">© 2025 NAS Centro hospitalario. Todos los derechos reservados</footer>
                </div>
            </section>

            <!-- Lado derecho -->
            <section class="card-right">
                <h2>¿Olvidaste tu clave?</h2>
                <p>Ingresa tu correo electrónico y te enviaremos un enlace para recuperar tu cuenta.</p>

                <form action="${pageContext.request.contextPath}/recuperarContrasena" method="post" class="form">
                    <label for="correo">Correo electrónico *</label>
                    <input type="email" name="correo" id="correo" placeholder="Ejemplo: juan@gmail.com" required>

                    <div class="alert">
                        <span>Te enviaremos un enlace seguro para restablecer tu clave.</span>
                    </div>
                    
                    <button type="submit" class="btn-primary">Enviar enlace de recuperación</button>

                    <div class="actions">
                        <a href="${pageContext.request.contextPath}/index.jsp" class="back-link">Volver al inicio de sesión</a>
                        <div class="create-account">
                            <span>¿No tienes una cuenta?</span>
                            <a href="${pageContext.request.contextPath}/jsp/registrarPaciente.jsp">Crear cuenta</a>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </main>
</body>
</html>
