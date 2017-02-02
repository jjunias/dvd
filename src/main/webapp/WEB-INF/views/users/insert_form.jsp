<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
	안녕하세용?못하겟어..
	</div>
</body>
</html>
<script>
	$(function(){
		$.ajax({
			method : "get",
			url : "getData.do?num=1",
			success : function(data) {
			}
		});
	});
</script>
