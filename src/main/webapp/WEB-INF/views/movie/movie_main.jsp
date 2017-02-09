<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<style>
	.imgBox{
		float:left;
		margin:60px 1% 0 1%;
		width:23%;
	}
	.txtBox{
		background-color:black;
		width:100%;
		height:50px;
	}
	.txtBox span{
		color:white;
	}
	.write_btn{
		position:absolute;
		top:130px;
		right:20%;
		z-index:100 !important;
	}
		.rating_star{
		width:110px !important;
	}
	.rating_star img{
		width:16px;
		height:16px;
	}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>한국 영화</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/catalog.jsp"/>
	<c:if test="${id eq 'admin'}">
		<button class="btn btn-default write_btn" onclick="location.href='admin/insert_form.do?type=views&national=${param.national}'">글쓰기</button>
	</c:if>
	<div class="content">
		<c:forEach var="tmp" items="${list}" varStatus="count">
			<div class="imgBox">
				<img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" onclick="location.href='detail_form.do?num=${tmp.num}'"/>
				<div class="txtBox">
					<span>가격:${tmp.price}원
						<div class="rating_star">
							<p class="scores" style="display: none">${tmp.grade}</p>							
						</div>
					</span>
				</div>
			</div>
		</c:forEach>
	</div>
	</body>
</html>
<script>
for(var i=0;i<12;i++){	
	$('.rating_star').eq(i).raty({
		half : true,
		score : $(".scores").eq(i).text(),
		readOnly: true
	});
}
</script>

