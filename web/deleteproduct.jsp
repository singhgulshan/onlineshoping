<%-- 
    Document   : deleteproduct
    Created on : Apr 24, 2016, 12:12:11 PM
    Author     : Gulshan
--%>

<%@page import="com.ctc.onlineshoping.vo.ProductDetailsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ctc.onlineshoping.dao.GetProductDetailsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product</title>
        <style>
            body {
                background-image: url(images/watermark.jpg); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100%;
            }
            h1{
                font-size: 30pt;
                font-variant: small-caps; 
                text-align: center;
            }
            th{
                font-size: 20pt;
                font-variant: small-caps;
            }
            td{
                font-size: 15pt;
                font-family: Lucida Calligraphy;
                text-align: center;
            }
            .button {
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 150px;
               height: 40px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
               font-size: 15pt;
                font-family: Lucida Calligraphy;
               }

              .button span {
              cursor: pointer;
              display: inline-block;
              position: relative;
              transition: 0.5s;
              }

              .button span:after {
              content: 'x';
              position: absolute;
              opacity: 0;
              top: 0;
              right: -20px;
              transition: 0.5s;
              }

              .button:hover span {
               padding-right: 25px;
              }

              .button:hover span:after {
              opacity: 1;
              right: 0;
              }
        </style>
    </head>
    <body>
         <%
         if(session.getAttribute("username") == null){
        response.sendRedirect("home.jsp?error=fail");
        }
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
        <%@include file="merchantheader.jsp" %>
        <br>
        <%
            GetProductDetailsDAO get = new GetProductDetailsDAO();
            ArrayList<ProductDetailsVO> list = get.getDetails((String)session.getAttribute("username"));
            
            if(list.isEmpty()){
        %>
        <h1>You have not added any product....</h1>
        <%
            }
            else{
        %>
        <table align="center">
            <tr>
                <th>Sr. No.</th>
                <th width="250px">Product Details</th>
                <th>Price</th>
                <th></th>
            </tr>
            <%
                int i = 1;
                for(ProductDetailsVO product : list){
            %>
            <form action="DeleteProductController" method="post">
                <tr>
                    <td><%= i %></td>
                    <td><%= product.getProductname()%><br><%=product.getUnitquantity()+product.getUnit() %></td>
                    <td><%= product.getPrice() %><input type="hidden" name="productid" value="<%= product.getProductid() %>"></td>
                    <td><button type="submit" class="button"><span>Delete</span></button></td>
                </tr>
            </form>
                    <%
                    i++;
                }
                    %>
        </table>
        <%
            }
        %>
    </body>
</html>
