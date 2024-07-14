<%-- 
    Document   : MenuLeft
    Created on : May 27, 2024, 10:16:08 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse">
                    <!-- sidebar menu start-->
                    <div class="leftside-navigation">
                        <ul class="sidebar-menu" id="nav-accordion">
                            <li>
                                <a class="active" href="AdminPage.jsp">
                                    <i class="fa fa-dashboard"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li class="sub-menu">
                                <a href="#">
                                    <i class="fa fa-book"></i>
                                    <span>Category</span>
                                </a>
                                <ul class="sub">
                                    <li><a href="#"><i class="fa fa-folder-o"></i>Category</a></li>
                                    <li><a href="NewsServlet?page=Index.jsp"><i class="fa fa-folder-o"></i>News</a></li>
                                    <li><a href="UserServlet?page=UserCategory.jsp"><i class="fa fa-folder-o"></i>User</a></li>
                                    <li><a href="RoleServlet?page=Index.jsp"><i class="fa fa-folder-o"></i>Role</a></li>
                                    <li><a href="ProductServlet?page=Index.jsp"><i class="fa fa-folder-o"></i>Product</a></li>
                                    <li><a href="OrdersServlet?page=Index.jsp"><i class="fa fa-folder-o"></i>Orders</a></li>
                                    <li><a href="OrderDetailServlet?page=Index.jsp"><i class="fa fa-folder-o"></i>OrderDetail</a></li>
                                    <li><a href="BagsServlet?page=Index.jsp"><i class="fa fa-folder-o"></i>Bags</a></li>
                                </ul>
                            </li>
                        </ul>            
                    </div>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->
</html>
