package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {
    
    Connection conn;

    public ConnectionDB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsitedb","root","");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Connection getConnection(){
        return conn;
    }
    
}
