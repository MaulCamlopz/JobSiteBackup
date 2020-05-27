/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.company.Company;
import model.company.CompanyDAO;
import model.company.Representative;
import model.student.Student;
import model.student.StudentDAO;
import model.user.User;
import model.vacancy.Vacancy;
import model.vacancy.VacancyDAO;

/**
 *
 * @author b22br
 */
@WebServlet(name = "CompanyController", urlPatterns = {"/CompanyController"})
public class CompanyController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String access = "";
        String action = request.getParameter("action");
        
        final String erroPage = "companyError.jsp";
        final String successPage = "companySuccess.jsp";
        
        if(action.equalsIgnoreCase("addVacancy")){
            System.out.println("ADD VACANCY");
            Vacancy vacancy = new Vacancy();
            VacancyDAO dao = new VacancyDAO();
            vacancy.setIdCompany(Integer.valueOf(request.getParameter("idCompany")));
            vacancy.setWorkstation(request.getParameter("workstation"));
            vacancy.setId(Integer.valueOf(request.getParameter("idVacancy")));
            vacancy.setWorkHours(request.getParameter("workhours"));
            vacancy.setAddress(request.getParameter("address"));
            vacancy.setDescription(request.getParameter("description"));
            vacancy.setSalary(Integer.valueOf(request.getParameter("salary")));
            if(dao.create(vacancy)){
                access = successPage;
            }else{
                access = erroPage;
            }   
        } else if(action.equalsIgnoreCase("addProfile")){
            System.out.println("ADD PROFILE");
            Company company = new Company();
            Representative rep = new Representative();
            CompanyDAO dao = new CompanyDAO();
            int idUser = Integer.valueOf(request.getParameter("idUser"));
            company.setName(request.getParameter("name"));
            company.setAddress(request.getParameter("address"));
            company.setCity(request.getParameter("city"));
            company.setPhone(request.getParameter("phone"));
            company.setEmail(request.getParameter("email"));
            company.setRFC(request.getParameter("rfc"));
            company.setCountry(request.getParameter("county"));
            rep.setName(request.getParameter("nameRep"));
            rep.setLastName(request.getParameter("lastNameRep"));
            rep.setPhone(request.getParameter("phone"));
            rep.setEmail(request.getParameter("email"));
            if(dao.create(company,rep,idUser)){
                access = successPage;
            }else{
                access = erroPage;
            }
        } else{
            access = erroPage;
        }
        
        RequestDispatcher view = request.getRequestDispatcher(access);
        view.forward(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
