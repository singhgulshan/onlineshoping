<%-- 
    Document   : Changemerchantpassword
    Created on : Apr 21, 2016, 11:06:20 PM
    Author     : Gulshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <style>
            body {
                background-image: url(images/watermark.jpg); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100%;
            }
               .textbox { 
                   border: 1px solid #c4c4c4; 
                   height: 25px; 
                   width: 275px; 
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
                td{
                font-size: 20pt;
                font-family: Georgia;
            }
            input[type="password"]{
                font-size: 15pt;
                font-family: Lucida Calligraphy;
                
            }
            .button {
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 230px;
               height: 40px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
               font-size: 15pt;
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
        <script>
            function checkPassword(){
                
                var pass1 = document.getElementById("pass1").value;
                var pass2 = document.getElementById("pass2").value;
                var ok = true;
                
                if(pass1 != pass2){
                    
                    alert("Password Not Matched...");
                   document.getElementById("pass1").style.borderColor = "#E34234";
                     document.getElementById("pass2").style.borderColor = "#E34234";
                    document.getElementById("pass1").focus();
                    ok = false;
                    
                }
               
             return ok;   
            }
        </script>
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
        <form action="ChangeMerchantPasswordController" method="post" onsubmit="return checkPassword()">
            <br><br>
            <center>
        <table>
            <tr>
                <td>Enter Your Old Password</td>
                <td><input type="password" class="textbox" placeholder="Enter Old Password" name="oldpassword"><%if(request.getParameter("error") != null){%><font color="red">Incorrect Password...</font><%}%></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Enter Your New Password</td>
                <td><input type="password" class="textbox" placeholder="Enter New Password" id="pass1" name="newpassword"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Retype Your New Password</td>
                <td><input type="password" class="textbox" placeholder="Retype New Password" id="pass2" name="repassword"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><button class="button" type="submit"><span>Change Password</span></button></td>
                <td><button class="button" type="reset" ><span>Reset Fields</span></button></td>
            </tr>
        </table>
            </center>
        </form>
    </body>
</html>
