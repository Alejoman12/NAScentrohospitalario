package com.hospital.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.UUID;

import com.hospital.dao.UsuarioDAO;
import com.hospital.database.SQL;
import com.hospital.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/recuperarContrasena")
public class RecuperarContrasenaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");

        // 🔹 AQUÍ es donde va el bloque que mencionas
        SQL sql = new SQL();
        sql.connectDatabase();

        try (Connection conn = sql.getConnection()) {
            UsuarioDAO dao = new UsuarioDAO(conn);   
            Usuario usuario = dao.buscarPorCorreo(correo);  

            if (usuario != null) {
                // Generar token
                String token = UUID.randomUUID().toString();
                dao.guardarTokenRecuperacion(usuario.getId(), token);

                // Crear enlace
                String enlace = "http://localhost:8080/hospital/cambiarContrasena?token=" + token;

                // Crear cuerpo del mensaje
                String cuerpo = "Hola " + usuario.getNombre() +
                        ",\n\nUsa este enlace para restablecer tu contraseña:\n" + enlace +
                        "\n\nEste enlace expirará en 10 minutos.";

                // Enviar correo
                EmailSender.enviarCorreo(correo, "Recuperar contraseña", cuerpo);

                // Redirigir a confirmación
                response.sendRedirect("jsp/mensajeEnviado.jsp");
            } else {
                // Si el correo no existe
                request.setAttribute("error", "No existe una cuenta con ese correo.");
                request.getRequestDispatcher(request.getContextPath() + "/jsp/OlvidarContrasena.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("jsp/error.jsp");
        }
    }
}
