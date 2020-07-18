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

</head>
<body>
	<!-- /start header -->
	<%@include file="../component/header.jsp" %>
	<!-- end header/ -->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<!-- /start category -->
						<%@include file="../component/category.jsp" %>
						<!-- end category/ -->
					</div>
				</div>

				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">${cateFullName}</h2>

						<c:forEach items="${productList}" var="product">
							<div class="col-sm-4">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<a href="/detail/${product.uniquename}"><img src="<c:url value="${product.imgurlbig}"/>" alt="" /></a>
											<h2>${product.price}zł</h2>
											<a href="/detail/${product.uniquename}"><p>${product.name}</p></a>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Szczegóły</a>
										</div>
										<a>
											<img src="<c:url value="/template/user_tpl/images/home/new.png"/>" class="new" alt="" />
										</a>
										
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<!--features_items-->
					<div class="paging-div">
						<c:if test="${totalPages > 1}">
							<a>Total Items: ${totalItems} </a>
							&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<c:if test="${currentPage > 1}">
								<spring:url value="/category/${cateName}/1" var="firstP" />
								<a href="${firstP}">First</a>
							</c:if>
							<c:if test="${currentPage <= 1}">
								<span>First</span>
							</c:if>
							&nbsp;&nbsp;
				
							<c:if test="${currentPage > 1}">
								<spring:url value="/category/${cateName}/${currentPage - 1}" var="previousP" />
								<a href="${previousP}">Previous</a>
							</c:if>
							<c:if test="${currentPage <= 1}">
								<span>Previous</span>
							</c:if>
							&nbsp;&nbsp;
							<c:forEach var="i" begin="1" end="${totalPages}">
								<span> <c:if test="${currentPage != i}">
										<spring:url value="/category/${cateName}/${i}" var="iPage" />
										<a href="${iPage}">${i}</a>
									</c:if> <c:if test="${currentPage eq i}">${i}</c:if>
								</span>
							</c:forEach>
							&nbsp;&nbsp;
							<c:if test="${currentPage < totalPages}">
								<spring:url value="/category/${cateName}/${currentPage + 1}" var="nextP" />
								<a href="${nextP}">Next</a>
								<c:if test="${currentPage >= totalPages}">
									<span>Next</span>
								</c:if>
							</c:if>	
							&nbsp;&nbsp;
							<c:if test="${currentPage < totalPages}">
								<spring:url value="/category/${cateName}/${totalPages}" var="lastP" />
								<a href="${lastP}">Last</a>
							</c:if>
							<c:if test="${currentPage >= totalPages}">
								<span>Last</span>
							</c:if>

						</c:if>
					</div>
				

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
	<script
		src="<c:url value="/template/user_tpl/js/jquery.prettyPhoto.js"/>"></script>
	<script src="<c:url value="/template/user_tpl/js/main.js"/>"></script>
	<!-- <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: block;"><i class="fa fa-angle-up"></i></a> -->
</body>
</html>