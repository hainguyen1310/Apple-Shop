<%-- 
    Document   : AddUserForm
    Created on : Jun 16, 2024, 11:18:50 PM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section id="container" >

            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <!-- page start-->

                    <div class="row">
                        <div class="col-sm-12">
                            <section class="panel">
                                <header class="panel-heading">
                                    Thêm người dùng
                                </header>
                                <div class="panel-body">
                                    <form action="UserServlet" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Username</p>
                                                <input type="text" id="UserName" name="username" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Password" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Password</p>
                                                <input type="password" id="Password" name="password" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Email" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Email</p>
                                                <input type="text" id="Email" name="email" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Tel" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Tel</p>
                                                <input type="text" id="Tel" name="tel" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="fn" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter First Name</p>
                                                <input type="text" id="fn" name="firstn" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ln" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Last Name</p>
                                                <input type="text" id="ln" name="lastn" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="add" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Address</p>
                                                <input type="text" id="add" name="address" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="zip" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Zipcode</p>
                                                <input type="text" id="zip" name="zipcode" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">&nbsp;</label>
                                            <div class="col-lg-6">
                                                <a href="UserServlet?page=UserCategory.jsp" class="btn btn-primary">Quay trở lại</a> &nbsp;
                                                <input type="submit" value="Add New" name="submit" class="btn btn-danger" autofocus/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!-- page end-->
                </section>
            </section>
            <!--main content end-->
        </section>
    </body>
</html>
