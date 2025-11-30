package com.hospital.controller;

import com.hospital.dao.CitaDAO;
import com.hospital.dao.PacienteDAO;
import com.hospital.model.Cita;
import com.hospital.model.Paciente;
import com.hospital.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/verCitasPaciente")
public class VerCitasPacienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null || !"Paciente".equalsIgnoreCase(usuario.getRol())) {
            resp.sendRedirect("index.jsp");
            return;
        }

        // Obtener paciente por ID de usuario (corrección)
        PacienteDAO pacienteDAO = new PacienteDAO();
        Paciente paciente = pacienteDAO.obtenerPorId(usuario.getId());

        if (paciente == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        // Obtener citas del paciente
        CitaDAO citaDAO = new CitaDAO();
        List<Cita> citas = citaDAO.obtenerCitasPorPaciente(paciente.getIdPaciente());

        req.setAttribute("citas", citas);
        req.getRequestDispatcher("/jsp/paciente.jsp").forward(req, resp);
    }
}
