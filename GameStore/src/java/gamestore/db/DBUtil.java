package gamestore.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author huusa
 */
public class DBUtil {
     public static final String USER_NAME = "sa";
    public static final String PASSWORD = "12345";
    public static final String DB_NAME = "GameStore";
    public static Connection getConnection()
    throws SQLException,ClassNotFoundException{
        Connection con = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url  = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        con = DriverManager.getConnection(url, USER_NAME, PASSWORD);
        return con;
    }
}
