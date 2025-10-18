package com.hospital.model;

import java.time.LocalDate;

public class Paciente extends Usuario {

    private String idPaciente;
    private String direccion;
    private String telefono;
    private String documentoIdentidad;
    private LocalDate fechaNacimiento;
    private String genero;
    private String idMedico;

    public Paciente() {
        super();
    }

    public Paciente(int id, String nombre, String correo, String contrasena, boolean activo, String pregunta, String respuesta, String idPaciente, String direccion, String telefono, LocalDate fechaNacimiento, String genero, String idMedico, String documentoIdentidad) {
        super(id, nombre, correo, contrasena, "Paciente", activo, pregunta, respuesta);
        this.idPaciente = idPaciente;
        this.direccion = direccion;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.genero = genero;
        this.idMedico = idMedico;
        this.documentoIdentidad = documentoIdentidad;
    }

    public String getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(String idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getIdMedico() {
        return idMedico;
    }

    public void setIdMedico(String idMedico) {
        this.idMedico = idMedico;
    }

    public String getDocumentoIdentidad() {
        return documentoIdentidad;
    }

    public void setDocumentoIdentidad(String documentoIdentidad) {
        this.documentoIdentidad = documentoIdentidad;
    }
}
