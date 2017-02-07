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
			<li><a href="/dvd/movie/domestic_main.do?type=views&nation=domestic">국내 영화</a></li>
			<li><a href="/dvd/movie/overseas_main.do?type=views&nation=overseas">해외 영화</a></li>
			<li><a href="/dvd/users/insert_form.do?type=views">회원가입</a></li>
			<li><a href="/dvd/basket/list.do?id=cystory">장바구니</a></li>
			<li><a href="/dvd/qna/qna_list.do?dvd_num=1">Q&A____</a></li>
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
			<li>기타</li>
		</ul>
	</div>
	<p style="margin-top:1500px">안녕</p>
	<c:forEach var="tmp" items="${list }">
		<p>${tmp.num }</p>
		<p>${tmp.name }</p>
	</c:forEach>
	<div class="content"></div>
	<h3>${catalog}</h3>
	<button class="btn_write">글쓰기</button>
</div>
<script>
	if("${catalog}" != ''){
		$(".sub").show();
	}
</script>
