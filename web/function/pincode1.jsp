<%-- 
    Document   : pincode1
    Created on : 2019/4/8, 下午 03:09:36
    Author     : Administrator
--%>
<%@page import="com.SQLCustomer"%>
<%@page import="com.sqlCreateVote"%>
<%@page import="java.sql.ResultSet"%>

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
            background-color: #cfae66;
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
            
         }
        #btout{
            position:absolute;
            top:480px;
            left:80px;
            width:130px;
            height:20px;
         }
        #p1{
            position:absolute;
            top:240px;
            left:370px;
            font-size:28px;
            color:#b49759;
            float:left;
            font-weight: bold;
            background-color: transparent;
          }
        #text1{
            position:absolute;
            top:360px;
            left:390px;
            border:2px;
            color:#b49759;
            width:80px;
            height:35px;
            padding:5px;     
            border-radius: 2px;
                      }
        #text2{
            position:absolute;
            top:300px;
            left:460px;
            border:2px;
            color:#b49759;
            width:20px;
            height:20px;
            padding:5px;
        }
        #text3{
            position:absolute;
            top:300px;
            left:530px;
            border:2px;
            color:#b49759;
            width:20px;
            height:20px;
            padding:5px;
        }
        #text4{
            position:absolute;
            top:300px;
            left:600px;
            border:2px;
            color:#b49759;
            width:20px;
            height:20px;
            padding:5px;
        }
        #btok{
            position:absolute;
            top:360px;
            left:520px;
            width:130px;
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
        <p id="p1" >Please enter the pin code.</p>
        <form method="post" action="../voteServlet">
            
            <input align="center" id="text1" type="text" maxlength="4" name="pincode" size="32" style=" color:#b49759; 
                   font-size:32px; background-color: transparent; border:3px; border-bottom-style: solid;border-top-style:
                   solid;border-left-style:solid;border-right-style:solid;">
            <input class="button" id="btok" type="submit"  value="OK">    
        </form>
    </body>
</html>

