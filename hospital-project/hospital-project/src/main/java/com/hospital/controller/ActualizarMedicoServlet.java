package com.hospital.controller;

import com.hospital.dao.MedicoDAO;
import com.hospital.dao.UsuarioDAO;
import com.hospital.model.Medico;
import com.hospital.model.Usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/actualizarMedico")
public class ActualizarMedicoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        Medico medico = (Medico) session.getAttribute("medico");

        String nombre = request.getParameter("nombre");
        String especialidad = request.getParameter("especialidad");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");


        // Actualizar objeto Usuario
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);

        // Actualizar objeto Medico
        medico.setEspecialidad(especialidad);
        medico.setTelefono(telefono);
        medico.setCorreo(correo);

        // Guardar cambios
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.actualizarUsuario(usuario);

        MedicoDAO medicoDAO = new MedicoDAO();
        medicoDAO.actualizarMedico(medico);

        // Volver a guardar en sesión
        session.setAttribute("usuario", usuario);
        session.setAttribute("medico", medico);

        response.sendRedirect("jsp/medico.jsp");
    }
}
