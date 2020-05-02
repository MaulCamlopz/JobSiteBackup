/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cv;

import java.util.ArrayList;

/**
 *
 * @author b22br
 */
public interface CVCRUD {
    
    public boolean createSkill(int idCV);
    
    public ArrayList<String> readSkills(int idCV);
    
    public boolean deleteSkill(int idCV, int idSkill);
    
}
