<%-- 
    Document   : single-product
    Created on : Jul 15, 2024, 11:35:25 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Product"%>
<%@page import="Model.Bags"%>
<%@page import="ModelDao.ProductDao"%>
<%@page import="ModelDao.BagsDao"%>
<jsp:useBean id="listBags" class="java.util.ArrayList" scope="session"/>
<jsp:useBean id="product" class="Model.Product" scope="session"/>
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
        <title>Single Product</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon
        ============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

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
                        <!-- SINGLE-PRODUCT-DESCRIPTION START -->
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12">
                                <div class="single-product-view">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="thumbnail_1">
                                            <div class="single-product-image">
                                                <c:set var="url" value="${pageContext.request.contextPath}/client/assets/img/product/${product.getImageURL()}"></c:set>
                                                <img src="${url}" alt="single-product-image" />
                                                <a class="new-mark-box" href="#">new</a>
                                                <a class="fancybox" href="${url}" data-fancybox-group="gallery"><span class="btn large-btn">View larger <i class="fa fa-search-plus"></i></span></a>
                                            </div>	
                                        </div>
                                    </div>										
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-8 col-xs-12">
                                <div class="single-product-descirption">
                                    <h2>${product.getProductName()}</h2>
                                    <div class="single-product-social-share">
                                        <ul>
                                            <li><a href="#" class="twi-link"><i class="fa fa-twitter"></i>Tweet</a></li>
                                            <li><a href="#" class="fb-link"><i class="fa fa-facebook"></i>Share</a></li>
                                            <li><a href="#" class="g-plus-link"><i class="fa fa-google-plus"></i>Google+</a></li>
                                        </ul>
                                    </div>
                                    <div class="single-product-review-box">
                                        <div class="rating-box">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-empty"></i>
                                        </div>
                                        <div class="read-reviews">
                                            <a href="#">Read reviews (1)</a>
                                        </div>
                                        <div class="write-review">
                                            <a href="#">Write a review</a>
                                        </div>		
                                    </div>
                                    <div class="single-product-price">
                                        <h2>$<c:out value="${product.getMoney()}"></c:out></h2>
                                        </div>
                                        <div class="single-product-desc">
                                            <p><c:out value="${product.getDescription()}"></c:out></p>
                                            <div class="product-in-stock">
                                                <p><c:out value="${product.getStock()}"></c:out> Items<span>In stock</span></p>
                                            </div>
                                        </div>
                                        <div class="single-product-info">
                                            <a href="#"><i class="fa fa-envelope"></i></a>
                                            <a href="#"><i class="fa fa-print"></i></a>
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                        </div>
                                        <form action="CartServlet" method="post">
                                            <input type="hidden" name="id" class="form-control" value="${product.getProductID()}"/>
                                            <div class="single-product-quantity">
                                                <p class="small-title">Quantity</p> 
                                                <div class="cart-quantity">
                                                    <div class="cart-plus-minus-button single-qty-btn">
                                                        <input class="cart-plus-minus sing-pro-qty" type="number" name="qtybutton" value="1" min="1" max="${product.getStock()}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="single-product-add-cart">
                                            <button type="submit" class="add-cart-text btn main-btn" title="Add to cart">
                                                <span>
                                                    <i class="fa fa-lock submit-icon"></i> Add to cart
                                                </span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-PRODUCT-DESCRIPTION END -->
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
