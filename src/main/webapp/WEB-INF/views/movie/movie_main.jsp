<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<style>
	.movieBox{
		float:left;
		margin-top:60px;
		border:2px solid #747474;
		width:22%;
		height:424px;
	}
	.movie2,.movie6,.movie10{
		margin-left:4%;
		margin-right:2%;
	}
	.movie3,.movie7,.movie11{
		margin-left:2%;
		margin-right:4%;
	}
	.imgBox{
		height:370px;
	}
	.txtBox{
		background-color:#232323;
		width:100%;
		height:50px;
	}
	.txtBox span{
		color:white;
	}
	.write_btn{
		position:absolute;
		top:575px;
		right:20%;
	}
	.rating_star{
		width:110px !important;
	}
	.rating_star img{
		width:16px;
		height:16px;
	}
	.movie_title{
		width:70%;
		height:50px;
		margin-left:5%;
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
		float:right;
		margin-top:-50px;
		margin-left:50%;
		width:10% !important;
	}
	.imgBox{
		cursor: pointer;
	}
	.sub_catal{
		float:right;
		margin-right:30px;
		width:500px;
		height:50px;
		font-size:17px;
		background-color: #232323;
		border-radius: 25px;
		color:darkgrey;
	}
	.sub{
		margin-top:13px;
	}
	.sub_catal a{
		color:white;
		text-decoration:none;
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
				<c:if test="${param.national eq 'domestic' }">
					<strong style="margin-top:10px">한국 영화</strong>
				</c:if>
					<div class="sub_catal">
						<div class="sub">
							<a style="margin-left:75px;
							<c:if test="${param.genre eq 'action'}">
							color:darkgrey;
							</c:if>
							" href="/dvd/movie/movie_main.do?type=list&num=1&national=${param.national}&genre=action">액션</a> |
							<a style="
							<c:if test="${param.genre eq 'drama'}">
							color:darkgrey;
							</c:if>
							" href="/dvd/movie/movie_main.do?type=list&num=1&national=${param.national}&genre=drama">범죄/드라마</a> |
							<a style="
							<c:if test="${param.genre eq 'comedy'}">
							color:darkgrey;
							</c:if>
							" href="/dvd/movie/movie_main.do?type=list&num=1&national=${param.national}&genre=comedy">코미디</a> |
							<a style="
							<c:if test="${param.genre eq 'romance'}">
							color:darkgrey;
							</c:if>
							" href="/dvd/movie/movie_main.do?type=list&num=1&national=${param.national}&genre=romance">멜로/로맨스</a> |
							<a style="
							<c:if test="${param.genre eq 'etc'}">
							color:darkgrey;
							</c:if>
							"href="/dvd/movie/movie_main.do?type=list&num=1&national=${param.national}&genre=etc">기타</a>
						</div>
					</div>
				<c:if test="${param.national eq 'overseas' }"><strong>해외 영화</strong></c:if>
			
		</div>
		<select class="form-control sort_select">
			<option value="">정렬방식</option>
			<option value="production">개봉일</option>
			<option value="grade">평　점</option>
			<option value="views">조　회</option>
		</select> 
		<c:if test="${id eq 'admin'}">
			<c:if test="${param.national eq 'domestic'||${param.nationl eq'overseas'}">
				<button class="btn btn-default write_btn" onclick="location.href='admin/insert_form.do?type=views&national=${param.national}'">글쓰기</button>
			</c:if>
		</c:if>
		<c:forEach var="tmp" items="${list}" varStatus="count">
			<div class="movieBox movie${count.count}">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" onclick="location.href='detail_form.do?num=${tmp.num}&ratingNum=1'"/>
				</div>
				<div class="txtBox">
					<span><span style="margin-left:10px">개봉일 :${tmp.production}</span>
						<p class="scores" style="display:none;">${tmp.grade}</p>
						<div class="rating_star" style="margin-left:10px;"></div>
						<span style="float:right;margin-top:-18px;margin-right:10px;"><fmt:formatNumber value="${tmp.grade*2}" pattern=".0"/> / 10.0</span>
					</span>
				</div>
			</div>
		</c:forEach>
		<div class="page_display"><center>
			<ul class="pagination">
				<c:choose>
					<c:when test="${param.num>5}">
						<li><a href="movie_main.do?type=list&page=paging&national=${param.national}&genre=${param.genre}&num=${paging.endPageNum-1}&keyword=${param.keyword}&sort=${param.sort}">&laquo;</a></li>
					</c:when>
				<c:otherwise>
					<li class="disabled"><a class="muted" href="javascript:">&laquo;</a></li>
				</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${paging.startPageNum }" end="${paging.endPageNum }">
					<c:choose>
						<c:when test="${i eq param.num}">
							<li class="active"><a>${i }</a></li>   
						</c:when>
						<c:otherwise>
							<li><a href="movie_main.do?type=list&page=paging&national=${param.national}&genre=${param.genre}&num=${i}&keyword=${param.keyword}&sort=${param.sort}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${paging.totalPageCount > paging.endPageNum }">
						<li><a href="movie_main.do?type=list&page=paging&national=${param.national}&genre=${param.genre}&num=${paging.endPageNum+1}&keyword=${param.keyword}&sort=${param.sort}">&raquo;</a></li>
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
			location.href='movie_main.do?type=list&num=1&page=sort&national=${param.national}&genre=${param.genre}&grade=1&keyword=${param.keyword}&sort='+data;
		}else if(data == 'production'){
			location.href='movie_main.do?type=list&num=1&page=sort&national=${param.national}&genre=${param.genre}&keyword=${param.keyword}&sort='+data;
		}else if(data == 'views'){
			location.href='movie_main.do?type=list&num=1&page=sort&national=${param.national}&genre=${param.genre}&views=1&keyword=${param.keyword}&sort='+data;
		}else if(data == 'num'){
			location.href='movie_main.do?type=list&num=1&page=sort&national=${param.national}&genre=${param.genre}&keyword=${param.keyword}&sort='+data;
		}
	});
	$(function(){
		$(".sort_select").val('${param.sort}');
		if('${page}' == 'sort'){
			$(window).scrollTop($(".sort_select").offset().top-80);
		}else if('${page}' == 'paging'){
			$(window).scrollTop($(".movie_title").offset().top+30);
		}
	});	
</script>

