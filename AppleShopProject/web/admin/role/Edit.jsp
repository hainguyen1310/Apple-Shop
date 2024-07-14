<%-- 
    Document   : EditUserForm
    Created on : Jun 17, 2024, 8:28:46 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="user" class="Model.Users" scope="session"/>
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
                                    Cập nhập người dùng
                                </header>
                                <div class="panel-body">
                                    <form action="UserServlet" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <input type="hidden" name="id" class="form-control" value="${user.getUserID()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Username</p>
                                                <input type="text" id="UserName" name="username" class="form-control" value="${user.getUserName()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Password" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Password</p>
                                                <input type="password" id="Password" name="password" class="form-control" value="${user.getPassword()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Email" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Email</p>
                                                <input type="text" id="Email" name="email" class="form-control" value="${user.getEmail()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Role" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Role</p>
                                                <input type="text" id="Role" name="role" class="form-control" value="${user.getRoleID()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="tel" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter TelPhone</p>
                                                <input type="text" id="tel" name="tel" class="form-control" value="${user.getTel()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="fname" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter First Name</p>
                                                <input type="text" id="fname" name="firstn" class="form-control" value="${user.getFirstName()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="lname" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Last Name</p>
                                                <input type="text" id="lanme" name="lastn" class="form-control" value="${user.getLastName()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="add" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Address</p>
                                                <input type="text" id="add" name="address" class="form-control" value="${user.getAddress()}"/>
                                            </div>
                                        </div>
                                            <div class="form-group">
                                            <label for="zip" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Zipcode</p>
                                                <input type="text" id="zip" name="zipcode" class="form-control" value="${user.getZipcode()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">&nbsp;</label>
                                            <div class="col-lg-6">
                                                <a href="UserServlet?page=UserCategory.jsp" class="btn btn-primary">Quay trở lại</a> &nbsp;
                                                <input type="submit" value="Update" name="submit" class="btn btn-danger" autofocus/>
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
