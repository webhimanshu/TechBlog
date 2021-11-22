
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="Css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>Register here!</title>
    </head>
    <body>
        <%@include  file="navbar.jsp" %>
        <main>
            <div class="container mt-3">
                <div class="col-md-6 offset-md-3">

                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <h3>Register here</h3>


                        </div>
                        <div class="card-body">

                            <form action="RegisterServlet" method="post" id="reg-form">

                                <div class="mb-3">
                                    <label for="user_name" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="user_name"  placeholder="Enter Your Name" name="user_name" required>

                                </div>





                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Your Email" name="user_email" required>
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Your Password" name="user_password" required>
                                </div>

                                <div class="mb-3">
                                    <label for="gender" class="form-label">Gender</label><br>
                                    <input type="radio"  id="gender" name="gender"value="Male">Male
                                    <input type="radio"  id="gender" name="gender" value="female">Female
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control" cols="20" rows="3" placeholder="Say Something About you... " required></textarea>


                                </div>

                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check" >
                                    <label class="form-check-label" for="exampleCheck1">Agree terms & Conditions</label>
                                </div>
                                <div class="container text-center" id="loader" style="display:none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please Wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>

                        </div>


                    </div> 



                </div>










        </main>






        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


        <script src="js/myjs.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded");


                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    //send request to servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: "Post",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            if(data.trim()==="DONE"){
                            swal("registered successfully...")
                                    .then((value) => {
                                       window.location="Login_page.jsp";
                                    });
                                    }
                        else{
                           swal(data);
                        }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                                 $("#submit-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..");
                                   
                        },
                        processData: false,
                        contentType: false,
                    })
                })
            })
        </script>  
    </body>
</html>
