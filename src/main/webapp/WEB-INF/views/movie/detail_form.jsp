<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<style>
	.imgBox{
		float:left;
		margin-top:50px;
		margin-left:10%;
		width:25%;
		height:350px;
	}
	.box{
		clear:both;
		margin-top:90px;
		height:500px;
		background-color:#F5F5F5;
		border:1px solid #E4E4E4;
	}
	#box_trailer{
		background-color:#F5F5F5;
		margin-top:10px;
		padding-bottom:50px;
		padding-left:10%;
		border:1px solid #E4E4E4;
	}
	#box_content{
		background-color:#F5F5F5;
		margin-top:10px;
		padding-bottom:50px;
		padding-left:10%;
		border:1px solid #E4E4E4;
	}
	.span{
		background-color:#FFFFE4;
	}
	.txtBox{
		float:left;
		margin-top:30px;
		margin-left:5%;
		width:50%;
		font-size:16px;

	}
	.buy_btn{
		margin-right:5%;
	}
	.view_list{
		background-color: #232323;
		width:40%;
		height:50px;
		border-radius:25px;
		font-size: 17px;
		padding-top:10px;
		margin-top:10px;
		margin-left:30%;
	}
	.view_list a{
		color:white;
		text-decoration: none;
	}
	.view_list a:HOVER {
		color:darkgray;
	}
	.update_btn{
		float:right;
		margin-top: 15px;
		margin-right:2%;
	}
	.star{
		width:150px !important;
	}
	.star img{
		width:23px;
		height:23px;
	}
	.dvd_grade{
		float:right !important;
		margin-right:380px;
		font-family:18px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>detail_form</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/catalog.jsp"/>
	<div class="content">
		<c:if test="${id eq 'admin' }">
			<div class="update_btn">
				<button class="btn btn-warning" onclick="location.href='admin/update_form.do?num=${dvd.num}&type=data'">수정</button>
			</div>
		</c:if>
		<div class="box">
			<div class="imgBox">
				<img src="${pageContext.request.contextPath }/upload/${dvd.saveFileName}" onclick="location.href='detail_form.do?num=${dvd.num}'"/>
			</div>
			<div class="txtBox">
				<h2>[
					<c:if test="${dvd.national eq 'domestic' }"> 국내 영화
					</c:if>
					<c:if test="${dvd.national eq 'overseas' }"> 해외 영화
					</c:if>
					] ${dvd.title}</h2>
				<hr/>
				<span class="dvd_grade"><strong><fmt:formatNumber value="${dvd.grade*2}" pattern=".0"/> 점</span></strong>
				<div class="star"></div>				
				<div><strong>
					<br/>
					<p>배우 : ${dvd.actor}</p>
					<p>장르 : ${dvd.genre}</p>
					<p>개봉일 : ${dvd.production}</p>
					가격 :<fmt:formatNumber value="${dvd.price}"/>원<br/>
					</strong>
				</div>
				<hr/>
				<button class="btn btn-success buy_btn" >구매 하기</button>
				<button class="btn btn-warning">장바구니 담기</button>
			</div>
		</div>
		<div class="view_list">
			<span><a href="#box_trailer" style="margin-left:20%">동 영 상</a> |</span>
			<span><a href="#box_content">줄 거 리</a> |</span>
			<span><a href="#rating">평 점/리 뷰</a> |</span>
			<span><a href="">Q & A</a></span>
		</div>
		<div id="box_trailer">
			<h3>동 영 상</h3>
			<iframe width="90%" height="500" src="https://www.youtube.com/embed/${dvd.trailer}" frameborder="0" allowfullscreen></iframe>
		</div>
		<div id="box_content">
			<h3>줄거리</h3>
			<span id="content">${dvd.content}</span>
		</div>
		<jsp:include page="/WEB-INF/views/movie/rating/rating_form.jsp"></jsp:include>
	</div>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</html>
<script>
	$('.star').raty({
		half : true,
		score : "${dvd.grade}",
		readOnly: true
	});
	$(".buy_btn").click(function(){
		location.href="/dvd/users/pay.do?num=${dvd.num}";
	});
</script>