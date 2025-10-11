package com.hospital.controller;

import com.hospital.dao.AdministradorDAO;
import com.hospital.dao.MedicoDAO;
import com.hospital.dao.PacienteDAO;
import com.hospital.dao.UsuarioDAO;
import com.hospital.model.Administrador;
import com.hospital.model.Medico;
import com.hospital.model.Paciente;
import com.hospital.model.Usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        switch (accion) {
            case "editarForm":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Usuario usuarioEditar = new UsuarioDAO().obtenerUsuarioPorId(idEditar);
                request.setAttribute("usuarioEditar", usuarioEditar);
                try {
                    request.getRequestDispatcher("/jsp/gestionUsuarios.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "editar":
                editarUsuario(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                new UsuarioDAO().eliminarUsuario(idEliminar);
                response.sendRedirect("listarUsuarios");
                break;
        }
    }

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String rol = request.getParameter("rol");

        Usuario usuario = new UsuarioDAO().obtenerUsuarioPorId(id);
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setRol(rol);

        new UsuarioDAO().actualizarUsuario(usuario);

        // también actualiza tabla según el rol:
        switch (rol) {
            case "Paciente":
                Paciente paciente = new PacienteDAO().obtenerPorId(id);
                paciente.setDireccion(request.getParameter("direccion"));
                paciente.setTelefono(request.getParameter("telefonoPaciente"));
                new PacienteDAO().actualizarPaciente(paciente);
                break;
            case "Médico":
                Medico medico = new MedicoDAO().obtenerUsuarioPorId(id);
                medico.setEspecialidad(request.getParameter("especialidad"));
                medico.setTelefono(request.getParameter("telefonoMedico"));
                new MedicoDAO().actualizarMedico(medico);
                break;
            case "Administrador":
                Administrador admin = new AdministradorDAO().obtenerUsuarioPorId(id);
                admin.setTelefono(request.getParameter("telefonoAdministrador"));
                new AdministradorDAO().actualizarAdministrador(admin);
                break;
        }

        response.sendRedirect("listarUsuarios");
    }
}
