/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.OrderStatusVO;
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
public class GetOrderDetailDAO {
    
    public ArrayList<OrderStatusVO> customerOrderStatus(String username){
        
        ArrayList<OrderStatusVO> list = new ArrayList<>();
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from orderstatus where customerid='"+username+"';";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                rs.beforeFirst();
                while(rs.next()){
                    
                    OrderStatusVO status = new OrderStatusVO();
                    status.setCustomerid(rs.getString(4));
                    status.setMerchantid(rs.getString(3));
                    status.setOrderid(rs.getString(2));
                    status.setOrderstatus(rs.getString(5));
                    status.setTotalamount(rs.getDouble(6));
                    status.setShopname(rs.getString(7));
                    list.add(status);
                    
                }
                
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
     return list;  
     
    }
    
    public ArrayList<ProductDetailsVO> orderProductDetail(String orderid){
        
        ArrayList<ProductDetailsVO> products = new ArrayList<>();
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from orderdetail where orderid='"+orderid+"';";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                
                ProductDetailsVO detail = new ProductDetailsVO();
                detail.setProductname(rs.getString(3));
                detail.setQuantity(rs.getInt(4));
                detail.setPrice(rs.getDouble(5));
                detail.setTotal(rs.getDouble(6));
                products.add(detail);
                
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
      return products;
      
    }
    
    public ArrayList<OrderStatusVO> merchantOrderStatus(String username){
        
        ArrayList<OrderStatusVO> list = new ArrayList<>();
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from orderstatus where merchantid='"+username+"';";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                rs.beforeFirst();
                while(rs.next()){
                    
                    OrderStatusVO status = new OrderStatusVO();
                    status.setCustomerid(rs.getString(4));
                    status.setMerchantid(rs.getString(3));
                    status.setOrderid(rs.getString(2));
                    status.setOrderstatus(rs.getString(5));
                    status.setTotalamount(rs.getDouble(6));
                    status.setShopname(rs.getString(7));
                    status.setCustomername(rs.getString(8));
                    list.add(status);
                    
                }
                
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
     return list;
     
    }
    
}
