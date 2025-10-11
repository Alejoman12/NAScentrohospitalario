package com.hospital.model;

public class Administrador extends Usuario {

    private String idAdminsitrador;
    private String telefono;

    public Administrador(int id, String idAdminsitrador, String nombre, String correo, String contrasena, boolean activo, String telefono) {
        super(id, nombre, correo, contrasena, "Administrador", activo);
        this.idAdminsitrador = idAdminsitrador;
        this.telefono = telefono;
    }

    public Administrador() {
    }

    public String getIdAdminsitrador() {
        return idAdminsitrador;
    }

    public void setIdAdminsitrador(String idAdminsitrador) {
        this.idAdminsitrador = idAdminsitrador;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
