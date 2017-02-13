<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<style>
	.movieBox{
		float:left;
		margin-top:60px;
		margin-left:4%;
		border:2px solid #747474;
		width:20%;
		height:404px;
	}
	.imgBox{
		height:350px;
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
	.movie_title{
		width:40%;
		height:50px;
		margin-left:30%;
		margin-top:30px;
		padding-top:50px;
		font-size:27px;
	}
	.page_display{
		clear:both;
	}
	.pagination {
		margin:50px 0;
	}
	.sort_select{
		clear:both;
		margin-left:86%;
		width:10%;
	}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Movie</title> 
</head>
<body>
	<jsp:include page="/WEB-INF/views/catalog.jsp"/>
	<div class="content">
		<div class="movie_title">
			<center>
				<c:if test="${param.national eq 'domestic' }"><strong>한국 영화</strong></c:if>
				<c:if test="${param.national eq 'overseas' }"><strong>해외 영화</strong></c:if>
			<center>
		</div>
		<select class="form-control sort_select">
			<option value="">정렬방식</option>
			<option value="production">개봉일</option>
			<option value="grade">평　점</option>
			<option value="views">조　회</option>
		</select> 
		<c:if test="${id eq 'admin'}">
			<button class="btn btn-default write_btn" onclick="location.href='admin/insert_form.do?type=views&national=${param.national}'">글쓰기</button>
		</c:if>
		<c:forEach var="tmp" items="${list}" varStatus="count">
			<div class="movieBox">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" onclick="location.href='detail_form.do?num=${tmp.num}'"/>
				</div>
				<div class="txtBox">
					<span>가격:${tmp.price}원
						<p class="scores" style="display:none;">${tmp.grade}</p>
						<div class="rating_star"></div>
					</span>
				</div>
			</div>
		</c:forEach>
		<div class="page_display"><center>
			<ul class="pagination">
				<c:choose>
					<c:when test="${param.num>5}">
						<li><a href="movie_main.do?type=list&national=${param.national}&genre=${param.genre}&num=${paging.endPageNum-1}&keyword=${param.keyword}&sort=${param.sort}">&laquo;</a></li>
					</c:when>
				<c:otherwise>
					<li class="disabled"><a class="muted" href="javascript:">&laquo;</a></li>
				</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${paging.startPageNum }" end="${paging.endPageNum }">
					<c:choose>
						<c:when test="">
							<li class="active"><a href="detail_form.do?num&${dvd.num}&ratingNum=${i }">${i }</a></li>   
						</c:when>
						<c:otherwise>
							<li><a href="movie_main.do?type=list&national=${param.national}&genre=${param.genre}&num=${i}&keyword=${param.keyword}&sort=${param.sort}">${i}</a></li>
						</c:otherwise>
					</c:choose>    
				</c:forEach>
				<c:choose>
					<c:when test="${paging.totalPageCount > paging.endPageNum }">
						<li><a href="movie_main.do?type=list&national=${param.national}&genre=${param.genre}&num=${paging.endPageNum+1}&keyword=${param.keyword}&sort=${param.sort}">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a class="muted" href="javascript:">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>

</html>

<script>
	for(var i=0;i<'${fn:length(list)}';i++){	
		$('.rating_star').eq(i).raty({
			half : true,
			score : $(".scores").eq(i).text(),
			readOnly: true
		});
	}
	$(".sort_select").change(function(){
		var data = $(this).val();
		if(data == 'grade'){
			location.href='movie_main.do?type=list&national=${param.national}&genre=${param.genre}&grade=1&keyword=${param.keyword}&sort='+data;
		}else if(data == 'production'){
			location.href='movie_main.do?type=list&national=${param.national}&genre=${param.genre}&keyword=${param.keyword}&sort='+data;
		}else if(data == 'views'){
			location.href='movie_main.do?type=list&national=${param.national}&genre=${param.genre}&views=1&keyword=${param.keyword}&sort='+data;
		}else if(data == 'num'){
			location.href='movie_main.do?type=list&national=${param.national}&genre=${param.genre}&keyword=${param.keyword}&sort='+data;
		}
	});
	$(function(){
		$(".sort_select").val('${param.sort}');
	});
</script>

