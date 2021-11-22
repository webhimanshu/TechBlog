
package com.tech.blog.DAO;
import com.tech.blog.Entities.Category;
import com.tech.blog.Entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con;
    public PostDao(Connection con)
    {
        this.con=con;
    }
    
    public ArrayList<Category> getAllCategoty(){
        ArrayList<Category> list=new ArrayList<Category>();
        try{
            String sql="select *  from categories";
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next())
            {
               int  cid=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                Category c=new Category(cid, name, description);
                list.add(c);
                       
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean savePost(Post p)
    {
        boolean flag=false;
      
        try{
        String qry="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
        PreparedStatement pstmt=con.prepareStatement(qry);
        pstmt.setString(1, p.getpTitle());
        pstmt.setString(2, p.getpContent());
        pstmt.setString(3, p.getpCode());
        pstmt.setString(4, p.getpPic());
        pstmt.setInt(5, p.getCatId());
        pstmt.setInt(6, p.getuserId());
        pstmt.executeUpdate();
        flag=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
                    
        }
        
        
        return flag;
    }
    
    //to Get All Post
    public List<Post> getAllPost()
    {
        List<Post> list=new ArrayList<Post>();
        try
        {
            PreparedStatement pstmt=con.prepareStatement("select * from posts order by pid desc");
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())
            {
                int id=rs.getInt("pid");
                String title=rs.getString("pTitle");
                String content=rs.getString("pContent");
                String code=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp date=rs.getTimestamp("pDate");
                int catId=rs.getInt("catId");
                int userId=rs.getInt("userId");
                Post post=new Post(id, title, content, code, pPic, date, catId, userId);
                list.add(post);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
    return list;
    }
    
    
    public List<Post> getPostCatId(int catId)
    {
           List<Post> list=new ArrayList<Post>();
            try
        {
            PreparedStatement pstmt=con.prepareStatement("select * from posts where catId=?");
            pstmt.setInt(1, catId);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())
            {
                int id=rs.getInt("pid");
                String title=rs.getString("pTitle");
                String content=rs.getString("pContent");
                String code=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp date=rs.getTimestamp("pDate");
             
                int userId=rs.getInt("userId");
                Post post=new Post(id, title, content, code, pPic, date, catId, userId);
                list.add(post);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
           return list;
    }
    public Post getPostBypostId(int postId)
    {
    List<Post> list=new ArrayList<Post>();
    Post post=null;
                try
        {
            PreparedStatement pstmt=con.prepareStatement("select * from posts where pid=?");
            pstmt.setInt(1, postId);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
                int id=rs.getInt("pid");
                String title=rs.getString("pTitle");
                String content=rs.getString("pContent");
                String code=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp date=rs.getTimestamp("pDate");
             
                int catId=rs.getInt("catId");
                int userId=rs.getInt("userId");
                post=new Post(id, title, content, code, pPic, date, catId, userId);
               
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        } 
    return post;
    }
    
    
    
    
    
  
}
