<%-- 
    Document   : create
    Created on : 2019/4/8, 下午 03:04:42
    Author     : Administrator
--%>
<%@page import="com.SQLCustomer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sqlCreateVote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MemberMagament</title>
        <style>
          Sidebar{
            width:260px;
            float:left;
            height:800px;
            text-align:center;
            line-height:280px;
            font-size:20px;
            color:white;
            font-weight:bold;
          }
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
            font: normal normal normal 20px arial;
            color: #ffffff;
            text-decoration: none;
        }
        .button:checked {
        background-color: #cfae66;
      }
        .button:hover,
        .button:active,
        .button:focus {
            border: 3px solid #cfae66;
            color: #ffffff;
            text-decoration: none;
            background-color:#cfae66
        }        
        #bthistory{
            position:absolute;
            top:200px;
            left:80px;
            width:130px;
            height:20px;
            
         }
        #btvote{
            position:absolute;
            top:270px;
            left:80px;
            width:130px;
            height:20px;
         }
        #btcreate{
            position:absolute;
            top:340px;
            left:80px;
            width:130px;
            height:20px;
            background-color: #cfae66;
         }
        #btabout{
            position:absolute;
            top:410px;
            left:80px;
            width:130px;
            height:20px;
         }
        #btout{
            position:absolute;
            top:480px;
            left:80px;
            width:130px;
            height:20px;
         }
         #sub{
            position:absolute;
            top:220px;
            left:330px;
         }
         #desc{
            position:absolute;
            top:310px;
            left:330px;
         }
         #pt1{
            position:absolute;
            top:500px;
            left:330px;
            color:white;
            font-size: 24px;
         }
        #pt2{
            position:absolute;
            top:500px;
            left:540px;
            color:white;
            font-size: 24px;
         }
         #limite{
            position:absolute;
            top:520px;
            left:480px;
            width:40px;
            height:20px;
            padding: 4px;
            font-size: 32px;
            color:#b49759;
         }
        #myCanvas {
            position:absolute;
            top:200px;
            left:680px;
            width:100px;
            height:400px;
            border-color: #cfae66;
            border:3px;
         }
         #opa{
            position:absolute;
            top:220px;
            left:740px;
         }
        #opb{
            position:absolute;
            top:300px;
            left:740px;
         }
        #opc{
            position:absolute;
            top:380px;
            left:740px;
         }
        #opd{
            position:absolute;
            top:460px;
            left:740px;
         }
         #btok{
            position:absolute;
            top:540px;
            left:810px;
            width:150px;
            height:50px;
         }
                  #pn{
            position:absolute;
            top:5px;
            left:200px;
            font-size:52px;
            color:#b49759;
            font-weight:bold;          
          }
        #pm{
            position:absolute;
            top:105px;
            left:200px;
            font-size:20px;
            color:#738990;
            font-weight:bold;          
          }
          .comments{
             position:absolute;
            top:50px;
            left:65px;
                width:100px;
                height:100px;
                
                
                border: 2px solid #b49759;
                
            }
        </style>
        <%!
            String CImg="";
            String CMail="";
            String CName="";
        %>
        <%       
            SQLCustomer sct=null; 
            ResultSet rs=null;
            if(session.getAttribute("SA") !=null)
            {
            sct=(SQLCustomer)session.getAttribute("SA");
            try{
                CImg=sct.getImageurl().replace("C:/android/code/CodeAdventure/web/function/", "").trim();
            }catch(Exception e){
                CImg=sct.getImageurl().trim();
            }
            CMail=sct.getEmail();
            CName=sct.getName();
            }
            else if(session.getAttribute("RS") !=null)
            {
            rs=(ResultSet)session.getAttribute("RS");
            while(rs.next())
            {
                CImg=rs.getString("imageurl");
                CMail=rs.getString("email");
                CName=rs.getString("name");
            }}
        %>
    </head>
    <body>
        <script src="https://aiax.googleapis.com/aiax/libs/jquery/3.3.1/jquery.min.js"></script>
<p id="pn"><%out.println(CName);%></p>
        <p id="pm"><%out.println(CMail);%></p>
        <div class="comments"><img src=<%=CImg%> style="border:none" width="100" height="100" /></div>
        <Sidebar>
                <a class="button" id="bthistory" href="../function/MemberMagament.jsp" >History</a>
                <a class="button" id="btvote" href="../function/pincode1.jsp">Go to Vote</a>
                <a class="button" id="btcreate" href="../function/create.jsp">Creat a Issue</a>
                <a class="button" id="btabout" href="../function/about.jsp" >About</a>
                <a class="button" id="btout" href="../Logout">Log out</a>
        </Sidebar>
    
            <canvas id="myCanvas" width="300" height="150" style="border:3px; color: #b49759; font-size:20px; background-color:transparent; border:1px; border-bottom-style:none;border-top-style: none;border-left-style:solid;border-right-style:none;">
        </canvas>
         <form method="post" action="../createServlet">
            <input id="sub" type="text" width="320px" name="votename" size="23" value="Enter your subject" style=" color:#b49759; font-size:24px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
           <textarea id="desc" name="description" style="overflow:hidden; color:#b49759; font-size:18px; background-color: transparent; border:1px solid; "
                     rows="8" cols="30">Describe your subject....</textarea> 
               
            <p id="pt1">Limited Time:</p>
            <input align="center" id="limite" value="3" type="number" maxlength="2" name="timeout" size="32" style=" color:#b49759; font-size:24px;
                    background-color: transparent; border:3px; border-bottom-style: solid;border-top-style: solid;border-left-style:solid;border-right-style:solid;">
            <p id="pt2">min</p>
            
            <input id="opa" type="text" name="optionA" size="20" value="Option A" style=" color:#b49759; font-size:24px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input id="opb" type="text" name="optionB" size="20" value="Option B" style=" color:#b49759; font-size:24px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input id="opc" type="text" name="optionC" size="20" value="Option C" style=" color:#b49759; font-size:24px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input id="opd" type="text" name="optionD" size="20" value="Option D" style=" color:#b49759; font-size:24px;
                    background-color: transparent; border:1px; border-bottom-style: solid;border-top-style: none;border-left-style:none;border-right-style:none;">
            <input class="button" id="btok" type="submit" value="Submit">
        </form>
             <script language="JavaScript">
                function ShowTime(){
                  var NowDate=new Date();
                  var y=NowDate.getFullYear();
                  var mon=NowDate.getMonth();
                  var d=NowDate.getDate();
                  var h=NowDate.getHours();
                  var m=NowDate.getMinutes();
                  document.getElementById('showbox').innerHTML = y+'年'+mon+'月'+d+'日'+h+'時'+m+'分';
                  setTimeout('ShowTime()',1000);
                }
         </script>
    </body>
</html>

