package com.hospital.model;

public class Usuario {
    private int idUsuario;
    private String nombre;
    private String correo;
    private String contrasena;
    private String rol;
    private boolean activo;
    private String pregunta;
    private String respuesta;

    public Usuario() {}

    public Usuario(int idUsuario, String nombre, String correo, String contrasena, String rol, boolean activo, String pregunta, String respuesta) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.correo = correo;
        this.contrasena = contrasena;
        this.rol = rol;
        this.activo = activo;
        this.pregunta = pregunta;
        this.respuesta = respuesta;
    }

    public int getId() {
        return idUsuario;
    }

    public void setId(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public String getPregunta() {return pregunta;}

    public void setPregunta(String pregunta) {this.pregunta = pregunta;}

    public String getRespuesta() {return respuesta;}

    public void setRespuesta(String respuesta) {this.respuesta = respuesta;}
}
