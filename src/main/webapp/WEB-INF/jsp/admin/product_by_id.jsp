<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product By Id</title>

<link href="<c:url value="/template/user_tpl/css/bootstrap.min.css"/>"
	rel="stylesheet" />
<script src="<c:url value="/template/user_tpl/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/user_tpl/js/jquery.js"/>"></script>

</head>
<body>
	<div class="container" style="width: 100%">
		<spring:url value="/admin/product/page" var="addURL" />
		<a class="btn btn-primary" href="${addURL}" role="button">Back to Product List</a>
		<h2>Product Detail</h2>
		<table class="table table-striped">
			<thead>
				<th scope="row">Attribute Name</th>
				<th scope="row">Content</th>
			</thead>
			<tbody>
				<tr>
					<td>Id</td>
					<td>${productById.id}</td>
				</tr>
				<tr>
					<td>Image</td>
					<td><img src="<c:url value="${productById.imgurlbig}"/>" height="auto" width="150"></td>
				</tr>
				<tr>
					<td>Name</td>
					<td>${productById.name}</td>
				</tr>
				<tr>
					<td>Unique Name</td>
					<td>${productById.uniquename}</td>
				</tr>
				<tr>
					<td>Title</td>
					<td>${productById.title}</td>
				</tr>
				<tr>
					<td>Code</td>
					<td>${productById.kod}</td>
				</tr>
				<tr>
					<td>Category Name</td>
					<td>${productById.categoryname }</td>
				</tr>
				<tr>
					<td>Category ID</td>
					<td>${productById.categoryid }</td>
				</tr>
				<tr>
					<td>Brand</td>
					<td>${productById.brand}</td>
				</tr>
				<tr>
					<td>Provider Name</td>
					<td>${productById.providername}</td>
				</tr>
				<tr>
					<td>Provider Email</td>
					<td>${productById.provideremail}</td>
				</tr>
				<tr>
					<td>Provider Phone</td>
					<td>${productById.providerphone}</td>
				</tr>
				<tr>
					<td>Provider Website</td>
					<td>${productById.providerwebsite}</td>
				</tr>
				<tr>
					<td>Quantity</td>
					<td>${productById.quantity}</td>
				</tr>
				<tr>
					<td>Sold number</td>
					<td>${productById.soldnumber}</td>
				</tr>
				<tr>
					<td>Description</td>
					<td>${productById.discription}</td>
				</tr>
				<tr>
					<td>Price</td>
					<td>${productById.price}</td>
				</tr>
				<tr>
					<td>Original Price</td>
					<td>${productById.originprice}</td>
				</tr>
				<tr>
					<td>Available</td>
					<c:if test="${productById.isactivated eq 0}">
						<td style="color: red; font-weight: bold; text-align: center;">No</td>
					</c:if>
					<c:if test="${productById.isactivated eq 1}">
						<td style="color: blue; font-weight: bold; text-align: center;">Yes</td>
					</c:if>
				</tr>
				<tr>
					<td>Created date</td>
					<td>${productById.createddate}</td>
				</tr>
				<tr>
					<td>Modified date</td>
					<td>${productById.modifieddate}</td>
				</tr>
				<tr>
					<td>Type</td>
					<td>${productById.type}</td>
				</tr>
				<tr>
					<td>Image small</td>
					<td>${productById.imgurlsmall}</td>
				</tr>
				<tr>
					<td>Image big</td>
					<td>${productById.imgurlbig}</td>
				</tr>
				
			</tbody>
		</table>	
		<spring:url value="/admin/product/updateProduct/${productById.id}" var="updateURL" />
		<a class="btn btn-primary" href="${updateURL}" role="button">Sửa thông tin</a>
		
		<%-- <spring:url value="/admin/product/deleteProduct/${productById.id }" var="deleteURL" />
		<a class="btn btn-primary" href="${deleteURL}" role="button">Xóa</a> --%>
	</div>
</body>
</html>