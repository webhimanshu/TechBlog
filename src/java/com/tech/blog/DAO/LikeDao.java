/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.DAO;

import java.sql.*;

/**
 *
 * @author Bluebeast
 */
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    public  boolean insertLike(int pid, int uid)
    
    {
        boolean flag=false;
    try
    {
        PreparedStatement pstmt=con.prepareStatement("insert into liked(pid ,uid) values(?,?)");
         pstmt.setInt(1, pid);
         pstmt.setInt(2, uid);
         pstmt.executeUpdate();
         flag=true;
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    return flag;
    }
    
    public int  countLikeOnPost(int pid)
    {
        int count=0;
        try
        {
            PreparedStatement pstmt=con.prepareStatement("select count(*) from liked where pid=? ");
            pstmt.setInt(1,pid);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
                count=rs.getInt("count(*)");
                
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return count;
    }
    
    public boolean isLikedByUser(int pid, int uid)
    {
    boolean flag=false;
    try
    {
     PreparedStatement pstmt=con.prepareStatement("select * from liked where pid=? and uid=? ");
     pstmt.setInt(1,pid);
     pstmt.setInt(2,uid);
     ResultSet set=pstmt.executeQuery();
     if(set.next())
     {
         flag=true;
     }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    return flag;
    }
    
    public boolean deleteLike(int pid, int uid)
    {
    boolean flag=false;
    
    try
    {
        PreparedStatement pstmt=con.prepareStatement("delete from  liked where pid=? and uid=?");
        pstmt.setInt(1,pid);
        pstmt.setInt(2,uid);
        pstmt.executeUpdate();
        flag=true;
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    return flag;
    }
}
