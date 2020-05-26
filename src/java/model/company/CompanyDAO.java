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
    
    public boolean create(Company company, Representative representative, int idUser){
        
        int idRepresentative = createRepresentative(representative);
        
        if(idRepresentative!=0){
            String sql = "INSERT INTO company (name, RFC, email, phone, country, country_state, "
                    + "address, Legal_Representative_id, User_id) VALUES ("
                    + company.getName() + ", "
                    + company.getRFC() + ", "
                    + company.getEmail() + ", "
                    + company.getPhone() + ", "
                    + company.getCountry() + ", "
                    + company.getCity() + ", "
                    + company.getAddress() + ", "
                    + idRepresentative + ", "
                    + idUser;
            int response = 0;
            try {
                conn = connDB.getConnection();
                ps = conn.prepareStatement(sql);
                response = ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(response!=0)
                return true;
            else
                return false;
        } else {
          return false;  
        }
        
    }
    
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
    
    public Company readCompany(int id) {
        Company company = new Company();
        
        String sql = "select * from company where id = " + id;
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

    private int createRepresentative(Representative representative) {
        String sql = "INSERT INTO legal_representative (name, last_name, second_last_name, phone, email) "
                + "VALUES (" + representative.getName()
                + ", " + representative.getLastName()
                + ", " + representative.getSecondLastName()
                + ", " + representative.getPhone()
                + ", " + representative.getEmail()
                + "); SELECT @@IDENTITY AS id;";
        int id = 0;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                id = rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
    
}
