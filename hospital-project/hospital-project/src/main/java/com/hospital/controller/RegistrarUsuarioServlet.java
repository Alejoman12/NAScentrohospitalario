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
import java.time.LocalDate;

@WebServlet("/admin/crearUsuario")
public class RegistrarUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String rol = request.getParameter("rol");
        String pregunta = request.getParameter("pregunta");
        String respuesta = request.getParameter("respuesta");

        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setContrasena(contrasena);
        usuario.setRol(rol);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        int id = usuarioDAO.insertarUsuario(usuario);

            switch (rol) {
                case "Paciente":
                    Paciente paciente = new Paciente();
                    paciente.setId(usuario.getId());
                    paciente.setDocumentoIdentidad(request.getParameter("documento"));
                    paciente.setFechaNacimiento(LocalDate.parse(request.getParameter("fechaNacimiento")));
                    paciente.setGenero(request.getParameter("genero"));
                    paciente.setDireccion(request.getParameter("direccion"));
                    paciente.setTelefono(request.getParameter("telefono"));
                    paciente.setCorreo(request.getParameter("correoPaciente"));
                    paciente.setIdMedico(request.getParameter("idMedico"));
                    paciente.setActivo(true);
                    new PacienteDAO().insertarPaciente(paciente);
                    break;

                case "Médico":
                    Medico medico = new Medico();
                    medico.setId(usuario.getId());
                    medico.setEspecialidad(request.getParameter("especialidad"));
                    medico.setTelefono(request.getParameter("telefono"));
                    medico.setActivo(true);
                    new MedicoDAO().insertarMedico(medico);
                    break;

                case "Administrador":
                    Administrador admin = new Administrador();
                    admin.setId(usuario.getId());
                    admin.setTelefono(request.getParameter("telefono"));
                    admin.setActivo(true);
                    new AdministradorDAO().insertarAdministrador(admin);
                    break;
            }
    }
}
