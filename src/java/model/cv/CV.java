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
public class CV {
    
    private ArrayList<String> skills = new ArrayList<>();
    private ArrayList<String> courses = new ArrayList<>();
    private ArrayList<String> langues = new ArrayList<>();
    private ArrayList<WorkExperience> workExps = new ArrayList<>();

    public CV() { }

    public ArrayList<String> getSkills() {
        return skills;
    }

    public void setSkills(ArrayList<String> skills) {
        this.skills = skills;
    }

    public ArrayList<String> getCourses() {
        return courses;
    }

    public void setCourses(ArrayList<String> courses) {
        this.courses = courses;
    }

    public ArrayList<String> getLangues() {
        return langues;
    }

    public void setLangues(ArrayList<String> langues) {
        this.langues = langues;
    }

    public ArrayList<WorkExperience> getWorkExps() {
        return workExps;
    }

    public void setWorkExps(ArrayList<WorkExperience> workExps) {
        this.workExps = workExps;
    }
    
    
   
    
    
}
