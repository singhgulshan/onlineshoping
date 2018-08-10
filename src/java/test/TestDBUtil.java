/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import com.ctc.onlineshoping.util.DBUtil;
import com.ctc.onlineshoping.vo.SalesDetailVO;
import java.sql.Connection;

/**
 *
 * @author Gulshan
 */
public class TestDBUtil {
    
    public static void main(String[] a) throws Exception{
        
       DBUtil util = new DBUtil();
       
        Connection con = null;
        
        con = util.getDBConnection();
        System.out.println(con);
    }
}
