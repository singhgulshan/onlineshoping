/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.ProductDetailsVO;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author Gulshan
 */
public class SaveProductDetailsDAO {
    
    public boolean saveProducts(ProductDetailsVO[] detail){
        
        boolean status = false;
        Connection con = null;
        
        try{
            
            DBUtil data = new DBUtil();
            con = data.getDBConnection();
            Statement stmt = con.createStatement();
            for(int i = 0;i<=detail.length;i++){
                
            }
       
        }
        catch(Exception e){
            
            e.printStackTrace();;
            
        }
     return status;   
    }
    
}
