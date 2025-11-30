package com.hospital.model;

public class Cita {
    private int idCita;
    private String idPaciente;
    private String nombrePaciente;
    private String nombreMedico;
    private String idMedico;
    private String fechaHora;
    private String motivo;
    private String estado;
    private int activo;

    // Getters y Setters
    public int getIdCita() {
        return idCita;
    }
    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public String getIdPaciente() {
        return idPaciente;
    }
    public void setIdPaciente(String idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getIdMedico() {
        return idMedico;
    }
    public void setIdMedico(String idMedico) {
        this.idMedico = idMedico;
    }

    public String getFechaHora() {
        return fechaHora;
    }
    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getMotivo() {
        return motivo;
    }
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getActivo() {
        return activo;
    }
    public void setActivo(int activo) {
        this.activo = activo;
    }
    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public String getNombreMedico() {
        return nombreMedico;
    }

    public void setNombreMedico(String nombreMedico) {
        this.nombreMedico = nombreMedico;
    }
}
