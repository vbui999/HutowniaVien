<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | Hurtownia Vien</title>

<link href="<c:url value="/template/user_tpl/images/ico/favicon.ico"/>" rel="shortcut icon">
<link href="<c:url value="/template/user_tpl/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/font-awesome.min.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/prettyPhoto.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/price-range.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/animate.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/main.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/responsive.css"/>" rel="stylesheet">

</head>
<body>
	<!-- /start header -->
	<%@include file="../component/header.jsp"%>
	<!-- end header/ -->

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<!-- /start category -->
						<%@include file="../component/category.jsp"%>
						<!-- end category/ -->

					</div>
				</div>
				<div class="col-sm-9 padding-right" style="margin-left: -40px">
						<ul>
							<li style="float: left; padding: 10px; color: black; padding-right: 0"><a href="/">Home / </a></li>
							<li style="float: left; padding: 10px; color: black"><a href="/category/${category.catename}?type=${productById.type}">${category.catefullname} / </a></li>							
						</ul>
						
				</div>
				<div class="col-sm-9 padding-right">
					<!--product details/  -->
					<div class="product-details">
						<div class="col-sm-5">
							<div class="view-product">
								<img src="<c:url value="${productById.imgurlbig}"/>" alt="" />
								<h3>ZOOM</h3>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="product-information">
								<img src="<c:url value="/template/user_tpl/images/product-details/new.jpg"/>" class="newarrival" alt="" />
								<h2>${productById.name}</h2>
								<span> 
									<span>${productById.price} zł</span> 							
								</span>
								<script type="text/javascript">
									var quantity = 0;
									if(${productById.carton}==0){
										var quantity = ${productById.pack};
										document.getElementById("addToCart").setAttribute('href', '/cart/add/');
									}else{
										var quantity = ${productById.carton};
										document.getElementById("addToCart").setAttribute('href', '/cart/add/');
									}
									function addQuantity(){
										var currentValue = document.getElementById("add-quantity").value*1;
										var newValue = currentValue + quantity;
										document.getElementById("add-quantity").setAttribute('value', newValue);
										
									}
									function minusQuantity(){
										var currentValue = document.getElementById("add-quantity").value*1;
										if(currentValue > quantity){
											var newValue = currentValue - quantity;
											document.getElementById("add-quantity").setAttribute('value', newValue);
										}
									}
								</script>
								<p>
									<label style="min-width: 30%">Quantity</label> 
									<button onclick="minusQuantity()" style="height: 33px; padding-top: 4px; width: 30px"><i class="fa fa-minus"></i></button>
									<c:if test="${productById.pack eq 0}">
										<input disabled="disabled" type="text" value="${productById.carton}" class="add-quantity" id ="add-quantity">
									</c:if>
									<c:if test="${productById.carton eq 0}">
									 	<input disabled="disabled" type="text" value="${productById.pack}" class="add-quantity" id ="add-quantity">
									</c:if>
									<button onclick="addQuantity()" style="height: 33px; padding-top: 4px; width: 30px"><i class="fa fa-plus"></i></button>
								</p>
								<p>
									<label style="min-width: 30%">Availability</label>: Yes
								</p>
								<p>
									<label style="min-width: 30%">Size</label>: ${productById.size}
								</p>
								<c:if test="${productById.pack eq 0}">
									<p>
										<label style="min-width: 30%">Min Szt/Karton</label>: ${productById.carton}
									</p>
								</c:if>
								<c:if test="${productById.carton eq 0}">
									<p>
										<label style="min-width: 30%">Min Szt/Pack</label>: ${productById.pack}
									</p>
								</c:if>
								<script type="text/javascript">
									function addToCart(){
										var orderNumber = document.getElementById("add-quantity").value;
										var link = '/cart/add/'+${productById.id}+'/'+ orderNumber;
										window.location.href = link;
									}
								</script>
								<button type="button" class="btn btn-fefault cart" onclick="addToCart()">
										<a class="my-buton"  style="color: white;" href="#"><i class=" fa fa-shopping-cart"></i> Dodaj to koszyka </a>
								</button>
								
								<security:authorize access="hasRole('ROLE_ADMIN')">
								<p>
									<a href="/admin/product/${productById.id}">
										<button type="button" class="btn btn-fefault cart">View detail as Admin</button>
									</a>
								</p>
								<p>
								    <b>Provider:</b> ${productById.providername}
								</p>
								<p>
								    <b>Tel:</b> ${productById.providerphone}
								</p>
																
								</security:authorize>
							</div>
						</div>
					</div>
					<!--/product-details-->

					<div class="category-tab shop-details-tab">
						<!--recommended_items-->
						<div class="recommended_items">
							<h2 class="title text-center">Recommended items</h2>
							<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
								<div class="carousel-inner">
									<div class="item active">
									
										<c:forEach items="${top5ListProdduct}" var="top5List">
											<div class="col-sm-4">
											<div class="product-image-wrapper">
												<div class="single-products">
													<div class="productinfo text-center">
														<img src="<c:url value="${top5List.imgurlbig}"/>" alt="" />
														<h2>${top5List.price} zł</h2>
														<a href="/detail/${top5List.uniquename}"><p>${top5List.name}</p></a>
														<a href="/detail/${top5List.uniquename}" class="btn btn-default add-to-cart">
															<i class="fa fa-shopping-cart"></i>Szczegóły
														</a>
														
													</div>

												</div>
											</div>
										</div>
										</c:forEach>
										
										

									</div>
									<!--  end items active-->

									<div class="item">
										<c:forEach items="${top5ListProdduct2}" var="top5List2">
										<div class="col-sm-4">
											<div class="product-image-wrapper">
												<div class="single-products">
													<div class="productinfo text-center">
														<img src="<c:url value="${top5List2.imgurlbig}"/>" alt="" />
														<h2>${top5List2.price} zł</h2>
														<a href="/detail/${top5List2.uniquename}"><p>${top5List2.name}</p></a>
														<a href="/detail/${top5List2.uniquename}" class="btn btn-default add-to-cart">
															<i class="fa fa-shopping-cart"></i>Szczegóły
														</a>
													</div>

												</div>
											</div>
										</div>
										</c:forEach>
									</div>

								</div>
								<a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev"> <i class="fa fa-angle-left"></i>
								</a> <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next"> <i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
						<!--/recommended_items-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--Footer-->
	<%@include file="../component/footer.jsp"%>
	<!--/Footer-->



	<script src="<c:url value="/template/user_tpl/js/jquery.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/jquery.scrollUp.min.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/price-range.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/jquery.prettyPhoto.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/main.js"/>"></script>
	<!-- <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: block;"><i class="fa fa-angle-up"></i></a> -->
</body>
</html>