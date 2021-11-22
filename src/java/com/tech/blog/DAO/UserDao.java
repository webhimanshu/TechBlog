/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.DAO;

import com.tech.blog.Entities.User;
import java.sql.*;
public class UserDao {
    private Connection con;
    public UserDao(Connection con)
    {
        this.con=con;
    }
    
    // save data into database
    public boolean saveUser(User user )
    {
        boolean f=false;
        try
        {
            String qry="insert into user(name, email, password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(qry);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByEmailAndPassword(String email, String password)
    {
        User user=null;
        try
        {
            String qry="select * from  user  where email=? and password=?";
            PreparedStatement pstmt=con.prepareStatement(qry);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
               
                user = new User();
               user.setName(rs.getString("name"));
               user.setId(rs.getInt("id"));
               user.setEmail(rs.getString("email"));
               user.setPassword(rs.getString("password"));
               user.setAbout(rs.getString("about"));
               user.setGender(rs.getString("gender"));
               user.setDate(rs.getTimestamp("ddate"));
               user.setProfile(rs.getString("profile"));
                
                    }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    public boolean UserUpdate(User user){
        String sql="update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
      boolean flag=false;
        try{
            
            PreparedStatement pstmt=con.prepareStatement(sql);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
           pstmt.setString(6, user.getProfile());
           pstmt.setInt(7,user.getId());
           pstmt.executeUpdate();
           flag=true;
        }catch(Exception e){
        e.printStackTrace();
        }
        return flag;
    }
    
 public String getUser( int id)
 {
      String name="";
      try
        {
            String qry="select * from  user  where id=? ";
            PreparedStatement pstmt=con.prepareStatement(qry);
            pstmt.setInt(1, id);
          
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
               
           name=rs.getString("name");
              }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
     
     return name;
 }   
}
