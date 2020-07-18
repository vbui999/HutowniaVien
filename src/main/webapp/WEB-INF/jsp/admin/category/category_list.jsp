<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý kho</title>

<link href="<c:url value="/template/user_tpl/css/bootstrap.min.css"/>"
	rel="stylesheet" />
<script src="<c:url value="/template/user_tpl/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/user_tpl/js/jquery.js"/>"></script>

</head>
<body>
	<nav class="navbar navbar-inverse" style="background-color:#6d1715; margin:15px; font-size:16px">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" style="color: #afa425">Quản lý kho hàng</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/admin">Home</a></li>
			<li><a href="/admin/product/page">Danh sách sản phẩm</a></li>
			<li><a href="/admin/product/addProduct/">Thêm sản phẩm</a></li>
			<li><a href="#">Quản lý đơn hàng</a></li>
			<li class="active"><a href="/admin/category">Quản lý danh mục sản phẩm</a></li>
		</ul>
	</div>
	</nav>

	<%-- <img src="<c:url value="resources/category_img/mn.jpg"/>" height="150" width="200"> --%>

	<div class="container" style="width: 50%">
		<h2>Danh mục sản phẩm</h2>
		<spring:url value="/admin/category/addCategory" var="addURL" />
		<%-- <a class="btn btn-primary" href="${addURL}" role="button">Thêm danh mục</a> --%>

		<table class="table table-striped">
			<thead>
				<th scope="row">#ID</th>
				<th scope="row">Tên danh mục tiếng Việt</th>
				<th scope="row">Tên danh mục tiếng Balan</th>
				<th scope="row">Update</th>
				<!-- <th scope="row">Delete|</th> -->
			</thead>
			<tbody>
				<c:forEach items="${categoryList}" var="category">
					<tr>
						<td>${category.id}</td>
						<td>${category.catename}</td>
						<td>${category.catefullname }</td>
						<td><spring:url
								value="/admin/category/updateCategory/${category.id }"
								var="updateURL" /> 
							<a class="btn btn-primary"href="${updateURL}" role="button">Update</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<a class="btn btn-primary" href="${addURL}" role="button">Thêm danh mục</a>
	</div>
</body>
</html>