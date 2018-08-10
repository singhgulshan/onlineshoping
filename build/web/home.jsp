<%-- 
    Document   : newhome
    Created on : May 11, 2016, 9:17:21 AM
    Author     : Gulshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="ninja-slider.css" rel="stylesheet" type="text/css" />
        <script src="ninja-slider.js" type="text/javascript"></script>
        <script>
            function Logout(){
                alert("Logout Successfully...!!!");
            }
            function errorLogin(){
                alert("Session invalid Please Login to continue...!!!");
            }
        </script>
        <style>
            body {
                font: normal 0.9em Arial;
                margin:0;
            }
            a {
                color:#1155CC;
            }
            ul li {
                padding: 10px 0;
            }
            header {
                display:block;
                padding:60px 0 20px;
                text-align:center;
                position:absolute;
                top:1%;
                left:75%;
                z-index:4;
            }
            header a {
               font-family: sans-serif;
               font-size: 34px;
               line-height: 24px;
               padding: 8px 13px 7px;
               color: crimson;
               text-decoration:none;
               transition: color 0.7s;
               font-family: Lucida Calligraphy;
               font-weight: bold;
               width: 190px;
               height: 30px;
               text-align: center;
               display:inline-block;
               border-radius: 50%;
               background: activecaption;
            }
        </style>
    </head>
    <body>
        <%
            if(request.getParameter("msg") != null){
        %>
        <script>
        Logout();
            </script>
        <%
            }
            if(request.getParameter("error") != null){
        %>
        <script>
            errorLogin();
        </script>
        <%}%>
        <header>
        <a href="Login.jsp">Login</a>
        <a href="Registeration.jsp">Register</a>
    </header>
        <div id="ninja-slider">
        <div class="slider-inner">
            <ul>
                <li>
                    <a class="ns-img" href="images/slider1.jpg"></a>
                    <div class="caption">MATZ</div>
                </li>
                <li>
                    <a class="ns-img" href="images/slider2.jpg"></a>
                    <div class="caption">Market</div>
                </li>
                <li>
                    <a class="ns-img" href="images/slide3.jpg"></a>
                    <div class="caption">Analysis</div>
                </li>
                <li>
                    <a class="ns-img" href="images/slide4.jpg"></a>
                    <div class="caption">Tool</div>
                </li>
                <li>
                    <a class="ns-img" href="images/slide5.jpg"></a>
                    <div class="caption">By</div>
                </li>
                <li>
                    <a class="ns-img" href="images/slide6.jpg"></a>
                    <div class="caption">Zone</div>
                </li>
                <li>
                    <a class="ns-img" href="images/slide7.jpg"></a>
                    <div class="caption">Easy To Shop</div>
                </li>
                <li>
                    <a class="ns-img" href="images/slide8.jpg"></a>
                    <div class="caption">Easy to Find New Shop In New Place</div>
                </li>
            </ul>
            <div class="navsWrapper">
                <div id="ninja-slider-prev"></div>
                <div id="ninja-slider-next"></div>
            </div>
        </div>
    </div> 
    </body>
</html>
