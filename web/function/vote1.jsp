<%-- 
    Document   : vote1
    Created on : 2019/4/8, 下午 03:08:44
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
            position:absolute;
            top:210px;
            left:340px;
            font-size:28px;
            color:#BC9C65;
            float:left;
            font-weight: bold;
            background-color: transparent;
            white-space:normal;
            width:320px;
          }
          #p2{
            position:absolute;
            top:330px;
            left:340px;
            font-size:20px;
            color:#EEE1B3;
            float:left;
            font-weight: bold;
            background-color: transparent;
          }
        #btsub{
            position:absolute;
            top:520px;
            left:800px;
            width:150px;
            height:50px;
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
        input[type="radio"] {
            display:none;
        }
        input[type="radio"] + label {
            color:#f2f2f2;
            font-family:Arial, sans-serif;
        }
        input[type="radio"] + label span {

            display:inline-block;
            width:19px;
            height:19px;
            margin:-2px 10px 0 0;
            vertical-align:middle;
            background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -38px top no-repeat;
            cursor:pointer;
        }

        input[type="radio"]:checked + label span {
            background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -57px top no-repeat;
        }
        #l1{
            position:absolute;
            top:220px;
            left:720px;
            font-size:20px;
            color:white;
        }
        #l2{
            position:absolute;
            top:280px;
            left:720px;
            font-size:20px;
            color:white;
        }
        #l3{
            position:absolute;
            top:340px;
            left:720px;
            font-size:20px;
            color:white;
        }
        #l4{
            position:absolute;
            top:400px;
            left:720px;
            font-size:20px;
            color:white;
        }
                 #pn{
            position:absolute;
            top:5px;
            left:200px;
            font-size:52px;
            color:#b49759;
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
        #pm{
            position:absolute;
            top:105px;
            left:200px;
            font-size:20px;
            color:#738990;
            font-weight:bold;          
          }
        #img2{
            position:absolute;
            top:0px;
            left:0px;
         }
        </style>
        <%
            sqlCreateVote scv=(sqlCreateVote)session.getAttribute("SCVV");
            String votename=scv.getVotename();
            String description=scv.getDescription();
            String optionA=scv.getOptionA();
            String optionB=scv.getOptionB();
            String optionC=scv.getOptionC();
            String optionD=scv.getOptionD();
            int pincode=(int)session.getAttribute("PP");            
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
        <div class="comments"><img id="img2" src=<%=CImg%> style="border:none" width="100" height="100" /></div>
        <Sidebar>
                <a class="button" id="bthistory" href="../function/MemberMagament.jsp" >History</a>
                <a class="button" id="btvote" href="../function/pincode1.jsp">Go to Vote</a>
                <a class="button" id="btcreate" href="../function/create.jsp">Creat a Issue</a>
                <a class="button" id="btabout" href="../function/about.jsp" >About</a>
                <a class="button" id="btout" href="../Logout">Log out</a>
        </Sidebar>
    <form method="post" action="../VotehanddleServlet">
        <p id="p1" ><%=votename%></p>
        <p id="p2" ><%=description%></p>
        <canvas id="myCanvas" width="300" height="150" style="border:3px; color: #b49759; font-size:20px;
                background-color:transparent; border:1px; border-bottom-style:none;border-top-style: none;
                border-left-style:solid;border-right-style:none;">
        </canvas>
        <input type="radio" id="r1" name="Count" value="CountA" />
        <label for="r1" id="l1"><span></span><%=optionA%></label>
        <p>
        <input type="radio" id="r2" name="Count" value="CountB" />
        <label for="r2"  id="l2"><span></span><%=optionB%></label>
        <p>
        <input type="radio" id="r3" name="Count"  value="CountC"/>
        <label for="r3"  id="l3"><span></span><%=optionC%></label>
        <p>
        <input type="radio" id="r4" name="Count" value="CountD" />
        <label for="r4"  id="l4"><span></span><%=optionD%></label>
        <% out.print("<input type=\"hidden\" name=\"pincode\" value=\""+pincode+"\""); %><br>
        <input class="button" id="btsub" type="submit" value="Submit">
    </form>


    </body>
</html>

