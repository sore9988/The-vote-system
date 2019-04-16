/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Administrator
 */
public class SQLCustomer {
    private String name;
    private String email;
    private String password;
    private String imageurl;
    static String url="jdbc:mysql://localhost:3306/codeadventure?useUnicode=true&characterEncoding=utf-8";
    static String user="root";
    static String ppassword="0000";

    public SQLCustomer(String name, String email, String password, String imageurl) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.imageurl=imageurl;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
     /**
     * @return the imageurl
     */
    public String getImageurl() {
        return imageurl;
    }

    /**
     * @param imageurl the imageurl to set
     */
    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }
    
    public void add()
    {
        String sql="insert into customer(name,email,password,imageurl) values(?,?,?,?)";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, ppassword);
            PreparedStatement ps=conn.prepareStatement(sql);
            
            ps.setString(1, getName());
            ps.setString(2, getEmail());
            ps.setString(3, getPassword());
            ps.setString(4, getImageurl());
            
            ps.executeUpdate();
           
        } catch (ClassNotFoundException ex) {
            System.out.println("no driver");
        }
        catch(SQLException e)
        {
             System.out.println("no connection");
        }
    }  
     public static ResultSet queryEmail(String typemail)
    {
        String sql="select * from customer where email='"+typemail+"'";
        ResultSet rs=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, ppassword);
            
            Statement st=conn.createStatement();
          rs=st.executeQuery(sql);
       
          } catch (ClassNotFoundException ex) {
            System.out.println("no driver");
        }
        catch(SQLException e)
        {
             System.out.println("no connection");
        }
        
        return rs;
    }
     
}
