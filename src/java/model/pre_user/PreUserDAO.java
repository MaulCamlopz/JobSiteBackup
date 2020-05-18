package model.pre_user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ConnectionDB;

public class PreUserDAO {
    
    ConnectionDB connDB = new ConnectionDB();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public boolean create(PreUser user) {
        String sql = "INSERT INTO pre_user (email, typeC, typeN, commentary, active) "
                +"VALUES('"+user.getEmail()+"','"+user.getTypeC()+"',"+user.getTypeN()+",'"+user.getCommentary()+"',"+user.isActive()+")";
        int response = 0;
        try {
            conn = connDB.getConnection();
            ps=conn.prepareStatement(sql);
            response = ps.executeUpdate();
        } catch (Exception e) {
        }
        if(response!=0)
            return true;
        else
            return false;
    }
    
     public List list() {
        ArrayList<PreUser> list = new ArrayList<>();
        String sql = "select * from pre_user where active = 0";
        
        try {
            conn = connDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                PreUser user = new PreUser();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                if(rs.getString("typeC").equalsIgnoreCase("1")){
                    user.setTypeC("Empresa");
                }else if(rs.getString("typeC").equalsIgnoreCase("2")){
                    user.setTypeC("Estudiante/Egresado");
                }else{
                    user.setTypeC("Desconocido");
                }
                user.setCommentary(rs.getString("commentary"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list; 
     }
    
    
    
}
