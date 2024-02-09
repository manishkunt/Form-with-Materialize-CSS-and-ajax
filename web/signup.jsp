<%-- 
    Document   : signup
    Created on : 09-Feb-2024, 10:43:32 pm
    Author     : kt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </head>
    <body style="background:url(img/background.jpg); background-size: cover; background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top:10px;" class="center-align">Register Here !!</h3>
                            <h5 id="msg"></h5>

                            <div class="form center-align">
                                <!--creating form-->
                                <form action="Register" method="post">
                                    <input type="text" name="user_name" placeholder="Enter your name" />
                                    <input type="password" name="user_password" placeholder="Enter user passsword" />
                                    <input type="email" name="user_mail" placeholder="Enter user mail" />
                                    <div class="file-field input-field">
                                        <div class="btn">
                                            <span>File</span>
                                            <input type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn light-blue accent-3">Submit</button>
                                </form>

                            </div>

                            <div class="loader center-align" style="margin-top: 10px;display: none;" >
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div> 
                                <h5>Please Wait..</h5>       
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                console.log("page is ready.....")

                $("myform").on('submit', function (event) {
                    event.preventDefault();

            //        var f = $(this).serialize();

                  let f = new FormData(this);
                  
                    console.log(f);

                    $(".loader").show();
                    $(".form").hide();

                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success")

                            $(".loader").hide();
                            $(".form").show();

                            if (data.trim() == 'success')
                            {
                                $('#msg').html("Successfully registered !!")
                            } else
                            {
                                $('#msg').html("Something went wronng on server....!!")
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("error")

                            $(".loader").hide();
                            $(".form").show();
                            $('#msg').html("Something went wrong on server !!")
                        },
                        processData:false,
                        contentType:false
                    })
                })
            })
        </script>

    </body>
</html>
