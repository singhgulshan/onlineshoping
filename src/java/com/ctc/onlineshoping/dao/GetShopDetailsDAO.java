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
public class GetShopDetailsDAO {
    
    public UserDetailsVO[] getDetails(String pincode){
        
        UserDetailsVO details[] = null;
        Connection con = null;
        int i;
        
        try{
            
            DBUtil ob = new DBUtil();
            con = ob.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from merchantdetail where pincode='"+pincode+"';";
            ResultSet rs = stmt.executeQuery(query);
            
            if(rs.next()){
                
                rs.last();
                details = new UserDetailsVO[rs.getRow()];
                rs.beforeFirst();
                i = 0;
                while(rs.next()){
                    
                    details[i] = new UserDetailsVO();
                    details[i].setName(rs.getString(4));
                    details[i].setLine1(rs.getString(5));
                    details[i].setLine2(rs.getString(6));
                    details[i].setMobilenumber(rs.getString(11));
                    details[i].setShopname(rs.getString(3));
                    details[i].setCity(rs.getString(8));
                    details[i].setDistrict(rs.getString(7));
                    details[i].setState(rs.getString(9));
                    details[i].setUsername(rs.getString(2));
                    i++;
                    
                }
                
            }
            con.close();
            
        }
        catch(SQLException e){
            
            e.printStackTrace();
            
        }
        
        return details;
        
    }
    
}
