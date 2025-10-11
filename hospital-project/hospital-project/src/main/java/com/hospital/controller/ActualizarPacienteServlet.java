package com.hospital.controller;

import com.hospital.dao.PacienteDAO;
import com.hospital.dao.UsuarioDAO;
import com.hospital.model.Paciente;
import com.hospital.model.Usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/actualizarPaciente")
public class ActualizarPacienteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String genero = request.getParameter("genero");

        // Actualizar en Usuario
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);

        // Actualizar en Paciente
        PacienteDAO pacienteDAO = new PacienteDAO();
        Paciente paciente = pacienteDAO.obtenerPorId(usuario.getId());
        paciente.setDireccion(direccion);
        paciente.setTelefono(telefono);
        paciente.setGenero(genero);
        paciente.setCorreo(correo);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.actualizarUsuario(usuario);
        pacienteDAO.actualizarPaciente(paciente);

        session.setAttribute("usuario", usuario);
        session.setAttribute("paciente", paciente);

        response.sendRedirect("jsp/paciente.jsp");
    }
}
