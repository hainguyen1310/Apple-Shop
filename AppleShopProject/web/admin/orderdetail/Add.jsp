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
                                    Add Order Detail
                                </header>
                                <div class="panel-body">
                                    <form action="OrderDetailServlet" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="OrderID" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Order ID</p>
                                                <input type="text" id="OrderID" name="orderid" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ProductID" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Product ID</p>
                                                <input type="text" id="ProductID" name="productid" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Stock" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Stock Order</p>
                                                <input type="text" id="Stock" name="stock" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Price" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Price Order</p>
                                                <input type="text" id="Price" name="price" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">&nbsp;</label>
                                            <div class="col-lg-6">
                                                <a href="OrderDetailServlet?page=Index.jsp" class="btn btn-primary">Quay trở lại</a> &nbsp;
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
