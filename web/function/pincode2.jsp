<%-- 
    Document   : pincode2
    Created on : 2019/4/9, 下午 03:46:58
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
        #p1{
            position:absolute;
            top:140px;
            left:390px;
            font-size:28px;
            color:#b49759;
            float:left;
            background-color: transparent;
            font-weight: bold;
          }
        #p2{
            position:absolute;
            top:190px;
            left:390px;
            font-size:24px;
            color:#D0B982;
            float:left;
            background-color: transparent;
            white-space:normal;
            width:300px;
          }
        #p3{
            position:absolute;
            top:240px;
            left:390px;
            font-size:24px;
            color:#CCB276;
            float:left;
            background-color: transparent;
          } 
          #p4{
            position:absolute;
            top:370px;
            left:390px;
            font-size:18px;
            color:white;
            float:left;
            background-color: transparent;
          }
        #text1{
            position:absolute;
            top:300px;
            left:400px;
            border:2px;
            color:#b49759;
            width:20px;
            height:20px;            
          }
        #text2{
            position:absolute;
            top:300px;
            left:470px;
            border:2px;
            color:#b49759;
            width:20px;
            height:20px;
        }
        #text3{
            position:absolute;
            top:300px;
            left:540px;
            border:2px;
            color:#b49759;
            width:20px;
            height:20px;
        }
        #text4{
            position:absolute;
            top:300px;
            left:610px;
            border:2px;
            color:#b49759;
            width:20px;
            height:20px;
        }
        #btok{
            position:absolute;
            top:480px;
            left:420px;
            width:140px;
            height:20px;
        }
        #pin{
            position:absolute;
            top:240px;
            left:460px;
            font-size:28px;
            color:#b49759;
            float:left;
            background-color: transparent;
            font-weight: bold;
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
        <%
            sqlCreateVote scv=(sqlCreateVote)session.getAttribute("SC");
            String s=String.format("%04d",scv.getPincode());
        %>
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
    
        <p id="p1" >Your pincode is ...<%=s%></p>
        <p id="p2" ><%=scv.getVotename() %><br></p>
        <p id="p3">
        A.<%=scv.getOptionA() %><br>
        B.<%=scv.getOptionB() %><br>
        C.<%=scv.getOptionC() %><br>
        D.<%=scv.getOptionD() %><br><br>
        </p>
        <p id="p4">
        Create time: &nbsp; ${TIME.getHour()} : ${TIME.getMinute()} : ${TIME.getSecond()}<br>
        Total time: ${ETIME}min<br>
        </p>
        <form action="../voteServlet" method="post"><input id="pin" type="hidden" name="pincode" value="<%=s%>">
            <a id="btok" class="button" type="submit" href="pincode1.jsp" value="">START VOTE</a></form>
    </body>
</html>
