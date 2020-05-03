/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
}
