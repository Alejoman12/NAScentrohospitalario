package com.hospital.controller;

import com.hospital.dao.MedicoDAO;
import com.hospital.dao.RecepcionistaDAO;
import com.hospital.dao.UsuarioDAO;
import com.hospital.dao.PacienteDAO;
import com.hospital.model.Medico;
import com.hospital.model.Recepcionista;
import com.hospital.model.Usuario;
import com.hospital.model.Paciente;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/loginUsuario")
public class LoginUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("Entro al servlet de login de usuario");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        UsuarioDAO DAO = new UsuarioDAO();
        Usuario usuario = DAO.autenticarUsuario(correo, contrasena);

        if (usuario != null) {
            System.out.println("Nombre: " + usuario.getNombre());
            System.out.println("Rol: " + usuario.getRol());

            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            String rol  = usuario.getRol();
            switch (rol) {
                case "Administrador":
                    System.out.println("Vista Administrador");
                    response.sendRedirect("jsp/administrador.jsp");
                    break;
                case "Paciente":
                    System.out.println("Vista Paciente");
                    PacienteDAO pacienteDAO = new PacienteDAO();
                    Paciente paciente = pacienteDAO.obtenerPorId(usuario.getId());

                    if (paciente != null) {
                        session.setAttribute("paciente", paciente);
                        response.sendRedirect("verCitasPaciente");
                    } else {
                        System.out.println("Paciente no encontrado");
                        response.sendRedirect("index.jsp?error=paciente_no_encontrado");
                    }
                    break;
                case "Medico":
                    System.out.println("Vista Medico");
                    MedicoDAO medicoDAO = new MedicoDAO();
                    Medico medico = medicoDAO.obtenerUsuarioPorId(usuario.getId());

                    if (medico != null) {
                        session.setAttribute("medico", medico);
                        response.sendRedirect("jsp/medico.jsp");
                    } else {
                        System.out.println("medico no encontrado");
                        response.sendRedirect("index.jsp?error=medico_no_encontrado");
                    }
                    break;
                case "Recepcionista":
                    System.out.println("Vista Recepcionista");
                    RecepcionistaDAO recepcionistaDAO = new RecepcionistaDAO();
                    Recepcionista recepcionista = recepcionistaDAO.obtenerUsuarioPorId(usuario.getId());

                    if (recepcionista != null) {
                        session.setAttribute("recepcionista", recepcionista);
                        response.sendRedirect("jsp/recepcionista.jsp");
                    } else {
                        System.out.println("rececpcionista no encontrado");
                        response.sendRedirect("index.jsp?error=rececpcionista_no_encontrado");
                    }
                    break;
                default:
                    response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }
}
