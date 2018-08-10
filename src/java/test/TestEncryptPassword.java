/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import com.ctc.onlineshoping.bussineslogic.EncryptPassword;

/**
 *
 * @author Gulshan
 */
public class TestEncryptPassword {
    
    public static void main(String[] a){
        
        String password;
        EncryptPassword encrypt = new EncryptPassword();
        password = encrypt.getEncryptedPassword("gulshan");
        System.out.print(password);
                
    }
    
}
