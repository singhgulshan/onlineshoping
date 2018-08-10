/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.UserDetailsVO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Gulshan
 */
public class GetCustomerDetailsDAO {
    
    public UserDetailsVO getDetails(String username){
        
        UserDetailsVO details = new UserDetailsVO();
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from customerdetail where usernamec='"+username+"';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            details.setName(rs.getString(3));
            details.setPincode(rs.getString(11));
            details.setCity(rs.getString(6));
            details.setDistrict(rs.getString(7));
            details.setState(rs.getString(8));
            details.setMobilenumber(rs.getString(9));
            details.setEmail(rs.getString(10));
            details.setLandmark(rs.getString(12));
            details.setLine1(rs.getString(4));
            details.setLine2(rs.getString(5));
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
     return details;
     
    }
    
}
