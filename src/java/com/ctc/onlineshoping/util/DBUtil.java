/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.util;

import java.sql.Connection;
import java.sql.DriverManager;


/**
 *
 * @author Gulshan
 */
public class DBUtil {
    
    public Connection getDBConnection(){
        
        Connection con = null;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/onlinestore";
            String dbUser = "root";
            String dbPassword = "root";
            con = DriverManager.getConnection(url, dbUser, dbPassword);
           
        }catch(Exception e){
            
            e.printStackTrace();
            
        }
        
        return con;
    }    
    
}
