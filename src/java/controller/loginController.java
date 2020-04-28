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
import model.User;
import model.UserDAO;

/**
 *
 * @author b22br
 */
@WebServlet(name = "loginController", urlPatterns = {"/loginController"})
public class loginController extends HttpServlet {
    
    String home = "view/home.jsp";
    final String homeAdmin = "homeAdmin.jsp";
    final String homeCompany = "homeCompany.jsp";
    final String homeStudent = "homeStudent.jsp";
    
    User user = new User();
    UserDAO dao = new UserDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //processRequest(request, response);
        
        String access = "";
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("login")){
            String code = request.getParameter("txtUser");
            System.out.println(code);
            String password = request.getParameter("txtPass");
            System.out.println(password);
            user = dao.read(code, password);
            if(user != null){
                System.out.println(user.getType());
                switch(user.getType()){
                    case "admin":
                        access = homeAdmin;
                        break;
                    case "company":
                        access = homeCompany;
                        break;
                    case "student":
                        access = homeStudent;
                        break;
                    default:
                        access = "index.jsp";
                }
                request.setAttribute("code",code);
                request.setAttribute("pass",password);
            }else{
                access = "index.jsp";
            }
        }
        
        RequestDispatcher view = request.getRequestDispatcher(access);
        view.forward(request, response);
        
    }
    
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
