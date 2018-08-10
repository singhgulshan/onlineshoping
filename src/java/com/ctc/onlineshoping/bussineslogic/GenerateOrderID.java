/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.bussineslogic;

import com.ctc.onlineshoping.dao.GetOrderNumberDAO;

/**
 *
 * @author Gulshan
 */
public class GenerateOrderID {
    
    public String getOrderID(String username){
        
            GetOrderNumberDAO get = new GetOrderNumberDAO();
            int number = get.getNumber();
            String orderid = username+number;
        
     return orderid;   
     
    }
    
}
