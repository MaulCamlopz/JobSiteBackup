/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.ConnectionDB;

/**
 *
 * @author b22br
 */
public class CVDAO implements CVCRUD {
    
    private ConnectionDB connDB = new ConnectionDB();
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    @Override
    public boolean createSkill(int idCV) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public ArrayList<String> readSkills(int id) {
        ArrayList<String> skills = new ArrayList<>();
        String sql = "SELECT Skill.id, Skill.item FROM CV " +
            "INNER JOIN CV_Skill ON CV.id = CV_Skill.CV_id " +
            "INNER JOIN Skill ON CV_Skill.Skill_id = Skill.id WHERE CV.id = " + id;
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                skills.add(rs.getString("item"));
            }
        } catch (Exception e) {
        }
        return skills;
    }

    @Override
    public boolean deleteSkill(int idCV, int idSkill) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    

}
