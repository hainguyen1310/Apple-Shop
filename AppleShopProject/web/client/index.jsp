<!doctype html>
<!--[if IE]><![endif]-->
<!--[if lt IE 7 ]> <html lang="en" class="ie6">    <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7">    <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8">    <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9">    <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
    <jsp:useBean id="listNews" class="java.util.ArrayList" scope="session"/>
    <jsp:useBean id="listProduct" class="java.util.ArrayList" scope="session"/>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Home</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon
        ============================================ -->
        <link rel="shortcut icon" type="image/x-icon" href="/client/assets/img/favicon.png">

        <!-- FONTS
        ============================================ -->	
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'> 
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bitter:400,700,400italic&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>

        <!-- animate CSS
        ============================================ -->
        <link rel="stylesheet" href="/client/assets/css/animate.css">		

        <!-- FANCYBOX CSS
        ============================================ -->			
        <link rel="stylesheet" href="/client/assets/css/jquery.fancybox.css">	

        <!-- BXSLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="/client/assets/css/jquery.bxslider.css">			

        <!-- MEANMENU CSS
        ============================================ -->			
        <link rel="stylesheet" href="/client/assets/css/meanmenu.min.css">	

        <!-- JQUERY-UI-SLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="/client/assets/css/jquery-ui-slider.css">		

        <!-- NIVO SLIDER CSS
        ============================================ -->			
        <link rel="stylesheet" href="/client/assets/css/nivo-slider.css">

        <!-- OWL CAROUSEL CSS 	
        ============================================ -->	
        <link rel="stylesheet" href="/client/assets/css/owl.carousel.css">

        <!-- OWL CAROUSEL THEME CSS 	
        ============================================ -->	
        <link rel="stylesheet" href="/client/assets/css/owl.theme.css">

        <!-- BOOTSTRAP CSS 
        ============================================ -->	
        <link rel="stylesheet" href="/client/assets/css/bootstrap.min.css">

        <!-- FONT AWESOME CSS 
        ============================================ -->
        <link rel="stylesheet" href="/client/assets/css/font-awesome.min.css">

        <!-- NORMALIZE CSS 
        ============================================ -->
        <link rel="stylesheet" href="/client/assets/css/normalize.css">

        <!-- MAIN CSS 
        ============================================ -->
        <link rel="stylesheet" href="/client/assets/css/main.css">

        <!-- STYLE CSS 
        ============================================ -->
        <link rel="stylesheet" href="/client/assets/css/style.css">

        <!-- RESPONSIVE CSS 
        ============================================ -->
        <link rel="stylesheet" href="/client/assets/css/responsive.css">

        <!-- IE CSS 
        ============================================ -->
        <link rel="stylesheet" href="/client/assets/css/ie.css">

        <!-- MODERNIZR JS 
        ============================================ -->
        <script src="/client/assets/js/vendor/modernizr-2.6.2.min.js"></script>
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
                    <!-- MAIN-SLIDER-AREA START -->
                    <div class="main-slider-area">
                        <!-- SLIDER-AREA START -->
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <div class="slider-area">
                                <div id="wrapper">
                                    <div class="slider-wrapper">
                                        <div id="mainSlider" class="nivoSlider">
                                            <img src="/client/assets/img/slider/2.jpg" alt="main slider" title="#htmlcaption"/>
                                            <img src="/client/assets/img/slider/1.jpg" alt="main slider" title="#htmlcaption2"/>
                                        </div>
                                        <div id="htmlcaption" class="nivo-html-caption slider-caption">
                                            <div class="slider-progress"></div>
                                            <div class="slider-cap-text slider-text1">
                                                <div class="d-table-cell">
                                                    <h2 class="animated bounceInDown">BEST THEMES</h2>
                                                    <p class="animated bounceInUp">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod ut laoreet dolore magna aliquam erat volutpat.</p>	
                                                    <a class="wow zoomInDown" data-wow-duration="1s" data-wow-delay="1s" href="#">Read More <i class="fa fa-caret-right"></i></a>													
                                                </div>
                                            </div>
                                        </div>
                                        <div id="htmlcaption2" class="nivo-html-caption slider-caption">
                                            <div class="slider-progress"></div>
                                            <div class="slider-cap-text slider-text2">
                                                <div class="d-table-cell">
                                                    <h2 class="animated bounceInDown">BEST THEMES</h2>
                                                    <p class="animated bounceInUp">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod ut laoreet dolore magna aliquam erat volutpat.</p>	
                                                    <a class="wow zoomInDown" data-wow-duration="1s" data-wow-delay="1s" href="#">Read More <i class="fa fa-caret-right"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>								
                            </div>							
                        </div>
                        <!-- SLIDER-AREA END -->
                        <!-- SLIDER-RIGHT START -->
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="slider-right zoom-img m-top">
                                <a href="#"><img class="img-responsive" src="/client/assets/img/product/cms11.jpg" alt="sidebar left" /></a>
                            </div>
                        </div>
                        <!-- SLIDER-RIGHT END -->
                    </div>
                    <!-- MAIN-SLIDER-AREA END -->
                </div>
                <!-- TOW-COLUMN-PRODUCT START -->
                <div class="row tow-column-product">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <!-- NEW-PRODUCT-AREA START -->
                        <div class="new-product-area">
                            <div class="left-title-area">
                                <h2 class="left-title">New Products</h2>
                            </div>						
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <!-- NEW-PRO-CAROUSEL START -->
                                        <div class="new-pro-carousel">
                                            <!-- NEW-PRODUCT-SINGLE-ITEM START -->
                                            <c:forEach var="i" begin="0" end="${listProduct.size()-1}">
                                            <div class="item">
                                                <div class="new-product">
                                                    <div class="single-product-item">
                                                        <div class="product-image">
                                                            <c:set var="anhproductURL" value="${pageContext.request.contextPath}/client/assets/img/product/${listProduct[i].imageURL}" />
                                                <a href="#"><img src="${anhproductURL}" alt="product-image" /></a>
                                                            <a href="#" class="new-mark-box">new</a>
                                                            <div class="overlay-content">
                                                                <ul>
                                                                    <li><a href="#" title="Quick view"><i class="fa fa-search"></i></a></li>
                                                                    <li><a href="#" title="Quick view"><i class="fa fa-shopping-cart"></i></a></li>
                                                                    <li><a href="#" title="Quick view"><i class="fa fa-retweet"></i></a></li>
                                                                    <li><a href="#" title="Quick view"><i class="fa fa-heart-o"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <div class="customar-comments-box">
                                                                <div class="rating-box">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-half-empty"></i>
                                                                    <i class="fa fa-star-half-empty"></i>
                                                                </div>
                                                                <div class="review-box">
                                                                    <span>1 Review (s)</span>
                                                                </div>
                                                            </div>
                                                            <a href="CartServlet?page=single-product.jsp&id=${listProduct.get(i).getProductID()}"><c:out value="${listProduct.get(i).getProductName()}"/></a>
                                                            <div class="price-box">
                                                                <span class="price"><c:out value="${listProduct.get(i).getMoney()}"/></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            <!-- NEW-PRODUCT-SINGLE-ITEM END -->									
                                        </div>
                                        <!-- NEW-PRO-CAROUSEL END -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- NEW-PRODUCT-AREA END -->
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <!-- SALE-PRODUCTS START -->
                        <div class="Sale-Products">
                            <div class="left-title-area">
                                <h2 class="left-title">Sale Products</h2>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <!-- SALE-CAROUSEL START -->
                                        <div class="sale-carousel">
                                            <!-- SALE-PRODUCTS-SINGLE-ITEM START -->
                                            <c:forEach var="i" begin="0" end="${listProduct.size()-1}">
                                            <div class="item">
                                                <div class="new-product">
                                                    <div class="single-product-item">
                                                        <div class="product-image">
                                                            <c:set var="anhproductURL" value="${pageContext.request.contextPath}/client/assets/img/product/${listProduct[i].imageURL}" />
                                                            <a href="#"><img src="${anhproductURL}" alt="product-image" /></a>
                                                            <a href="#" class="new-mark-box">new</a>
                                                            <div class="overlay-content">
                                                                <ul>
                                                                    <li><a href="#" title="Quick view"><i class="fa fa-search"></i></a></li>
                                                                    <li><a href="#" title="Quick view"><i class="fa fa-shopping-cart"></i></a></li>
                                                                    <li><a href="#" title="Quick view"><i class="fa fa-retweet"></i></a></li>
                                                                    <li><a href="#" title="Quick view"><i class="fa fa-heart-o"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="product-info">
                                                            <div class="customar-comments-box">
                                                                <div class="rating-box">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star-half-empty"></i>
                                                                    <i class="fa fa-star-half-empty"></i>
                                                                </div>
                                                                <div class="review-box">
                                                                    <span>1 Review (s)</span>
                                                                </div>
                                                            </div>
                                                            <a href="CartServlet?page=single-product.jsp&id=${listProduct.get(i).getProductID()}"><c:out value="${listProduct.get(i).getProductName()}"/></a>
                                                            <div class="price-box">
                                                                <span class="price"><c:out value="${listProduct.get(i).getMoney()}"/></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                            <!-- SALE-PRODUCTS-SINGLE-ITEM END -->									
                                        </div>
                                        <!-- SALE-CAROUSEL END -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- SALE-PRODUCTS END -->
                    </div>
                </div>
                <div class="row">
                    <!-- FEATURED-PRODUCTS-AREA START -->
                    <div class="featured-products-area">
                        <div class="center-title-area">
                            <h2 class="center-title">Featured Products</h2>
                        </div>	
                        <div class="col-xs-12">
                            <div class="row">
                                <!-- FEARTURED-CAROUSEL START -->
                                <div class="feartured-carousel">
                                    <!-- SINGLE-PRODUCT-ITEM START -->
                                    <c:forEach var="i" begin="0" end="${listProduct.size()-1}">
                                    <div class="item">
                                        <div class="single-product-item">
                                            <div class="product-image">
                                                <c:set var="anhproductURL" value="${pageContext.request.contextPath}/client/assets/img/product/${listProduct[i].imageURL}" />
                                                <a href="#"><img src="${anhproductURL}" alt="product-image" /></a>
                                                <a href="#" class="new-mark-box">new</a>
                                                <div class="overlay-content">
                                                    <ul>
                                                        <li><a href="#" title="Quick view"><i class="fa fa-search"></i></a></li>
                                                        <li><a href="#" title="Quick view"><i class="fa fa-shopping-cart"></i></a></li>
                                                        <li><a href="#" title="Quick view"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#" title="Quick view"><i class="fa fa-heart-o"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-info">
                                                <div class="customar-comments-box">
                                                    <div class="rating-box">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-half-empty"></i>
                                                    </div>
                                                    <div class="review-box">
                                                        <span>1 Review (s)</span>
                                                    </div>
                                                </div>
                                                <a href="CartServlet?page=single-product.jsp&id=${listProduct.get(i).getProductID()}"><c:out value="${listProduct.get(i).getProductName()}"/></a>
                                                <div class="price-box">
                                                    <span class="price"><c:out value="${listProduct.get(i).getMoney()}"/></span>
                                                </div>
                                            </div>
                                        </div>							
                                    </div>
                                    </c:forEach>
                                    <!-- SINGLE-PRODUCT-ITEM END -->							
                                </div>
                                <!-- FEARTURED-CAROUSEL END -->
                            </div>
                        </div>						
                    </div>
                    <!-- FEATURED-PRODUCTS-AREA END -->
                </div>
            </div>
        </section>
        <!-- MAIN-CONTENT-SECTION END -->
        <!-- LATEST-NEWS-AREA START -->
        <section class="latest-news-area">
            <div class="container">
                <div class="row">
                    <div class="latest-news-row">
                        <div class="center-title-area">
                            <h2 class="center-title"><a href="#">latest news</a></h2>
                        </div>	
                        <div class="col-xs-12">
                            <div class="row">
                                <!-- LATEST-NEWS-CAROUSEL START -->
                                <div class="latest-news-carousel">
                                    <!-- LATEST-NEWS-SINGLE-POST START -->
                                    <c:forEach var="i" begin="0" end="${listNews.size()-1}">
                                        <div class="item">
                                            <div class="latest-news-post">
                                                <div class="single-latest-post">
                                                    <c:set var="anhURL" value="${pageContext.request.contextPath}/client/assets/img/product/${listNews[i].imageURL}" />
                                                    <a href="#"><img src="${anhURL}" alt="latest-post" /></a>
                                                    <h2><a href="#"><c:out value="${listNews.get(i).getTitle()}"/></a></h2>
                                                    <p><c:out value="${listNews.get(i).getDescription()}"/></p>
                                                    <div class="latest-post-info">
                                                        <i class="fa fa-calendar"></i><span><c:out value="${listNews.get(i).getDateUpdate()}"/></span>
                                                    </div>
                                                    <div class="read-more">
                                                        <a href="#">Read More <i class="fa fa-long-arrow-right"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- LATEST-NEWS-SINGLE-POST END -->									
                                </div>	
                                <!-- LATEST-NEWS-CAROUSEL START -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- LATEST-NEWS-AREA END -->
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
        <script src="/client/assets/js/vendor/jquery-1.11.3.min.js"></script>

        <!-- fancybox js -->
        <script src="/client/assets/js/jquery.fancybox.js"></script>

        <!-- bxslider js -->
        <script src="/client/assets/js/jquery.bxslider.min.js"></script>

        <!-- meanmenu js -->
        <script src="/client/assets/js/jquery.meanmenu.js"></script>

        <!-- owl carousel js -->
        <script src="/client/assets/js/owl.carousel.min.js"></script>

        <!-- nivo slider js -->
        <script src="/client/assets/js/jquery.nivo.slider.js"></script>

        <!-- jqueryui js -->
        <script src="/client/assets/js/jqueryui.js"></script>

        <!-- bootstrap js -->
        <script src="/client/assets/js/bootstrap.min.js"></script>

        <!-- wow js -->
        <script src="/client/assets/js/wow.js"></script>		
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
        <script src="/client/assets/js/main.js"></script>
    </body>
</html>