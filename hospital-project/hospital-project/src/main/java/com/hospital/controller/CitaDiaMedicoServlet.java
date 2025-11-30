package com.hospital.controller;

import com.hospital.database.SQL;
import com.hospital.model.Cita;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CitasDelDiaMedico")
public class CitaDiaMedicoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Cita> citas = obtenerCitas(req);
        req.setAttribute("citas", citas);
        req.getRequestDispatcher("/jsp/CitasDelDiaMedico.jsp").forward(req, resp);
    }

    private List<Cita> obtenerCitas(HttpServletRequest req) {

        List<Cita> citas = new ArrayList<>();
        SQL sql = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            sql = new SQL();
            conn = sql.getConnection();

            String query = buildQuery(req);
            stmt = conn.prepareStatement(query);

            // FILTRO POR MÉDICO: solo si existe en sesión
            String idMedico = (String) req.getSession().getAttribute("id_medico");
            if (idMedico != null && !idMedico.isEmpty()) {
                stmt.setString(1, idMedico);
            }

            rs = stmt.executeQuery();

            while (rs.next()) {
                citas.add(mapearCita(rs));
            }

            log("Citas obtenidas: " + citas.size());

        } catch (Exception e) {
            log("Error al obtener citas: " + e.getMessage(), e);
        } finally {

            try { if (rs != null) rs.close(); } catch (Exception ex) {}
            try { if (stmt != null) stmt.close(); } catch (Exception ex) {}
            try { if (conn != null) conn.close(); } catch (Exception ex) {}

            if (sql != null) sql.disconnectDatabase();
        }

        return citas;
    }

    private String buildQuery(HttpServletRequest req) {

        StringBuilder query = new StringBuilder()
                .append("SELECT c.id_cita, c.id_paciente, c.id_medico, ")
                .append("c.fecha_hora, c.motivo, c.estado, c.activo, ")
                .append("p.nombre AS nombre_paciente, ")
                .append("m.nombre AS nombre_medico ")
                .append("FROM cita c ")
                .append("LEFT JOIN paciente p ON c.id_paciente = p.id_paciente ")
                .append("LEFT JOIN medico m ON c.id_medico = m.id_medico ");

        String idMedico = (String) req.getSession().getAttribute("id_medico");

        if (idMedico != null && !idMedico.isEmpty()) {
            query.append("WHERE c.id_medico = ? AND DATE(c.fecha_hora) = CURDATE() ");
        } else {
            query.append("WHERE DATE(c.fecha_hora) = CURDATE() ");
        }

        query.append("ORDER BY c.fecha_hora ASC");

        return query.toString();
    }


    private Cita mapearCita(ResultSet rs) throws Exception {
        Cita c = new Cita();

        c.setIdCita(rs.getInt("id_cita"));
        c.setIdPaciente(rs.getString("id_paciente"));
        c.setIdMedico(rs.getString("id_medico"));
        c.setFechaHora(rs.getString("fecha_hora"));
        c.setMotivo(rs.getString("motivo"));
        c.setEstado(rs.getString("estado"));
        c.setActivo(rs.getInt("activo"));
        c.setNombrePaciente(rs.getString("nombre_paciente"));
        c.setNombreMedico(rs.getString("nombre_medico"));

        return c;
    }
}
