<%-- 
    Document   : customerprofile
    Created on : Apr 23, 2016, 8:16:12 PM
    Author     : Gulshan
--%>

<%@page import="java.lang.String"%>
<%@page import="com.ctc.onlineshoping.vo.UserDetailsVO"%>
<%@page import="com.ctc.onlineshoping.dao.GetCustomerDetailsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <style>
            h1{
                font-size: 30pt;
                font-variant: small-caps;
                text-align: center;
            }
            .center{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 50%;
                   margin-left: -500px;
            }
            td{
                font-family: Lucida Calligraphy;
                font-size: 20pt;
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
        <%
            GetCustomerDetailsDAO get = new GetCustomerDetailsDAO();
            UserDetailsVO detail = get.getDetails((String)session.getAttribute("username"));
        %>
        <h1>Profile</h1>
        <div class="center">
        <table>
            <tr>
                <td width="250px">Name</td>
                <td>:</td>
                <td width="800px"><%= detail.getName() %></td>
            </tr>
            <tr>
                <td>Mobile Number</td>
                <td>:</td>
                <td><%= detail.getMobilenumber() %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td>:</td>
                <td><%= detail.getEmail() %></td>
            </tr>
            <tr>
                <td>Address</td>
                <td>:</td>
                <td><%= detail.getLine1() %>, <%= detail.getLine2() %><br> <%= detail.getCity() %>, <%= detail.getDistrict() %>, <%= detail.getLandmark() %><br><%= detail.getState() %>, PIN Code - <%= detail.getPincode() %></td>
            </tr>
        </table>
        </div>
    </body>
</html>
