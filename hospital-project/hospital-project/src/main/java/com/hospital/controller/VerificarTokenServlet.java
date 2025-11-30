package com.hospital.controller;

import com.hospital.dao.UsuarioDAO;
import com.hospital.model.Usuario;
import com.hospital.database.SQL;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/verificarToken")
public class VerificarTokenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener el token desde la URL
        String token = request.getParameter("token");

        if (token == null || token.trim().isEmpty()) {
            response.sendRedirect("jsp/tokenInvalido.jsp");
            return;
        }

        SQL sql = new SQL();
        sql.connectDatabase();

        try (Connection conn = sql.getConnection()) {

            UsuarioDAO dao = new UsuarioDAO(conn);
            Usuario u = dao.buscarPorToken(token);

            if (u != null && dao.tokenValido(u)) {
                // Token válido: permitir cambiar la contraseña
                request.setAttribute("token", token);
                RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath() + "/jsp/cambiarContrasena.jsp");
                dispatcher.forward(request, response);
            } else {
                // Token inválido o vencido
                response.sendRedirect("jsp/tokenInvalido.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("jsp/error.jsp");
        } finally {
            sql.disconnectDatabase();
        }
    }
}
