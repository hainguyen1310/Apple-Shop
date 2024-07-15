<%-- 
    Document   : header
    Created on : Jul 15, 2024, 7:06:38 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Category"%>
<%@page import="Model.Bags"%>
<%@page import="ModelDao.ProductDao"%>
<jsp:useBean id="listBags" class="java.util.ArrayList" scope="session"/>
<jsp:useBean id="listCategory" class="java.util.ArrayList" scope="session"/>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<!-- HEADER-TOP START -->
<div class="header-top">
    <div class="container">
        <div class="row">
            <!-- HEADER-LEFT-MENU START -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="header-left-menu">
                    <div class="welcome-info">
                        Welcome <span>NDB</span>
                    </div>
                    <div class="currenty-converter">
                        <form method="post" action="#" id="currency-set">
                            <div class="current-currency">
                                <span class="cur-label">Currency : </span><strong>USD</strong>
                            </div>
                            <ul class="currency-list currency-toogle">
                                <li>
                                    <a title="Dollar (USD)" href="#">Dollar (USD)</a>
                                </li>
                                <li>
                                    <a title="VietNamDong (VND)" href="#">VietNamDong (VND)</a>
                                </li>
                            </ul>
                        </form>									
                    </div>
                    <div class="selected-language">
                        <div class="current-lang">
                            <span class="current-lang-label">Language : </span><strong>English</strong>
                        </div>
                        <ul class="languages-choose language-toogle">
                            <li>
                                <a href="#" title="English">
                                    <span>English</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" title="Việt Nam (VietName)">
                                    <span>Việt Nam</span>
                                </a>
                            </li>
                        </ul>										
                    </div>
                </div>
            </div>
            <!-- HEADER-LEFT-MENU END -->
            <!-- HEADER-RIGHT-MENU START -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="header-right-menu">
                    <%
                                            String username = null;
                                            String role = null;

                                            if (session != null) {
                                                username = (String) session.getAttribute("username");
                                                role = (String) session.getAttribute("role");
                        }
                                            %>
                    <nav>
                        <ul class="list-inline">
                            <li><a href="/client/checkout.jsp">Check Out</a></li>
                            <li><a href="/client/my-account.html">My Account</a></li>
                            <li><a href="/client/cart.jsp">My Cart</a></li>
                            <% if (username == null) {
                                                        %>
                            <li><a href="/client/registration.jsp">Sign in</a></li>
                            <%
                                } else if("admin".equals(role)){
                                %>
                            <li><a href="/admin/AdminPage.jsp">Manage</a></li>
                            <li><span class="username"><%= username %></span></li>
                            <li><a href="/client/Logout.jsp">Log out</a></li>
                            <%
                                } else {
                            %>
                            <li><span class="username"><%= username %></span></li>
                            <li><a href="/client/Logout.jsp">Log out</a></li>
                            <% 
                            } 
                            
                        %>
                        </ul>									
                    </nav>
                </div>
            </div>
            <!-- HEADER-RIGHT-MENU END -->
        </div>
    </div>
</div>
<!-- HEADER-TOP END -->
<!-- HEADER-MIDDLE START -->
<section class="header-middle">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- LOGO START -->
                <div class="logo">
                    <a href="index.jsp"><img src="/client/assets/img/logo.png" alt="bstore logo" /></a>
                </div>
                <!-- LOGO END -->
                <!-- HEADER-RIGHT-CALLUS START -->
                <div class="header-right-callus">
                    <h3>call us free</h3>
                    <span>0123-456-789</span>
                </div>
                <!-- HEADER-RIGHT-CALLUS END -->
                <!-- CATEGORYS-PRODUCT-SEARCH START -->
                <div class="categorys-product-search">
                    <form action="#" method="get" class="search-form-cat">
                        <div class="search-product form-group">
                            
                            <select name="catsearch" class="cat-search">
                                <option value="">Categories</option>
                                <c:forEach var="i" begin="0" end="${listCategory.size()-1}">
                                <option value=""><c:out value="${listCategory.get(i).getCategoryName()}"/></option>
                                </c:forEach>
                            </select>
                            
                            <input type="text" class="form-control search-form" name="s" placeholder="Enter your search key . " />
                            <button class="search-button" value="Search" name="s" type="submit">
                                <i class="fa fa-search"></i>
                            </button>									 
                        </div>
                    </form>
                </div>
                <!-- CATEGORYS-PRODUCT-SEARCH END -->
            </div>
        </div>
    </div>
