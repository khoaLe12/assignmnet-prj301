/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserError;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author KHOA
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {
    
    private static final String ERROR="createUser.jsp";
    private static final String SUCCESS="login.html";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError error = new UserError();
        boolean checkValidation = true;
        
        try{
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            
            UserDAO dao = new UserDAO(); 
//            boolean checkDuplicate = dao.checkDuplicate(userID);
//            if(checkDuplicate){
//                error.setUserID("User ID is duplicate!");
//                checkValidation = false;
//            }
            
            if(userID==null || userID.length()<2 || userID.length()>5){
                error.setUserID("User ID in[2,5]");
                checkValidation = false;
            }
            if(fullName==null || fullName.length()<5 || fullName.length()>20){
                error.setFullName("Full name in[5,20]");
                checkValidation = false;
            }
            if(!confirm.equals(password)){
                error.setConfirm("Password do not match!");
                checkValidation = false;
            }
            
            if(checkValidation){
                UserDTO user = new UserDTO(userID, fullName, roleID, password);
//                boolean checkCreate = dao.insert(user);
                boolean checkCreate = dao.insertV2(user);
                if(checkCreate){
                    url = SUCCESS;
                }else{
                    request.setAttribute("ERROR", "error !");
                }
            }else{
                request.setAttribute("ERROR_USER", error);
            }
        }catch(Exception e){
            log("error at LoginController: " + e.toString());
            if(e.toString().contains("duplicate")){
                error.setUserID("User ID is duplicate!");
                request.setAttribute("ERROR_USER", error);
            }
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
