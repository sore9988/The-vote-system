/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.sqlCreateVote;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
@WebServlet(urlPatterns = {"/VotehanddleServlet"})
public class VotehanddleServlet extends HttpServlet {

    public VotehanddleServlet(){super();}
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        String option=request.getParameter("Count");
        int pincode=Integer.parseInt(request.getParameter("pincode"));
        int count=0;
        String votename="";
        String description="";
        ResultSet rs=sqlCreateVote.Querypincode(pincode);
        try{while(rs.next())
        {
            count=rs.getInt(option)+1;
            votename=rs.getString("votename");
            description=rs.getString("description");
        }}catch(Exception e){}
        HttpSession session=request.getSession();
        sqlCreateVote.updateVotes(pincode, option, count);
        session.setAttribute("PC", pincode);
        response.sendRedirect("function/result.jsp");
    }    

}

