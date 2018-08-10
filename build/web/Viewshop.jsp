<%-- 
    Document   : Viewshop
    Created on : Apr 14, 2016, 10:14:16 AM
    Author     : Gulshan
--%>

<%@page import="com.ctc.onlineshoping.vo.UserDetailsVO"%>
<%@page import="com.ctc.onlineshoping.dao.GetShopDetailsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shops</title>
        <style>
            h1{
                font-size: 25pt;
                font-variant: small-caps;
                font-family: Georgia;
                text-align: center;
            }
            .center{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 35%;
                   margin-left: -500px;
            }
            .button {
               font-family: Lucida Calligraphy;
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 200px;
               height: 35px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
               }

              .button span {
              cursor: pointer;
              display: inline-block;
              position: relative;
              transition: 0.5s;
              }

              .button span:after {
              content: '»';
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
              body {
                background-image: url(images/watermark.jpg); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100%;
            }
            .center th{
                font-variant: small-caps;
                font-size: 150%;
            }
            .center td{
                font-size: 13pt;
                font-family: Lucida Calligraphy;
                text-align: center;
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
        <%@include file="customerheader.jsp" %>
        <br>
        <%
            String pincode = (String)session.getAttribute("pincode");
            GetShopDetailsDAO shop = new GetShopDetailsDAO();
            UserDetailsVO[] user = shop.getDetails(pincode);
            String address;
            if(user == null){
        %>
        <h1>Sorry...!!</h1>
        <h1>No Merchant Found Near Your Zone....</h1>
        <%
            }
            else{
        %>
        <div class="center">
        <table>
            <tr>
                <th>Shop's Name</th>
                <th>Owner's Name</th>
                <th>Address</th>
                <th>Mobile Number</th>
                <th>Products</th>
            </tr>
            <%
                for(UserDetailsVO detail:user){
                    
                    address = detail.getLine1()+", "+detail.getLine2()+", "+detail.getCity()+", "+detail.getDistrict()+", "+detail.getState();
               %>  
               <form action="SetMerchantController">
               <tr>
                   <td width="200px"><%= detail.getShopname() %></td>
                   <td width="200px"><%= detail.getName() %></td>
                   <td width="500px"><%= address %><input type="hidden" name="shop" value="<%= detail.getShopname() %>"></td>
                   <td width="180px"><%= detail.getMobilenumber() %><input type="hidden" name="id" value="<%= detail.getUsername()%>"></td>
                   <td width="100px"><button type="submit" class="button"><span>View Products</span></button></td>
               </tr>
               </form>
            <%
            }
                %>
        </table>
        </div>
        <%
            }
        %>
    </body>
</html>
