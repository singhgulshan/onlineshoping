/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Gulshan
 */
public class DeleteProductsDAO {
    
    public boolean deleteProduct(String id){
        
        boolean status = false;
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "delete from productdetailm where productnumber='"+id+"'";
            stmt.executeUpdate(query);
            status = true;
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
    return status;
    
    } 
    
}
