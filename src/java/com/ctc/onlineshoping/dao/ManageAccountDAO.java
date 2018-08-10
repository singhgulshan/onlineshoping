/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.OrderStatusVO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Gulshan
 */
public class ManageAccountDAO {
    
    public void addToAccount(String orderid){
        
        try{
            
            OrderStatusVO detail = new OrderStatusVO();
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from orderstatus where orderid='"+orderid+"';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            detail.setCustomerid(rs.getString(4));
            detail.setCustomername(rs.getString(8));
            detail.setMerchantid(rs.getString(3));
            detail.setMerchantname(rs.getString(7));
            detail.setTotalamount(rs.getDouble(6));
            
            query = "select * from accountdetail where merchantid='"+detail.getMerchantid()+"' AND customerid='"+detail.getCustomerid()+"';"; 
            rs = stmt.executeQuery(query);
            if(rs.next()){
                
                double amount = rs.getDouble(4);
                amount = amount + detail.getTotalamount();
                
                query = "update accountdetail set amount='"+amount+"' where merchantid='"+detail.getMerchantid()+"' AND customerid='"+detail.getCustomerid()+"';";
                stmt.executeUpdate(query);
                
            }
            else{
                
                query = "insert into accountdetail (customerid,merchantid,amount,customername,shopname) values('"+detail.getCustomerid()+"','"+detail.getMerchantid()+"','"+detail.getTotalamount()+"','"+detail.getCustomername()+"','"+detail.getMerchantname()+"');";
                stmt.executeUpdate(query);
                
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    
    public ArrayList<OrderStatusVO> merchantAccountDetail(String username){
        
        ArrayList<OrderStatusVO> list = new ArrayList<>();
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from accountdetail where merchantid='"+username+"';";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                
                if(rs.getDouble(4) > 1){
                    
                   OrderStatusVO detail = new OrderStatusVO();
                   detail.setCustomerid(rs.getString(2));
                   detail.setCustomername(rs.getString(5));
                   detail.setTotalamount(rs.getDouble(4));    
                   list.add(detail);
       
                }
                
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
      
        return list;
        
    }
    
    public ArrayList<OrderStatusVO> customerAccountDetail(String username){
        
        ArrayList<OrderStatusVO> list = new ArrayList<>();
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from accountdetail where customerid='"+username+"';";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                
                if(rs.getDouble(4) > 1){
                    
                   OrderStatusVO detail = new OrderStatusVO();
                   detail.setMerchantid(rs.getString(3));
                   detail.setMerchantname(rs.getString(6));
                   detail.setTotalamount(rs.getDouble(4));
                   list.add(detail);
                
                }
                
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
      
        
        return list;
        
    }
    
    public boolean deductFromAccount(String merchantid , String customerid , double amount){
        
        boolean status = false;
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from accountdetail where merchantid='"+merchantid+"' AND customerid='"+customerid+"';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            if(rs.getDouble(4) >= amount){
                
                amount = rs.getDouble(4) - amount;
                query = "update accountdetail set amount='"+amount+"' where merchantid='"+merchantid+"' AND customerid='"+customerid+"';";
                stmt.executeUpdate(query);
                status = true;
                
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
      
        return status;
        
    }
    
}
