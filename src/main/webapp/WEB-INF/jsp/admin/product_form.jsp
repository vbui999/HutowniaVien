<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Form</title>

<link href="<c:url value="/template/user_tpl/css/bootstrap.min.css"/>"
	rel="stylesheet" />
<script src="<c:url value="/template/user_tpl/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/template/user_tpl/js/jquery.js"/>"></script>
<style type="text/css">
:root {
  --my-red: #a21d19;
}

</style>
</head>
<body>
	<div class="container">
		<spring:url value="/admin/product/saveProduct" var="saveURL" />
		<h2>Điền thông tin sản phẩm</h2>
		<form:form modelAttribute="productForm" method="post"
			action="${saveURL}" cssClass="form">
			<form:hidden path="id" />
			<div class="form-group">
				<label style="color: var(--my-red) ">Tên sản phẩm</label>
				<form:input path="name" cssClass="form-control" id="name" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Mã code</label>
				<form:input path="kod" cssClass="form-control" id="kod" />
			</div>


			<div class="form-group">
				<label style="color: var(--my-red) ">Danh mục sản phẩm</label>				
				<form:select path="categoryname" name='category' style="width: 50%; height: 40px; background-color: #f5f5f5;">			
					<option value="${category_selected}" selected>${category_selected}</option>
					<c:forEach items="${categories}" var="category">
						<c:if test="${category.catefullname != category_selected}">
							<option value="${category.catefullname}">${category.catefullname}</option>							
						</c:if>
					</c:forEach>
				</form:select>
			</div>

			<div class="form-group">
				<label style="color: var(--my-red) ">Giới tính</label>				
				<form:select path="type" name='type' style="width: 50%; height: 40px; background-color: #f5f5f5;">
					<c:if test="${type_selected != ''}">
						<option value="${type_selected}" selected>${type_selected}</option>
					</c:if>
					<option value="General">General</option>			
					<option value="Men">Man</option>
					<option value="Women">Woman</option>
					<option value="Boys">Boys</option>	
					<option value="Girls">Girls</option>
					<option value="Children">Children</option>						
				</form:select>
			</div>

			<div class="form-group">
				<label style="color: var(--my-red) ">Kích cỡ</label>
				<form:input path="size" cssClass="form-control" id="size" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Số lượng cái 1 bát</label>
				<form:input path="pack" cssClass="form-control" id="pack" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Màu</label>
				<form:input path="color" cssClass="form-control" id="color" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Số lượng cái 1 thùng</label>
				<form:input path="carton" cssClass="form-control" id="carton" />
			</div>

			<div class="form-group">
				<label style="color: var(--my-red) ">Thương hiệu/xuất sứ</label>
				<form:input path="brand" cssClass="form-control" id="brand" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Tên nhà cung cấp</label>
				<form:input path="providername" cssClass="form-control"
					id="providername" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Điện thoại nhà cung cấp</label>
				<form:input path="providerphone" cssClass="form-control"
					id="providerphone" />
			</div>
			<div class="form-group">
				<label>Số lượng đã bán</label>
				<form:input path="soldnumber" cssClass="form-control"
					id="soldnumber" />
			</div>

			<div class="form-group">
				<label style="color: var(--my-red)" for="discription">Mô tả sản phẩm</label>
				<form:textarea path="discription" class="form-control"
					id="discription" rows="3" />
			</div>

			<div class="form-group">
				<label style="color: var(--my-red) ">Giá bán</label>
				<form:input path="price" cssClass="form-control" id="price" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Giá mua</label>
				<form:input path="originprice" cssClass="form-control" id="originprice" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Có còn hàng không ?</label>				
				<form:select path="isactivated" name='isactivated' style="width: 50%; height: 40px; background-color: #f5f5f5;">
					<c:if test="${isactivated_selected eq 1}">
						<option value="1" selected>Yes</option>
						<option value="0">No</option>
					</c:if>
					<c:if test="${isactivated_selected eq 0}">
						<option value="0" selected>No</option>
						<option value="1">Yes</option>
					</c:if>
					<c:if test="${isactivated_selected eq null}">
						<option value="1" selected>Yes</option>		
						<option value="0">No</option>	
					</c:if>					
				</form:select>
			</div>
			
			<div class="form-group">
				<label>Ngày sửa lần cuối</label>
				<form:input disabled="true" path="modifieddate" cssClass="form-control" id="modifieddate" />
			</div>
			<div class="form-group">
				<label>Email nhà cung cấp</label>
				<form:input path="provideremail" cssClass="form-control"
					id="provideremail" />
			</div>
			<div class="form-group">
				<label>Website nhà cung cấp</label>
				<form:input path="providerwebsite" cssClass="form-control"
					id="providerwebsite" />
			</div>
			
			<button type="submit" class="btn btn-primary">Save</button>
			
			<!-- hidden content -->
						
			<div class="form-group" style="visibility: hidden;">
				<label>Ngày tạo sản phẩm</label>
				<form:input path="createddate" cssClass="form-control" id="createddate" />				
			</div>
			<div class="form-group" style="visibility: hidden;">
				<label>Link ảnh bé</label>
				<form:input path="imgurlsmall" cssClass="form-control"
					id="imgurlsmall" />
			</div>
			<div class="form-group" style="visibility: hidden;">
				<label>Link ảnh lớn</label>
				<form:input path="imgurlbig" cssClass="form-control"
					id="imgurlbig" />
			</div>
			<div class="form-group" style="visibility: hidden;">
				<label>Id danh mục</label>
				<form:input path="categoryid" cssClass="form-control"
					id="categoryid" />
			</div>
			<div class="form-group" style="visibility: hidden;">
				<label>Tiêu đề</label>
				<form:input path="title" cssClass="form-control" id="title" />
			</div>
			<div class="form-group" style="visibility: hidden;">
				<label>Tên duy nhất</label>
				<form:input path="uniquename" cssClass="form-control" id="uniquename"/>
			</div>
					
		</form:form>

	</div>
</body>
</html>