</section>
<!-- HEADER-MIDDLE END -->
<!-- MAIN-MENU-AREA START -->
<header class="main-menu-area">
    <div class="container">
        <div class="row">
            <!-- SHOPPING-CART START -->
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 pull-right shopingcartarea">
                <div class="shopping-cart-out pull-right">
                    <div class="shopping-cart">
                        <a class="shop-link" href="cart.html" title="View my shopping cart">
                            <i class="fa fa-shopping-cart cart-icon"></i>
                            <b>My Cart</b>
                            <span class="ajax-cart-quantity"><c:out value="${listBags.size()}"/></span>
                        </a>
                        <div class="shipping-cart-overly" style="overflow: scroll;">
                            <c:set var="total" value="0" />
                            <c:forEach var="i" begin="0" end="${listBags.size()-1}">
                                <div class="shipping-item">
                                    <span class="cross-icon"><i class="fa fa-times-circle"></i></span>
                                    <div class="shipping-item-image">
                                        <c:set var="url" value="${pageContext.request.contextPath}/client/assets/img/product/${ProductDao.getProductbyID(listBags.get(i).getProductID()).getImageURL()}"></c:set>
                                        <a href="#"><img src="${url}" alt="shopping image" /></a>
                                    </div>
                                    <div class="shipping-item-text">
                                        <span><c:out value="${listBags.get(i).getStock()}"/> <span class="pro-quan-x">x</span> <a href="#" class="pro-cat"><c:out value="${ProductDao.getProductbyID(listBags.get(i).getProductID()).getProductName()}"/></a></span>
                                        <p>$<c:out value="${ProductDao.getProductbyID(listBags.get(i).getProductID()).getMoney()}" /></p>
                                    </div>
                                </div>
                                    <c:set var="itemPrice" value="${ProductDao.getProductbyID(listBags.get(i).getProductID()).getMoney() * listBags.get(i).getStock()}" />
                                    <c:set var="total" value="${total + itemPrice}" />
                            </c:forEach>
                            <div class="shipping-total-bill">
                                <div class="cart-prices">
                                    <span class="shipping-cost">$2.00</span>
                                    <span>Shipping</span>
                                </div>
                                <div class="total-shipping-prices">
                                    <span class="shipping-total">$<c:out value="${total+2}" /></span>
                                    <span>Total</span>
                                </div>										
                            </div>
                            <div class="shipping-checkout-btn">
                                <a href="/client/checkout.jsp">Check out <i class="fa fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>	
            <!-- SHOPPING-CART END -->
            <!-- MAINMENU START -->
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 no-padding-right menuarea">
                <div class="mainmenu">
                    <nav>
                        <ul class="list-inline mega-menu">
                            <li class="active"><a href="index.jsp">Home</a>
                            </li>
                            <li>
                                <a href="/client/shop-gird.jsp">clothing</a>
                                <!-- DRODOWN-MEGA-MENU START -->	
                                <div class="drodown-mega-menu">
                                    <div class="left-mega col-xs-6">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">TOPS</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">new product</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="right-mega col-xs-6">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">Prodect</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Watch</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">best sale month</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>	
                                <!-- DRODOWN-MEGA-MENU END -->										
                            </li>
                            <li>
                                <a href="/client/shop-gird.jsp">Tops</a>
                                <!-- DRODOWN-MEGA-MENU START -->
                                <div class="drodown-mega-menu">
                                    <div class="left-mega col-xs-4">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">TOPS</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="right-mega col-xs-4">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">best sale month</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="right-mega col-xs-4">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">top rate product</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="left-mega col-xs-6">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">Latest product</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>	
                                    <div class="left-mega col-xs-6">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">popular product</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>											
                                </div>
                                <!-- DRODOWN-MEGA-MENU END -->
                            </li>
                            <li>
                                <a href="/client/shop-gird.jsp">T-shirts</a>
                                <!-- DRODOWN-MEGA-MENU START -->
                                <div class="drodown-mega-menu">
                                    <div class="left-mega col-xs-6">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">TOPS</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">new product</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="right-mega col-xs-6">
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">Prodect</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Watch</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                        <div class="mega-menu-list">
                                            <a class="mega-menu-title" href="/client/shop-gird.jsp">best sale month</a>
                                            <ul>
                                                <li><a href="/client/shop-gird.jsp">T-shirts</a></li>
                                                <li><a href="/client/shop-gird.jsp">clothing</a></li>
                                                <li><a href="/client/shop-gird.jsp">Delivery</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- DRODOWN-MEGA-MENU END -->
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- MAINMENU END -->
        </div>
    </div>
</header>
<!-- MAIN-MENU-AREA END -->