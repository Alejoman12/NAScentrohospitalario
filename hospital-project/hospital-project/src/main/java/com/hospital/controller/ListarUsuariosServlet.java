package com.hospital.controller;

import com.hospital.database.SQL;
import com.hospital.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/listarUsuarios")
public class ListarUsuariosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Usuario> listaUsuarios = new ArrayList<>();
        SQL sql = new SQL();
        sql.connectDatabase();

        try(Connection conn = sql.getConnection()){
            String query = "SELECT * FROM usuario WHERE activo = 1";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setRol(rs.getString("rol"));
                usuario.setActivo(rs.getBoolean("activo"));
                listaUsuarios.add(usuario);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sql.disconnectDatabase();
        }

        req.setAttribute("usuarios", listaUsuarios);
        req.getRequestDispatcher("jsp/gestionUsuarios.jsp").forward(req, resp);
    }
}
