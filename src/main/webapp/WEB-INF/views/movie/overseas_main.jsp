<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>해외 영화</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/catalog.jsp"/>
<h3>해외 영화</h3>
<button onclick="location.href='admin/insert_form.do?type=views&national=overseas'">글쓰기</button>
<c:forEach var="tmp" items="${list}">
<h3>${tmp.genre }</h3>
<h3>${tmp.num }</h3>
<img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" onclick="location.href='detail_form.do?num=${tmp.num}'"/>
</c:forEach>
</body>
</html>