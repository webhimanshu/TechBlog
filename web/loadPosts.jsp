
<%@page import="com.tech.blog.Entities.User"%>
<%@page import="com.tech.blog.DAO.LikeDao"%>
<%@page import="com.tech.blog.Helper.ConnectionProvider"%>
<%@page import="com.tech.blog.DAO.PostDao"%>
<%@page import="com.tech.blog.Entities.Post"%>

<%@page import="java.util.*"%>
<div class="row">
    <%
        User uu=(User)session.getAttribute("current-user");
    PostDao d=new PostDao(ConnectionProvider.getConnection());
    int cid=Integer.parseInt(request.getParameter("cid"));
     List<Post>   list=null;
    if(cid==0)
    {
        list=d.getAllPost();
    }
    else
    {
    list=d.getPostCatId(cid);
    }
    if(list.isEmpty())
    {
    out.print("<h1 class='display-3 text-center'> No Posts Available  in this category...</h1>");
       return; 
    }
   
        for(Post posts:list)
        {
            
            %>
            
            <div class="col-md-6 mt-2">
                <div class="card">
                    <img class="card-img-top"  alt="...." src="blog_post/<%= posts.getpPic().trim() %>">
                    <div class="card-header">
                        <b> <%= posts.getpTitle() %> </b> 
                       </div>
                    <div class="card-body">
                        <p>  <%= posts.getpContent().substring(0, 100).concat("...")        %>  </p>
                       
                    </div>  
                    <div class="card-footer text-center">
                        <a href="show_blog.jsp?postid=<%= posts.getpId() %>" class="btn btn-outline-primary btn-sm" >Read More...</a>
                        
<!--                    
                      <a href="#" class="btn btn-outline-primary btn-sm"  <i class="fa fa-thumbs-o-up" ><span class="like-counter">1</span></i></a>
                                        <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting"></i></a>-->
                    </div>
                </div>    
              </div>
            <%
        }

    %>
</div>

