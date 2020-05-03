/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.ConnectionDB;

/**
 *
 * @author b22br
 */
public class CompanyDAO {
    
    private ConnectionDB connDB = new ConnectionDB();
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public Company read(int idUser) {
        Company company = new Company();
        
        String sql = "select * from company where User_id = "+idUser;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                company.setId(rs.getInt("id"));
                company.setName(rs.getString("name"));
                company.setEmail(rs.getString("email"));
                company.setPhone(rs.getString("phone"));
                company.setAddress(rs.getString("address"));
                company.setIdRep(rs.getInt("Legal_Representative_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return company;
    }
    
}
