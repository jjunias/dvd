<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/basket/list.jsp</title>
</head>
<body>
	<h3>장바구니 목록입니다.</h3>
	<table>
		<thead>
			<tr>
				<th>상품번호</th>
				<th>제목</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list}">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.title }</td>
				<td>${tmp.price }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>