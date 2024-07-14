<%-- 
    Document   : Index
    Created on : Jul 14, 2024, 11:01:26 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Product"%>
<%@page import="Model.OrderDetail"%>
<%@page import="ModelDao.ProductDao"%>
<jsp:useBean id="list" class="java.util.ArrayList" scope="session"/>
<jsp:useBean id="odetail" class="Model.OrderDetail" scope="session"/>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                Order Detail Management
                            </header>
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <a href="OrderDetailServlet?page=Add.jsp" id="editable-sample_new" class="btn btn-primary">
                                                Add New <i class="fa fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="form-group" style="clear:both">&nbsp;</div>
                                    <div class="form-group">
                                        <table class="table table-striped table-hover table-bordered" id="editable-sample">
                                            <thead>
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>Product ID</th>
                                                    <th>Stock</th>
                                                    <th>Price Order</th>
                                                    <th>Action</th>   
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="i" begin="0" end="${list.size()-1}">
                                                    <tr class="">
                                                        <td class="center"><c:out value="${list.get(i).getOrderID()}"/></td>
                                                        <td class="center"><c:out value="${ProductDao.getProductbyID(list.get(i).getProductID()).getProductName()}"/></td>
                                                        <td class="center"><c:out value="${list.get(i).getStock()}"/></td>
                                                        <td class="center"><c:out value="${list.get(i).getPriceOrder()}"/></td>
                                                        <td class="center"><a class="btn btn-danger" href="OrderDetailServlet?page=Edit.jsp&prid=${list.get(i).getProductID()}&oid=${list.get(i).getOrderID()}"><i class="fa fa-edit"></i></a>&nbsp;
                                                            <a class="btn btn-danger" href="OrderDetailServlet?page=Delete.jsp&prid=${list.get(i).getProductID()}&oid=${list.get(i).getOrderID()}"><i class="fa fa-times"></i></a></td>
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
