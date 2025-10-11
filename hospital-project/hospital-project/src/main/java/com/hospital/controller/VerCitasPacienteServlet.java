package com.hospital.controller;

import com.hospital.dao.CitaDAO;
import com.hospital.model.Cita;
import com.hospital.model.Paciente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/verCitasPaciente")
public class VerCitasPacienteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Paciente paciente = (Paciente) session.getAttribute("paciente");

        if (paciente == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        CitaDAO citaDAO = new CitaDAO();
        List<Cita> citas = citaDAO.obtenerCitasPorPaciente(paciente.getIdPaciente());

        req.setAttribute("citas", citas);
        req.getRequestDispatcher("/jsp/pacienteCitas.jsp").forward(req, resp);
    }
}
