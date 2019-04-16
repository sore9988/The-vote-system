/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.SQLCustomer;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {
private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String sqlpw="";
        String name="";
        String imageurl="";
        ResultSet rs=SQLCustomer.queryEmail(email);  
        HttpSession session=request.getSession();
        try{
        while(rs.next()){
                sqlpw=rs.getString("password");
                name=rs.getString("name");
                imageurl=rs.getString("imageurl");
        }}catch(Exception e){}       
        if(password.equals(sqlpw)){
            SQLCustomer sa=new SQLCustomer(name, email, password, imageurl);
            session.setAttribute("SA", sa);
            response.sendRedirect("function/MemberMagament.jsp");            
        }
        else{
            String error="帳號或密碼錯誤，請重新輸入";
            session.setAttribute("E", error);
            response.sendRedirect("login/login.jsp");
                    }
    }
}
