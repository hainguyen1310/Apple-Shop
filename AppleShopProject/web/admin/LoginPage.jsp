<%-- 
    Document   : LoginPage
    Created on : May 27, 2024, 8:28:59 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="assets/bs3/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-reset.css" rel="stylesheet">
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet" />
    </head>
    <body>

        <div class="container">

            <form class="form-signin" action="UserServlet" method="post">
                <h2 class="form-signin-heading">sign in now</h2>
                <div class="login-wrap">

                    <div class="user-login-info">
                        <%
                        if (session != null && session.getAttribute("login_msg") != null) {
                            String msg = (String) session.getAttribute("login_msg");
                        %>
                        <div id="loginMessage" class="alert alert-info">
                            <%= msg %>
                        </div>
                        <% 
                            session.removeAttribute("login_msg");
                            } 
                        %>
                        <input type="text" class="form-control" placeholder="User ID" name="username" autofocus>
                        <input type="password" class="form-control" name="password" placeholder="Password">
                    </div>
                    <label class="checkbox">
                        <input type="checkbox" value="remember-me"> Remember me
                        <span class="pull-right">
                            <a data-toggle="modal" href="#myModal"> Forgot Password?</a>

                        </span>
                    </label>
                    <input type="submit" value="Sign in" name="submit" class="btn btn-lg btn-login btn-block">

                    <div class="registration">
                        Don't have an account yet?
                        <a class="" href="RegisterForm.jsp">
                            Create an account
                        </a>
                    </div>

                </div>

                <!-- Modal -->
                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Forgot Password ?</h4>
                            </div>
                            <div class="modal-body">
                                <p>Enter your e-mail address below to reset your password.</p>
                                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                <button class="btn btn-success" type="button">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- modal -->

            </form>

        </div>



        <!-- Placed js at the end of the document so the pages load faster -->

        <!--Core js-->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/bs3/js/bootstrap.min.js"></script>
        <script>
            // Kiểm tra xem phần tử thông báo có tồn tại không
            window.onload = function () {
                var loginMessage = document.getElementById("loginMessage");
                if (loginMessage) {
                    // Ẩn phần tử sau 5 giây (5000 milliseconds)
                    setTimeout(function () {
                        loginMessage.style.display = "none";
                    }, 5000);
                }
            };
        </script>
    </body>
</html>
