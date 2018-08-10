<%-- 
    Document   : customeraccount
    Created on : May 13, 2016, 8:58:43 AM
    Author     : Gulshan
--%>

<%@page import="com.ctc.onlineshoping.vo.OrderStatusVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ctc.onlineshoping.dao.ManageAccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
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
        ManageAccountDAO account = new ManageAccountDAO();
        ArrayList<OrderStatusVO> list = account.customerAccountDetail((String)session.getAttribute("username"));
        if(list.isEmpty()){
        %>
        <h1>No Pending Account...!!</h1>
        <%
        }else{%>
        <table align="center">
                        <tr>
                            <th>Sr. No.</th>
                            <th width="350px">Shop's Name</th>
                            <th>Amount</th>
                        </tr>
            <%
            int i = 1;
                for(OrderStatusVO detail : list){
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%= detail.getMerchantname() %></td>
                        <td><%= detail.getTotalamount() %></td>
                    </tr>
                    
        <%
        i++;
                }%>
                </table>
                <%
        }
        %>
    </body>
</html>
