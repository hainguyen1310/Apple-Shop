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
                                    <form action="ProductServlet" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Product Name</p>
                                                <input type="text" id="UserName" name="productname" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter CategoryID</p>
                                                <input type="text" id="UserName" name="categoryID" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Money</p>
                                                <input type="text" id="UserName" name="money" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Stock</p>
                                                <input type="text" id="UserName" name="stock" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter ImageURL</p>
                                                <input type="text" id="UserName" name="imageURL" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter Description</p>
                                                <input type="text" id="UserName" name="description" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="UserName" class="col-lg-2 col-sm-2 control-label"></label>
                                            <div class="col-lg-6">
                                                <p>Enter MetaContent</p>
                                                <input type="text" id="UserName" name="metaContent" class="form-control" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">&nbsp;</label>
                                            <div class="col-lg-6">
                                                <a href="ProductServlet?page=Index.jsp" class="btn btn-primary">Quay trở lại</a> &nbsp;
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
