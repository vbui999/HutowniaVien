<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý kho</title>

<link href="<c:url value="/template/user_tpl/css/bootstrap.min.css"/>"rel="stylesheet" />
<script src="<c:url value="/template/user_tpl/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/user_tpl/js/jquery.js"/>"></script>

</head>
<body>
	<nav class="navbar navbar-inverse" style="background-color:#6d1715; margin:15px; font-size:16px">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#" style="color:#afa425">Quản lý kho hàng</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/admin">Home</a></li>
			<li class="active"><a href="/admin/product/list">Danh sách sản phẩm</a></li>
			<li><a href="/admin/product/addProduct/">Thêm sản phẩm</a></li>
			<li><a href="#">Quản lý đơn hàng</a></li>
			<li><a href="#">Quản lý danh mục sản phẩm</a></li>
		</ul>
	</div>
	</nav>

	<%-- <img src="<c:url value="resources/product_img/mn.jpg"/>" height="150" width="200"> --%>
	
	<div class="container" style="width: 100%">
		<h2>Product List</h2>
		<table class="table table-striped">
			<thead>
				<th scope="row">#ID|</th>
				<th scope="row">(~_~)</th>
				<th scope="row">Tên</th>
				<!-- <th scope="row">uniquename|</th> -->
				<!-- <th scope="row">title|</th> -->
				<th scope="row">Mã__code</th>
				<th scope="row">Danh_mục sp</th>
				<th scope="row">Kích cỡ</th>
				<th scope="row">Bát</th>
				<th scope="row">Màu sắc</th>
				<th scope="row">Thùng</th>
				<!-- <th scope="row">categoryid|</th> -->
				<!-- <th scope="row">imgurlsmall|</th> -->
				<!-- <th scope="row">imgurlbig|</th> -->
				<th scope="row">brand|</th>
				<th scope="row">Nhà cung cấp</th>
				<!-- <th scope="row">provideremail|</th> -->
				<th scope="row">Sdt_nhà_c.c</th>
				<!-- <th scope="row">providerwebsite|</th> -->
				<!-- <th scope="row">quantity|</th> -->
				<th scope="row">Đã bán</th>
				<th scope="row">Mô tả sản phẩm|</th>
				<th scope="row">Giá mua</th>
				<th scope="row">Giá bán</th>
				<th scope="row">Có hàng?</th>
				<th scope="row">createddate|</th>
				<!-- <th scope="row">modifieddate|</th> -->
				<th scope="row">type|</th>
				<th scope="row">Update|</th>
				<!-- <th scope="row">Delete|</th> -->
			</thead>
			<tbody>
				<c:forEach items="${productList }" var="product">
					<tr>
						<td>${product.id}</td>
						<td><a href="/admin/product/${product.id}"><img src="<c:url value="${product.imgurlbig}"/>" height="auto" width="150"></a>					
							<div>
								<form method="POST" enctype="multipart/form-data"
									action="/admin/storage/upload_img/${product.id}">
									<table>
										<tr>
											<!-- <td>Img to upload</td> -->
											<td><input type="file" name="file" style="width: 150px" /></td>
										</tr>
										<tr>
											<td><input type="submit" value="Upload" /></td>
										</tr>
									</table>
								</form>
							</div>
						</td>
						<td><a style="text-decoration: underline;" href="/admin/product/${product.id}">${product.name}</a></td>
						<%-- <td>${product.uniquename}</td> --%>
						<%-- <td>${product.title}</td> --%>
						<td>${product.kod}</td>
						<td>${product.categoryname }</td>
						<td>${product.size}</td>
						<td>${product.pack}</td>
						<td>${product.color}</td>
						<td>${product.carton}</td>
						<%-- <td>${product.categoryid }</td> --%>
						<%-- <td>${product.imgurlsmall}</td> --%>
						<%-- <td>${product.imgurlbig}</td> --%>
						<td>${product.brand}</td>
						<td>${product.providername}</td>
						<%-- <td>${product.provideremail}</td> --%>
						<td>${product.providerphone}</td>
						<%-- <td>${product.providerwebsite}</td> --%>
						<%-- <td>${product.quantity}</td> --%>
						<td>${product.soldnumber}</td>
						<td>${product.discription}</td>
						<td>${product.price}</td>
						<td>${product.originprice}</td>
						<c:if test="${product.isactivated eq 0}">
							<td style="color: red; font-weight: bold; text-align: center;">No</td>
						</c:if>
						<c:if test="${product.isactivated eq 1}">
							<td style="color: blue; font-weight: bold; text-align: center;">Yes</td>
						</c:if>
						<%-- <td>${product.isactivated}</td> --%>
						<td>${product.createddate}</td>
						<%-- <td>${product.modifieddate}</td> --%>
						<td>${product.type}</td>
						<td><spring:url value="/admin/product/updateProduct/${product.id }"
								var="updateURL" /> <a class="btn btn-primary"
							href="${updateURL }" role="button">Update</a></td>
						<%-- <td><spring:url value="/admin/product/deleteProduct/${product.id }"
								var="deleteURL" /> <a class="btn btn-primary"
							href="${deleteURL }" role="button">Delete</a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<spring:url value="/admin/product/addProduct/" var="addURL" />
		<a class="btn btn-primary" href="${addURL}" role="button">Add new
			product</a>
	</div>
</body>
</html>