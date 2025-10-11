package com.hospital.controller;

import com.hospital.dao.*;
import com.hospital.model.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/admin/crearUsuarioDesdeAdmin")
public class CrearUsuarioDesdeAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String rol = request.getParameter("rol");

        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setContrasena(contrasena);
        usuario.setRol(rol);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        int idGenerado = usuarioDAO.insertarUsuario(usuario);
        usuario.setId(idGenerado);

        switch (rol) {

            case "Paciente":
                Paciente paciente = new Paciente();
                paciente.setId(usuario.getId());
                paciente.setIdPaciente("PAC-" + usuario.getId());
                paciente.setDocumentoIdentidad(request.getParameter("documento"));
                paciente.setFechaNacimiento(LocalDate.parse(request.getParameter("fechaNacimiento")));
                paciente.setGenero(request.getParameter("genero"));
                paciente.setDireccion(request.getParameter("direccion"));
                paciente.setTelefono(request.getParameter("telefonoPaciente"));
                paciente.setCorreo(usuario.getCorreo());
                paciente.setIdMedico(request.getParameter("idMedico"));
                paciente.setActivo(true);
                new PacienteDAO().insertarPaciente(paciente);
                break;

            case "Médico":
                System.out.println("Insertando Medico");
                Medico medico = new Medico();
                medico.setId(usuario.getId());
                medico.setIdMedico("MED-" + usuario.getId());
                medico.setEspecialidad(request.getParameter("especialidad"));
                medico.setTelefono(request.getParameter("telefonoMedico"));
                medico.setCorreo(usuario.getCorreo());
                medico.setActivo(true);
                new MedicoDAO().insertarMedico(medico);
                break;
            case "Administrador":
                Administrador admin = new Administrador();
                admin.setId(usuario.getId());
                admin.setIdAdminsitrador("ADM-" + usuario.getId());
                admin.setTelefono(request.getParameter("telefonoAdministrador"));
                admin.setActivo(true);
                new AdministradorDAO().insertarAdministrador(admin);
                break;
            case "Recepcionista":
                Recepcionista recep = new Recepcionista();
                recep.setId(usuario.getId());
                recep.setIdRecepcionista("REP-" + usuario.getId());
                recep.setTelefono(request.getParameter("telefonoRecepcionista"));
                recep.setTurno(request.getParameter("turno"));
                new RecepcionistaDAO().insertarRecepcionista(recep);
                break;
        }
    }
}
