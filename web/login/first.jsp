<%-- 
    Document   : first
    Created on : 2019/4/2, 上午 11:05:21
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Let's Vote</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
              crossorigin="anonymous">
        <style>
	body {
	height:100vh;
	background-image: url('../image/first.jpg');
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
         #btfb{
            position:absolute;
            top:340px;
            left:240px;
            width:320px;
            height:30px;
         }
         #btsign{
            position:absolute;
            top:420px;
            left:240px;
            width:130px;
            height:30px;
         }
        #btlogin{
            position:absolute;
            top:420px;
            left:430px;
            width:130px;
            height:30px;
         }
        #ii{
            position:absolute;
            top:390px;
            left:1360px;
            background-size: 100% 100%;
            opacity:0.5;
         }
        </style>
    </head>
    <body>
            <a class="button" id="btfb" href="#">Log In with facebook</a>
            <a class="button" id="btsign" href="signup.jsp">Sign Up</a>
            <a class="button" id="btlogin" href="login.jsp">Login In</a>
            <a id="ii" class="fas fa-angle-double-right" href="concept.jsp" style="font-size:48px;color:#b49759;"></a>
    </body>
</html>
