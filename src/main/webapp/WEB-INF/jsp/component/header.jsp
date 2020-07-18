<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header id="header">
	<!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-phone"></i> +48 788 390 565</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i> hurtowniavien899@gmail.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header_top-->

	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-md-4 clearfix">
					<div class="logo pull-left">
						<a href="/"><img width="250px" src='<c:url value ="/template/user_tpl/images/home/logo.JPG"/>' alt="" /></a>
					</div>
				</div>
				<div class="col-md-8 clearfix">
					<div class="shop-menu clearfix pull-right">
						<ul class="nav navbar-nav">
							<li><c:if test="${pageContext.request.userPrincipal.name != null}">
									<a href="/myaccount" style="color: #ff6a00"><i class="fa fa-user"></i>Hi! ${pageContext.request.userPrincipal.name}</a>
								</c:if> 
								<c:if test="${pageContext.request.userPrincipal.name eq null}">
									<a href=""><i class="fa fa-user"></i>Account</a>
								</c:if></li>
							<li><a href="checkout"><i class="fa fa-crosshairs"></i>Checkout</a></li>
							<c:if test="${sessionScope.myCartTotal != sessionScope.myCartTotalTest}">
								<li class="dropdown"><a href="/cart" style="color: #ff6a00" ><i class="fa fa-shopping-cart"></i>Cart<span class="notify">${sessionScope.numberOfProducts}</span><i class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li>
											
												<div class="shopping_cart" style="float: left; color: white;">
													<c:forEach var="map" items="${sessionScope.myCartItems}">
													
														<ul class="cart_box" style="padding-inline-start:0px; padding-top: 10px">
																<li class="list_img" style="width: 20%; float: left;">
																	<img src="<c:url value="${map.value.product.imgurlbig}"/>" width="50px" class="img-responsive" alt="">
																</li>
																<li class="list_desc" style="width: 80%; padding-top: 0px">
																	<h4>
																		<a href="#"><c:out value="${map.value.product.name}" /></a>
																	</h4>
																	<c:out value="${map.value.quantity}" /> x <c:out value="${map.value.product.price}" /> zł
																	= <span class="actual"><c:out value="${map.value.quantity * map.value.product.price}" /> zł</span>
																</li>
														</ul>
													</c:forEach>
												</div>
												<div class="total" style="float: right; color: white;">
													<div >Total: ${sessionScope.myCartTotal} zł</div>
												</div>
												<div class="login_buttons" style="float: left; color: white; background: #ff6a00; padding: 8px">
													<div class="check_button">
														<a href="checkout.html">Check out</a>
													</div>
												</div>
											
										</li>
									</ul>
								</li>
							</c:if>
							<c:if test="${sessionScope.myCartTotal eq sessionScope.myCartTotalTest}">
								<li class="dropdown"><a href="/cart" ><i class="fa fa-shopping-cart"></i>Cart<i class="fa fa-angle-down"></i></a>
							</c:if>
							

							<li><c:if test="${pageContext.request.userPrincipal.name != null}">
									<form id="logoutForm" method="POST" action="${contextPath}/logout">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form>

									<li style="float: right"><a style="color: #ff6a00" onclick="document.forms['logoutForm'].submit()"><i class="fa fa-lock"></i>Logout</a></li>
								</c:if> <c:if test="${pageContext.request.userPrincipal.name eq null}">
									<a href="/login"><i class="fa fa-lock"></i>Login</a>
								</c:if>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="/" class="active">Home</a></li>
							<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="/shop">Products</a></li>
									<li><a href="/product-details">Product Details</a></li>
									<li><a href="/checkout">Checkout</a></li>
									<li><a href="/cart">Cart</a></li>
									<li><a href="/login">Login</a></li>
								</ul></li>
							<li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="blog.html">Blog List</a></li>
									<li><a href="blog-single.html">Blog Single</a></li>
								</ul></li>
							<li><a href="/404">404</a></li>
							<li><a href="/contact-us">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3" style="padding-right: 0px">
					<div class="search_box pull-right">
						<input type="text" placeholder="Search" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom-->
</header>