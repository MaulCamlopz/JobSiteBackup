/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.vacancy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ConnectionDB;

/**
 *
 * @author b22br
 */
public class VacancyDAO {
    
    ConnectionDB connDB = new ConnectionDB();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public boolean create(Vacancy vacancy) {
        
        String sql = "INSERT INTO vacancy (ID_Vacancy, Workstation, Description,"
                + " Professional_Profile, Salary, `Work hours`, Address_Job,"
                + " `Due date`, Aditional_information, Company_id, Vacancycol)"
                + " VALUES ("+vacancy.getId()+", '"+vacancy.getWorkstation()+"', '"
                + vacancy.getDescription()+"', '', "+vacancy.getSalary()+", '"
                + vacancy.getWorkHours()+"', '"+vacancy.getAddress()+"', '', '', "
                + vacancy.getIdCompany() +", '');";
        
        try {
            conn = connDB.getConnection();
            ps=conn.prepareStatement(sql);
            ps.executeUpdate();
            for(String req: vacancy.getProfile()){
                String sqlReq = "INSERT INTO requirement (ID_Vacancy, item)"
                        +"VALUES ("+vacancy.getId()+", '"+req+"');";
                ps=conn.prepareStatement(sqlReq);
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public Vacancy read(int id) {
        Vacancy vacancy = new Vacancy();
        String sql = "SELECT * FROM vacancy WHERE ID_Vacancy = "+id;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                vacancy.setId(rs.getInt("ID_Vacancy"));
                vacancy.setWorkstation(rs.getString("Workstation"));
                vacancy.setDescription(rs.getString("Description"));
                vacancy.setSalary(rs.getInt("Salary"));
                vacancy.setWorkHours(rs.getString("Work hours"));
                vacancy.setAddress(rs.getString("Address_Job"));
            }/*
            String sqlReq = "select * from requirement where ID_Vacancy = "+vacancy.getId();
            ArrayList<String> profile = new ArrayList<>(); // requirements
            ps = conn.prepareStatement(sqlReq);
            rs = ps.executeQuery();
            while(rs.next()){
                profile.add(rs.getString("item"));
            }
            vacancy.setProfile(profile);*/
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vacancy;
    }
    
    public List list(int idCompany) {
        ArrayList<Vacancy> list = new ArrayList<>();
        String sql = "select * from vacancy where Company_id = "+idCompany;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Vacancy vacancy = new Vacancy();
                vacancy.setId(rs.getInt("ID_Vacancy"));
                vacancy.setWorkstation(rs.getString("Workstation"));
                vacancy.setDescription(rs.getString("Description"));
                vacancy.setSalary(rs.getInt("Salary"));
                vacancy.setWorkHours(rs.getString("Work hours"));
                vacancy.setAddress(rs.getString("Address_Job"));
                list.add(vacancy);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
