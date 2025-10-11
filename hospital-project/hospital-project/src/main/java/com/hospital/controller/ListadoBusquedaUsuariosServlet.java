package com.hospital.controller;

import com.hospital.dao.UsuarioDAO;
import com.hospital.database.SQL;
import com.hospital.model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/listaBusquedaUsuarios")
public class ListadoBusquedaUsuariosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String busqueda = request.getParameter("busqueda");
        if (busqueda == null) busqueda = "";
        SQL sql = new SQL();
        sql.connectDatabase();

        try (Connection conn = sql.getConnection()) {
            UsuarioDAO dao = new UsuarioDAO(conn);
            List<Usuario> usuarios = dao.listarUsuarios(busqueda);
            request.setAttribute("usuarios", usuarios);
            request.setAttribute("busqueda", busqueda);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/listadoUsuarios.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
