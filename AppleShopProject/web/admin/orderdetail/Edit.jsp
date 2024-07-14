<%-- 
    Document   : EditUserForm
    Created on : Jun 17, 2024, 8:28:46 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="odetail" class="Model.OrderDetail" scope="session"/>
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
                                    Update Order Detail
                                </header>
                                <div class="panel-body">
                                    <form action="OrderDetailServlet" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="OrderID" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Order ID</p>
                                                <input type="text" id="OrderID" name="orderid" class="form-control" value="${odetail.getOrderID()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="ProductID" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Product ID</p>
                                                <input type="text" id="ProductID" name="productid" class="form-control" value="${odetail.getProductID()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Stock" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Stock</p>
                                                <input type="text" id="Stock" name="stock" class="form-control" value="${odetail.getStock()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Price" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Price Order</p>
                                                <input type="text" id="Price" name="price" class="form-control" value="${odetail.getPriceOrder()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">&nbsp;</label>
                                            <div class="col-lg-6">
                                                <a href="OrderDetailServlet?page=Index.jsp" class="btn btn-primary">Quay trở lại</a> &nbsp;
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
