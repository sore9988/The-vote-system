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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class sqlCreateVote {
    private int pincode;
    private String votename;
    private String description;
    private int CountA;
    private int CountB;
    private int CountC;
    private int CountD;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private int endtime;
    static String url="jdbc:mysql://localhost:3306/codeadventure?useUnicode=true&characterEncoding=utf-8";
    static String user="root";
    static String password="0000";
    
    
    public sqlCreateVote(int pincode, String votename, int CountA, int CountB, int CountC, int CountD, String optionA, String optionB, String optionC, String optionD ,int endtime, String description) {
        this.pincode = pincode;
        this.CountA = CountA;
        this.CountB = CountB;
        this.CountC = CountC;
        this.CountD = CountD;
        this.votename = votename;
        this.description = description;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.endtime=endtime;
    }

    /**
     * @return the pincode
     */
    public int getPincode() {
        return pincode;
    }   

    /**
     * @return the CountA
     */
    public int getCountA() {
        return CountA;
    }

    /**
     * @param CountA the CountA to set
     */
    public void setCountA(int CountA) {
        this.CountA = CountA;
    }

    /**
     * @return the CountB
     */
    public int getCountB() {
        return CountB;
    }

    /**
     * @param CountB the CountB to set
     */
    public void setCountB(int CountB) {
        this.CountB = CountB;
    }

    /**
     * @return the CountC
     */
    public int getCountC() {
        return CountC;
    }

    /**
     * @param CountC the CountC to set
     */
    public void setCountC(int CountC) {
        this.CountC = CountC;
    }

    /**
     * @return the CountD
     */
    public int getCountD() {
        return CountD;
    }

    /**
     * @param CountD the CountD to set
     */
    public void setCountD(int CountD) {
        this.CountD = CountD;
    }

    /**
     * @return the optionA
     */
    public String getOptionA() {
        return optionA;
    }

    /**
     * @param optionA the optionA to set
     */
    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }

    /**
     * @return the optionB
     */
    public String getOptionB() {
        return optionB;
    }

    /**
     * @param optionB the optionB to set
     */
    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }

    /**
     * @return the optionC
     */
    public String getOptionC() {
        return optionC;
    }

    /**
     * @param optionC the optionC to set
     */
    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }

    /**
     * @return the optionD
     */
    public String getOptionD() {
        return optionD;
    }

    /**
     * @param optionD the optionD to set
     */
    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }

    /**
     * @return the votename
     */
    public String getVotename() {
        return votename;
    }

    /**
     * @param votename the votename to set
     */
    public void setVotename(String votename) {
        this.votename = votename;
    }
    
    public String getDescription() {
        return description;
    }

    /**
     * @param votename the votename to set
     */
    public void setDescription(String votename) {
        this.description = description;
    }
    
    public void add()
    {
        String sql="insert into voteresult(pincode,votename,optionA,optionB,optionC,optionD,CountA,CountB,CountC,CountD,endtime,description) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            PreparedStatement ps=conn.prepareStatement(sql);
            
            ps.setInt(1, getPincode());
            ps.setString(2, getVotename());
            ps.setString(3, getOptionA());
            ps.setString(4, getOptionB());
            ps.setString(5, getOptionC());
            ps.setString(6, getOptionD());
            ps.setInt(7, getCountA());
            ps.setInt(8, getCountB());
            ps.setInt(9, getCountC());
            ps.setInt(10, getCountD());
            ps.setInt(11, getEndtime()); 
            ps.setString(12, getDescription());
            ps.executeUpdate();
           
        } catch (ClassNotFoundException ex) {
            System.out.println("no driver");
        }
        catch(SQLException e)
        {
             System.out.println("no connection");
        }
    }
    public static ResultSet Querypincode(int pincode)
    {
        String sql="select * from voteresult where pincode="+pincode;
        ResultSet rs=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            
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
    public static ResultSet QueryAll()
    {
        String sql="select * from voteresult  order by endtime desc";
        ResultSet rs=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);            
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
    public static void updateVotes(int pincode,String option,int count)
      {
        String sql="update voteresult set "+option+"="+count+" where pincode="+pincode;
        
        try {            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, password);
            PreparedStatement ps=conn.prepareStatement(sql);            
            ps.executeUpdate();
           
        } catch (ClassNotFoundException ex) {
            System.out.println("no driver");
        }
        catch(SQLException e)
        {
             System.out.println("no connection");
        }
      }
    /*
    public static void main(String args[])
     {
         ResultSet rs=sqlCreateVote.QueryAll();
        try {
            while(rs.next())
            {
                System.out.println(
                rs.getInt("pincode")+"\t"+
                rs.getString("votename")+"\t"+
                rs.getString("optionA")+"\t"+
                rs.getString("optionB")+"\t"+
                rs.getString("optionC")+"\t"+
                rs.getString("optionD")+"\t"+
                rs.getInt("CountA")+"\t"+
                rs.getInt("CountB")+"\t"+
                rs.getInt("CountC")+"\t"+
                rs.getInt("CountD"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(sqlCreateVote.class.getName()).log(Level.SEVERE, null, ex);
        }
         
     }*/
    
    /**
     * @return the endtime
     */
    public int getEndtime() {
        return endtime;
    }

    /**
     * @param endtime the endtime to set
     */
    public void setEndtime(int endtime) {
        this.endtime = endtime;
    }
}
