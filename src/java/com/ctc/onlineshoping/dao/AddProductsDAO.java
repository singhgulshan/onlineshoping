/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.ProductDetailsVO;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author Gulshan
 */
public class AddProductsDAO {
    
    public boolean saveProduct(ProductDetailsVO[] products){
                   
            Connection con = null;
            boolean status = false;
        
        try{
            
            DBUtil dbobj = new DBUtil();
            con = dbobj.getDBConnection();
            Statement stmt = con.createStatement();
            int length = products.length;
            int i;
            for(i=0 ; i<length ; i++){
                
               String query = "insert into productdetailm(username,productname,quantiy,qunit,price,category) values ('"+products[i].getUsername()+"','"+products[i].getProductname()+"','"+products[i].getUnitquantity()+"','"+products[i].getUnit()+"','"+products[i].getPrice()+"','"+products[i].getCategory()+"');"; 
               stmt.executeUpdate(query);
                
            }
           con.close();
           status = true;
        }
        catch(Exception e){
            
            e.printStackTrace();
            
        }
        return status;
        
    }
    
}
