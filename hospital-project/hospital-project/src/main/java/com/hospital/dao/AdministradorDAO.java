package com.hospital.dao;

import com.hospital.database.SQL;
import com.hospital.model.Administrador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdministradorDAO {

    private PreparedStatement stmt;

    public boolean insertarAdministrador(Administrador administrador) {
        boolean success = false;
        String query = "INSERT INTO administrador (id_usuario, id_administrador, telefono, activo) VALUES (?, ?, ?, ?)";

        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, administrador.getId());
            stmt.setString(2, administrador.getIdAdminsitrador());
            stmt.setString(3, administrador.getTelefono());
            stmt.setBoolean(4, administrador.isActivo());

            int rows = stmt.executeUpdate();
            success = (rows > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            sql.disconnectDatabase();
        }

        return success;
    }

    public boolean actualizarAdministrador(Administrador administrador) {
        boolean success = false;
        String query = "UPDATE administrador SET telefono = ?, activo = ? WHERE id_usuario = ?";

        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            stmt = conn.prepareStatement(query);
            stmt.setString(1, administrador.getTelefono());
            stmt.setBoolean(2, administrador.isActivo());
            stmt.setInt(3, administrador.getId());

            int rows = stmt.executeUpdate();
            success = (rows > 0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            sql.disconnectDatabase();
        }

        return success;
    }

    public boolean eliminarAdministrador(int idUsuario) {
        String sql = "UPDATE administrador SET activo = 0 WHERE id_usuario = ?";
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

    public Administrador obtenerUsuarioPorId(int idUsuario) {
        String query = "SELECT * FROM administrador WHERE id_usuario = ?";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if(rs.next()) {
                Administrador a = new Administrador();
                a.setId(rs.getInt("id_usuario"));
                a.setIdAdminsitrador(rs.getString("id_administrador"));
                a.setTelefono(rs.getString("telefono"));
                a.setActivo(rs.getBoolean("activo"));
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }
        return null;
    }
}
