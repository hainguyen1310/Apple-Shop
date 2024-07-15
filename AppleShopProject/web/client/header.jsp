<%-- 
    Document   : header
    Created on : Jul 15, 2024, 7:06:38 AM
    Author     : kivil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- HEADER-TOP START -->
		<div class="header-top">
			<div class="container">
				<div class="row">
					<!-- HEADER-LEFT-MENU START -->
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="header-left-menu">
							<div class="welcome-info">
								Welcome <span>BootExperts</span>
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
										<a title="Euro (EUR)" href="#">Euro (EUR)</a>
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
										<a href="#" title="Français (French)">
											<span>Français</span>
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
							<nav>
								<ul class="list-inline">
									<li><a href="/client/checkout.html">Check Out</a></li>
									<li><a href="/client/my-account.html">My Account</a></li>
									<li><a href="/client/cart.html">My Cart</a></li>
                                                                        <li><a href="/client/registration.html">Sign in</a></li>
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
										<option value="2">--Women</option>
										<option value="3">---T-Shirts</option>
										<option value="4">--Men</option>
										<option value="5">----Shoose</option>
										<option value="6">--Dress</option>
										<option value="7">----Tops</option>
										<option value="8">---Casual</option>
										<option value="9">--Evening</option>
										<option value="10">--Summer</option>
										<option value="11">---sports</option>
										<option value="12">--day</option>
										<option value="13">--evening</option>
										<option value="14">-----Blouse</option>
										<option value="15">--handba</option>
										<option value="16">--phone</option>
										<option value="17">-house</option>
										<option value="18">--Beauty</option>
										<option value="19">--health</option>
										<option value="20">---clothing</option>
										<option value="21">---kids</option>
										<option value="22">--Dresse</option>
										<option value="22">---Casual</option>
										<option value="23">--day</option>
										<option value="24">--evening</option>
										<option value="24">---Blouse</option>
										<option value="25">-handb</option>
										<option value="66">--phone</option>
										<option value="27">---house</option>									
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
									<span class="ajax-cart-quantity">2</span>
								</a>
								<div class="shipping-cart-overly">
									<div class="shipping-item">
										<span class="cross-icon"><i class="fa fa-times-circle"></i></span>
										<div class="shipping-item-image">
											<a href="#"><img src="/client/assets/img/shopping-image.jpg" alt="shopping image" /></a>
										</div>
										<div class="shipping-item-text">
											<span>2 <span class="pro-quan-x">x</span> <a href="#" class="pro-cat">Watch</a></span>
											<span class="pro-quality"><a href="#">S,Black</a></span>
											<p>$22.95</p>
										</div>
									</div>
									<div class="shipping-item">
										<span class="cross-icon"><i class="fa fa-times-circle"></i></span>
										<div class="shipping-item-image">
											<a href="#"><img src="/client/assets/img/shopping-image2.jpg" alt="shopping image" /></a>
										</div>
										<div class="shipping-item-text">
											<span>2 <span class="pro-quan-x">x</span> <a href="#" class="pro-cat">Women Bag</a></span>
											<span class="pro-quality"><a href="#">S,Gary</a></span>
											<p>$19.95</p>
										</div>
									</div>
									<div class="shipping-total-bill">
										<div class="cart-prices">
											<span class="shipping-cost">$2.00</span>
											<span>Shipping</span>
										</div>
										<div class="total-shipping-prices">
											<span class="shipping-total">$24.95</span>
											<span>Total</span>
										</div>										
									</div>
									<div class="shipping-checkout-btn">
										<a href="/client/checkout.html">Check out <i class="fa fa-chevron-right"></i></a>
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
										<a href="/client/shop-gird.html">clothing</a>
										<!-- DRODOWN-MEGA-MENU START -->	
										<div class="drodown-mega-menu">
											<div class="left-mega col-xs-6">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">TOPS</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">new product</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
											</div>
											<div class="right-mega col-xs-6">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">Prodect</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Watch</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">best sale month</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
											</div>
										</div>	
										<!-- DRODOWN-MEGA-MENU END -->										
									</li>
									<li>
										<a href="/client/shop-gird.html">Tops</a>
										<!-- DRODOWN-MEGA-MENU START -->
										<div class="drodown-mega-menu">
											<div class="left-mega col-xs-4">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">TOPS</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
											</div>
											<div class="right-mega col-xs-4">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">best sale month</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
											</div>
											<div class="right-mega col-xs-4">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">top rate product</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
											</div>
											<div class="left-mega col-xs-6">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">Latest product</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
											</div>	
											<div class="left-mega col-xs-6">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">popular product</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
											</div>											
										</div>
										<!-- DRODOWN-MEGA-MENU END -->
									</li>
									<li>
										<a href="/client/shop-gird.html">T-shirts</a>
										<!-- DRODOWN-MEGA-MENU START -->
										<div class="drodown-mega-menu">
											<div class="left-mega col-xs-6">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">TOPS</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">new product</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
											</div>
											<div class="right-mega col-xs-6">
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">Prodect</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Watch</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
													</ul>
												</div>
												<div class="mega-menu-list">
													<a class="mega-menu-title" href="/client/shop-gird.html">best sale month</a>
													<ul>
														<li><a href="/client/shop-gird.html">T-shirts</a></li>
														<li><a href="/client/shop-gird.html">clothing</a></li>
														<li><a href="/client/shop-gird.html">Delivery</a></li>
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