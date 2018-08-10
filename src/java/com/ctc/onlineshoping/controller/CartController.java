/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.controller;

import com.ctc.onlineshoping.dao.GetProductDetailsDAO;
import com.ctc.onlineshoping.vo.ProductDetailsVO;
import java.io.IOException;
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
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

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
        
        String action = request.getParameter("action");
        if("add".equals(action)){
            addToCart(request, response);
            orderTotal(request);
            response.sendRedirect("Viewproducts.jsp");
        }
        if("Update".equals(action)){
            updateCart(request);
            orderTotal(request);
            response.sendRedirect("cart.jsp");
        }
        if("Delete".equals(action)){
            deleteCart(request);
            orderTotal(request);
            response.sendRedirect("cart.jsp");
            
        }
        
        
    }
    
    public void addToCart(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException{
        HttpSession session = request.getSession();
        String id = request.getParameter("productid");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        GetProductDetailsDAO get = new GetProductDetailsDAO();
        ArrayList<ProductDetailsVO> list = (ArrayList<ProductDetailsVO>)session.getAttribute("cart");
        ProductDetailsVO product = get.getDetails(id , quantity);
        list.add(product);
        session.setAttribute("cart", list);
    
    }
    
    public void updateCart(HttpServletRequest request){
        
        HttpSession session = request.getSession();
        ArrayList<ProductDetailsVO> list = (ArrayList<ProductDetailsVO>)session.getAttribute("cart");
        int index = Integer.parseInt(request.getParameter("index"));
        int value = Integer.parseInt(request.getParameter("quantity"));
        ProductDetailsVO product = list.get(index);
        list.remove(index);
        product.setQuantity(value);
        product.setTotal(product.getPrice()*product.getQuantity());
        list.add(index, product);
        session.setAttribute("cart", list);
        
    }
    
    public void deleteCart(HttpServletRequest request){
        
        HttpSession session = request.getSession();
        ArrayList<ProductDetailsVO> list = (ArrayList<ProductDetailsVO>)session.getAttribute("cart");
        int index = Integer.parseInt(request.getParameter("index"));
        list.remove(index);
        session.setAttribute("cart", list);
        
    }
    
    public void orderTotal(HttpServletRequest request){
        
        HttpSession session = request.getSession();
        ArrayList<ProductDetailsVO> list = (ArrayList<ProductDetailsVO>)session.getAttribute("cart");
        ProductDetailsVO product = new ProductDetailsVO();
        double ordertotal = 0;
        
        for (ProductDetailsVO list1 : list) {
            
            product = list1;
            ordertotal += product.getTotal();
            
        }
        session.setAttribute("ordertotal", ordertotal);
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
