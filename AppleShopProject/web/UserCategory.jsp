<%-- 
    Document   : ProductCategory
    Created on : May 27, 2024, 11:02:02 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Users"%>
<%@page import="ModelDao.UserDao"%>
<jsp:useBean id="list" class="java.util.ArrayList" scope="session"/>
<jsp:useBean id="user" class="Model.Users" scope="session"/>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="ThemeBucket">
        <link rel="shortcut icon" href="images/favicon.png">

        <title>Editable Table</title>

        <!--Core CSS -->
        <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

        <link rel="stylesheet" href="js/data-tables/DT_bootstrap.css" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" />
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
                                Quản lí người dùng
                            </header>
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <a href="DispatcherServlet?page=AddUserForm.jsp" id="editable-sample_new" class="btn btn-primary">
                                                Add New <i class="fa fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <%
                                            String username = null;
                                            String role = null;

                                            if (session != null) {
                                                username = (String) session.getAttribute("username");
                                                role = (String) session.getAttribute("role");
                                            }%>
                                    <div class="form-group" style="clear:both">&nbsp;</div>
                                    <div class="form-group">
                                        <table class="table table-striped table-hover table-bordered" id="editable-sample">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Password</th>
                                                    <th>Role</th>
                                                        <% if ("admin".equals(role)) {
                                                        %>
                                                    <th>Action</th>
                                                        <%
                                                }%>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="i" begin="0" end="${list.size()-1}">
                                                    <tr class="">
                                                        <td class="center"><c:out value="${list.get(i).getUserID()}"/></td>
                                                        <td class="center"><c:out value="${list.get(i).getUserName()}"/></td>
                                                        <td class="center"><c:out value="${list.get(i).getEmail()}"/></td>
                                                        <td class="center"><c:out value="${list.get(i).getPassword()}"/></td>
                                                        <td class="center"><c:out value="${list.get(i).getRoleID()}"/></td>
                                                        <my:CustomTagsHandler/>
                                                        <% if ("admin".equals(role)) {
                                                        %>
                                                        <td class="center"><a class="btn btn-danger" href="DispatcherServlet?page=EditUserForm.jsp&id=${list.get(i).getUserID()}"><i class="fa fa-edit"></i></a>&nbsp;
                                                            <a class="btn btn-danger" href="DispatcherServlet?page=DeleteUser.jsp&id=${list.get(i).getUserID()}"><i class="fa fa-times"></i></a></td>
                                                            <%
                                                }%> 
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    </div>            
                                </div>
                        </section>
                    </div>
                </div>
                <!-- page end-->
            </section>
        </section>
        <!--main content end-->
    </section>


    <!-- END JAVASCRIPTS -->
    <script>
        jQuery(document).ready(function () {
            EditableTable.init();
        });
    </script>
</body>
</html>
