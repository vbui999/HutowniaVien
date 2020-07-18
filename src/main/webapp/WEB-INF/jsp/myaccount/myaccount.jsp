<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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

<style type="text/css">
.col-left-myaccount{
	float: left;
	width: 30%;
}
.col-right-myaccount{
	float: right;
	width: 70%;
}


</style>
</head>
<body>
	<!-- /start header -->
	<%@include file="../component/header.jsp" %>
	<!-- end header/ -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-left-myaccount">
					<ul>
						<li>toan 1</li>
						<li>toan 2</li>
					</ul>
				</div>

				<div class="col-right-myaccount">
					toan
				</div>
			</div>
		</div>
	</section>

	<!--Footer-->
	<%@include file="../component/footer.jsp" %>
	<!--/Footer-->



	<script src="<c:url value="/template/user_tpl/js/jquery.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/bootstrap.min.js"/>"></script>
	<script
		src="<c:url value="/template/user_tpl/js/jquery.scrollUp.min.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/price-range.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/jquery.prettyPhoto.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/main.js"/>"></script>
</body>
</html>