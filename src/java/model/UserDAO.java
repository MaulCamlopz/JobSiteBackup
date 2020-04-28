package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO implements UserCRUD {
    
    ConnectionDB connDB = new ConnectionDB();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    User user = new User();

    @Override
    public boolean create(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User read(String code, String pass) {
        
        User user = new User();
        String sql = "select * from user where Nickname = '" + code + "' and Password = '" + pass+"'";
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                user.setId(rs.getInt("id"));
                user.setCode(rs.getString("Nickname"));
                user.setPass(rs.getString("Password"));
                user.setType(rs.getString("user_type"));
            }
        } catch (Exception e) {
        }
        System.out.println("RETURN ID: "+user.getId());
        return user;
        
    }

    @Override
    public boolean update(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
