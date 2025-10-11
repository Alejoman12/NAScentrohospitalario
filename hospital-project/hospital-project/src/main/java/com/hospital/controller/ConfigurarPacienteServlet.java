package com.hospital.controller;

import com.hospital.dao.PacienteDAO;
import com.hospital.model.Paciente;
import com.hospital.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/configurarPaciente")
public class ConfigurarPacienteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario != null && "Paciente".equals(usuario.getRol())) {
            PacienteDAO pacienteDAO = new PacienteDAO();
            Paciente paciente = pacienteDAO.obtenerPorId(usuario.getId());

            session.setAttribute("paciente", paciente);
            request.getRequestDispatcher("jsp/editarPaciente.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}
