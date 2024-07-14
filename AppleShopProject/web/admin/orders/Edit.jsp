<%-- 
    Document   : EditUserForm
    Created on : Jun 17, 2024, 8:28:46 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="order" class="Model.Orders" scope="session"/>
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
                                    Update Order
                                </header>
                                <div class="panel-body">
                                    <form action="OrdersServlet" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <input type="hidden" name="id" class="form-control" value="${order.getOrderID()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserOrder" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter UserOrder</p>
                                                <input type="text" id="UserOrder" name="userorder" class="form-control" value="${order.getUserOrder()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="DateOrder" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Date Order</p>
                                                <input type="text" id="DateOrder" name="dateorder" class="form-control" value="${order.getDateOrder()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Status" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Status</p>
                                                <input type="text" id="Status" name="status" class="form-control" value="${order.getStatus()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">&nbsp;</label>
                                            <div class="col-lg-6">
                                                <a href="OrdersServlet?page=Index.jsp" class="btn btn-primary">Quay trở lại</a> &nbsp;
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
