
<%@page import="com.tech.blog.Entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login here!</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="Css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center " style="height: 80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header primary-background text-center text-white">
                            <h3>Login here</h3>  
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
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" required="">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="password" required="">
  </div>
                                <div class="container text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
</form>
                        </div>
                    </div>

                </div>



            </div>




        </main>


























        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


        <script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html>
