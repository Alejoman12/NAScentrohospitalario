<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, width=device-width">
    <link rel="stylesheet" href="../css/globalRegistrar.css" />
    <link rel="stylesheet" href="../css/indexRegistrar.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" />
</head>
<body>

<div class="mejorar-formulario-de-registro">
    <div class="container"></div>
    <div class="mejorar-formulario-de-registro-container"></div>
    <div class="container2">
        <div class="container3">
            <div class="container4">

                <img class="imagewithfallback-icon" src="../imgenes/ImagenFormularioRegistrar.jpg" alt="Icono Fondo" />

                <div class="container5"></div>
                <div class="container6">
                    <img class="container-icon" src="../imgenes/IconCorazon.svg" alt="Icono Corazon" />
                    <div class="container7">
                        <div class="heading-2"><div class="nas-centro-hospitalario">NAS Centro hospitalario</div></div>
                        <div class="paragraph"><div class="sistema-de-salud">Sistema de Salud</div></div>
                    </div>
                </div>

                <div class="container8">
                    <div class="heading-3">
                        <div class="nete-a-nuestra">Unete a nuestra</div>
                    </div>
                    <div class="mejorar-formulario-de-registro-paragraph">
                        <div class="accede-a-los">Accede a los mejores servicios de salud y manten tu historial medico en un solo lugar.</div>
                    </div>
                    <div class="container9">
                        <div class="container10">
                            <img class="mejorar-formulario-de-registro-container-icon" src="../imgenes/IconChulo.svg" alt="Icono Chulo" />
                            <div class="container11">
                                <div class="heading-4"><div class="historial-seguro">Atencion 24/7</div></div>
                                <div class="paragraph2"><div class="sistema-de-salud">Soporte medico disponible en todo momento</div></div>
                            </div>
                        </div>
                        <div class="container10">
                            <img class="mejorar-formulario-de-registro-container-icon" src="../imgenes/IconChulo.svg" alt="Icono chulo" />
                            <div class="container13">
                                <div class="heading-4"><div class="historial-seguro">Historial seguro</div></div>
                                <div class="paragraph2"><div class="sistema-de-salud">Tus datos medicos protegidos y cifrados</div></div>
                            </div>
                        </div>
                        <div class="container10">
                            <img class="mejorar-formulario-de-registro-container-icon" src="../imgenes/IconChulo.svg" alt="Icono chulo" />
                            <div class="container15">
                                <div class="heading-4"><div class="historial-seguro">Doctores certificados</div></div>
                                <div class="paragraph2"><div class="sistema-de-salud">Profesionales verificados y experimentados</div></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text">
                    <div class="sistema-de-salud">2025 NAS Centro hospitalario. Todos los derechos reservados</div>
                </div>
            </div>

            <!-- FORMULARIO -->
            <div class="container16">
                <div class="container17">
                    <div class="heading-2"><div class="nas-centro-hospitalario">Crear cuenta</div></div>
                    <div class="paragraph5"><div class="historial-seguro">Ingresa tus datos para registrarte como paciente</div></div>
                </div>

                <form class="form" action="registrarUsuario" method="post">
                    <div class="container18">
                        <div class="container19">
                            <div class="primitivelabel"><div class="nombre">Nombre *</div></div>
                            <div class="container20">
                                <input type="text" name="nombre" class="input" placeholder="Ejemplo: Juan" required />
                                <img class="iconPersona" src="../imgenes/IconPersona.svg" alt="Icono Persona" />
                            </div>
                        </div>
                        <div class="container21">
                            <div class="primitivelabel"><div class="nombre">Apellido *</div></div>
                            <div class="container20">
                                <input type="text" name="apellido" class="input" placeholder="Ejemplo: Perez" required />
                                <img class="iconPersona" src="../imgenes/IconPersona.svg" alt="Icono Persona" />
                            </div>
                        </div>
                    </div>

                    <div class="container23">
                        <div class="primitivelabel2"><div class="nombre">Tipo de cuenta *</div></div>
                        <div class="primitivebutton">
                            <div class="slotclone">
                                <div class="selectitemtext"><div class="mejorar-formulario-de-registro-paciente"></div>Paciente</div>
                            </div>
                            <img class="iconflechaHaciaAbajo" src="../imgenes/IconFlechahaciaAbajo.svg" alt="Icono Flecha Abajo" />
                        </div>
                    </div>

                    <div class="container24">
                        <div class="container19">
                            <div class="primitivelabel"><div class="nombre">Correo electronico *</div></div>
                            <div class="container20">
                                <input type="email" name="correo" class="input" placeholder="Ejemplo: juan@ejemplo.com" required />
                                <img class="iconMensaje" src="../imgenes/IconMensaje.svg" alt="Icono Mensaje" />
                            </div>
                        </div>
                        <div class="container21">
                            <div class="primitivelabel"><div class="nombre">Telefono *</div></div>
                            <div class="container20">
                                <input type="tel" name="telefono" class="input" placeholder="Ejemplo: +52 123 456 7890" required />
                                <img class="iconTelefono" src="../imgenes/IconTelefono.svg" alt="Icono telefono" />
                            </div>
                        </div>
                    </div>

                    <div class="container29">
                        <div class="primitivelabel5"><div class="nombre">Direccion *</div></div>
                        <div class="container30">
                            <input type="text" name="direccion" class="input4" placeholder="Ejemplo: Calle, Ciudad, Estado" required />
                            <img class="iconMapa" src="../imgenes/IconMapa.svg" alt="Icono Mapa" />
                        </div>
                    </div>

                    <div class="container31">
                        <div class="primitivelabel5"><div class="nombre">Contrasena *</div></div>
                        <div class="container30">
                            <input type="password" name="contrasena" class="input5" placeholder="Minimo 8 caracteres" minlength="8" required />
                            <img class="iconCandado" src="../imgenes/IconCandado.svg" alt="Icono Candado" />
                            <img class="iconOjo" src="../imgenes/IconOjo.svg" alt="Icono Ojo" />
                        </div>
                    </div>

                    <div class="container33">
                        <div class="mejorar-formulario-de-registro-primitivebutton"></div>
                        <div class="primitivelabel7">
                            <div class="acepto-los">Acepto los</div>
                            <div class="registrarusuarios"><div class="trminos-y-condiciones">terminos y condiciones</div></div>
                            <div class="y-la">y la</div>
                            <div class="mejorar-formulario-de-registro-registrarusuarios"><div class="politica-de-privacidad">politica de privacidad</div></div>
                            <div class="de-nas-centro">de NAS Centro hospitalario</div>
                        </div>
                    </div>

                    <div class="button">
                        <button type="submit" class="paciente" style="all: unset; cursor: pointer;">Crear cuenta</button>
                    </div>

                    <div class="container34">
                        <div class="mejorar-formulario-de-registro-text"><div class="ya-tienes-una">Ya tienes una cuenta?</div></div>
                        <div class="mejorar-formulario-de-registro-button">
                            <a href="../index.jsp" class="historial-seguro">Inicia sesion</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <div class="t11"></div>
    </div>
</div>

</body>
</html>
