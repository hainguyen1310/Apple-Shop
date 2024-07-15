<%-- 
    Document   : cart
    Created on : Jul 15, 2024, 10:24:24 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Product"%>
<%@page import="Model.Bags"%>
<%@page import="ModelDao.ProductDao"%>
<%@page import="ModelDao.BagsDao"%>
<jsp:useBean id="listBags" class="java.util.ArrayList" scope="session"/>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<!--[if IE]><![endif]-->
<!--[if lt IE 7 ]> <html lang="en" class="ie6">    <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7">    <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8">    <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9">    <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Cart</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon
        ============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- FONTS
        ============================================ -->	
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'> 
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bitter:400,700,400italic&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>

        <!-- animate CSS
        ============================================ -->
        <link rel="stylesheet" href="assets/css/animate.css">		

        <!-- FANCYBOX CSS
        ============================================ -->			
        <link rel="stylesheet" href="assets/css/jquery.fancybox.css">	

        <!-- BXSLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="assets/css/jquery.bxslider.css">			

        <!-- MEANMENU CSS
        ============================================ -->			
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">	

        <!-- JQUERY-UI-SLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="assets/css/jquery-ui-slider.css">		

        <!-- NIVO SLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="assets/css/nivo-slider.css">

        <!-- OWL CAROUSEL CSS 	
        ============================================ -->	
        <link rel="stylesheet" href="assets/css/owl.carousel.css">

        <!-- OWL CAROUSEL THEME CSS 	
        ============================================ -->	
        <link rel="stylesheet" href="assets/css/owl.theme.css">

        <!-- BOOTSTRAP CSS 
        ============================================ -->	
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- FONT AWESOME CSS 
        ============================================ -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- NORMALIZE CSS 
        ============================================ -->
        <link rel="stylesheet" href="assets/css/normalize.css">

        <!-- MAIN CSS 
        ============================================ -->
        <link rel="stylesheet" href="assets/css/main.css">

        <!-- STYLE CSS 
        ============================================ -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- RESPONSIVE CSS 
        ============================================ -->
        <link rel="stylesheet" href="assets/css/responsive.css">

        <!-- IE CSS 
        ============================================ -->
        <link rel="stylesheet" href="assets/css/ie.css">

        <!-- MODERNIZR JS 
        ============================================ -->
        <script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->

        <jsp:include page="header.jsp" /> 
        <!-- MAIN-CONTENT-SECTION START -->
        <section class="main-content-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="index.jsp">HOMe</a>
                            <span><i class="fa fa-caret-right"></i></span>
                            <span>Your shopping cart</span>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- SHOPPING-CART SUMMARY START -->
                        <h2 class="page-title">Shopping-cart summary <span class="shop-pro-item">Your shopping cart contains: 2 products</span></h2>
                        <!-- SHOPPING-CART SUMMARY END -->
                    </div>	

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- SHOPING-CART-MENU START -->
                        <div class="shoping-cart-menu">
                            <ul class="step">
                                <li class="step-current first">
                                    <span>01. Summary</span>
                                </li>
                                <li class="step-todo second">
                                    <span>02. Sign in</span>
                                </li>
                                <li class="step-todo third">
                                    <span>03. Address</span>
                                </li>
                                <li class="step-todo four">
                                    <span>04. Shipping</span>
                                </li>
                                <li class="step-todo last" id="step_end">
                                    <span>05. Payment</span>
                                </li>
                            </ul>									
                        </div>
                        <!-- SHOPING-CART-MENU END -->
                        <!-- CART TABLE_BLOCK START -->
                        <div class="table-responsive">
                            <!-- TABLE START -->
                            <table class="table table-bordered" id="cart-summary">
                                <!-- TABLE HEADER START -->
                                <thead>
                                    <tr>
                                        <th class="cart-product">Product</th>
                                        <th class="cart-description">Description</th>   
                                        <th class="cart-unit text-right">Unit price</th>
                                        <th class="cart_quantity text-center">Qty</th>
                                        <th class="cart-delete">&nbsp;</th>
                                        <th class="cart-total text-right">Total</th>
                                    </tr>
                                </thead>
                                <!-- TABLE HEADER END -->
                                <!-- TABLE BODY START -->
                                <tbody>	
                                    <!-- SINGLE CART_ITEM START -->
                                    <c:set var="total" value="0" />
                                    <c:forEach var="i" begin="0" end="${listBags.size()-1}">
                                        <tr>
                                            <td class="cart-product">
                                                <c:set var="url" value="${pageContext.request.contextPath}/client/assets/img/product/${ProductDao.getProductbyID(listBags.get(i).getProductID()).getImageURL()}"></c:set>
                                                <a href="#"><img src="${url}"></a>
                                            </td>
                                            <td class="cart-description">
                                                <p class="product-name"><a href="#"><c:out value="${ProductDao.getProductbyID(listBags.get(i).getProductID()).getProductName()}"/></a></p>
                                            </td>
                                            <td class="cart-unit">
                                                <ul class="price text-right">
                                                    <li class="price">$<c:out value="${ProductDao.getProductbyID(listBags.get(i).getProductID()).getMoney()}"/></li>
                                                </ul>
                                            </td>
                                            <td class="cart_quantity text-center">
                                                <p class="product-name"><c:out value="${listBags.get(i).getStock()}"/></p>
                                            </td>
                                            <td class="cart-delete text-center">
                                                <span>
                                                    <a href="#" class="cart_quantity_delete" title="Delete"><i class="fa fa-trash-o"></i></a>
                                                </span>
                                            </td>
                                            <c:set var="itemPrice" value="${ProductDao.getProductbyID(listBags.get(i).getProductID()).getMoney() * listBags.get(i).getStock()}" />
                                            <td class="cart-total">
                                                <span class="price">$<c:out value="${itemPrice}"/></span>
                                            </td>
                                            <c:set var="total" value="${total + itemPrice}" />
                                        </tr>
                                    </c:forEach>
                                    <!-- SINGLE CART_ITEM END -->
                                </tbody>
                                <!-- TABLE BODY END -->
                                <!-- TABLE FOOTER START -->
                                <tfoot>										
                                    <tr class="cart-total-price">
                                        <td class="cart_voucher" colspan="3" rowspan="4"></td>
                                        <td class="text-right" colspan="3">Total products (tax excl.)</td>
                                        <td id="total_product" class="price" colspan="1">$<c:out value="${total}"></c:out></td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="3">Total shipping</td>
                                        <td id="total_shipping" class="price" colspan="1">$2.00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="3">Total vouchers (tax excl.)</td>
                                        <td class="price" colspan="1">$0.00</td>
                                    </tr>
                                    <tr>
                                        <td class="total-price-container text-right" colspan="3">
                                            <span>Total</span>
                                        </td>
                                        <td id="total-price-container" class="price" colspan="1">
                                            <span id="total-price">$<c:out value="${total+2}"></c:out></span>
                                        </td>
                                    </tr>
                                </tfoot>		
                                <!-- TABLE FOOTER END -->									
                            </table>
                            <!-- TABLE END -->
                        </div>
                        <!-- CART TABLE_BLOCK END -->
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="first_item primari-box mycartaddress-info">
                            <!-- SINGLE ADDRESS START -->
                            <ul class="address">
                                <li>
                                    <h3 class="page-subheading box-subheading">
                                        Delivery address (BootExperts Office)
                                    </h3>
                                </li>
                                <li><span class="address_name">BootExperts</span></li>
                                <li><span class="address_company">Web development Company</span></li>
                                <li><span class="address_address1">Bonossri</span></li>
                                <li><span class="address_address2">D-Block</span></li>
                                <li><span class="">Rampura</span></li>
                                <li><span class="">Dhaka</span></li>
                                <li><span class="address_phone">+880 1735161598</span></li>
                                <li><span class="address_phone_mobile">+880 1975161598</span></li>
                            </ul>	
                            <!-- SINGLE ADDRESS END -->
                        </div>						
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="second_item primari-box mycartaddress-info">
                            <!-- SINGLE ADDRESS START -->
                            <ul class="address">
                                <li>
                                    <h3 class="page-subheading box-subheading">
                                        Invoice address (BootExperts Home)
                                    </h3>
                                </li>
                                <li><span class="address_name">BootExperts</span></li>
                                <li><span class="address_company">Web development Company</span></li>
                                <li><span class="address_address1">Dhaka</span></li>
                                <li><span class="address_address2">Bonossri</span></li>
                                <li><span class="">Dhaka-1205</span></li>
                                <li><span class="">Rampura</span></li>
                                <li><span class="address_phone">+880 1735161598</span></li>
                                <li><span class="address_phone_mobile">+880 1975161598</span></li>
                            </ul>	
                            <!-- SINGLE ADDRESS END -->
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- RETURNE-CONTINUE-SHOP START -->
                        <div class="returne-continue-shop">
                            <a href="index.jsp" class="continueshoping"><i class="fa fa-chevron-left"></i>Continue shopping</a>
                            <a href="checkout-signin.html" class="procedtocheckout">Proceed to checkout<i class="fa fa-chevron-right"></i></a>
                        </div>	
                        <!-- RETURNE-CONTINUE-SHOP END -->						
                    </div>
                </div>
            </div>
        </section>
        <!-- MAIN-CONTENT-SECTION END -->
        <!-- COMPANY-FACALITY START -->
        <section class="company-facality">
            <div class="container">
                <div class="row">
                    <div class="company-facality-row">
                        <!-- SINGLE-FACALITY START -->
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="single-facality">
                                <div class="facality-icon">
                                    <i class="fa fa-rocket"></i>
                                </div>
                                <div class="facality-text">
                                    <h3 class="facality-heading-text">FREE SHIPPING</h3>
                                    <span>on order over $100</span>
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-FACALITY END -->
                        <!-- SINGLE-FACALITY START -->
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="single-facality">
                                <div class="facality-icon">
                                    <i class="fa fa-umbrella"></i>
                                </div>
                                <div class="facality-text">
                                    <h3 class="facality-heading-text">24/7 SUPPORT</h3>
                                    <span>online consultations</span>
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-FACALITY END -->
                        <!-- SINGLE-FACALITY START -->						
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="single-facality">
                                <div class="facality-icon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <div class="facality-text">
                                    <h3 class="facality-heading-text">DAILY UPDATES</h3>
                                    <span>Check out store for latest</span>
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-FACALITY END -->
                        <!-- SINGLE-FACALITY START -->						
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="single-facality">
                                <div class="facality-icon">
                                    <i class="fa fa-refresh"></i>
                                </div>
                                <div class="facality-text">
                                    <h3 class="facality-heading-text">30-DAY RETURNS</h3>
                                    <span>moneyback guarantee</span>
                                </div>
                            </div>
                        </div>		
                        <!-- SINGLE-FACALITY END -->					
                    </div>
                </div>
            </div>
        </section>
        <!-- COMPANY-FACALITY END -->
        <jsp:include page="footer.jsp" /> 
        <!-- JS 
        ===============================================-->
        <!-- jquery js -->
        <script src="assets/js/vendor/jquery-1.11.3.min.js"></script>

        <!-- fancybox js -->
        <script src="assets/js/jquery.fancybox.js"></script>

        <!-- bxslider js -->
        <script src="assets/js/jquery.bxslider.min.js"></script>

        <!-- meanmenu js -->
        <script src="assets/js/jquery.meanmenu.js"></script>

        <!-- owl carousel js -->
        <script src="assets/js/owl.carousel.min.js"></script>

        <!-- nivo slider js -->
        <script src="assets/js/jquery.nivo.slider.js"></script>

        <!-- jqueryui js -->
        <script src="assets/js/jqueryui.js"></script>

        <!-- bootstrap js -->
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- wow js -->
        <script src="assets/js/wow.js"></script>		
        <script>
            new WOW().init();
        </script>

        <!-- Google Map js -->
        <script src="https://maps.googleapis.com/maps/api/js"></script>	
        <script>
            function initialize() {
                var mapOptions = {
                    zoom: 8,
                    scrollwheel: false,
                    center: new google.maps.LatLng(35.149868, -90.046678)
                };
                var map = new google.maps.Map(document.getElementById('googleMap'),
                        mapOptions);
                var marker = new google.maps.Marker({
                    position: map.getCenter(),
                    map: map
                });

            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <!-- main js -->
        <script src="assets/js/main.js"></script>
    </body>

</html>
