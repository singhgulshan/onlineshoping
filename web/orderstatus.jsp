<%-- 
    Document   : orderstatus
    Created on : Apr 23, 2016, 2:40:28 PM
    Author     : Gulshan
--%>

<%@page import="com.ctc.onlineshoping.vo.UserDetailsVO"%>
<%@page import="com.ctc.onlineshoping.dao.GetMerchantDetailsDAO"%>
<%@page import="com.ctc.onlineshoping.vo.ProductDetailsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ctc.onlineshoping.vo.OrderStatusVO"%>
<%@page import="com.ctc.onlineshoping.dao.GetOrderDetailDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Status</title>
        <style>
            h1{
                font-variant: small-caps;
                font-size: 20pt;
                text-align: center
            }
            h2{
                font-variant: small-caps;
                font-size: 15pt;
                text-align: center
            }
            .center{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 45%;
                   margin-left: -500px;
            }
            th{
                font-size: 18pt;
                font-variant: small-caps;
            }
            td{
                font-size: 15pt;
                font-family: Lucida Calligraphy;
                text-align: center;
            }
            a{
                text-decoration: none;
                color: #f4511e;
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
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
        <%@include file="customerheader.jsp" %>
        <br>
        <%
            String username = (String)session.getAttribute("username");
            GetOrderDetailDAO get = new GetOrderDetailDAO();
            ArrayList<OrderStatusVO> list = get.customerOrderStatus(username);
            
            if(list.isEmpty()){
        %>
        <br>
        <br>
        <h1>No Order Placed Yet....</h1>
        <h2>Place an Order To View Status...</h2>
        <%
            }
            else{
                %>
                <div class="center">
                <table>
                    <tr>
                        <th>Sr. No.</th>
                        <th width="400px">Order Placed To</th>
                        <th>Order Amount</th>
                        <th width="200px">Order Status</th>
                        <th>View order</th>
                    </tr>
                    <%
                       int i = 1;
                       for(OrderStatusVO status : list){ 
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%= status.getShopname() %></td>
                        <td><%= status.getTotalamount() %></td>
                        <td><%if("false".equals(status.getOrderstatus())){%>Not Ready<%}else{%>Ready<%}%></td>
                        <td><a href="orderstatus.jsp?orderid=<%= status.getOrderid() %>&billid=<%= status.getMerchantid() %>">View</a></td>
                    </tr>
                    <%
                        i++;
                       }
            }
                    %>
                </table>
                <%
            GetMerchantDetailsDAO dao = new GetMerchantDetailsDAO();
            String merchant = request.getParameter("billid");
            UserDetailsVO detail = dao.getDetails(merchant);
                    if(request.getParameter("orderid") != null){
                        ArrayList<ProductDetailsVO> productlist = get.orderProductDetail(request.getParameter("orderid"));
                        %>
                        <br>
                        <br>
                        <table>
                            <tr>
                                <th colspan="5">Order Details</th>  
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td colspan="4"><%= detail.getName() %></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td colspan="4"><%= detail.getLine1()%>, <%= detail.getLine2() %><br><%= detail.getCity() %>, <%= detail.getDistrict() %>, PIN Code:<%= detail.getPincode() %> </td>
                            </tr>
                            <tr>
                                <td>Mobile</td>
                                <td colspan="4"><%= detail.getMobilenumber() %></td>
                            </tr>
                            <tr>
                                <th>Sr. No.</th>
                                <th width="350px">Product Name</th>
                                <th>Quantity</th>
                                <th width="150px">Price</th>
                                <th width="150px">Sub Total</th>
                            </tr>
                        <%
                        int i =1;
                        double ordertotal = 0;
                        for(ProductDetailsVO product : productlist){
                            ordertotal += product.getTotal();
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%= product.getProductname() %></td>
                    <td><%= product.getQuantity() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getTotal() %></td>
                </tr>
                <%
                i++;
                        }
                %>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>Total</td>
                    <td><%= ordertotal %></td>
                </tr>
                
                        </table>
                <%
                    }
                %>
                </div>
    </body>
</html>
