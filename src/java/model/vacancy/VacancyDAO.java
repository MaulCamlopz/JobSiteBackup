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
                + " `Due date`, Aditional_information, Company_id, Vacancycol, active)"
                + " VALUES ("+vacancy.getId()+", '"+vacancy.getWorkstation()+"', '"
                + vacancy.getDescription()+"', '', "+vacancy.getSalary()+", '"
                + vacancy.getWorkHours()+"', '"+vacancy.getAddress()+"', '', '', "
                + vacancy.getIdCompany() +", '',"+0+");";
        
        try {
            conn = connDB.getConnection();
            ps=conn.prepareStatement(sql);
            ps.executeUpdate();
            for(String req: vacancy.getRequirements()){
                String sqlReq = "INSERT INTO requirement (ID_Vacancy, item)"
                        +"VALUES ("+vacancy.getId()+", '"+req+"');";
                ps=conn.prepareStatement(sqlReq);
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public Vacancy read(String idVacancy) {
        Vacancy vacancy = new Vacancy();
        String sql = "SELECT * FROM vacancy WHERE ID_Vacancy = " + idVacancy;
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
                vacancy.setInformation(rs.getString("Aditional_information"));
                vacancy.setRequirements(getRequirements(vacancy.getId()));
                vacancy.setIdCompany(rs.getInt("Company_id"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vacancy;
    }
    
    public List listForCompany(int idCompany) {
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
    
    public List listForActive (){
        ArrayList<Vacancy> list = new ArrayList<>();
        String sql = "SELECT * FROM VACANCY WHERE ACTIVE = 1 ORDER BY ID_VACANCY DESC";
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
                vacancy.setIdCompany(rs.getInt("Company_id"));
                list.add(vacancy);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List listForInactive (){
        ArrayList<Vacancy> list = new ArrayList<>();
        String sql = "SELECT * FROM VACANCY WHERE ACTIVE = 0 ORDER BY ID_VACANCY DESC";
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
                vacancy.setIdCompany(rs.getInt("Company_id"));
                list.add(vacancy);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    public List listFull (){
        ArrayList<Vacancy> list = new ArrayList<>();
        String sql = "SELECT * FROM VACANCY ORDER BY ID_VACANCY DESC";
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
                vacancy.setIdCompany(rs.getInt("Company_id"));
                list.add(vacancy);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean setValid(String idVacancy){
        String sql = "UPDATE VACANCY SET ACTIVE = 1 WHERE ID_Vacancy = " + idVacancy;
        int response = 0;
        try {
            conn = connDB.getConnection();
            ps=conn.prepareStatement(sql);
            response = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(response!=0)
            return true;
        else
            return false;
    }
    
    public boolean delete(String idVacancy){
        String sql = "DELETE FROM vacancy WHERE ID_Vacancy = " + idVacancy;
        int response = 0;
        try {
            conn = connDB.getConnection();
            ps=conn.prepareStatement(sql);
            response = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(response!=0)
            return true;
        else
            return false;
    }

    private ArrayList<String> getRequirements(int idVacancy) {
        ArrayList<String> list = new ArrayList<>();
        String sql = "SELECT ITEM FROM REQUIREMENT WHERE ID_VACANCY = " + idVacancy;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(rs.getString("ITEM"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
