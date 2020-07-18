<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
	<!-- start cart-items -->
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ul>
					<li style="float: left; padding: 10px; color: black; padding-right: 0; margin-left: -40px"><a href="/">Home / </a></li>
					<li style="float: left; padding: 10px; color: black"><a href="#">Shopping Cart / </a></li>							
				</ul>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>					
						<c:forEach var="map" items="${sessionScope.myCartItems}">
							<tr>
								<td class="cart_product" style="">
									<a href=""><img src="<c:url value="${map.value.product.imgurlbig}"/>" width="100px" alt=""></a>
								</td>
								<td class="cart_description">
									<h4><a href="/detail/${map.value.product.uniquename }"><c:out value="${map.value.product.name}"/></a></h4>
									<!-- <p>Web ID: 1089772</p> -->
								</td>
								<td class="cart_price">
									<p><c:out value="${map.value.product.price}"/>zł</p>
								</td>
								<td class="cart_quantity">
									<div class="cart_quantity_button">
										<%-- <a class="cart_quantity_down" href="/cart/sub/${map.value.product.id}"> - </a> --%>
										<input style="margin-bottom: 5px" disabled="disabled" class="cart_quantity_input" type="text" name="quantity" value="<c:out value="${map.value.quantity}"/>" autocomplete="off" size="2">
										<%-- <a classs="cart_quantity_up" href="/cart/add/${map.value.product.id}"> + </a> --%>
									</div>
								</td>
								<td class="cart_total">
									<%-- <p class="cart_total_price"><c:out value="${map.value.quantity * map.value.product.price}"/>zł</p> --%>
									<%-- <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${balance}" /> --%>
									<p class="cart_total_price"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${map.value.quantity * map.value.product.price}" />zł</p>
								</td>
								<td class="cart_delete">
									<a class="cart_quantity_delete" href="/cart/remove/${map.value.product.id}"><i class="fa fa-times"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section> 
	<!-- start do_action  -->	
	<section id="do_action">
		<div class="container">
			<div class="row">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<div class="col-sm-6">
						
						<c:if test="${userInfo != null }">
							<div class="chose_area">
								<ul class="user_option">
									<li>
										<label>Imię i Nazwisko*: </label>
										<input type="text" value="${userInfo.fullname }">
										
									</li>
									<li>								
										<label>Telephone*: </label>
										<input type="text" value="${userInfo.phone }">
									</li>
									<li>								
										<label>Email(optional): </label>
										<input type="text" value="${userInfo.email }">
									</li>
									<li class="single_field">
										<label>Miasto:</label>
										<select style="width: 50%">
											<c:if test="${userInfo.miasto eq 'Gorzów Wiekopolski' }">
												<option selected="selected">Grozów Wiekopolski</option>
												<option>Gdynia</option>
											</c:if>
											<c:if test="${userInfo.miasto != 'Gorzów Wiekopolski'}">
												<option>Grozów Wiekopolski</option>
												<option selected="selected">Gdynia</option>
											</c:if>									
										</select>
										
									</li>	
									<li> <a class=" my-button btn btn-default check_out" href="">Update Information</a></li>						
								</ul>
								
							</div>
						</c:if>
						
					</div>
				</c:if>	
				<c:if test="${pageContext.request.userPrincipal.name eq null}">
					<div class="col-sm-4 col-sm-offset-1" style="width: 33.333%">
						<div class="login-form form-group ${error != null ? 'has-error' : ''}">
							<!--login form-->
							<h2>You need to login to buy product!</h2>
							<form method="POST" action="/login">
								<span style="color: #43a759">${message}</span> 
								<input name="username" type="text" placeholder="Name" class="form-control" /> 
								<input name="password" type="password" placeholder="Password" class="form-control" /> <span>${error}</span> 
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />						
								<div>
									<span style="margin-top: 20px; color: black"> <input type="checkbox" class="checkbox" name="remember-me" checked="checked"> Keep me signed in
									</span>
								</div>
								<button type="submit" class="btn btn-default">Login</button>
							</form>
						</div>
					</div>
				</c:if>	
				<c:if test="${sessionScope.myCartTotal != sessionScope.myCartTotalTest}">
					<div class="col-sm-6" style="float: right;">
						<div class="total_area">
							<ul>
								<li>Cart Sub Total: <span>${sessionScope.myCartTotal} zł</span></li>
								<li>VAT (23%): <span><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sessionScope.myCartTotal * 0.23}" /> zł</span></li>
								
								<li>Shipping Cost: <span>Free</span></li>
								<li>Total: <span><c:out value="${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.23)}"/> zł</span></li>
								<li style="background-color: white; margin-left: 0px; padding-left: 0px;">
									<a class=" my-button btn btn-default check_out" href="" style="margin-left: 0px">Check Out</a>
								</li>
							</ul>
								
						</div>
					</div>
				</c:if>			
			</div>
		</div>
	</section>
	<!--/#do_action-->
	<!--/#cart_items-->
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