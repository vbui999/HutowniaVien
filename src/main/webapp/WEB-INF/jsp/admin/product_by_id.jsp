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
		<spring:url value="/admin/product/list" var="addURL" />
		<a class="btn btn-primary" href="${addURL}" role="button">Back to Product List</a>
		<h2>Product Detail</h2>
		<table class="table table-striped">
			<thead>
				<th scope="row">#ID|</th>
				<th scope="row">(~_~)images</th>
				<th scope="row">name|</th>
				<th scope="row">uniquename|</th>
				<th scope="row">title|</th>
				<th scope="row">kod|</th>
				<th scope="row">categoryname|</th>
				<th scope="row">categoryid|</th>				
				<th scope="row">brand|</th>
				<th scope="row">providername|</th>
				<th scope="row">provideremail|</th>
				<th scope="row">providerphone|</th>
				<th scope="row">providerwebsite|</th>
				<th scope="row">quantity|</th>
				<th scope="row">soldnumber|</th>
				<th scope="row">discription__________|</th>
				<th scope="row">price|</th>
				<th scope="row">originprice|</th>
				<th scope="row">isactivated|</th>
				<th scope="row">createddate|</th>
				<th scope="row">modifieddate|</th>
				<th scope="row">type|</th>
				<th scope="row">imgurlsmall|</th>
				<th scope="row">imgurlbig|</th>
			</thead>
			<tbody>
				<tr>
					<td>${productById.id}</td>
					<td><img src="<c:url value="${productById.imgurlbig}"/>"
						height="auto" width="150"></td>
					<td>${productById.name}</td>
					<td>${productById.uniquename}</td>
					<td>${productById.title}</td>
					<td>${productById.kod}</td>
					<td>${productById.categoryname }</td>
					<td>${productById.categoryid }</td>
					<td>${productById.brand}</td>
					<td>${productById.providername}</td>
					<td>${productById.provideremail}</td>
					<td>${productById.providerphone}</td>
					<td>${productById.providerwebsite}</td>
					<td>${productById.quantity}</td>
					<td>${productById.soldnumber}</td>
					<td>${productById.discription}</td>
					<td>${productById.price}</td>
					<td>${productById.originprice}</td>
					<c:if test="${productById.isactivated eq 0}">
						<td style="color: red; font-weight: bold; text-align: center;">No</td>
					</c:if>
					<c:if test="${productById.isactivated eq 1}">
						<td style="color: blue; font-weight: bold; text-align: center;">Yes</td>
					</c:if>
					<td>${productById.createddate}</td>
					<td>${productById.modifieddate}</td>
					<td>${productById.type}</td>
					<td>${productById.imgurlsmall}</td>
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