/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Gulshan
 */
public class ChangeOrderStatusDAO {
    
    public boolean changeStatus(String orderid){
        
        boolean status = false;
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "update orderstatus set orderstatus='true' where orderid='"+orderid+"';";
            stmt.executeUpdate(query);
            status = true;
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
     return status;   
    }
    
    public boolean getOrderStaus(String orderid){
        
        boolean status = false;
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from orderstatus where orderid='"+orderid+"'";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            String value = rs.getString(5);
            if("false".equals(value)){
                status = true;
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
     return status;
     
    }
    
}
