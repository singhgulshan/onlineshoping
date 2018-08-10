<%-- 
    Document   : MerchantRegistration
    Created on : Apr 4, 2016, 11:35:26 AM
    Author     : Gulshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
               .textbox1 { 
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
 
               .textbox1:focus { 
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
               font-size: 28px;
               padding: 5px;
               width: 170px;
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
              background: #fafafa url("images/arrow.png") no-repeat 96% 50%;
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
               .status{
                font-family:verdana;
                font-size:12px;
            }
            .uname{
                color:blue;
            }
            
            td{
                font-size: 20pt;
                font-family: Georgia;
            }
            h1{
                font-size: 30pt;
                font-variant: small-caps;
                font-family: Georgia;
            }
            
            input[type="text"]{
                font-size: 15pt;
                font-family: Lucida Calligraphy;
            }
            
            input[type="password"]{
                font-size: 15pt;
                font-family: Lucida Calligraphy;
            }
            
            a{
                text-decoration: none;
                color: #f4511e;
            }
 </style> 
 <script src="jquery.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".textbox1").change(function(){
                    var uname = $(this).val();
                    if(uname.length > 4){
                        $(".status").html("<img src='images/loading.gif'><font color=gray> Checking availability...</font>");
                         $.ajax({
                            type: "POST",
                            url: "CheckMerchantUsernameController",
                            data: "uname="+ uname,
                            success: function(msg){

                                $(".status").ajaxComplete(function(event, request, settings){
                                     
                                    $(".status").html(msg);

                                });
                            }
                        }); 
                    }
                    else{
                         
                        $(".status").html("<font color=red>Username should be greater than <b>4</b> characters</font>");
                    }
                    
                });
            });
            
            
            function checkPassword(){
                
                var pass1 = document.getElementById("pass1").value;
                var pass2 = document.getElementById("pass2").value;
                var ok = true;
                
                if(pass1 !== pass2){
                    
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
         <form action="MerchantDetailController" method="post" onsubmit="return checkPassword()" >
                   <h1 style="text-align:center">Merchant Registration</h1>
                   <center>
         <table>
           <tr>
                     <td>Username</td>
                     <td><input id="username" class="textbox1" type="text" placeholder="Enter Your Username" name="username"><span class="status"></span></td>
            </tr>

            <tr>
                      <td>Password</td>
                      <td><input class="textbox" id="pass1" type="password" placeholder="Type Your Password" name="password"></td>
            </tr>

              <tr>
                      <td>Confirm Password</td>
                      <td><input class="textbox" id="pass2" type="password" placeholder="Retype Your Password" name="repassword"></td>
             </tr>
             <tr>
                      <td>Shop's Name</td>
                      <td><input class="textbox" type="text" placeholder="Enter Your Shop's Name" name="shopname"></td>
             </tr>
             <tr>
	      <td>Owner's Name</td>
              <td><input class="textbox" placeholder="Enter Your Full Name" type="text" name="ownername"></td>
             </tr>

             <tr> 
                 <td>Address Line1</td>
                 <td><input class="textbox" placeholder="Enter Address Line 1" type="text" name="addline1"></td>
             </tr>

             <tr>
	<td>Address Line2</td>
        <td><input class="textbox" type="text" placeholder="Enter Address Line 2" name="addline2"></td>
             </tr>

              <tr>
                      <td>City</td>
                      <td><input class="textbox" placeholder="Enter Your City" type="text" name="City"></td>
                </tr>
                <tr>
                 <td>District</td>
                 <td><input class="textbox" type="text" placeholder="Enter Your District" name="District"></td>
             </tr>

             <tr>
	 <td>Landmark</td>
         <td><input class="textbox" placeholder="Enter Your Landmark" type="text" name="landmark"></td>
             </tr>
           
              <tr>
	<td>State</td>
        <td><div class="select-style"><select name="state">
	<option value="Andhra Pradesh">Andhra Pradesh</option>
	<option value="Arunachal Pradesh">Arunachal Pradesh</option>
	<option value="Assam">Assam</option>
	<option value="Bihar">Bihar</option>
	<option value="Chandigarh">Chandigarh</option>
	<option value="Chhattisgarh">Chhattisgarh</option>
        <option value="Delhi">Delhi</option>
        <option value="Goa">Goa</option>
	<option value="Gujarat">Gujarat</option>
	<option value="Haryana">Haryana</option>
	<option value="Himachal Pradesh">Himchal Pradesh</option>
	<option value="Jammu & Kashmir">Jammu & Kashmir</option>
	<option value="Jharkhand">Jharkhand</option>
	<option value="Karnataka">Karnataka</option>
	<option value="Kerala">Kerala</option>
	<option value="Madhya Pradesh">Madhya Pradesh</option>
	<option value="Maharashtra">Maharashtra</option>
	<option value="Manipur">Manipur</option>
	<option value="Meghalaya">Meghalaya</option>
	<option value="Mizoram">Mizoram</option>
	<option value="Nagaland">Nagaland</option>
	<option value="Orrisa">Orrisa</option>
	<option value="Punjab">Punjab</option>
	<option value="Rajasthan">Rajasthan</option>
	<option value="Sikkim">Sikkim</option>
	<option value="Tamil Nadu">Tamil Nadu</option>
	<option value="Telangana">Telangana</option>
	<option value="Tripura">Tripura</option>
	<option value="Uttar Pradesh">Uttar Pradesh</option>
	<option value="Uttarakhand">Uttarakhand</option>
	<option value="West Bengal">West Bengal</option>
                    </select>
            </div>
	  </td>
	</tr>

                 <tr>
                     <td>Pincode</td>
                     <td><input class="textbox" placeholder="Enter Your Pincode" type="text" name="pincode"></td>
                </tr>

                <tr>
                   <td>E-mail</td>
                   <td><input class="textbox" placeholder="Enter Your Email" type="text" name="email"></td>
                </tr>

               <tr>
	 <td>Contact number</td>
         <td><input class="textbox" placeholder="Enter Your Contact Number" type="text" name="contactnum"></td>
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
                   <td></td>
                   <td></td>
               </tr>
              <tr>
                   <td><button class="button" type="submit" value="Submit"><span>Register</span></button></td>
                   <td><a href="Login.jsp">Already Registered</a></td>
               </tr>
               </table>
                   </center>
        </form>
    </body>
</html>
