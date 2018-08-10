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
public class LoginDAO {
    
    public boolean login(String usertype , String username , String password){
        
        boolean status = false;
        
        try{
            EncryptPassword encrypt = new EncryptPassword();
            password = encrypt.getEncryptedPassword(password);
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from "+usertype+" where username='"+username+"' AND userpassword='"+password+"';";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                status = true;
            }
            
        }
        
       /* try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from "+usertype+" where username='"+username+"';";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                
                String currentpassword = rs.getString(2);
                EncryptPassword encrypt = new EncryptPassword();
                password = encrypt.getEncryptedPassword(password);
                if(currentpassword.equals(password)){
                    status = true;
                }
            }
        }*/
        catch(SQLException e){
            e.printStackTrace();
        }
        
        return status;
        
    }
    
}
