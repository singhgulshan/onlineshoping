/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.bussineslogic.EncryptPassword;
import com.ctc.onlineshoping.util.DBUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Gulshan
 */
public class ChangeCustomerPasswordDAO {
    
    public boolean changePassword(String oldpassword , String newpassword , String username){
        
        boolean status = false;
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            EncryptPassword encrypt = new EncryptPassword();
            Statement stmt = con.createStatement();
            String query = "select * from customerlogin where username='"+username+"';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            String currentpassword = rs.getString(2);
            oldpassword = encrypt.getEncryptedPassword(oldpassword);
            newpassword = encrypt.getEncryptedPassword(newpassword);
            if(currentpassword.equals(oldpassword)){
                
                query = "update customerlogin set userpassword='"+newpassword+"' where username='"+username+"';";
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
