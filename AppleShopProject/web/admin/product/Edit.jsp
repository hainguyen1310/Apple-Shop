<%-- 
    Document   : EditUserForm
    Created on : Jun 17, 2024, 8:28:46 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:useBean id="product" class="Model.Product" scope="session"/>
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
                                    <form action="ProductServlet" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <input type="hidden" name="id" class="form-control" value="${product.getProductID()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Product Name</p>
                                                <input type="text" id="UserName" name="productname" class="form-control" value="${product.getProductName()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter CategoryID</p>
                                                <input type="text" id="UserName" name="categoryID" class="form-control" value="${product.getCategoryID()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Money</p>
                                                <input type="text" id="UserName" name="money" class="form-control" value="${product.getMoney()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Stock</p>
                                                <input type="text" id="UserName" name="stock" class="form-control" value="${product.getStock()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Description</p>
                                                <input type="text" id="UserName" name="description" class="form-control" value="${product.getDescription()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter MetaContent</p>
                                                <input type="text" id="UserName" name="metaContent" class="form-control" value="${product.getMetaContent()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter ImageURL</p>
                                                <input type="text" id="UserName" name="imageURL" class="form-control" value="${product.getImageURL()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">&nbsp;</label>
                                            <div class="col-lg-6">
                                                <a href="ProductServlet?page=Index.jsp" class="btn btn-primary">Quay trở lại</a> &nbsp;
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
