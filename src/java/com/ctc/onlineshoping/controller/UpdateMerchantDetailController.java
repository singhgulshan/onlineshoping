/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.controller;

import com.ctc.onlineshoping.dao.UpdateCustomerDetailDAO;
import com.ctc.onlineshoping.dao.UpdateMerchantDetailDAO;
import com.ctc.onlineshoping.vo.UserDetailsVO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UpdateMerchantDetailController", urlPatterns = {"/UpdateMerchantDetailController"})
public class UpdateMerchantDetailController extends HttpServlet {

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
        
            UserDetailsVO detail = new UserDetailsVO();
            HttpSession session = request.getSession();
            UpdateMerchantDetailDAO dao = new UpdateMerchantDetailDAO();
            
            detail.setUsername((String)session.getAttribute("username"));
            detail.setName(request.getParameter("name"));
            detail.setLine1(request.getParameter("addline1"));
            detail.setLine2(request.getParameter("addline2"));
            detail.setCity(request.getParameter("City"));
            detail.setDistrict(request.getParameter("District"));
            detail.setLandmark(request.getParameter("landmark"));
            detail.setState(request.getParameter("state"));
            detail.setPincode(request.getParameter("pincode"));
            detail.setEmail(request.getParameter("email"));
            detail.setMobilenumber(request.getParameter("contactnum"));
            boolean status = dao.updateDetail(detail);
            
            if(status){
                
                response.sendRedirect("merchanthome.jsp");
                
            }
            else{
                
                response.sendRedirect("updatemerchantdetail.jsp?error=msg");
                
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
