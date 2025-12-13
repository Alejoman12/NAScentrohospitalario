package com.hospital.dao;

import com.hospital.database.SQL;
import com.hospital.model.Cita;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CitaDAO {

    // ===========================================================
    // INSERTAR CITA
    // ===========================================================
    public boolean agendarCita(Cita cita) {
        String query = "INSERT INTO cita (id_paciente, id_medico, fecha_hora, motivo, estado, activo) " +
                "VALUES (?, ?, ?, ?, ?, 1)";

        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, cita.getIdPaciente());
            stmt.setString(2, cita.getIdMedico());
            stmt.setString(3, cita.getFechaHora()); // formato yyyy-MM-dd HH:mm:ss
            stmt.setString(4, cita.getMotivo());
            stmt.setString(5, cita.getEstado());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            sql.disconnectDatabase();
        }
    }


    // ===========================================================
    // OBTENER CITAS POR PACIENTE
    // ===========================================================
    public List<Cita> obtenerCitasPorPaciente(String idPaciente) {
        List<Cita> lista = new ArrayList<>();

        String query = "SELECT * FROM cita WHERE id_paciente = ? ORDER BY fecha_hora DESC";

        SQL sql = new SQL();
        sql.connectDatabase();

        try (PreparedStatement stmt = sql.getConnection().prepareStatement(query)) {

            stmt.setString(1, idPaciente);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Cita cita = new Cita();
                cita.setIdCita(rs.getInt("id_cita"));
                cita.setIdPaciente(rs.getString("id_paciente"));
                cita.setIdMedico(rs.getString("id_medico"));
                cita.setFechaHora(rs.getString("fecha_hora"));
                cita.setMotivo(rs.getString("motivo"));
                cita.setEstado(rs.getString("estado"));

                lista.add(cita);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }

        return lista;
    }


    // ===========================================================
    // OBTENER CITAS PENDIENTES POR MÉDICO
    // ===========================================================
    public List<Cita> obtenerCitasPendientesPorMedico(String idMedico) {
        List<Cita> lista = new ArrayList<>();

        String query = "SELECT * FROM cita WHERE id_medico = ? AND estado = 'Pendiente' AND activo = 1 ORDER BY fecha_hora ASC";

        SQL sql = new SQL();
        sql.connectDatabase();

        try (PreparedStatement stmt = sql.getConnection().prepareStatement(query)) {

            stmt.setString(1, idMedico);
            System.out.println("Buscando citas PENDIENTES del médico: " + idMedico);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Cita cita = new Cita();
                cita.setIdCita(rs.getInt("id_cita"));
                cita.setIdPaciente(rs.getString("id_paciente")); // ← CORREGIDO
                cita.setIdMedico(rs.getString("id_medico"));
                cita.setFechaHora(rs.getString("fecha_hora"));
                cita.setMotivo(rs.getString("motivo"));
                cita.setEstado(rs.getString("estado"));

                lista.add(cita);

                System.out.println("CITA ENCONTRADA: " + cita.getIdCita() + " - " + cita.getEstado());
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }

        System.out.println("TOTAL CITAS ENCONTRADAS: " + lista.size());
        return lista;
    }

}
