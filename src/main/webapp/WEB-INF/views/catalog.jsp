<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<style>
.main_catal>ul>li {
	float: left;
	margin-right: 5%;
	list-style: none;
	color: white;
}

.sub_catal {
	clear: both;
}
.sub{
	display: none;
	color:white;
}
.sub_catal>ul>li {
	float: left;
	list-style: none;
	margin-right: 2%;
}
.catalog{
	background-image: url("${pageContext.request.contextPath }/resources/images/main01.jpg");
	background-size:100% 100%;
	height:900px;
}

</style>
<div class="catalog">
	<div class="main_catal">
		<ul>
			<li><a href="/dvd/home.do?type=list">로고</a></li>
			<li><a href="/dvd/movie/domestic_main.do?type=list&national=domestic">국내 영화</a></li>
			<li><a href="/dvd/movie/overseas_main.do?type=list&national=overseas">해외 영화</a></li>
			<li><a href="/dvd/users/insert_form.do?type=views">회원가입</a></li>
		</ul>
	</div>
	<div class="sub_catal">
		<ul class="sub">
			<li>
			<a href ="   
				<c:if test="${catalog eq 'domestic'}">
				adfadf
				</c:if>
			">액션</a></li>
			<li>범죄,드라마</li>
			<li>코미디</li>
			<li>멜로/로맨스</li>
			<li>기 타</li>
		</ul>
	</div>
	<div class="content"></div>
	<h3>${catalog}</h3>
</div>
<script>
	if("${catalog}" != ''){
		$(".sub").show();
	}
</script>
