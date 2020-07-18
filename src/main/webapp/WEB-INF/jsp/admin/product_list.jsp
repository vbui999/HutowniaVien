<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý kho</title>

<link href="<c:url value="/template/user_tpl/css/bootstrap.min.css"/>" rel="stylesheet" />
<script src="<c:url value="/template/user_tpl/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/user_tpl/js/jquery.js"/>"></script>

</head>
<body>
	<nav class="navbar navbar-inverse" style="background-color:#6d1715; margin:15px; font-size:16px">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/" style="color: #afa425">Hurtownia</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/admin">Home</a></li>
			<li class="active"><a href="/admin/product/page">Danh sách sản phẩm</a></li>
			<li><a href="/admin/product/addProduct/">Thêm sản phẩm</a></li>
			<li><a href="#">Quản lý đơn hàng</a></li>
			<li><a href="/admin/category">Quản lý danh mục sản phẩm</a></li>
		</ul>
	</div>
	</nav>

	<%-- <img src="<c:url value="resources/product_img/mn.jpg"/>" height="150" width="200"> --%>

	<div class="container" style="width: 100%">
		<h2>Danh sách sản phẩm</h2>
		<spring:url value="/admin/product/addProduct/" var="addURL" />
		<a class="btn btn-primary" href="${addURL}" role="button">Thêm sản phẩm</a>

		<div>&nbsp;</div>
		<div>
			<i>Sorted by ${sortField} in ${sortDir} order</i>
		</div>
		<div>&nbsp;</div>
		<div class="paging-div" style="font-size: 16px;">
			<c:if test="${totalPages > 1}">
				<a>Total Items: ${totalItems} </a>
				&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
				<c:if test="${currentPage > 1}">
					<spring:url value="/admin/product/page/1?sortField=${sortField}&sortDir=${sortDir}" var="firstP" />
					<a href="${firstP}">First</a>
				</c:if>
				<c:if test="${currentPage <= 1}">
					<span>First</span>
				</c:if>
				&nbsp;&nbsp;
				
				<c:if test="${currentPage > 1}">
					<spring:url value="/admin/product/page/${currentPage - 1}?sortField=${sortField}&sortDir=${sortDir}" var="previousP" />
					<a href="${previousP}">Previous</a>
				</c:if>
				<c:if test="${currentPage <= 1}">
					<span>Previous</span>
				</c:if>
				&nbsp;&nbsp;
				<c:forEach var="i" begin="1" end="${totalPages}">
					<span> <c:if test="${currentPage != i}">
							<spring:url value="/admin/product/page/${i}?sortField=${sortField}&sortDir=${sortDir}" var="iPage" />
							<a href="${iPage}">${i}</a>
						</c:if> <c:if test="${currentPage eq i}">${i}</c:if>
					</span>
				</c:forEach>

				<c:if test="${currentPage < totalPages}">
					<spring:url value="/admin/product/page/${currentPage + 1}?sortField=${sortField}&sortDir=${sortDir}" var="nextP" />
					<a href="${nextP}">Next</a>
					<c:if test="${currentPage >= totalPages}">
						<span>Next</span>
					</c:if>
				</c:if>	
				&nbsp;&nbsp;
				<c:if test="${currentPage < totalPages}">
					<spring:url value="/admin/product/page/${totalPages}?sortField=${sortField}&sortDir=${sortDir}" var="lastP" />
					<a href="${lastP}">Last</a>
				</c:if>
				<c:if test="${currentPage >= totalPages}">
					<span>Last</span>
				</c:if>

			</c:if>
		</div>


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
						<td><a href="/admin/product/${product.id}"><img src="<c:url value="${product.imgurlbig}"/>" height="auto" width="90"></a> <%-- <div>
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
							</div> --%></td>
						<td><a style="text-decoration: underline;" href="/admin/product/${product.id}">${product.name}</a>
							<div class="upload-form">
								<form method="POST" enctype="multipart/form-data" action="/admin/storage/upload_img/${product.id}">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<table>
										<tr>
											<td>Tải ảnh sản phẩm</td>
										</tr>
										<tr>
											<td><input type="file" name="file" /></td>
										</tr>
										<tr>
											<td><input type="submit" value="Upload" /></td>
										</tr>
									</table>
								</form>
							</div></td>
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
						<td><spring:url value="/admin/product/updateProduct/${product.id }" var="updateURL" /> <a class="btn btn-primary" href="${updateURL}" role="button">Update</a></td>
						<%-- <td><spring:url value="/admin/product/deleteProduct/${product.id }"
								var="deleteURL" /> <a class="btn btn-primary"
							href="${deleteURL }" role="button">Delete</a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="paging-div" style="font-size: 16px;">
			<c:if test="${totalPages > 1}">
				<a>Total Items: ${totalItems} </a>
				&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
				<c:if test="${currentPage > 1}">
					<spring:url value="/admin/product/page/1?sortField=${sortField}&sortDir=${sortDir}" var="firstP" />
					<a href="${firstP}">First</a>
				</c:if>
				<c:if test="${currentPage <= 1}">
					<span>First</span>
				</c:if>
				&nbsp;&nbsp;
				
				<c:if test="${currentPage > 1}">
					<spring:url value="/admin/product/page/${currentPage - 1}?sortField=${sortField}&sortDir=${sortDir}" var="previousP" />
					<a href="${previousP}">Previous</a>
				</c:if>
				<c:if test="${currentPage <= 1}">
					<span>Previous</span>
				</c:if>
				&nbsp;&nbsp;
				<c:forEach var="i" begin="1" end="${totalPages}">
					<span> <c:if test="${currentPage != i}">
							<spring:url value="/admin/product/page/${i}?sortField=${sortField}&sortDir=${sortDir}" var="iPage" />
							<a href="${iPage}">${i}</a>
						</c:if> <c:if test="${currentPage eq i}">${i}</c:if>
					</span>
				</c:forEach>

				<c:if test="${currentPage < totalPages}">
					<spring:url value="/admin/product/page/${currentPage + 1}?sortField=${sortField}&sortDir=${sortDir}" var="nextP" />
					<a href="${nextP}">Next</a>
					<c:if test="${currentPage >= totalPages}">
						<span>Next</span>
					</c:if>
				</c:if>	
				&nbsp;&nbsp;
				<c:if test="${currentPage < totalPages}">
					<spring:url value="/admin/product/page/${totalPages}?sortField=${sortField}&sortDir=${sortDir}" var="lastP" />
					<a href="${lastP}">Last</a>
				</c:if>
				<c:if test="${currentPage >= totalPages}">
					<span>Last</span>
				</c:if>

			</c:if>
		</div>
		<a class="btn btn-primary" href="${addURL}" role="button">Thêm sản phẩm</a>
	</div>
</body>
</html>