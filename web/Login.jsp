<%-- 
    Document   : Login
    Created on : Apr 21, 2016, 12:36:48 PM
    Author     : Gulshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            .head img{
                float: left;
                width: 200px;
               height: 200px;
            }
            
            .head h1{
                position: relative;
                top: 18px;
                left: 600px;
                font-family: Lucida Calligraphy;
                font-size: 33pt;
                color: crimson;
            }
            
            td{
                font-size: 20pt;
                font-variant: small-caps;
                font-family: Georgia;
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
               
               body {
                background-image: url(images/watermark.jpg); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100%;
            }
            
            .button {
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 28px;
               padding: 5px;
               width: 150px;
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
              
              .select-style {
              border: 1px solid #ccc;
              height: 35px;
              width: 283px;
              border-radius: 3px;
              overflow: hidden;
              background: #fafafa;
              background: #fafafa url("images/arrow.png") no-repeat 96% 50%;
                }

              .select-style select {
                  font-size: 15pt;
                  font-family: Lucida Calligraphy;
                  padding: 5px 8px;
                  width: 100%;
                  border: none;
                  box-shadow: none;
                  background: transparent;
                  background-image: none;
                  -webkit-appearance: none;
                }

              .select-style select:focus {
              outline: none;
               }
               input[type="text"]{
                font-size: 15pt;
                font-family: Lucida Calligraphy;
            }
            
            input[type="password"]{
                font-size: 15pt;
                font-family: Lucida Calligraphy;
                
            }
            font{
                font-size: 20pt;
                alignment-adjust: auto;
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="head">
        <img src="images/mono1.png" alt="mono">
        <br>
        <br>
        <h1>User Login</h1>
        </div>
        <br>
        <br>
        <br>
        <br>
        <form action="LoginController" method="post">
            <center>
            <table>
                <tr>
                    <td>Select User Type</td>
                    <td>
                        <div class="select-style">
                        <select name="usertype">
                            <option value="customer">Customer</option>
                            <option value="merchant">Merchant</option>
                        </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" placeholder="Enter User Name" class="textbox" name="username"></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" placeholder="Enter Password" class="textbox" name="password"></td>
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
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td><button class="button" type="submit"><span>Login</span></button></td>
                    <td><button class="button" type="reset"><span>Reset</span></button></td>
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
                    <td colspan="2"><%if(request.getParameter("error") != null){%><font>Invalid Username Or Password...</font><%}%></td>
                </tr>
            </table>
            </center>
        </form>
    </body>
</html>
