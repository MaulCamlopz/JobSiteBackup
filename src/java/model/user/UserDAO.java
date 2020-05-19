package model.user;

import model.user.UserCRUD;
import model.user.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ConnectionDB;

public class UserDAO implements UserCRUD {
    
    ConnectionDB connDB = new ConnectionDB();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    //User user = new User();

    @Override
    public boolean create(User user) {
        String sql = "INSERT INTO USER ( Nickname, Password, user_type) "
                +"VALUES('"+user.code+"','"+user.pass+"','"+user.type+"')";
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
    
    public List listAdmin (){
        ArrayList<User> list = new ArrayList<>();
        String sql = "select id, nickname from user where user_type = 'company' or user_type = 'student'";
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setCode(rs.getString("nickname"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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
