<%-- 
    Document   : Viewproducts
    Created on : Apr 20, 2016, 3:16:49 PM
    Author     : Gulshan
--%>

<%@page import="com.ctc.onlineshoping.vo.ProductDetailsVO"%>
<%@page import="com.ctc.onlineshoping.dao.GetProductDetailsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Products</title>
        <style>
            .textbox:focus { 
                outline: none; 
                border: 1px solid #7bc1f7; 
                box-shadow: 0px 0px 8px #7bc1f7; 
                -moz-box-shadow: 0px 0px 8px #7bc1f7; 
                -webkit-box-shadow: 0px 0px 8px #7bc1f7; 
               } 
               .textbox { 
                border: 1px solid #c4c4c4; 
                height: 25px; 
                width: 50px; 
                font-size: 13px; 
                padding: 4px 4px 4px 4px; 
                border-radius: 4px; 
                -moz-border-radius: 4px; 
                -webkit-border-radius: 4px; 
                box-shadow: 0px 0px 8px #d9d9d9; 
                -moz-box-shadow: 0px 0px 8px #d9d9d9; 
                -webkit-box-shadow: 0px 0px 8px #d9d9d9; 
               } 
               .center{
                   width: 1000px;
                   position: relative;
                   z-index: 200;
                   left: 45%;
                   margin-left: -500px;
               }
               .button {
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 170px;
               height: 35px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
               font-family: Lucida Calligraphy;
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
            h1{
                font-size: 25pt;
                font-variant: small-caps;
                font-family: Georgia;
                text-align: center;
            }
            td{
                font-size: 20pt;
                font-family: Georgia;
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
             String shopid = (String)session.getAttribute("shopid");
             if(shopid == null){
                 %>
                 <h1>Please Select The Shop First....</h1>
        <%
             }else{
                 
                 GetProductDetailsDAO getproduct = new GetProductDetailsDAO();
                 ArrayList list = new ArrayList();
                 list = getproduct.getDetails(shopid);
                 ProductDetailsVO product = new ProductDetailsVO();%>
                 <div class="center">
                 <%
                 for (Object list1 : list) {
                     product = (ProductDetailsVO) list1;
                     %>
                     <form action="CartController" method="post">
                     <table align="center">
                         <tr>
                             <td width="200px"><img src="<%= product.getCategory() %>" alt="image"></td>
                             <td width="300px"><%=product.getProductname()%><br><%=product.getUnitquantity()%><%=product.getUnit()%></td>
                             <td width="100px"><%=product.getPrice()%></td>
                             <td><input type="text" class="textbox" name="quantity" required="required"><input type="hidden" name="action" value="add"><input type="hidden" name="productid" value="<%=product.getProductid()%>"></td>
                             <td><button class="button" type="submit" ><span>Add To Cart</span></button></td>
                         </tr>
                         </table>
                         </form>
                 <%
                 }%>
                 </div><%
             }
        %>
    </body>
</html>
