<%-- 
    Document   : HistoryList
    Created on : 2019/4/10, 上午 10:48:43
    Author     : Administrator
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sqlCreateVote"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body{
            background-color: black;
            color:white;
        }
        div {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            padding: 12px 20px;
            background-color: transparent;
            border: 2px solid #b49759;
            border-radius: 4px;
            font: normal normal normal 20px arial;
            color: #ffffff;
            text-decoration: none;
            width:395px;
            height:190px;
            margin:5px;
            
        }
        div:checked {
        background-color: #cfae66;
        }
        div:hover,
        div:active,

        <%--
        div:focus {
            border: 3px solid #cfae66;
            color: #ffffff;
            text-decoration: none;
            background-color:#282213;
        } --%>
        </style>
    </head>
    <body>
        
        <%
            
            ResultSet rs=com.sqlCreateVote.QueryAll();
            try{while(rs.next())
            {
            String votename=rs.getString("votename");
            String description=rs.getString("description");
            String optionA=rs.getString("optionA");
            String optionB=rs.getString("optionB");
            String optionC=rs.getString("optionC");
            String optionD=rs.getString("optionD");
            int CountA=rs.getInt("CountA");
            int CountB=rs.getInt("CountB");
            int CountC=rs.getInt("CountC");
            int CountD=rs.getInt("CountD");
            int pincode=rs.getInt("pincode");
            out.println(
                        "<div color=\"white\">"+
                        "<p bgcolor=transparent>"+
                    "pivcode:"+pincode+"<br>Voename:"+votename+
                    "<br>Description:"+description+
                    "<br>A.\t"+optionA+":"+CountA+
                    "<br>B.\t"+optionB+":"+CountB+
                    "<br>C.\t"+optionC+":"+CountC+
                    "<br>D.\t"+optionD+":"+CountD+"<br>"+"</p>"+
                    "</div>");
            }}catch(Exception e){}
        %>    
        </body>
</html>
