/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.ProductDetailsVO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Gulshan
 */
public class GetProductDetailsDAO {
    
    public ProductDetailsVO getDetails(String id , int quantity){
        
        Connection con = null;
        ProductDetailsVO detail = new ProductDetailsVO();
        
        try{
            
            DBUtil ob = new DBUtil();
            con = ob.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from productdetailm where productnumber='"+id+"';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            detail.setCategory(rs.getString(7));
            detail.setPrice(rs.getDouble(6));
            detail.setProductname(rs.getString(3));
            detail.setQuantity(quantity);
            detail.setUnit(rs.getString(5));
            detail.setUnitquantity(rs.getString(4));
            detail.setTotal(detail.getPrice()*detail.getQuantity());
            con.close();
        }
        catch(SQLException e){
            
            e.printStackTrace();
            
        }
        
        
     return detail;   
    }
    
    public ArrayList<ProductDetailsVO> getDetails(String id){
               
        ArrayList<ProductDetailsVO> list = new ArrayList<>();
        
        try{
            
            DBUtil ob = new DBUtil();
            Connection con = ob.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from productdetailm where username='"+id+"';";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                
                ProductDetailsVO product = new ProductDetailsVO();
                product.setCategory(rs.getString(7));
                product.setPrice(rs.getDouble(6));
                product.setProductname(rs.getString(3));
                product.setUnit(rs.getString(5));
                product.setUnitquantity(rs.getString(4));
                product.setProductid(rs.getString(1));
                list.add(product);
                
            }
            
        }
        catch(SQLException e){
            
            e.printStackTrace();
            
        }
        
        return list;
        
    }
    
}
