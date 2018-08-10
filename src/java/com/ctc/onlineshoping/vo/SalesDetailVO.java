/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ctc.onlineshoping.vo;

/**
 *
 * @author Gulshan
 */
public class SalesDetailVO {
    
    private String customerid;
    private String merchantid;
    private String date;
    private double balance;

    /**
     * @return the customerid
     */
    public String getCustomerid() {
        return customerid;
    }

    /**
     * @param customerid the customerid to set
     */
    public void setCustomerid(String customerid) {
        this.customerid = customerid;
    }

    /**
     * @return the merchantid
     */
    public String getMerchantid() {
        return merchantid;
    }

    /**
     * @param merchantid the merchantid to set
     */
    public void setMerchantid(String merchantid) {
        this.merchantid = merchantid;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the balance
     */
    public double getBalance() {
        return balance;
    }

    /**
     * @param balance the balance to set
     */
    public void setBalance(double balance) {
        this.balance = balance;
    }
    
}
