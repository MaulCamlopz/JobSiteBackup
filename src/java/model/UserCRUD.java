/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author b22br
 */
public interface UserCRUD {
    public boolean create(User user);
    public User read(String code, String pass);
    public boolean update(User user);
    public boolean delete(int id);
}
