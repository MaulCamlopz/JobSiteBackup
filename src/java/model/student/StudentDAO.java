/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.student;

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
public class StudentDAO implements StudentCRUD{
    
    private ConnectionDB connDB = new ConnectionDB();
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    //private Student student = new Student();

    @Override
    public boolean create(Student student) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public Student read(int idUser) {
        Student student = new Student();
        
        String sql = "select * from student where User_id = "+idUser;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setLastName(rs.getString("last_name"));
                student.setCareer(rs.getString("college_career"));
                student.setUniversity(rs.getString("university"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setAddress(rs.getString("address"));
                student.setCity(rs.getString("City_State"));
                student.setCountry(rs.getString("Country"));
                student.setIdCv(rs.getInt("CV_id"));
            }
        } catch (Exception e) {
        }
        System.out.println("RETURN STUDENT: "+student.getName());
        return student;
    }

    @Override
    public boolean update(Student student) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List ListSelectedVacancies(int idStudent){
        ArrayList<Integer> list = new ArrayList<>();
        String sql = "SELECT ID_APPLICANT, VACANCY_ID_VACANCY FROM APPLICANT WHERE ID_STUDENT = " + idStudent;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(rs.getInt("VACANCY_ID_VACANCY"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
     public boolean applyVacancy(String idStudent, String idVacancy) {
        int response = 0;
        String sql = "INSERT INTO APPLICANT ( ID_Student, Vacancy_ID_Vacancy)"
                + " VALUES ("+idStudent+", "+idVacancy+")";
        try {
            conn = connDB.getConnection();
            ps=conn.prepareStatement(sql);
            response = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
         System.out.println("RESPONSE APPLY VACANCY: "+response);
        if(response!=0)
            return true;
        else
            return false;
    }
    
    
}
