package com.hospital.controller;

import com.hospital.dao.PacienteDAO;
import com.hospital.model.Paciente;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ListarPacientes")
public class ListarPacientesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String busqueda = request.getParameter("busqueda");
        String estado = request.getParameter("estado");
        if (busqueda == null) busqueda = "";
        if (estado == null) estado = "todos";
        // Crear DAO y obtener lista
        PacienteDAO dao = new PacienteDAO();
        List<Paciente> lista = dao.listarPacientes(busqueda, estado);

        // Contadores
        int total = dao.contarPacientes();
        int activos = dao.contarActivos();
        int inactivos = dao.contarInactivos();

        request.setAttribute("totalPacientes", total);
        request.setAttribute("activosPacientes", activos);
        request.setAttribute("inactivosPacientes", inactivos);

        // Enviar a la vista
        request.setAttribute("pacientes", lista);

        // Redirigir al JSP
        request.getRequestDispatcher("jsp/listadoPacientes.jsp")
                .forward(request, response);
    }
}
