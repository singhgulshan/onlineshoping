<%-- 
    Document   : merchantheader
    Created on : Apr 24, 2016, 11:30:39 AM
    Author     : Gulshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            ul#menu {
                     padding: 0;
                     margin-bottom: 11px;
                    }

            ul#menu li {
                        display: inline;
                        margin-right: 3px;
                       }

            ul#menu li a {
                          background-color: #ffffff;
                          padding: 10px 20px;
                          text-decoration: none;
                          color: #696969;
                          border-radius: 4px 4px 0 0;
                          font-size: 20pt;
                          font-family: Georgia;
                         }

            ul#menu li a:hover {
                                color: white;
                                background-color: black;
                               }
            .dropbtn {
                      background-color: #ffffff;
                      color: #696969;
                      padding: 9px;
                      font-size: 16px;
                      border: none;
                      cursor: pointer;
                      border-radius: 4px 4px 0 0;
                      font-size: 20pt;
                      font-family: Georgia;
                     }

            .dropdown {
                       position: relative;
                       display: inline-block;
                       z-index: 999;
                      }

            .dropdown-content {
                               display: none;
                               position: absolute;
                               background-color: #ffffff;
                               min-width: 260px;
                               box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                              }

            .dropdown-content a {
                                 color: #696969;
                                 padding: 12px 16px;
                                 text-decoration: none;
                                 display: block;
                                }       

            .dropdown-content a:hover {background-color: #f1f1f1;}

            .dropdown:hover .dropdown-content {
                                               display: block;
                                              }

            .dropdown:hover .dropbtn {
                                      color: white;
                                      background-color: black;
                                     }
                                     label{
                                         font-size: 20pt;
                                         font-weight: bold;
                                         font-family: Georgia;
                                     }
                                     .head img{
                float: right;
                width: 300px;
               height: 150px;
            }
        </style>
    </head>
    <%
        String name = (String)session.getAttribute("name");
    %>
    <body>
        <br>
        <div class="head">
            <label>Welcome <%=name%></label>
        <img src="images/mono2.png" alt="mono">
        </div>
        <br>
        <center>
        <nav>
        <ul id='menu'>
            <li><a href='merchanthome.jsp'>Home</a></li>
            <li><a href='AddProducts.jsp'>Add Products</a></li>
            <li><a href='deleteproduct.jsp'>Delete Products</a></li>
            <li><a href='merchantorderstatus.jsp'>View order</a></li>
            <li><a href='merchantaccount.jsp'>Account</a></li>
            <li><div class="dropdown">
                <button class="dropbtn">Settings</button>
                <div class="dropdown-content">
                <a href="Changemerchantpassword.jsp">Change Password</a>
                <a href="updatemerchantdetail.jsp">Update Details</a>
                <a href="merchantprofile.jsp">Profile</a>
                </div>
                </div></li>
            <li><a href='LogoutController'>Logout</a></li>
        </ul>
        </nav>
    </center>
    </body>
</html>
