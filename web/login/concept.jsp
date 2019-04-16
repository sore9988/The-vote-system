<%-- 
    Document   : concept
    Created on : 2019/4/9, 下午 05:18:02
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
	background-image: url('../image/web_concep.jpg');
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
        #btback{
            position:absolute;
            top:580px;
            left:1140px;
            width:130px;
            height:30px;
         }       
        </style>
    </head>
    <body>
            <a class="button" id="btback" href="first.jsp">Back</a>
    </body>
</html>

