package Daos;

import Servlets.BodegaServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoBase {

    public Connection getConection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BodegaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        String username = "root";
        String password = "root";
        String database = "grupo1_db";
        String params = "serverTimezone=America/Lima&useSSL=false&allowPublicKeyRetrieval=true";
        String url = "jdbc:mysql://localhost:3306/" + database + "?" + params;

        return DriverManager.getConnection(url, username, password);

    }

}
