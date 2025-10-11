<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Hospital NMS - Registro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/indexRegistrar.css" />
    <link rel="stylesheet" href="../css/globalRegistrar.css" />
    <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet" />
</head>
<body>

<div class="registrar-usuarios">
    <div class="card">
        <div class="cardheader">
            <div class="cardtitle">
                <div class="crear-cuenta">Crear cuenta</div>
            </div>
            <div class="carddescription">
                <div class="ingresa-tus-datos">Ingresa tus datos para registrarte</div>
            </div>
        </div>

        <!-- Formulario dinámico -->
        <form action="RegistrarUsuario" method="post" class="registerform">
            <div class="container">
                <div class="registrar-usuarios-container">
                    <div class="primitivelabel">
                        <label for="nombre" class="nombre">Nombre</label>
                    </div>
                    <div class="container2">
                        <input type="text" id="nombre" name="nombre" class="input" placeholder="Juan" required />
                        <img class="icon1" src="imgenes/iconPersona.svg" alt="Icono nombre" />
                    </div>
                </div>

                <div class="container3">
                    <div class="primitivelabel">
                        <label for="apellido" class="nombre">Apellido</label>
                    </div>
                    <div class="container2">
                        <input type="text" id="apellido" name="apellido" class="input" placeholder="Pérez" required />
                        <img class="icon2" src="../imgenes/IconPersona.svg" alt="Icono apellido" />
                    </div>
                </div>
            </div>

            <div class="container5">
                <div class="primitivelabel">
                    <label for="correo" class="nombre">Correo electrónico</label>
                </div>
                <div class="container2">
                    <input type="email" id="correo" name="correo" class="input2" placeholder="juan@ejemplo.com" required />
                    <img class="icon3" src="imgenes/iconPersona.svg" alt="Icono correo" />
                </div>
            </div>

            <div class="container5">
                <div class="primitivelabel">
                    <label for="contrasena" class="nombre">Contraseña</label>
                </div>
                <div class="container2">
                    <input type="password" id="contrasena" name="contrasena" class="input3" placeholder="••••••••" required />
                    <img class="icon" src="imgenes/iconOjo.svg" alt="Icono contraseña" />
                    <img class="button-icon" src="imgenes/iconOjo.svg" alt="Mostrar contraseña" />
                </div>
            </div>

            <div class="container5">
                <div class="primitivelabel">
                    <label for="confirmar" class="nombre">Confirmar contraseña</label>
                </div>
                <div class="container2">
                    <input type="password" id="confirmar" name="confirmar" class="input3" placeholder="••••••••" required />
                    <img class="icon" src="imgenes/iconOjo.svg" alt="Icono confirmar contraseña" />
                    <img class="button-icon" src="imgenes/iconOjo.svg" alt="Mostrar contraseña" />
                </div>
            </div>

            <div class="container11">
                <input type="checkbox" id="terminos" name="terminos" required />
                <label for="terminos" class="primitivelabel5">
                    <span class="acepto-los">Acepto los</span>
                    <span class="trminos-y-condiciones">términos y condiciones</span>
                </label>
            </div>

            <button type="submit" class="button">
                <span class="registrar-usuarios-crear-cuenta">Crear cuenta</span>
            </button>

            <div class="paragraph">
                <span class="ya-tienes-una">¿Ya tienes una cuenta?</span>
                <div class="registrar-usuarios-button">
                    <a href="index.jsp" class="trminos-y-condiciones">Inicia sesión</a>
                </div>
            </div>
        </form>
    </div>

    <div class="t3"></div>
</div>

</body>
</html>