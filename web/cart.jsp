<%-- 
    Document   : cart
    Created on : Apr 20, 2016, 11:20:40 PM
    Author     : Gulshan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.ctc.onlineshoping.vo.ProductDetailsVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function doEdit(id){
                
                var button = document.getElementById(id);
                var quantity = document.getElementById('e'+id);
                
                if(button.value == "Edit"){
                    button.value="Update"; 
                    quantity.innerHTML ="<input type='text' class='textbox' name='quantity'>";
                }
                else{
                    button.type="submit";
                }
            }
        </script>
        <style>
            .center{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 60%;
                   margin-left: -500px;
            }
            .center h1{
                font-size: 25pt;
                font-variant: small-caps;
                font-family: Georgia;
            }
            .center img{
                width: 200px;
               height: 200px;
            }
            .tablecenter{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 45%;
                   margin-left: -500px; 
            }
            td{
                font-size: 15pt;
                font-family: Lucida Calligraphy;
                text-align: center;
            }
            .button {
               font-family: Lucida Calligraphy;
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 140px;
               height: 35px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
               }
               th{
                  font-size: 15pt;
                  font-variant: small-caps;
               }
               .button1 {
               font-family: Lucida Calligraphy;
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
               }
               .button1 span {
              cursor: pointer;
              display: inline-block;
              position: relative;
              transition: 0.5s;
              }

              .button1 span:after {
              content: '»';
              position: absolute;
              opacity: 0;
              top: 0;
              right: -20px;
              transition: 0.5s;
              }

              .button1:hover span {
               padding-right: 25px;
              }

              .button1:hover span:after {
              opacity: 1;
              right: 0;
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
 
               .textbox:focus { 
                outline: none; 
                border: 1px solid #7bc1f7; 
                box-shadow: 0px 0px 8px #7bc1f7; 
                -moz-box-shadow: 0px 0px 8px #7bc1f7; 
                -webkit-box-shadow: 0px 0px 8px #7bc1f7; 
               } 
               body {
                background-image: url(images/watermark.jpg); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100%;
            }
        </style>
    </head>
    <body>
         <%
         if(session.getAttribute("username") == null){
        response.sendRedirect("home.jsp?error=fail");
        }
         else{
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
        <%@include file="customerheader.jsp" %>
        <br>
        <br>
        <%
            ArrayList<ProductDetailsVO> list = (ArrayList<ProductDetailsVO>)session.getAttribute("cart");
            if(list.isEmpty()){
                %>
                <br>
                <br>
                <br>
                <br>
                <div class="center">
                <h1>Your Cart Is Empty....</h1>
                <img src="images/cart.png" alt="Cart">
                </div>
        <%
            }
            else{
            ProductDetailsVO product = new ProductDetailsVO();
            double total = (Double)session.getAttribute("ordertotal");
                    %>
                    <div class="tablecenter">
                        <table>
                            <tr>
                                <th width="80px">Sr. No.</th>
                                <th width="300px">Product</th>
                                <th width="80px">Quantity</th>
                                <th width="150px">Price</th>
                                <th width="150px">Edit</th>
                                <th width="150px">Delete</th>
                            </tr>
                        </table>
                        <%
            for(int i = 0 ; i < list.size() ; i++){
                product = list.get(i);
                %>
                <form action="CartController" method="post">
                <table>
                <tr>
                    <td width="80px"><%= i+1 %></td>
                    <td width="300px"><%= product.getProductname() %><br><%= product.getUnitquantity() %><%= product.getUnit() %></td>
                    <td width="80px" id="e<%=i+1%>"><%= product.getQuantity() %></td>
                    <td width="150px"><%= product.getTotal() %><input type="hidden" name="index" value="<%=i%>"></td>
                    <td width="120px"><input type="button" class="button" name="action" id="<%=i+1%>" value="Edit" onclick="doEdit(this.id)"></td>
                    <td width="120px"><input type="submit" class="button" name="action" value="Delete"></td>
                </tr>
                </table>
                </form>
                
        <%
            }
            %>
            <form action="OrderController" method="get">
            <table >
            <tr>
                <td width="80px"></td>
                <td width="180px"></td>
                <td width="200px">Total Price</td>
                <td width="150px"><%= total %></td>
                <td width="120px"></td>
                <td width="120px"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><button type="submit" class="button1"><span>Place Order</span></button></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </table>
                <%
                if(request.getParameter("msg") != null){
                %>
                <font color="red">An Error Occurred...</font>
                <%
                }
                %>
            </form>
                    </div>
                
                <%
            }
         }
        %>
    </body>
</html>
