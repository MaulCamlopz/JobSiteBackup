/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.student;

/**
 *
 * @author b22br
 */
public interface StudentCRUD {
    
    public boolean create(Student student);
    public Student read(int idUser);
    public boolean update(Student student);
    public boolean delete(int id);
    
}
