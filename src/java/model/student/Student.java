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
public class Student {
    
    private int id;
    private int idUser;
    private int idCv;
    private String name;
    private String lastName;
    private String secondLastName;
    private String birthDate;
    private String university;
    private String career;
    private String email;
    private String phone;
    private String phoneAdd;
    private String country;
    private String city;
    private String address;

    public Student(int id, int idUser, int idCv, String name, 
            String lastName, String secondLastName, String birthDate, 
            String university, String career, String email, String phone, 
            String phoneAdd, String country, String city, String address) {
        this.id = id;
        this.idUser = idUser;
        this.idCv = idCv;
        this.name = name;
        this.lastName = lastName;
        this.secondLastName = secondLastName;
        this.birthDate = birthDate;
        this.university = university;
        this.career = career;
        this.email = email;
        this.phone = phone;
        this.phoneAdd = phoneAdd;
        this.country = country;
        this.city = city;
        this.address = address;
    }

    public Student() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdCv() {
        return idCv;
    }

    public void setIdCv(int idCv) {
        this.idCv = idCv;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSecondLastName() {
        return secondLastName;
    }

    public void setSecondLastName(String secondLastName) {
        this.secondLastName = secondLastName;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhoneAdd() {
        return phoneAdd;
    }

    public void setPhoneAdd(String phoneAdd) {
        this.phoneAdd = phoneAdd;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
    
    
}
