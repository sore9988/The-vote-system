/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sqlCreateVote;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(urlPatterns = {"/voteServlet"})
public class voteServlet extends HttpServlet {

    public voteServlet(){
        super();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        int pincode=Integer.parseInt(request.getParameter("pincode"));
        int endtime=0;
        int CountA=0;
        int CountB=0;
        int CountC=0;
        int CountD=0;
        String votename="";
        String description="";
        String optionA="";
        String optionB="";
        String optionC="";
        String optionD="";
        ResultSet rs=sqlCreateVote.Querypincode(pincode);
        try {
            while(rs.next())
            {
                endtime=rs.getInt("endtime");
                CountA=rs.getInt("CountA");
                CountB=rs.getInt("CountB");
                CountC=rs.getInt("CountC");
                CountD=rs.getInt("CountD");
                votename=rs.getString("votename");
                description=rs.getString("description");
                optionA=rs.getString("optionA");
                optionB=rs.getString("optionB");
                optionC=rs.getString("optionC");
                optionD=rs.getString("optionD");
            }
        } catch (SQLException ex) {}
        LocalTime VoteTime=LocalTime.now();
        int hour=VoteTime.getHour();
        int minute=VoteTime.getMinute();
        int second=VoteTime.getSecond();
        int nowtime=hour*3600+minute*60+second;
        sqlCreateVote scv=new sqlCreateVote(pincode, votename, CountA, CountB, CountC, CountD, optionA, optionB, optionC, optionD , endtime, description);
        if(nowtime>=endtime)
        {
            String endmessage="投票已截止";
            ResultSet rr=sqlCreateVote.QueryAll();
            session.setAttribute("PC",pincode);
            session.setAttribute("END", endmessage);
            response.sendRedirect("function/result.jsp");
        }
        else
        {        
        session.setAttribute("SCVV", scv);
        session.setAttribute("PP",pincode);
        response.sendRedirect("function/vote1.jsp");
        }
    }
    
}
