/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.controller;

import com.ctc.onlineshoping.dao.GetCustomerDetailsDAO;
import com.ctc.onlineshoping.dao.GetMerchantDetailsDAO;
import com.ctc.onlineshoping.dao.LoginDAO;
import com.ctc.onlineshoping.vo.ProductDetailsVO;
import com.ctc.onlineshoping.vo.UserDetailsVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gulshan
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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
        
        try (PrintWriter out = response.getWriter()) {
        String usertype = request.getParameter("usertype");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginDAO get = new LoginDAO();
        boolean status;
        if("customer".equals(usertype)){
            
            status = get.login("customerlogin", username, password);
            if(status){
                HttpSession session = request.getSession();
                GetCustomerDetailsDAO customer = new GetCustomerDetailsDAO();
                ArrayList<ProductDetailsVO> list = new ArrayList<>();
                UserDetailsVO detail = customer.getDetails(username);
                session.setAttribute("username", username);
                session.setAttribute("pincode", detail.getPincode());
                session.setAttribute("name", detail.getName());
                session.setAttribute("cart", list);
                response.sendRedirect("Customerhome.jsp");
            }
            else{
                response.sendRedirect("Login.jsp?error=msg");
            }
        }
        else{
            
           status = get.login("merchantlogin", username, password);
           if(status){
               
               HttpSession session = request.getSession();
               GetMerchantDetailsDAO dao = new GetMerchantDetailsDAO();
               UserDetailsVO detail = dao.getDetails(username);
               session.setAttribute("username", username);
               session.setAttribute("name", detail.getName());
               response.sendRedirect("merchanthome.jsp");
               
           }
           else{
               
               response.sendRedirect("Login.jsp?error=msg");
               
           }
            
        }
        
        }
        
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
