package com.hospital.controller;

import com.hospital.dao.CitaDAO;
import com.hospital.model.Cita;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/agendarCita")
public class AgendarCitaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener parámetros del formulario
        String idPaciente = req.getParameter("idPaciente");
        String idMedico = req.getParameter("idMedico");
        String fecha = req.getParameter("fecha");
        String hora = req.getParameter("hora");
        String motivo = req.getParameter("motivo");
        String estado = req.getParameter("estado");

        // Unir fecha y hora
        String fechaHora = fecha + " " + hora + ":00";

        // Crear objeto Cita
        Cita cita = new Cita();
        cita.setIdPaciente(idPaciente);
        cita.setIdMedico(idMedico);
        cita.setFechaHora(fechaHora);
        cita.setMotivo(motivo);
        cita.setEstado(estado);

        // Guardar en base de datos
        CitaDAO citaDAO = new CitaDAO();
        boolean agendada = citaDAO.agendarCita(cita);

        // Redireccionar según el resultado
        if (agendada) {
            resp.sendRedirect("jsp/recepcionista.jsp?mensaje=cita_agendada");
        } else {
            resp.sendRedirect("jsp/recepcionista.jsp?error=fallo_agendar");
        }
    }
}
