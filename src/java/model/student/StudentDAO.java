/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.student;

import model.vacancy.VacancyRequirement;
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
public class StudentDAO {
    
    private ConnectionDB connDB = new ConnectionDB();
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    //private Student student = new Student();

    public boolean create(Student student,int idUser) {
        if(createCV(idUser)){
            int idCV = getCV(idUser); 
            if(idCV!=0){
                String sql = "INSERT INTO STUDENT ( name, last_name, second_last_name, university, college_career, email, phone, Country, City_State, address, User_id, CV_id) "
                    + "VALUES ('" + student.getName() + "', '"
                        + student.getLastName() + "', '"
                        + student.getSecondLastName() + "', '"
                        + student.getUniversity() + "', '"
                        + student.getCareer() + "', '"
                        + student.getEmail() + "', '"
                        + student.getPhone() + "', '"
                        + student.getCountry() + "', '"
                        + student.getCity() + "', '"
                        + student.getAddress() + "', "
                        + idUser + ", "
                        + idCV + ")";
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
        } else {
          return false;  
        }
    }
    
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

    public boolean update(Student student) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM STUDENT WHERE ID = " + id;
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
    }
    
    public List ListSelectedVacancies(int idStudent){
        ArrayList<VacancyRequirement> list = new ArrayList<>();
        String sql = "SELECT ID_APPLICANT, VACANCY_ID_VACANCY FROM APPLICANT WHERE ID_STUDENT = " + idStudent;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                VacancyRequirement req = new VacancyRequirement();
                req.setIdRequirement(rs.getInt("ID_APPLICANT"));
                req.setIdVacancy(rs.getInt("VACANCY_ID_VACANCY"));
                list.add(req);
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
     
     public boolean deleteVacancy(String idReq) {
        int response = 0;
        String sql = "DELETE FROM APPLICANT WHERE ID_APPLICANT = " + idReq ;
        try {
            conn = connDB.getConnection();
            ps=conn.prepareStatement(sql);
            response = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
         System.out.println("RESPONSE DELETE VACANCY: "+response);
        if(response!=0)
            return true;
        else
            return false;
    }
    
    private boolean createCV(int idUser) {
        String sql = "INSERT INTO CV (idUser) VALUES ("+idUser+")";
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
    
    private int getCV(int idUser) {
        String sql = "SELECT ID FROM CV WHERE idUser = " + idUser;
        int response = 0;
        try {
            conn = connDB.getConnection();
            ps=conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                VacancyRequirement req = new VacancyRequirement();
                response = rs.getInt("ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }
    
    
     
    
    
}
