package com.hospital.dao;

import com.hospital.database.SQL;
import com.hospital.model.Medico;
import com.hospital.model.Recepcionista;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RecepcionistaDAO {

    private String table;

    public RecepcionistaDAO() {
        table = "recepcionista";
    }

    public boolean insertarRecepcionista(Recepcionista recepcionista) {

        String query = "INSERT INTO " + table + " (id_recepcionista, id_usuario, turno, telefono, activo) VALUES (?, ?, ?, ?, ?)";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, recepcionista.getIdRecepcionista());
            stmt.setInt(2, recepcionista.getId());
            stmt.setString(3, recepcionista.getTurno());
            stmt.setString(4, recepcionista.getTelefono());
            stmt.setBoolean(5, recepcionista.isActivo());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            sql.disconnectDatabase();
        }
    }

    public boolean actualizarRecepcinista(Recepcionista recepcionista) {
        String query = "UPDATE table SET especialidad = ?, telefono = ?, correo = ?, activo = ? WHERE id_usuario = ?";

        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, recepcionista.getTurno());
            stmt.setString(2, recepcionista.getTelefono());
            stmt.setString(3, recepcionista.getCorreo());
            stmt.setBoolean(4, recepcionista.isActivo());

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
        String sql = "UPDATE table SET activo = false WHERE id_usuario = ?";
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

    public Recepcionista obtenerUsuarioPorId(int idUsuario) {
        String query = "SELECT * FROM recepcionista WHERE id_usuario = ?";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Recepcionista r = new Recepcionista();
                r.setId(rs.getInt("id_usuario"));
                r.setIdRecepcionista(rs.getString("id_recepcionista"));
                r.setTurno(rs.getString("turno"));
                r.setTelefono(rs.getString("telefono"));
                r.setActivo(rs.getBoolean("activo"));
                return r;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }
        return null;
    }
}
