/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.UserDetailsVO;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Gulshan
 */
public class UpdateMerchantDetailDAO {
    
    public boolean updateDetail(UserDetailsVO detail){
 
        boolean status = false;
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "update merchantdetail set name='"+detail.getName()+"',set shopename='"+detail.getShopname()+"',line1='"+detail.getLine1()+"',line2='"+detail.getLine2()+"',city='"+detail.getCity()+"',district='"+detail.getDistrict()+"',state='"+detail.getState()+"',mobile='"+detail.getMobilenumber()+"',email='"+detail.getEmail()+"',pin='"+detail.getPincode()+"',landmark='"+detail.getLandmark()+"' where username='"+detail.getUsername()+"';";
            stmt.executeUpdate(query);
            status = true;
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
     return status; 
     
    }
    
}
