/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import com.ctc.onlineshoping.dao.GetOrderDetailDAO;
import com.ctc.onlineshoping.dao.GetProductDetailsDAO;
import com.ctc.onlineshoping.vo.OrderStatusVO;
import com.ctc.onlineshoping.vo.ProductDetailsVO;
import java.util.ArrayList;

/**
 *
 * @author Gulshan
 */
public class TestArrayList {
    
    public static void main(String[] a){
        
        GetOrderDetailDAO get = new GetOrderDetailDAO();
        ArrayList<ProductDetailsVO> list = get.orderProductDetail("d2");
        
        for(ProductDetailsVO product : list){
            
            System.out.println(product.getProductname());
            System.out.println(product.getQuantity());
            System.out.println(product.getPrice());
            System.out.println(product.getTotal());
            
        }
        
    }
           
}
