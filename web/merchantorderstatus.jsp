<%-- 
    Document   : merchantorderstatus
    Created on : Apr 24, 2016, 12:32:06 PM
    Author     : Gulshan
--%>

<%@page import="com.ctc.onlineshoping.vo.UserDetailsVO"%>
<%@page import="com.ctc.onlineshoping.dao.GetCustomerDetailsDAO"%>
<%@page import="com.ctc.onlineshoping.dao.ChangeOrderStatusDAO"%>
<%@page import="com.ctc.onlineshoping.vo.ProductDetailsVO"%>
<%@page import="com.ctc.onlineshoping.vo.OrderStatusVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ctc.onlineshoping.dao.GetOrderDetailDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <style>
            body {
                background-image: url(images/watermark.jpg); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100%;
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
            h1{
                font-variant: small-caps;
                font-size: 40pt;
                text-align: center;
            }
            .center{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 45%;
                   margin-left: -500px;
            }
            a{
                text-decoration: none;
                color: #f4511e;
            }
            .button {
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 28px;
               padding: 5px;
               width: 250px;
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
            GetOrderDetailDAO get = new GetOrderDetailDAO();
            ArrayList<OrderStatusVO> list = get.merchantOrderStatus((String)session.getAttribute("username"));
            
            if(list.isEmpty()){
        %>
        <h1>Sorry....!!</h1>
        <h1>No Order for you....</h1>
        <%
            }
            else{
        %>
        <div class="center">
        <table>
            <tr>
                <th>Sr. No.</th>
                <th width="300px">Order Placed By</th>
                <th>Order Amount</th>
                <th>Order Status</th>
                <th>View Order</th>
            </tr>
            <%
                int i = 1;
                for(OrderStatusVO status : list){
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%= status.getCustomername() %></td>
                        <td><%= status.getTotalamount() %></td>
                        <td><%if("false".equals(status.getOrderstatus())){%>Not Ready<%}else{%>Ready<%}%></td>
                        <td><a href="merchantorderstatus.jsp?orderid=<%=status.getOrderid()%>&billid=<%=status.getCustomerid()%>">View</a></td>
                    </tr>
            <%
                        i++;
                }
            %>
        </table>
        <%
            }
                String customer = request.getParameter("billid");
                GetCustomerDetailsDAO dao = new GetCustomerDetailsDAO();
                UserDetailsVO detail = dao.getDetails(customer);
            if(request.getParameter("orderid") != null){
                String orderid = request.getParameter("orderid");
               ArrayList<ProductDetailsVO> productlist = get.orderProductDetail(request.getParameter("orderid"));
                %>
                <form action="OrderStatusController" method="post">
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
                        <td colspan="4"><%= detail.getLine1()%>, <%=detail.getLine2()%><br><%= detail.getCity() %>, <%= detail.getDistrict() %>, Pin Code:<%= detail.getPincode() %></td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td colspan="4"><%= detail.getMobilenumber() %></td>
                    </tr>
                            <tr>
                                <th>Sr. No.</th>
                                <th width="300px">Product Name</th>
                                <th>Quantity</th>
                                <th width="100px">Price</th>
                                <th>Sub Total</th>
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
            }
        %>
        <tr>
                    <td></td>
                    <td></td>
                    <td><input type="hidden" name="readyid" value="<%=orderid%>"></td>
                    <td>Total</td>
                    <td><%= ordertotal %></td>
                </tr>
                <%
                ChangeOrderStatusDAO change = new ChangeOrderStatusDAO();
                boolean status = change.getOrderStaus(orderid);
                if(status){
                %>
                <tr>
                    <td></td>
                    <td></td>
                    <td><button type="submit" class="button"><span>Order Ready</span></button></td>
                    <td></td>
                    <td></td>
                </tr>
                <%}%>
                        </table>                    
                </form>
                <%
                    }
                %>
        </div>
    </body>
</html>
