<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/source.jsp"/><!-- jquery , boostrap -->
<html>
<style>
	.new{
		float:left;
		width:100%;
	}
	.new_movie,.favor_movie{
		float:left;
		width:22%;
		height:350px;
		margin-bottom:50px;
	}
	.favor{
		float:left;
		width:100%;
	}
	.favor_movie2,.new_movie2{
		margin-left:4%;
		margin-right:2%;
	}
	.favor_movie3,.new_movie3{
		margin-left:2%;
		margin-right:4%;
	}
	.imgBox{
		height:80%;
	}
	.txtBox{
		background-color:#232323;
		width:100%;
		height:20%;
	}
	.txtBox span{
		color:white;
	}
	.rating_star,.rating_Favorstar{
		width:110px !important;
	}
	.rating_star img,.rating_Favorstar img{
		width:16px;
		height:16px;
	}
	@media(max-width:1360px){
		.new_movie,.favor_movie{
			width:28%;
			height:300px;
			margin-bottom:30px;
		}
	}
	@media(max-width:1100px){
		.new_movie, .favor_movie{
			width:43%;
			height:400px;
		}		
		.favor_movie1,.new_movie1,.favor_movie3,.new_movie3{
			margin-left:5%;
		}
	}
	@media(max-width:760px){
	}
	@media(max-width:360px){
		.rating_text{
			display:none;
		}
	}
</style>
<head>
<meta charset="UTF-8">
<title>movie</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/catalog.jsp"/>
	<div class="content">
		<div class="new">
			<h3 style="margin-top: 30px"><strong>최신 영화</strong></h3>
			<c:forEach var="tmp" begin="0" end="3" items="${newList}" varStatus="count">
			<div class="new_movie new_movie${count.count}">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" onclick="location.href='movie/detail_form.do?num=${tmp.num}&ratingNum=1'"/>
				</div>
				<div class="txtBox">
					<span><span style="margin-left:10px">개봉일 :${tmp.production}</span>
						<p class="scores" style="display:none;">${tmp.grade}</p>
						<div class="rating_star" style="margin-left:10px;"></div>
						<span class="rating_text" style="float:right;margin-top:-18px;margin-right:10px;"><fmt:formatNumber value="${tmp.grade*2}" pattern=".0"/></span>
					</span>
				</div>
			</div>
		</c:forEach>
		</div>
		<div class="favor">
			<h3><strong>인기 영화</strong></h3>
			<c:forEach var="tmp" begin="0" end="3" items="${favorList}" varStatus="count">
			<div class="favor_movie favor_movie${count.count}">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" onclick="location.href='movie/detail_form.do?num=${tmp.num}&ratingNum=1'"/>
				</div>
				<div class="txtBox">
					<span><span style="margin-left:10px">개봉일 :${tmp.production}</span>
						<p class="scores_favor" style="display:none;">${tmp.grade}</p>
						<div class="rating_Favorstar" style="margin-left:10px;"></div>
						<span class="rating_text" style="float:right;margin-top:-18px;margin-right:10px;"><fmt:formatNumber value="${tmp.grade*2}" pattern=".0"/></span>
					</span>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
<script>
	for(var i=0;i<'${fn:length(newList)}';i++){	
		$('.rating_star').eq(i).raty({
			half : true,
			score : $(".scores").eq(i).text(),
			readOnly: true
		});
	}
	for(var i=0;i<'${fn:length(favorList)}';i++){
		
		$('.rating_Favorstar').eq(i).raty({
			half : true,
			score : $(".scores_favor").eq(i).text(),
			readOnly: true
		});
	}
</script>