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
import model.company.*;
import model.vacancy.*;
import model.pre_user.*;
import model.user.*;

/**
 *
 * @author b22br
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

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
        
        if(action.equalsIgnoreCase("addUser")){
            System.out.println("add");
            User user = new User();
            UserDAO dao = new UserDAO();
            String id = request.getParameter("id");
            user.setCode(request.getParameter("nickname"));
            user.setPass(request.getParameter("password"));
            user.setType(request.getParameter("type-user"));
            if(dao.create(user)){
                PreUserDAO daoPU = new PreUserDAO();
                if(daoPU.delete(id)){
                    access = "adminSuccess.html";
                }else{
                    access = "adminError.html";
                }
            }else{
                access = "adminError.html";
            }
        }else if(action.equalsIgnoreCase("deleteUser")){
            //User user = new User();
            UserDAO dao = new UserDAO();
            String id = request.getParameter("id");
            if(dao.delete(id)){
                PreUserDAO daoPU = new PreUserDAO();
                if(daoPU.delete(id)){
                    access = "adminSuccess.html";
                }else{
                    access = "adminError.html";
                }
            }else{
                access = "adminError.html";
            }
        }else if(action.equalsIgnoreCase("deletePreuser")){
            //User user = new User();
            PreUserDAO dao = new PreUserDAO();
            String id = request.getParameter("id");
            if(dao.delete(id)){
                access = "adminSuccess.html";
            }else{
                access = "adminError.html";
            }
        
        } else if(action.equalsIgnoreCase("addVacancy")){
            String id = request.getParameter("id");
            VacancyDAO dao = new VacancyDAO();
            if(dao.setValid(id)){
                access = "adminSuccess.html";
            }else{
                access = "adminError.html";
            }
        } else if(action.equalsIgnoreCase("deleteVacancy")){
            String id = request.getParameter("id");
            VacancyDAO dao = new VacancyDAO();
            if(dao.delete(id)){
                access = "adminSuccess.html";
            }else{
                access = "adminError.html";
            }
        } else{
            access = "adminError.html";
        }
        //
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
