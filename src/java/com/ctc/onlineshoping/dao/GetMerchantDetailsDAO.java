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
public class GetMerchantDetailsDAO {
    
    public UserDetailsVO getDetails(String username){
        
        UserDetailsVO detail = new UserDetailsVO();
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from merchantdetail where username='"+username+"';";
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()){
                
            detail.setCity(rs.getString(8));
            detail.setDistrict(rs.getString(7));
            detail.setEmail(rs.getString(12));
            detail.setLandmark(rs.getString(13));
            detail.setLine1(rs.getString(5));
            detail.setLine2(rs.getString(6));
            detail.setMobilenumber(rs.getString(11));
            detail.setName(rs.getString(4));
            detail.setPincode(rs.getString(10));
            detail.setShopname(rs.getString(3));
            detail.setState(rs.getString(9));
            
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
        return detail;
        
    }
    
}
