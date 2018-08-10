/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.bussineslogic.EncryptPassword;
import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.UserDetailsVO;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author Gulshan
 */
public class MerchantDetailsDAO {
    
    public boolean saveMerchantDetails(UserDetailsVO details){
        
        boolean status = false;
        Connection con = null;
        EncryptPassword encrypt = new EncryptPassword();
        
        try{
            
            DBUtil data = new DBUtil();
            con = data.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "insert into merchantdetail(username,shopname,"
                    + "ownername,line1,line2,district,city,state,pincode,"
                    + "mobile,email,landmark) values ('"+details.getUsername()+"',"
                    + "'"+details.getShopname()+"','"+details.getName()+"',"
                    + "'"+details.getLine1()+"','"+details.getLine2()+"',"
                    + "'"+details.getDistrict()+"','"+details.getCity()+"',"
                    + "'"+details.getState()+"','"+details.getPincode()+"',"
                    + "'"+details.getMobilenumber()+"','"+details.getEmail()+"',"
                    + "'"+details.getLandmark()+"');";
            stmt.executeUpdate(query);
            String password = encrypt.getEncryptedPassword(details.getPassword());
            query = "insert into merchantlogin(username,userpassword) values ('"+details.getUsername()+"','"+password+"');";
            stmt.executeUpdate(query);
            con.close();
            status = true;
            
        }
        catch(Exception e){
            
            e.printStackTrace();
            
        }
        
        return status;
        
    }
    
}
