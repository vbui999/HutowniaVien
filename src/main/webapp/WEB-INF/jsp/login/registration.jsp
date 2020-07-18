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
				<div style="width: 33.333%; height: 10px; float: left"></div>
				<div class="col-sm-4" style="width: 33.333%">
					<div class="signup-form">
						<!--sign up form-->
						<h2>New User Signup!</h2>
						<form:form method="POST" modelAttribute="userForm" class="form-signin">
							<spring:bind path="username">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<form:input type="text" path="username" class="form-control" placeholder="Username" autofocus="true"></form:input>
									<form:errors path="username"></form:errors>
								</div>
							</spring:bind>

							<spring:bind path="password">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
									<form:errors path="password"></form:errors>
								</div>
							</spring:bind>

							<spring:bind path="passwordConfirm">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<form:input type="password" path="passwordConfirm" class="form-control" placeholder="Confirm your password"></form:input>
									<form:errors path="passwordConfirm"></form:errors>
								</div>
							</spring:bind>

							<!-- <input type="email" placeholder="Email Address" />
							<input type="password" placeholder="Password" /> -->
							<button type="submit" class="btn btn-default">Signup</button>
						</form:form>
					</div>

					<!--/sign up form-->
				</div>
				<div style="width: 33.333%; height: 10px; float: left"></div>
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