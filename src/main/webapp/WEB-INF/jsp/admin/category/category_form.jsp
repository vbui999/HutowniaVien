<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Category Form</title>

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
	<div class="container" style="width: 50%">
		<spring:url value="/admin/category/saveCategory" var="saveURL" />
		<h2>Điền thông tin danh mục sản phẩm</h2>
		<form:form modelAttribute="categoryForm" method="post" action="${saveURL}" cssClass="form">
			<form:hidden path="id" />
						
			<div class="form-group">
				<label style="color: var(--my-red) ">Tên danh mục tiếng Việt</label>
				<form:input path="catename" cssClass="form-control" id="catename" />
			</div>
			<div class="form-group">
				<label style="color: var(--my-red) ">Tên danh mục tiếng Balan</label>
				<form:input path="catefullname" cssClass="form-control" id="catefullname" />
			</div>
			
			<button type="submit" class="btn btn-primary">Save</button>
								
		</form:form>

	</div>
</body>
</html>