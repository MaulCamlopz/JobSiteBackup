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
import model.user.User;
import model.user.UserDAO;

/**
 *
 * @author b22br
 */
@WebServlet(name = "loginController", urlPatterns = {"/loginController"})
public class loginController extends HttpServlet {
    
    String home = "view/home.jsp";
    final String homeAdmin = "homeAdmin.jsp";
    final String homeCompany = "homeCompany.jsp";
    final String homeStudent = "StudentController";
    
    User user = new User();
    UserDAO dao = new UserDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String access = "";
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("login")){
            String code = request.getParameter("txtUser");
            System.out.println(code);
            String password = request.getParameter("txtPass");
            System.out.println(password);
            user = dao.read(code, password);
            System.out.println("user: "+user.getId());
            if(user.getId() != 0){
                System.out.println("user type: "+user.getType());
                switch(user.getType()){
                    case "admin":
                        access = homeAdmin;
                        break;
                    case "company":
                        access = homeCompany;
                        break;
                    case "student":
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        access = homeStudent;
                        break;
                    default:
                        access = "ErrorSessionController";
                }
                request.setAttribute("code",code);
                request.setAttribute("pass",password);
            }else{
                access = "ErrorSessionController";
            }
        }else{
            access = "ErrorSessionController";
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
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
