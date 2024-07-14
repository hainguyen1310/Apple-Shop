<%-- 
    Document   : RegisterForm
    Created on : May 27, 2024, 9:02:20 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <!--Core CSS -->
        <link href="admin/assets/bs3/css/bootstrap.min.css" rel="stylesheet">
        <link href="admin/assets/css/bootstrap-reset.css" rel="stylesheet">
        <link href="admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="admin/assets/css/style.css" rel="stylesheet">
        <link href="admin/assets/css/style-responsive.css" rel="stylesheet" />
    </head>
    <body class="login-body">
        <div class="container">

            <form class="form-signin" action="UserServlet" method="post">
                <h2 class="form-signin-heading">registration now</h2>
                <div class="login-wrap">
                    <%
                                if (session != null && session.getAttribute("regis_msg") != null) {
                                    String msg = (String) session.getAttribute("regis_msg");
                    %>
                    <div id="regisMessage" class="alert alert-info">
                        <%= msg %>
                    </div>
                    <% 
                        session.removeAttribute("regis_msg");
                        } 
                    %>
                    <p>Enter your personal details below</p>
                    <input type="text" class="form-control" placeholder="Email" name="email" autofocus>

                    <p> Enter your account details below</p>
                    <input type="text" class="form-control" placeholder="User Name" name="username" autofocus>
                    <input type="password" class="form-control" placeholder="Password" name="password">
                    <input type="password" class="form-control" placeholder="Re-type Password">
                    <label class="checkbox">
                        <input type="checkbox" value="agree this condition"> I agree to the Terms of Service and Privacy Policy
                    </label>
                    <input type="submit" value="Register" name="submit" class="btn btn-lg btn-login btn-block">

                    <div class="registration">
                        Already Registered.
                        <a class="" href="LoginPage.jsp">
                            Login
                        </a>
                    </div>

                </div>

            </form>

        </div>


        <!-- Placed js at the end of the document so the pages load faster -->

        <!--Core js-->
        <script src="admin/assets/js/jquery.js"></script>
        <script src="admin/assets/bs3/js/bootstrap.min.js"></script>
        <script>
            // Kiểm tra xem phần tử thông báo có tồn tại không
            window.onload = function () {
                var loginMessage = document.getElementById("regisMessage");
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
