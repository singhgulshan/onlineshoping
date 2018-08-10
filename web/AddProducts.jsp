<%-- 
    Document   : AddProducts
    Created on : Mar 21, 2016, 3:14:54 PM
    Author     : Gulshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Products</title>
        <style> 
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
               .textbox1 { 
                border: 1px solid #c4c4c4; 
                height: 25px; 
                width: 50px; 
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
               font-size: 20px;
               width: 150px;
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
              content: '+';
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
              font-size: 10pt;
              font-family: Lucida Calligraphy;
              height: 35px;
              width: 90px;
              border-radius: 3px;
              overflow: hidden;
              background: #fafafa url("images/arrow.png") no-repeat 96% 50%;
                }

              .select-style select {
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
               .small {
                font-variant: small-caps;
                font-size: 150%;
               }
               tr:nth-child(even)
               {
                   background-color: #f2f2f2
               }
               table{
                   alignment-adjust: central
               }
               body {
                background-image: url(images/watermark.jpg); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100%;
            }
            .button1 {
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 170px;
               height: 40px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
               font-size: 15pt;
                font-family: Lucida Calligraphy;
               }

              .button1 span {
              cursor: pointer;
              display: inline-block;
              position: relative;
              transition: 0.5s;
              }

              .button1 span:after {
              content: 'x';
              position: absolute;
              opacity: 0;
              top: 0;
              right: -20px;
              transition: 0.5s;
              }

              .button1:hover span {
               padding-right: 25px;
              }

              .button1:hover span:after {
              opacity: 1;
              right: 0;
              }
              .button2 {
               border-radius: 4px;
               background-color: #f4511e;
               border: none;
               color: #FFFFFF;
               text-align: center;
               font-size: 20px;
               width: 220px;
               height: 40px;
               transition: all 0.5s;
               cursor: pointer;
               margin: 5px;
               font-size: 15pt;
                font-family: Lucida Calligraphy;
               }

              .button2 span {
              cursor: pointer;
              display: inline-block;
              position: relative;
              transition: 0.5s;
              }

              .button2 span:after {
              content: '»';
              position: absolute;
              opacity: 0;
              top: 0;
              right: -20px;
              transition: 0.5s;
              }

              .button2:hover span {
               padding-right: 25px;
              }

              .button2:hover span:after {
              opacity: 1;
              right: 0;
              }
              .center{
                   width: 1500px;
                   position: relative;
                   z-index: 200;
                   left: 60%;
                   margin-left: -500px;
            }
             .textbox2 { 
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
 
               .textbox2:focus { 
                outline: none; 
                border: 1px solid #7bc1f7; 
                box-shadow: 0px 0px 8px #7bc1f7; 
                -moz-box-shadow: 0px 0px 8px #7bc1f7; 
                -webkit-box-shadow: 0px 0px 8px #7bc1f7; 
               }   
            </style> 
        <script>
var i = 0;
function addRow()
{
    i++;
    var table = document.getElementById("mytable");
    var row = table.insertRow(i);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);

    cell1.innerHTML = i;
    cell2.innerHTML = "<input type='text' class='textbox' name='product" + i + "'/>";
    cell3.innerHTML = "<input type='text' class='textbox1' name='quantity" + i + "' /> <select class='select-style' name='unit" + i + "'><option value='Mm'>Millimeter</option><option value='Mtr'>Meter</option><option value='Ml'>Milliliter</option><option value='Ltr'>Liter</option><option value='Mg'>Milligram</option><option value='Grm'>Gram</option><option value='Kg'>Kilogram</option><option value='Pcs'>Pieces</option></select>";
    cell4.innerHTML = "<input type='text' class='textbox2' name='price" + i + "'/>";
    cell5.innerHTML = "<select class='select-style' name='category" + i + "'><option value='images/dryfruits.jpg'>Dry Fruits</option><option value='images/chocolates.jpg'>Chocolates</option><option value='images/noodles.jpg'>Noodles</option><option value='images/snacks.jpg'>Snacks</option><option value='images/ketchup.jpg'>Ketchup</option><option value='images/salt.jpg'>Salts</option><option value='images/shampoo.jpg'>Shampoo</option><option value='images/conditioner.jpg'>Conditioners</option><option value='images/bathingsoap.jpg'>Bathing Soaps</option><option value'images/bodylotion.jpg'>Body Lotions</option><option value='images/batteries.jpg'>Batteries</option><option value='images/deodorant.jpg'>Deodorants</option><option value'images/dishwash.jpg'>Dishwash</option><option value='images/facecream.jpg'>Facecreams</option><option value='images/facewash.jpg'>Facewashes</option><option value='images/hairoil.jpg'>Hair Oils</option><option value=''images/juice.jpg>Juices</option><option value='images/mouthwash.jpg'>Mouth Wash</option><option value='images/pulses.jpg'>Pulses</option><option value='images/spices.jpg'>Spices</option><option value='images/toothpaste.jpg'>Tooth Paste</option><option value='images/floorcleaner.jpg'>Floor Cleaners</option><option value='images/grains.jpg'>Grains</option><option value='images/incesstick.jpg'>Incense Sticks</option><option value='images/matchbox.jpg'>Match Boxes</option><option value='images/razor.jpg'>Razor</option><option value='images/shavingcream.jpg'>Shaving Creams</option><option value='images/shavingbrush.jpg'>Shaving Brush</option><option value='images/softdrink.jpg'>Soft Drinks</option><option value='images/toiletbrush.jpg'>Toilet Brush</option><option value='images/toiletcleaner.jpg'>Toilet Cleaners</option><option value='images/toothbrush.jpg'>Tooth Brushes</option><option value='images/washingpowder.jpg'>Washing Powders</option><option value='images/washingsoap.jpg'>Washing Soaps</option></select>";
    document.getElementById("count").value = i;
}

function deleteRow()
{
    if(i>=1){
    document.getElementById("mytable").deleteRow(i);
    i--; 
    document.getElementById("count").value = i;
    }
}

function checkProduct(){
    
    var check = true;
    if(i == 0){
        
        alert("Add Atleast 1 Product...");
        check = false;
        
    }
    return check;
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
        <br>
        <form action="AddProductController" onsubmit="return checkProduct()">
            
            <table align="center" class="small" id="mytable">
<tr>
<th>Sr. No.</th>
<th width="300px">Product Name </th>
<th>Quantity</th>
<th>Price</th>
<th width="100px">Category</th>
</tr>
<tr>
    <td></td>
    <td><button class="button" type="button" onClick="addRow();"><span>Add Item</span></button></td>
    <td></td>
    <td><button class="button1" type="button" onClick="deleteRow();"><span>Delete Item</span></button></td>
    <td></td>
</tr>
            </table>
<div class="center">
    <button class="button2" type="submit"><span>Submit Products</span></button>
    <input type ="hidden" name="index" id="count">
            </div>
</form>
    </body>
</html>
