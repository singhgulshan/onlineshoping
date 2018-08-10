/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.controller;

import com.ctc.onlineshoping.dao.AddProductsDAO;
import com.ctc.onlineshoping.vo.ProductDetailsVO;
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
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            String username = (String)session.getAttribute("username");
            AddProductsDAO add = new AddProductsDAO();
            int i = Integer.parseInt(request.getParameter("index"));
            ProductDetailsVO[] details = new ProductDetailsVO[i];
            int j;
            int k = 1;
            for(j=0 ; j<i ; j++){
                
                details[j] = new ProductDetailsVO();
                details[j].setUsername(username);
                details[j].setProductname(request.getParameter("product"+k));
                details[j].setUnitquantity(request.getParameter("quantity"+k));
                details[j].setUnit(request.getParameter("unit"+k));
                double price = Double.parseDouble(request.getParameter("price"+k));
                details[j].setPrice(price);
                details[j].setCategory(request.getParameter("category"+k));
                k++;
                
            }
            boolean status = add.saveProduct(details);
            
            if(status){
                
                response.sendRedirect("merchanthome.jsp");
                
            }
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
