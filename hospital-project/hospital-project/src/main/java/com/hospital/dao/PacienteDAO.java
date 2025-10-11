package com.hospital.dao;

import com.hospital.database.SQL;
import com.hospital.model.Administrador;
import com.hospital.model.Paciente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PacienteDAO {

    public boolean insertarPaciente(Paciente paciente) {
        String query = " INSERT INTO paciente (id_paciente, id_usuario, id_medico, documento_identidad, fecha_nacimiento, genero, direccion, telefono , correo, activo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, paciente.getIdPaciente());
            stmt.setInt(2, paciente.getId());
            stmt.setString(3, paciente.getIdMedico());
            stmt.setString(4, paciente.getDocumentoIdentidad());
            stmt.setString(5, paciente.getFechaNacimiento().toString());
            stmt.setString(6, paciente.getGenero());
            stmt.setString(7, paciente.getDireccion());
            stmt.setString(8, paciente.getTelefono());
            stmt.setString(9, paciente.getCorreo());
            stmt.setBoolean(10, paciente.isActivo());

            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            sql.disconnectDatabase();
        }
    }

    public Paciente obtenerPorId(int idUsuario) {
        String query = "SELECT * FROM paciente WHERE id_usuario = ?";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if(rs.next()) {
                Paciente paciente = new Paciente();
                paciente.setId(rs.getInt("id_usuario"));
                paciente.setIdPaciente(rs.getString("id_paciente"));
                paciente.setDocumentoIdentidad(rs.getString("documento_identidad"));
                paciente.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());
                paciente.setGenero(rs.getString("genero"));
                paciente.setDireccion(rs.getString("direccion"));
                paciente.setTelefono(rs.getString("telefono"));
                paciente.setCorreo(rs.getString("correo"));
                paciente.setIdMedico(rs.getString("id_medico"));
                paciente.setActivo(rs.getBoolean("activo"));
                return paciente;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean actualizarPaciente(Paciente paciente) {
        String query = "UPDATE paciente SET documento_identidad = ?, fecha_nacimiento = ?, genero = ?, direccion = ?, telefono = ?, correo = ?, activo = ? WHERE id_usuario = ?";

        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, paciente.getDocumentoIdentidad());
            stmt.setDate(2, java.sql.Date.valueOf(paciente.getFechaNacimiento()));
            stmt.setString(3, paciente.getGenero());
            stmt.setString(4, paciente.getDireccion());
            stmt.setString(5, paciente.getTelefono());
            stmt.setString(6, paciente.getCorreo());
            stmt.setBoolean(7, paciente.isActivo());
            stmt.setInt(8, paciente.getId());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            sql.disconnectDatabase();
        }
    }

    public boolean eliminarPaciente(int idUsuario) {
        String sql = "UPDATE paciente SET activo = false WHERE id_usuario = ?";
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

}
