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
public class OrderStatusVO {
    
    private String orderid;
    private String merchantid;
    private String customerid;
    private String orderstatus;
    private String merchantname;
    private double totalamount;
    private String shopname;
    private String customername;
    

    /**
     * @return the orderid
     */
    public String getOrderid() {
        return orderid;
    }

    /**
     * @param orderid the orderid to set
     */
    public void setOrderid(String orderid) {
        this.orderid = orderid;
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
     * @return the orderstatus
     */
    public String getOrderstatus() {
        return orderstatus;
    }

    /**
     * @param orderstatus the orderstatus to set
     */
    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }

    /**
     * @return the merchantname
     */
    public String getMerchantname() {
        return merchantname;
    }

    /**
     * @param merchantname the merchantname to set
     */
    public void setMerchantname(String merchantname) {
        this.merchantname = merchantname;
    }

    /**
     * @return the totalamount
     */
    public double getTotalamount() {
        return totalamount;
    }

    /**
     * @param totalamount the totalamount to set
     */
    public void setTotalamount(double totalamount) {
        this.totalamount = totalamount;
    }

    /**
     * @return the shopname
     */
    public String getShopname() {
        return shopname;
    }

    /**
     * @param shopname the shopname to set
     */
    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    /**
     * @return the customername
     */
    public String getCustomername() {
        return customername;
    }

    /**
     * @param customername the customername to set
     */
    public void setCustomername(String customername) {
        this.customername = customername;
    }
    
}
