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
import model.student.Student;
import model.student.StudentDAO;
import model.user.User;

/**
 *
 * @author b22br
 */
@WebServlet(name = "StudentController", urlPatterns = {"/StudentController"})
public class StudentController extends HttpServlet {

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
        
        /*HttpSession session = request.getSession();
        
        User user = (User)session.getAttribute("user");
        
        if(user == null){
            request.getRequestDispatcher("ErrorSessionController");
        }else{
            StudentDAO sDao = new StudentDAO();
            Student student = sDao.read(user.getId());
            session.setAttribute("student", student);
            request.getRequestDispatcher("studentHome.jsp").forward(request, response);
        }*/
        
        String access = "";
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("applyVacancy")){
            
            StudentDAO dao = new StudentDAO();
            String idStudent = request.getParameter("idStudent");
            String idVacancy = request.getParameter("idVacancy");
            
            if(dao.applyVacancy(idStudent, idVacancy)){
                access = "studentSuccess.html";
            }else{
                access = "studentError.html";
            }
            
        } else if(action.equalsIgnoreCase("deleteVacancy")){
            
            StudentDAO dao = new StudentDAO();
            String idStudent = request.getParameter("idRequirement");
            
            if(dao.deleteVacancy(idStudent)){
                access = "studentSuccess.html";
            }else{
                access = "studentError.html";
            }
            
        } else if(action.equalsIgnoreCase("createStudent")){
            
            Student student = new Student();
            StudentDAO dao = new StudentDAO();
            student.setName(request.getParameter("name"));
            student.setLastName(request.getParameter("lastName"));
            student.setPhone(request.getParameter("phone"));
            student.setEmail(request.getParameter("email"));
            student.setUniversity(request.getParameter("university"));
            student.setCareer(request.getParameter("career"));
            student.setAddress(request.getParameter("address"));
            student.setCountry(request.getParameter("country"));
            student.setCity(request.getParameter("city"));
            int idUser = Integer.valueOf(request.getParameter("idUser"));
            
            if(dao.create(student, idUser)){
                access = "studentSuccess.html";
            }else{
                access = "studentError.html";
            }
            
        } else if(action.equalsIgnoreCase("deleteStudent")){
            
            StudentDAO dao = new StudentDAO();
            int idStudent = Integer.valueOf(request.getParameter("idStudent"));
            
            if(dao.delete(idStudent)){
                access = "studentSuccess.html";
            }else{
                access = "studentError.html";
            }
            
        } else{
            access = "studentError.html";
        }
        //deleteStudent
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
