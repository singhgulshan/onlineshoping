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
public class CustomerDetailsDAO {
    
    public boolean saveDetails(UserDetailsVO detail){
        
        boolean status = false;
        Connection con = null; 
        EncryptPassword encrypt = new EncryptPassword();
        
        try{
            
            DBUtil dbu = new DBUtil();
            con = dbu.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "insert into customerdetail(usernamec,name,line1,line2,city,district,state,mobile,email,pin,landmark) values ('"+detail.getUsername()+"','"+detail.getName()+"','"+detail.getLine1()+"','"+detail.getLine2()+"','"+detail.getCity()+"','"+detail.getDistrict()+"','"+detail.getState()+"','"+detail.getMobilenumber()+"','"+detail.getEmail()+"','"+detail.getPincode()+"','"+detail.getLandmark()+"');";
            stmt.executeUpdate(query);
            String password = encrypt.getEncryptedPassword(detail.getPassword());
            query = "insert into customerlogin(username,userpassword) values ('"+detail.getUsername()+"','"+password+"');";
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
