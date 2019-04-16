<%-- 
    Document   : login
    Created on : 2019/4/1, 下午 02:21:56
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Let's Vote</title>
        <style>
	body {
	height:100vh;
	background-image: url('../image/home.jpg');
	background-repeat:no-repeat;
	background-size:cover;
	 }
        .button {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            padding: 12px 24px;
            background-color: transparent;
            border: 2px solid #b49759;
            border-radius: 4px;
            font: normal normal normal 24px arial;
            color: #ffffff;
            text-decoration: none;
        }
        .button:hover,
        .button:active,
        .button:focus {
            border: 3px solid #cfae66;
            color: #ffffff;
            text-decoration: none;
            background-color: #cfae66;
        }
        #btok{
            position:absolute;
            top:520px;
            left:440px;
            width:180px;
            height:57px;
         }
        #btback{
            position:absolute;
            top:520px;
            left:240px;
            width:130px;
            height:30px;
         }
        #name{
            position:absolute;
            top:270px;
            left:240px;
         }
         
        #email{
            position:absolute;
            top:350px;
            left:240px;
         }
        #password{
            position:absolute;
            top:430px;
            left:240px;
         }
        #topic{
            font-weight:bold;
            font-size:68px;
            color:#b49759;
            position:absolute;
            top:80px;
            left:120px;
         }
         #pe{
            font-weight:bold;
            font-size:20px;
            color:#b49759;
            position:absolute;
            top:460px;
            left:240px;
         }
        </style>
    </head>
    <body>
        <script src="https://aiax.googleapis.com/aiax/libs/jquery/3.3.1/jquery.min.js"></script>
        <span id="topic">Log In</span>
        <form method="post" action="../Login">
            <input id="name" type="text" name="name" size="23" value="Name" style=" color:#b49759; font-size:28px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input id="email" type="text" name="email" size="23" value="Email" style=" color:#b49759; font-size:28px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input id="password" type="password" size="23" name="password" value="s1234567" style=" color:#b49759; font-size:28px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <a class="button" id="btback" href="first.jsp">Back</a>
            <input class="button" id="btok" type="submit" value="OK">
        </form>
        <p id="pe">${E}</p>
        
    </body>
</html>
