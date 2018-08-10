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
public class GetOrderNumberDAO {
    
    public int getNumber(){
        
        int number = 0;
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            String query = "select * from orderid where idname='merchant';";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            number = rs.getInt(1);
            query = "update orderid set idnumber='"+(number+1)+"' where idname='merchant';";
            stmt.executeUpdate(query);
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
     return number;
     
    }
   
}
