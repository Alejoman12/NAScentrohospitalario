package com.hospital.controller;

import com.hospital.dao.PacienteDAO;
import com.hospital.dao.UsuarioDAO;
import com.hospital.model.Paciente;
import com.hospital.model.Usuario;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/registrarPaciente")
public class RegistroPacienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("Entro al servlet");

        // 1. Capturar los datos del formulario
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String fechaNacimientoStr = request.getParameter("fechaNacimiento");
        String genero = request.getParameter("genero");

        // 2. Crear objeto Usuario
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setContrasena(contrasena);
        usuario.setRol("Paciente");
        usuario.setActivo(true);

        // 3. Insertar usuario y obtener ID
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        int idUsuario = usuarioDAO.insertarUsuario(usuario);

        if (idUsuario > 0) {
            // 4. Crear objeto Paciente
            Paciente paciente = new Paciente();
            paciente.setId(idUsuario);
            paciente.setIdPaciente("PAC-" + idUsuario);
            paciente.setDocumentoIdentidad(null);
            paciente.setDireccion(direccion);
            paciente.setTelefono(telefono);
            paciente.setFechaNacimiento(LocalDate.parse(fechaNacimientoStr));
            paciente.setGenero(genero);
            paciente.setCorreo(correo);
            paciente.setIdMedico(null);
            paciente.setActivo(true);

            // 5. Insertar paciente
            PacienteDAO pacienteDAO = new PacienteDAO();
            boolean insertado = pacienteDAO.insertarPaciente(paciente);

            if (insertado) {
                response.sendRedirect("registro_exitoso.jsp");
            } else {
                response.sendRedirect("registro_error.jsp");
            }

        } else {
            response.sendRedirect("registro_error.jsp");
        }
    }
}
