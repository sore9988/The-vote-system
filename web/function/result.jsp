<%-- 
    Document   : result
    Created on : 2019/4/9, 上午 11:01:42
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
        /*div{
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
          }*/
         #p1{
            position:absolute;
            top:210px;
            left:340px;
            font-size:28px;
            color:#BC9C65;
            float:left;
            font-weight: bold;
            background-color: transparent;
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
       
         #myCanvas {
            position:absolute;
            top:200px;
            left:680px;
            width:100px;
            height:400px;
            border-color: #cfae66;
            border:3px;
         }
        #btchat{
            position:absolute;
            top:520px;
            left:400px;
            width:100px;
            height:20px;
         }
         #chart_div{
            width:400px;
            height:200px;
            position:absolute;
            top:200px;
            left:700px;
            font-color: white;
            font-size: 20px;
            font-weight:bold;
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
            String votename="";
            String description="";
            String optionA="";
            String optionB="";
            String optionC="";
            String optionD="";
            String endmessage="";
            try{
                endmessage=(String)session.getAttribute("END");
            }catch(Exception e){}
            int CountA=0;
            int CountB=0;
            int CountC=0;
            int CountD=0;
            int pincode=(int)session.getAttribute("PC");
            ResultSet rs=sqlCreateVote.Querypincode(pincode);
            try{while(rs.next())
            {
                votename=rs.getString("votename");
                description=rs.getString("description");
                optionA=rs.getString("optionA");
                optionB=rs.getString("optionB");
                optionC=rs.getString("optionC");
                optionD=rs.getString("optionD");
                CountA=rs.getInt("CountA");
                CountB=rs.getInt("CountB");
                CountC=rs.getInt("CountC");
                CountD=rs.getInt("CountD");
            }}catch(Exception e){}
        %>
            <%
    out.println("<script type=\"text/javascript\" src=\"https://www.gstatic.com/charts/loader.js\"></script>");
    out.println("<div id=\"chart_div\"></div>");    
    %>
    <%!
            String CImg="";
            String CMail="";
            String CName="";
        %>
        <%       
            SQLCustomer sct=null; 
            ResultSet rss=null;
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
            rss=(ResultSet)session.getAttribute("RS");
            while(rss.next())
            {
                CImg=rss.getString("imageurl");
                CMail=rss.getString("email");
                CName=rss.getString("name");
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
    <p id="p1" ><%=votename%></p>
    <p id="p2" ><%=description%></p>
    <canvas id="myCanvas" width="300" height="150" style="border:3px; color: #b49759; font-size:20px; 
            background-color:transparent; border:1px; border-bottom-style:none;border-top-style: none;
            border-left-style:solid;border-right-style:none;">
    </canvas>  
        ${END}
        <%    
        out.println("<script>"); 
 	out.println("google.charts.load('current', {packages: ['corechart', 'bar']});");
 	out.println("google.charts.setOnLoadCallback(drawBasic);");
 	out.println("function drawBasic() {");
 	out.println("var data = google.visualization.arrayToDataTable([");
 	out.println("['VoteResult', '"+votename+"',],");
 	out.println(" ['"+optionA+"', "+CountA+"],['"+optionB+"', "+CountB+"],['"+optionC+"', "+CountC+"],['"+optionD+"', "+CountD+"]]);");
 	out.println("var options = {title: 'Choice leader',chartArea: {width: '50%'},");
 	out.println(" hAxis: {title: 'Total Population',minValue: 0},");
 	out.println("vAxis: {title: 'Total votes'}};");
 	out.println("var chart = new google.visualization.BarChart(document.getElementById('chart_div'));");
 	out.println("chart.draw(data, options);}");
 	out.println("</script>");
        %>
    </body>
</html>
