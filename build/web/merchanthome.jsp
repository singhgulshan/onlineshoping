<%-- 
    Document   : merchanthome
    Created on : Apr 24, 2016, 10:58:45 AM
    Author     : Gulshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>
            .center{
                width: 1200px;
                margin: 0 auto;
                text-align: left;
            }
            h1{
                padding: 10px 20px;
                font-size: 40pt;
                font-family: Lucida Calligraphy;
                color: crimson;
            }
            li{
                font-family: Lucida Calligraphy;
                color: limegreen;
                padding: 20px 5px;
                font-size: 23pt;
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
        <%@include file="merchantheader.jsp" %>
        
        <div class="center">
        <h1>Welcome to <strong>MATZ</strong> (Market Analysis Tool by Zone)...</h1>
        <ul>
            <li>Start your business by just adding your products.</li>
            <li>Give boost to your business.</li>
            <li>Easy to maintain your accounts and customers.</li>
            <li>Add new product or delete old product any time any where.</li>
            <li>Just change your shop address and no need to advertise user get your new location automatically.</li>
            <li>Keep track of your order and account.</li>
        </ul>
        </div>
    </body>
</html>
