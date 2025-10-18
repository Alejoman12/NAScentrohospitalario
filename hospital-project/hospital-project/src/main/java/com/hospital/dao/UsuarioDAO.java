package com.hospital.dao;

import com.hospital.database.SQL;
import com.hospital.model.Paciente;
import com.hospital.model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    private Connection conn;
    private ResultSet rs;
    private PreparedStatement stmt;

    public UsuarioDAO() {}

    public UsuarioDAO(Connection conn) {
        this.conn = conn;
    }

    public int insertarUsuario(Usuario usuario) {

        System.out.println("Insertando usuario");

        int idGenerado = 0;
        String query = "INSERT INTO usuario (nombre, correo, contrasena, rol, pregunta, respuesta) VALUES (?, ?, ?, ?, ?, ?)";

        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getCorreo());
            stmt.setString(3, usuario.getContrasena());
            stmt.setString(4, usuario.getRol());
            stmt.setString(5, usuario.getPregunta());
            stmt.setString(6, usuario.getRespuesta());
            int rows = stmt.executeUpdate();

            if (rows > 0) {
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    idGenerado = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            sql.disconnectDatabase();
        }
        return idGenerado;
    }

    public Usuario autenticarUsuario(String correo, String contrasena) {
        String query = "SELECT * FROM usuario WHERE correo = ? AND contrasena = ?";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            stmt = conn.prepareStatement(query);
            stmt.setString(1, correo);
            stmt.setString(2, contrasena);
            rs = stmt.executeQuery();

            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setRol(rs.getString("rol"));
                usuario.setActivo(rs.getBoolean("activo"));
                usuario.setPregunta(rs.getString("pregunta"));
                usuario.setRespuesta(rs.getString("respuesta"));
                return usuario;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }
        return null;
    }

    public void actualizarUsuario(Usuario usuario) {
        String query = "UPDATE usuario SET nombre = ?, correo = ?, contrasena = ?, rol = ? WHERE id_usuario = ?, pregunta = ?, respuesta = ?";

        SQL sql = new SQL();
        sql.connectDatabase(); // ¡IMPORTANTE!
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getCorreo());
            stmt.setString(3, usuario.getContrasena());
            stmt.setString(4, usuario.getRol());
            stmt.setInt(5, usuario.getId());
            stmt.setString(6, usuario.getPregunta());
            stmt.setString(7, usuario.getRespuesta());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase(); // ¡No olvides cerrarla!
        }
    }

    public void eliminarUsuario(int id) {
        String query = "UPDATE usuario SET activo = 0 WHERE id_usuario = ?";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }
    }

    public Usuario obtenerUsuarioPorId(int idUsuario) {
        String query = "SELECT * FROM usuario WHERE id_usuario = ?";
        SQL sql = new SQL();
        sql.connectDatabase();
        Connection conn = sql.getConnection();

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if(rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setContrasena(rs.getString("contrasena"));
                u.setRol(rs.getString("rol"));
                u.setActivo(rs.getBoolean("activo"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }
        return null;
    }


    public List<Usuario> listarUsuarios(String busqueda) throws SQLException {
        List<Usuario> lista = new ArrayList<>();
        String query = "SELECT * FROM usuario WHERE nombre LIKE ? OR correo LIKE ? OR rol LIKE ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            String filtro = "%" + busqueda + "%";
            stmt.setString(1, filtro);
            stmt.setString(2, filtro);
            stmt.setString(3, filtro);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setContrasena(rs.getString("contrasena"));
                u.setRol(rs.getString("rol"));
                u.setActivo(rs.getBoolean("activo"));
                lista.add(u);
            }
        }
        return lista;
    }

}
