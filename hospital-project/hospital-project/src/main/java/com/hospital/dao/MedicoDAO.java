package com.hospital.dao;

import com.hospital.database.SQL;
import com.hospital.model.Medico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MedicoDAO {

    public boolean insertarMedico(Medico medico) {

        String query = "INSERT INTO medico (id_medico, id_usuario, especialidad, telefono, activo) VALUES (?, ?, ?, ?, ?)";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, medico.getIdMedico());
            stmt.setInt(2, medico.getId());
            stmt.setString(3, medico.getEspecialidad());
            stmt.setString(4, medico.getTelefono());
            stmt.setBoolean(5, medico.isActivo());

            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            sql.disconnectDatabase();
        }
    }

    public boolean actualizarMedico(Medico medico) {
        String query = "UPDATE medico SET especialidad = ?, telefono = ?, activo = ? WHERE id_usuario = ?";

        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, medico.getEspecialidad());
            stmt.setString(2, medico.getTelefono());
            stmt.setBoolean(3, medico.isActivo());
            stmt.setInt(4, medico.getId());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            sql.disconnectDatabase();
        }
    }

    public boolean eliminarMedico(int idUsuario) {
        String sql = "UPDATE medico SET activo = 0 WHERE id_usuario = ?";
        SQL conexion = new SQL();
        conexion.connectDatabase();
        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUsuario);
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexion.disconnectDatabase();
        }
    }

    public Medico obtenerUsuarioPorId(int idUsuario) {
        String query = "SELECT * FROM medico WHERE id_usuario = ?";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Medico m = new Medico();
                m.setId(rs.getInt("id_usuario"));
                m.setIdMedico(rs.getString("id_medico"));
                m.setEspecialidad(rs.getString("especialidad"));
                m.setTelefono(rs.getString("telefono"));
                m.setActivo(rs.getBoolean("activo"));
                return m;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }
        return null;
    }
}
