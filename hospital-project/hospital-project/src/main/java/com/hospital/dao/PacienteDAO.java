package com.hospital.dao;

import com.hospital.database.SQL;
import com.hospital.model.Administrador;
import com.hospital.model.Paciente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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


    public int contarPacientes() {
        String sqlQuery = "SELECT COUNT(*) FROM paciente";
        return ejecutarContador(sqlQuery);
    }

    public int contarActivos() {
        String sqlQuery = "SELECT COUNT(*) FROM paciente WHERE activo = TRUE";
        return ejecutarContador(sqlQuery);
    }

    public int contarInactivos() {
        String sqlQuery = "SELECT COUNT(*) FROM paciente WHERE activo = FALSE";
        return ejecutarContador(sqlQuery);
    }

    private int ejecutarContador(String query) {
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }
        return 0;
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

    public List<Paciente> listarPacientes(String busqueda, String estado) {

        List<Paciente> lista = new ArrayList<>();

        String sql =
                "SELECT p.*, u.nombre AS nombre_usuario " +
                        "FROM paciente p " +
                        "INNER JOIN usuario u ON p.id_usuario = u.id_usuario " +
                        "WHERE (p.id_paciente LIKE ? " +
                        "OR p.documento_identidad LIKE ? " +
                        "OR p.correo LIKE ? " +
                        "OR u.nombre LIKE ?)";

        // Filtros por estado
        if (estado != null) {
            if (estado.equals("activo")) {
                sql += " AND p.activo = TRUE";
            } else if (estado.equals("inactivo")) {
                sql += " AND p.activo = FALSE";
            }
        }

        SQL conexion = new SQL();
        conexion.connectDatabase();

        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String like = "%" + busqueda + "%";

            stmt.setString(1, like);
            stmt.setString(2, like);
            stmt.setString(3, like);
            stmt.setString(4, like); // Buscar también por nombre de usuario

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Paciente p = new Paciente();

                // Campos de paciente
                p.setId(rs.getInt("id_usuario"));
                p.setIdPaciente(rs.getString("id_paciente"));
                p.setDocumentoIdentidad(rs.getString("documento_identidad"));
                p.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());
                p.setGenero(rs.getString("genero"));
                p.setDireccion(rs.getString("direccion"));
                p.setTelefono(rs.getString("telefono"));
                p.setCorreo(rs.getString("correo"));
                p.setIdMedico(rs.getString("id_medico"));
                p.setActivo(rs.getBoolean("activo"));

                // Campo del usuario
                p.setNombreUsuario(rs.getString("nombre_usuario"));

                lista.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conexion.disconnectDatabase();
        }

        return lista;
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
