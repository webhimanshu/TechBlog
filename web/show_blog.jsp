
<%@page import="com.tech.blog.DAO.LikeDao"%>
<%@page import="com.tech.blog.DAO.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.Entities.Category"%>
<%@page import="com.tech.blog.Helper.ConnectionProvider"%>
<%@page import="com.tech.blog.DAO.PostDao"%>
<%@page import="com.tech.blog.Entities.Message"%>
<%@page import="com.tech.blog.Entities.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.Entities.User" %>
<%@page errorPage="Error_Page.jsp" %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
        response.sendRedirect("Login_page.jsp");
    }
    %>
    
    
    <%
    int id=Integer.parseInt(request.getParameter("postid"));    
    PostDao dao=new PostDao(ConnectionProvider.getConnection());
        Post     p= dao.getPostBypostId(id);
    %>
    
    
       <%  
                         UserDao ud=new UserDao(ConnectionProvider.getConnection());
                         int x=p.getuserId();
                         String name=ud.getUser(x);
                        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %></title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="Css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <!-------NavBar start----->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a  href="profile.jsp" class="nav-link active" aria-current="page" href="#">Code</a>
        </li>
       
        
         <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
        
    
        
       
     
      </ul>
        <ul class="navbar-nav  mr-right">
                       <li class="nav-item">
                   
            <a  href="register_page.jsp" class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal"> <span class="fa fa-user-circle "></span><%= user.getName() %></a>

        </li>
                <li class="nav-item">
                   
            <a  href="LogoutServlet" class="nav-link"> <span class="fa fa-user-plus "></span>Log out</a>

        </li>
        </ul>
    </div>
  </div>
</nav>
           <!------Ends Here---------->
           
     
           <!-----------main content of body--------->
           
           <div class="container mt-2">
                  
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header"><b> <%= p.getpTitle() %> </b> </div>
                    <img class="card-img-top"  alt="...." src="blog_post/<%= p.getpPic().trim() %>" style="height: 300px">
                    <div class="card-body">
                        
                       
                        <p>  <%= p.getpContent()     %>  </p>
                        
                        <% 
                        
                        if(p.getpCode().isEmpty() )
                        {
                        %>
                        <p> No code available</p>
                        <%
                        }
else{
%>
<pre>    <%= p.getpCode()    %>        </pre>
<%
}
                        %>
                        
                        
                        <b>Publish  date: <%= p.getpDate().toLocaleString() %></b>
                        
                        <br>
                        <b> Posted by:<%= name %></b>
                    </div>  
<!--                    <div class="card-footer text-center">
                   
                        <a   href="#"   class="btn btn-outline-primary btn-sm">  <i class="fa fa-thumbs-o-up"><span class="like-counter"></span></i></a>
                                            <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting"></i></a>
                    </div>-->
                </div>    
              </div>
               
           </div>
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
                        <%
                            
Message m=(Message)session.getAttribute("msg");
                              if(m!=null)
                              {
                                  %>
                                  <div class="alert  <%= m.getCssClass()%>   " role="alert">
                                      <%= m.getContent() %>
                                       </div>
                                  
                                  <%
                                      session.removeAttribute("msg");
                              }
                            %>
                        
                        
                        
         <!-------Profile- starts here------------>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
       
          
          
          
          <!-----Profile details starts ------>
          <div id="profile-details">
                 <img src="pics/<%=user.getProfile()%>" style="width: 200px;">
          <h5 class="modal-title" id="exampleModalLabel" ><%= user.getName()%></h5>
                     <table class="table">
          
  <tbody>
    <tr>
      <th scope="row">ID:</th>
      <td><%= user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><%= user.getEmail() %></td>
     
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td colspan="2"><%= user.getGender() %></td>
     
    </tr>
        <tr>
      <th scope="row">Status</th>
      <td colspan="2"><%= user.getAbout() %></td>
     
    </tr>
        <tr>
      <th scope="row">Registered Date:</th>
      <td colspan="2"><%= user.getDate().toString()%></td>
     
    </tr>
  </tbody>
</table>               
              
          </div>
          
      <!-----Profile details end here ------>
      <!----------Edit Profile Start here----->
      <div id="profile-edit" style="display:none;">
             <img src="pics/<%=user.getProfile()%>" style="width: 200px;">
          <h5 class="modal-title" id="exampleModalLabel" ><%= user.getName()%></h5>
          <h2>Edit here</h2>
          <form action="editServlet" method="post" enctype="multipart/form-data">
              <table class="table">
          
  <tbody>
  
    <tr>
      <th scope="row">ID:</th>
      <td><%= user.getId() %></td>
      
    </tr>
      <tr>
      <th scope="row">Name:</th>
      <td><input type="text" name="user_name" class="form-control" value="<%= user.getName() %>"/> </td>
     
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail() %>"/> </td>
     
    </tr>
      <tr>
      <th scope="row">Password:</th>
      <td><input type="password" name="user_password" class="form-control" value="<%= user.getPassword() %>"/> </td>
     
    </tr>
  
        <tr>
      <th scope="row">Status</th>
      <td >
          <textarea  class="form-control" name="user_about" > 
              <%= user.getAbout()%>
          </textarea>
          
      </td>
     
    </tr>
        <tr>
      <th scope="row">New Profile photo</th>
      <td >
          <input type="file" name="pic" class="form-control"/>
      </td>
     
    </tr>
      <tr>
      <th scope="row">Gender</th>
      <td colspan="2"> <%= user.getGender().toUpperCase() %></td>
     
    </tr>
        <tr>
      <th scope="row">Registered Date:</th>
      <td colspan="2"><%= user.getDate().toString()%></td>
     
    </tr>
  </tbody>
</table>
   <div class="container">
          <button     type="submit"    class="btn btn-outline-primary">Save</button>
      </div>
          </form>
      </div>
      <!----------Edit profile ends here----->
      </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="edit-btn" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
      <!------------Profile ends here----------->
              <!-----POST MODAL STARTS HERE----------->
            

     
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                let status=false;
               $("#edit-btn").click(function(){
                   if(status===false){
                  $("#profile-details").hide();
                  $("#profile-edit").show();
                  status=true;
                  $(this).text("Back");
              }
              else{
                   $("#profile-details").show();
                  $("#profile-edit").hide();
                  status=false;
                    $(this).text("Edit");
              }
              });
          });
   
               $(document).ready(function(e){                  
                 $("#add-post-form").on("submit", function(event){
                      event.preventDefault();
                     
                      let form=new FormData(this);
                     //requesting to server
                      $.ajax({
                          url:"addPostServlet",
                          method:"post",
                         data:form,
                          success: function (data, textStatus, jqXHR) {
                       console.log(data);
                       if(data.trim()==="done")
                       {
                        swal("Good job!", "Saved Successfully!", "success");   
                       }else{
                           swal("Error", "Something went wrong try again!", "error");
                       }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
              
                    },
                   processData:false,
                   contentType:false,
                     })
                      
                  })  
                })
</script>
<script>

            </script>
             

        
    </body>
</html>

