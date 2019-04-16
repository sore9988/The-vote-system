<%-- 
    Document   : signup
    Created on : 2019/4/2, 上午 10:06:53
    Author     : Administrator
--%>
<%@page import="com.SQLCustomer"%>

<%@ page language="java" contentType="text/html; charset=utf-8" import="com.SQLCustomer"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
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
         #name{
            position:absolute;
            top:220px;
            left:400px;
         }
        #email{
            position:absolute;
            top:300px;
            left:400px;
         }
        #password{
            position:absolute;
            top:380px;
            left:400px;
         }
        #recheckpw{
            position:absolute;
            top:460px;
            left:400px;
         }
        #pe{
            font-weight:bold;
            font-size:18px;
            color:#b49759;
            position:absolute;
            top:490px;
            left:400px;
         }
        #topic{
            font-weight:bold;
            font-size:68px;
            color:#b49759;
            position:absolute;
            top:80px;
            left:120px;
         }
        #btok{
            position:absolute;
            top:540px;
            left:600px;
            width:180px;
            height:57px;
         }
        #btback{
            position:absolute;
            top:540px;
            left:400px;
            width:130px;
            height:30px;
         }
        #previewimg{
            position:absolute;
            top:240px;
            left:100px;
         }
        #f1{
            position:absolute;
            top:440px;
            left:100px;
         }
         #i1{
            position:absolute;
            top:360px;
            left:130px;             
         }
        </style>
    </head>
    <body>
       <script src="https://aiax.googleapis.com/aiax/libs/jquery/3.3.1/jquery.min.js"></script>
        <span id="topic">Sign up</span>
        <form method="post" enctype="multipart/form-data" action="../registered">
            <label id="i1" class="btn btn-info" >
            <input  style="display:none;"  type="file" name="photo" onchange="readURL(this)" targetID="previewimg"/><br><br>
            <i id="f1" class="fas fa-cloud" ></i><p style=" color:#b49759; font-size:28px">upload photo</p>
            </label>
            <img id="previewimg" src="../image/qq.jpg" width="205" height="177"/><br></p>

            <input id="name" type="text" name="name" size="23" value="Name" style=" color:#b49759; font-size:28px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input id="email" type="text" name="email" size="23" value="Email" style=" color:#b49759; font-size:28px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input id="password" type="password" size="23" name="password" value="s1234567" style=" color:#b49759; font-size:28px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input id="recheckpw" type="password" size="23" name="recheckpw" value="s1234567" style=" color:#b49759; font-size:28px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <a class="button" id="btback" href="first.jsp">Back</a>
            <input class="button" id="btok" type="submit" value="OK">
        </form>
        <script>
        function readURL(input){

          if(input.files && input.files[0]){
            var imageTagID = input.getAttribute("targetID");
            var reader = new FileReader();
            reader.onload = function (e) {
               var img = document.getElementById(imageTagID);
               img.setAttribute("src", e.target.result)
            }
            reader.readAsDataURL(input.files[0]);
          }
        }
        </script>
        <p id="pe">${ER}</p>
        
    </body>
</html>
