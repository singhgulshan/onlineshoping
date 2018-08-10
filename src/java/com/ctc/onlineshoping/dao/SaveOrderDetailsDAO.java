/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.dao;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.ProductDetailsVO;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Gulshan
 */
public class SaveOrderDetailsDAO {
    
    public boolean saveOrder(String orderid , ArrayList<ProductDetailsVO> list , String merchant , String customer , double ordertotal , String shopname , String customername){
        
        boolean status = false;
        
        try{
            
            DBUtil util = new DBUtil();
            Connection con = util.getDBConnection();
            Statement stmt = con.createStatement();
            
            for (ProductDetailsVO product : list) {
                
                String item = product.getProductname()+" "+product.getUnitquantity()+product.getUnit();
                String query = "insert into orderdetail (orderid,item,quantity,rate,subtotal) values ('"+orderid+"','"+item+"','"+product.getQuantity()+"','"+product.getPrice()+"','"+product.getTotal()+"');";
                stmt.executeUpdate(query);
                
            }
            
            String query = "insert into orderstatus (orderid,merchantid,customerid,orderamount,shopname,customername) values ('"+orderid+"','"+merchant+"','"+customer+"','"+ordertotal+"','"+shopname+"','"+customername+"');";
            stmt.executeUpdate(query);
            
            status = true;
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
      return status;
      
    }
    
}
