<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Hurtownia Vien</title>
<link href="<c:url value="/template/user_tpl/images/ico/favicon.ico"/>" rel="shortcut icon">
<link href="<c:url value="/template/user_tpl/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/font-awesome.min.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/prettyPhoto.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/price-range.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/animate.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/main.css"/>" rel="stylesheet">
<link href="<c:url value="/template/user_tpl/css/responsive.css"/>" rel="stylesheet">

</head>
<!--/head-->

<body>
	<!-- /start header -->
	<%@include file="../component/header.jsp"%>
	<!-- end header/ -->

	<section id="form">
		<!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1" style="width: 33.333%">
					<div class="login-form form-group ${error != null ? 'has-error' : ''}">
						<!--login form-->
						<h2>Login to your account</h2>
						<form method="POST" action="/login">
							<span style="color: #43a759">${message}</span> 
							<input name="username" type="text" placeholder="Name" class="form-control" /> 
							<input name="password" type="password" placeholder="Password" class="form-control" /> <span>${error}</span> 
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />						
							<div style="margin-top: 20px; color: black;">
								<span> 
									<input type="checkbox" class="checkbox" name="remember-me" checked="checked"> Remember me
								</span>
							</div>
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div>
					<!--/login form-->
				</div>
				<div class="col-sm-1" style="padding-left: 12px; padding-right: 15px;">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4" style="width: 33.333%; margin-top: 80px">
					<div class="signup-form">
						<!--sign up form-->
						<h2>
							<a href="/registration">Create new account!</a>
						</h2>

					</div>

					<!--/sign up form-->
				</div>
			</div>
		</div>
	</section>
	<!--/form-->

	<footer id="footer">
		<!--Footer-->

		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright 2020</p>
					<p class="pull-right">
						Designed by <span><a target="_blank" href="">Hurtownia Vien</a></span>
					</p>
				</div>
			</div>
		</div>

	</footer>
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