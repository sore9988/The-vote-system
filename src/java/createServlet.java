/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sqlCreateVote;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(urlPatterns = {"/createServlet"})
public class createServlet extends HttpServlet {
    public createServlet(){
    super();
    }    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();  
        HttpSession session=request.getSession(); 
        String votename=request.getParameter("votename");
        String description=request.getParameter("description");
        String optionA=request.getParameter("optionA");
        String optionB=request.getParameter("optionB");
        String optionC=request.getParameter("optionC");
        String optionD=request.getParameter("optionD");
        LocalTime buildTime=LocalTime.now();
        session.setAttribute("TIME", buildTime);
        session.setAttribute("ETIME", request.getParameter("timeout"));
        int hour=buildTime.getHour();
        int minute=buildTime.getMinute();
        int second=buildTime.getSecond();
        int scsum=hour*3600+minute*60+second;
        int endtime=scsum+Integer.parseInt(request.getParameter("timeout"))*60;
        int sqlpc=0;
        int pincode=(int)(Math.random()*10000); 
        ResultSet rs=sqlCreateVote.Querypincode(pincode);
        try{
        while(rs.next()){
        sqlpc=rs.getInt("pincode");}}catch(Exception e){}
        while(pincode==sqlpc)
        {pincode=(int)(Math.random()*10000);}
                
        sqlCreateVote sc=new sqlCreateVote(pincode,votename,0,0,0,0,optionA,optionB,optionC,optionD,endtime,description);
            sc.add();
        session.setAttribute("SC", sc);
        response.sendRedirect("function/pincode2.jsp");
    }
}
