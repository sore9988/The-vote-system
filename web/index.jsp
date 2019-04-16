<%-- 
    Document   : index
    Created on : 2019/3/28, 下午 02:16:08
    Author     : Administrator
--%>
<%@page language="java"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Code Adventure</title>
        <style>
	body {
	height:100vh;
	background-image: url('image/5.png');
	background-repeat:no-repeat;
	background-size:cover;
	 }
        </style>
    </head>
    <body>
        <table  border=0>
            <tr>
                <td width=200 > 
                    <table border=0 align=top> 
                    <tr>
                        <td align=center><img src="image/ca1.png">
                    <tr>
                        <td align=center>投票系統連結
                    <tr>
                        <td align=center><a href="login/first.jsp">網頁版</a>
                    <tr>
                        <td align=center>手機版QR Code
                    <tr>
                        <td align=center><img src="">
                    <tr>
                        <td align=center>關於我們
                    </table>
                <td width="30">
                <td>
                    <table align=center border=0>
                        <tr>
                            <td>
                                <h3>投票系統</h3><br>
                                隨著人類相處及互動的增加<br>
                                人們對於共同決策的需求也日漸增加<br>
                                基於促進社會的共同進步及自我保護下<br>
                                本團隊毅然決然地研發出可匿名的投票系統<br>
                                經過多年來的努力克服了種困難後<br>
                                終於．在2019年4月在萬眾期待下隆重推出~~~<br>
                        <tr>
                            <td><h3>投票系統介紹</h3>
                        <tr>
                            <td align="center"><img src="">
                            <td align="center"><img src="">
                            <td align="center"><img src="">
                        <tr>
                            <td>
                                <form method="post" action="index.jsp">
                                    <table align="center" width=460 border=1>
                                        <tr>
                                            <td colspan=4 align="center">訪客留言
                                        <tr>
                                            <td width=50>姓名:
                                            <td width=80><input type="text" name="name">
                                            <td width=70>e-mail:
                                            <td width=220><input type="email" name="mail">
                                        <tr>
                                            <td align="center" width="460" colspan="4"><textarea cols="70" rows="5" align="center" name="word"></textarea>
                                        <tr>
                                            <td colspan="4" align="center">
                                                <input type="submit" value="送出">
                                                <input type="reset" value="重填">
                                    </table>
                                </form>
                        <tr>
                            <td><h7>
                                contact to us:<br>
                                e-mail:codeadventure@gmail.com<br>
                                phone:08007-6666
                                </h7>
                    </table>
        </table>
    </body>
</html>
