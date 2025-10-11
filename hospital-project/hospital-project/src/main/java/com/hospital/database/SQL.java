package com.hospital.database;

import java.sql.*;

public class SQL implements ConnectionConfig {

    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    public SQL() {
        conn = null;
        stmt = null;
        rs = null;
    }

    public void connectDatabase() {
        String url = "jdbc:mysql://" + host + ":3306/" + database;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Conectado a la base de datos");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar a la base de datos");
            e.printStackTrace();
        }
    }

    public void disconnectDatabase() {
        try {
            if (conn != null) {
                conn.close();
                System.out.println("Desconectado de la base de datos");
            }
        } catch (SQLException e) {
            System.out.println("Error al desconectar de la base de datos");
        }
    }

    public Connection getConnection() {
        return conn;
    }

    public PreparedStatement getStatement() {
        return stmt;
    }

    public ResultSet getResultSet() {
        return rs;
    }
}
