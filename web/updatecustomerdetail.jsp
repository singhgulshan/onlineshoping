<%-- 
    Document   : updatecustomerdetail
    Created on : Apr 23, 2016, 8:36:17 PM
    Author     : Gulshan
--%>

<%@page import="com.ctc.onlineshoping.vo.UserDetailsVO"%>
<%@page import="com.ctc.onlineshoping.dao.GetCustomerDetailsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Details</title>
        <style>
            .center{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 55%;
                   margin-left: -500px;
            }
            font{
                  font-size: 20pt;
              }
              td{
                font-size: 20pt;
                font-variant: small-caps;
            }
            body {
                background-image: url(images/watermark.jpg); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100%;
            }
               .textbox { 
                   font-family: Lucida Calligraphy;
                   border: 1px solid #c4c4c4; 
                   height: 25px; 
                   width: 275px; 
                   font-size: 18px; 
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
               .button {
               font-family: Lucida Calligraphy;
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 180px;
               height: 40px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
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
              background: #fafafa url("images/arrow.png") no-repeat 95% 50%;
                }

              .select-style select {
                  font-size: 15pt;
                  font-family: Lucida Calligraphy;
                  padding: 5px 8px;
                  width: 130%;
                  border: none;
                  box-shadow: none;
                  background: transparent;
                  background-image: none;
                  -webkit-appearance: none;
                }

              .select-style select:focus {
              outline: none;
               }
        </style>
    </head>
    <body>
         <%
         if(session.getAttribute("username") == null){
        response.sendRedirect("home.jsp?error=fail");
        }
         else{
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
            String username = (String)session.getAttribute("username");
            GetCustomerDetailsDAO get = new GetCustomerDetailsDAO();
            UserDetailsVO detail = get.getDetails(username);
            String pstate = detail.getState();
        %>
        <%@include file="customerheader.jsp" %>
        <br>
        <br>
        <form action="UpdateCustomerDetailController" method="post">
            <div class="center">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" class="textbox" name="name" value="<%= detail.getName() %>"></td>
                </tr>
                <tr>
                    <td>Line 1</td>
                    <td><input type="text" class="textbox" name="addline1" value="<%= detail.getLine1() %>"></td>
                </tr>
                <tr>
                    <td>Line 2</td>
                    <td><input type="text" class="textbox" name="addline2" value="<%= detail.getLine2() %>"></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" class="textbox" name="City" value="<%= detail.getCity() %>"></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><input type="text" class="textbox" name="District" value="<%= detail.getDistrict() %>"></td>
                </tr>
                <tr>
                    <td>Landmark</td>
                    <td><input type="text" class="textbox" name="landmark" value="<%= detail.getLandmark() %>"></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><div class="select-style"><select name="state">
                        <option value="Andhra Pradesh" <%if(pstate.equals("Andhra Pradesh")){%>selected<%}%>>Andhra Pradesh</option>
                        <option value="Arunachal Pradesh" <%if(pstate.equals("Andhra Pradesh")){%>selected<%}%>>Arunachal Pradesh</option>
			<option value="Assam" <%if(pstate.equals("Assam")){%>selected<%}%>>Assam</option>
			<option value="Bihar" <%if(pstate.equals("Bihar")){%>selected<%}%>>Bihar</option>
			<option value="Chandigarh" <%if(pstate.equals("Chandigarh")){%>selected<%}%>>Chandigarh</option>  
                        <option value="Chhattisgarh" <%if(pstate.equals("Chhattisgarh")){%>selected<%}%>>Chhattisgarh</option>
			<option value="Delhi" <%if(pstate.equals("Delhi")){%>selected<%}%>>Delhi</option>
			<option value="Goa" <%if(pstate.equals("Goa")){%>selected<%}%>>Goa</option>
			<option value="Gujarat" <%if(pstate.equals("Gujarat")){%>selected<%}%>>Gujarat</option>
			<option value="Haryana" <%if(pstate.equals("Haryana")){%>selected<%}%>>Haryana</option>
			<option value="Himachal Pradesh" <%if(pstate.equals("Himachal Pradesh")){%>selected<%}%>>Himchal Pradesh</option>
			<option value="Jammu & Kashmir" <%if(pstate.equals("Jammu & Kashmir")){%>selected<%}%>>Jammu & Kashmir</option>
			<option value="Jharkhand" <%if(pstate.equals("Jharkhand")){%>selected<%}%>>Jharkhand</option>
			<option value="Karnataka" <%if(pstate.equals("Karnataka")){%>selected<%}%>>Karnataka</option>
			<option value="Kerala" <%if(pstate.equals("Andhra Pradesh")){%>selected<%}%>>Kerala</option>
			<option value="Madhya Pradesh" <%if(pstate.equals("Madhya Pradesh")){%>selected<%}%>>Madhya Pradesh</option>
			<option value="Maharashtra" <%if(pstate.equals("Maharashtra")){%>selected<%}%>>Maharashtra</option>
			<option value="Manipur" <%if(pstate.equals("Manipur")){%>selected<%}%>>Manipur</option>
			<option value="Meghalaya" <%if(pstate.equals("Meghalaya")){%>selected<%}%>>Meghalaya</option>
			<option value="Mizoram" <%if(pstate.equals("Mizoram")){%>selected<%}%>>Mizoram</option>
			<option value="Nagaland" <%if(pstate.equals("Nagaland")){%>selected<%}%>>Nagaland</option>
			<option value="Orrisa" <%if(pstate.equals("Orrisa")){%>selected<%}%>>Orrisa</option>
			<option value="Punjab" <%if(pstate.equals("Punjab")){%>selected<%}%>>Punjab</option>
			<option value="Rajasthan" <%if(pstate.equals("Rajasthan")){%>selected<%}%>>Rajasthan</option>
			<option value="Sikkim" <%if(pstate.equals("Sikkim")){%>selected<%}%>>Sikkim</option>
			<option value="Tamil Nadu" <%if(pstate.equals("Tamil Nadu")){%>selected<%}%>>Tamil Nadu</option>
			<option value="Telangana" <%if(pstate.equals("Telangana")){%>selected<%}%>>Telangana</option>
			<option value="Tripura" <%if(pstate.equals("Tripura")){%>selected<%}%>>Tripura</option>
			<option value="Uttar Pradesh" <%if(pstate.equals("Uttar Pradesh")){%>selected<%}%>>Uttar Pradesh</option>
			<option value="Uttarakhand" <%if(pstate.equals("Uttarakhand")){%>selected<%}%>>Uttarakhand</option>
                        <option value="West Bengal" <%if(pstate.equals("West Bengal")){%>selected<%}%>>West Bengal</option>
                            </select></div></td>
                </tr>
                <tr>
                    <td>PIN Code</td>
                    <td><input type="text" class="textbox" name="pincode" value="<%= detail.getPincode() %>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" class="textbox" name="email" value="<%= detail.getEmail() %>"></td>
                </tr>
                <tr>
                    <td>Contact Number</td>
                    <td><input type="text" class="textbox" name="contactnum" value="<%= detail.getMobilenumber() %>"></td>
                </tr>
                <tr>
                    <td><button type="submit" class="button"><span>Update</span></button></td>
                    <td><button type="reset" class="button"><span>Reset</span></button></td>
                </tr>
            </table>
                <%
                    if(request.getParameter("error") != null){
                %>
                <br>
                <br>
                <font color="red">An Error Occurred... Please Try Again</font>
                <%
                    }
         }
                %>
            </div>
        </form>
    </body>
</html>
