<%-- 
    Document   : Customerhome
    Created on : Apr 23, 2016, 12:22:07 PM
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
                width: 1500px;
                margin: 0 auto;
                text-align: left;
            }
            h1{
                padding: 10px 20px;
                font-size: 35pt;
                font-family: Lucida Calligraphy;
                color: crimson;
            }
            li{
                font-family: Lucida Calligraphy;
                color: limegreen;
                padding: 10px 5px;
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
        
        <%@include file="customerheader.jsp" %>
        <br>
        <div class="center">
        <h1>Welcome to <strong>MATZ</strong> (Market Analysis Tool by Zone)...</h1>
        <ul>
            <li>Start buying by just selecting the shops near you.</li>
            <li>Select your products from your local stores.</li>
            <li>Order any time and any where.</li>
            <li>Select Your type of delivery either home delivery or pickup.</li>
            <li>Select payment option by cash on delivery or personal mode.</li>
            <li>Keep track of your order and account.</li>
        </ul>
        </div>
    </body>
</html>
