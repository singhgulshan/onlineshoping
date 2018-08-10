/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import com.ctc.onlineshoping.dao.ChangeOrderStatusDAO;
import com.ctc.onlineshoping.dao.DeleteProductsDAO;
import com.ctc.onlineshoping.dao.ManageAccountDAO;

/**
 *
 * @author Gulshan
 */
public class TestDAO {
    
    public static void main(String[] a){
        
        ManageAccountDAO manage = new ManageAccountDAO();
        manage.addToAccount("f5");
        
    }
    
    
}
