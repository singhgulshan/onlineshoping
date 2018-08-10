<%-- 
    Document   : merchantaccount
    Created on : Apr 24, 2016, 2:57:11 PM
    Author     : Gulshan
--%>

<%@page import="com.ctc.onlineshoping.dao.GetCustomerDetailsDAO"%>
<%@page import="com.ctc.onlineshoping.vo.UserDetailsVO"%>
<%@page import="com.ctc.onlineshoping.vo.OrderStatusVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ctc.onlineshoping.dao.ManageAccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <script>
            function doEdit(id){
                
                var button = document.getElementById(id);
                var customer = document.getElementById('customer'+id);
                
                if(button.value == "Make Payment"){
                    button.value="Pay"; 
                    customer.innerHTML ="<input type='text' class='textbox' name='amount'>";
                }
                else{
                    button.type="submit";
                }
            }
        </script>
        <style>
            h1{
                font-variant: small-caps;
                font-size: 40pt;
                text-align: center;
            }
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
            .center{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 45%;
                   margin-left: -500px;
            }
            p{
                text-align: center;
                font-size: 15pt;
                font-family: Lucida Calligraphy;
                color: green;
                font-weight: bold;
                
            }
            h2{
                text-align: center;
                font-size: 15pt;
                font-family: Lucida Calligraphy;
                color: red;
            }
            .textbox { 
                border: 1px solid #c4c4c4; 
                height: 25px; 
                width: 150px; 
                font-size: 13px; 
                padding: 4px 4px 4px 4px; 
                border-radius: 4px; 
                -moz-border-radius: 4px; 
                -webkit-border-radius: 4px; 
                box-shadow: 0px 0px 8px #d9d9d9; 
                -moz-box-shadow: 0px 0px 8px #d9d9d9; 
                -webkit-box-shadow: 0px 0px 8px #d9d9d9; 
                font-size: 15pt;
                font-family: Lucida Calligraphy;
               } 
 
               .textbox:focus { 
                outline: none; 
                border: 1px solid #7bc1f7; 
                box-shadow: 0px 0px 8px #7bc1f7; 
                -moz-box-shadow: 0px 0px 8px #7bc1f7; 
                -webkit-box-shadow: 0px 0px 8px #7bc1f7; 
               } 
               .button {
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 190px;
               height: 40px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
               font-size: 15pt;
                font-family: Lucida Calligraphy;
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
            ManageAccountDAO manage = new ManageAccountDAO();
            ArrayList<OrderStatusVO> list = manage.merchantAccountDetail((String)session.getAttribute("username"));
            if(list.isEmpty()){
                %>
                <h1>No Pending Accounts...</h1>
        <%
            }
            else{
                if(request.getParameter("done") != null){
                %>
                
                <p>Payment Successful...</p>
                <%
                }
                if(request.getParameter("error") != null){
                %>
                <h2>Invalid Amount...</h2>
                <%}%>
                <div class="center">
                <table>
                    <tr>
                        <th width="90px">Sr. No.</th>
                        <th width="350px">Customer Name</th>
                        <th width="200px">Contact Number</th>
                        <th width="150px">Amount</th>
                    </tr>
                </table>
                <%
                int i = 1;
                for(OrderStatusVO detail : list){
                        GetCustomerDetailsDAO get = new GetCustomerDetailsDAO();
                        UserDetailsVO number = get.getDetails(detail.getCustomerid());
                   %>
                   <form action="PaymentController" method="post">
                    <table>
                        <tr>
                            <td width="90px"><%=i%></td>
                            <td width="350px"><%=detail.getCustomername()%></td>
                            <td width="200px"><%=number.getMobilenumber()%><input type="hidden" name="customerid" value="<%= detail.getCustomerid() %>"></td>
                            <td width="150px"><%=detail.getTotalamount()%></td>
                            <td id="customer<%=i%>"></td>
                            <td><input type="button" class="button" value="Make Payment" id="<%=i%>" onclick="doEdit(this.id)"></td>
                        </tr>
                    </table>
                   </form>
        <%
        i++;
                }
                
                %>
                
        <%
            }
        %>
                </div>
    </body>
</html>
