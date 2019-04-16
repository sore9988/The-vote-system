<%-- 
    Document   : about
    Created on : 2019/4/2, 上午 10:38:55
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
         }
        #btabout{
            position:absolute;
            top:410px;
            left:80px;
            width:130px;
            height:20px;
            background-color: #cfae66;
         }
        #btout{
            position:absolute;
            top:480px;
            left:80px;
            width:130px;
            height:20px;
         }
        div{
            position:absolute;
            top:160px;
            left:320px;
            width:960px;
            height:480px;
            text-align:center;
            line-height:280px;
            font-size:20px;
            color:white;
            font-weight:bold;
            float:left;
            background-color: transparent;
          }
         #p1{
            font-weight:bold;
            font-size:42px;
            color:#b49759;
            position:absolute;
            top:180px;
            left:330px;
         }
        #p2{
            position:absolute;
            top:240px;
            left:330px;
            color:white;
            font-size: 20px;
         }
         #img1{
            position:absolute;
            top:240px;
            left:750px;
            
         }
        #img2{
            position:absolute;
            top:0px;
            left:0px;
            
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
        <div class="comments"><img id="img2" src=<%=CImg%> style="border:none" width="100" height="100" /></div>
        <Sidebar>
                <a class="button" id="bthistory" href="../function/MemberMagament.jsp" >History</a>
                <a class="button" id="btvote" href="../function/pincode1.jsp">Go to Vote</a>
                <a class="button" id="btcreate" href="../function/create.jsp">Creat a Issue</a>
                <a class="button" id="btabout" href="../function/about.jsp" >About</a>
                <a class="button" id="btout" href="../Logout">Log out</a>
        </Sidebar>
    <span id="p1">About the vote</span>
    
        <p id="p2">Because people interact frequently, the need<br> for joint decision-making is also increasing.<br>
        Based on the premise of social progress and<br> privacy, our team designed an anonymous<br> voting system.<br>
        After breaking through many difficulties and<br> team efforts, it was released in April 2019.<br></p>
        <img id="img1" src="../image/app_logo.png" width="200">
 


    </body>
</html>
