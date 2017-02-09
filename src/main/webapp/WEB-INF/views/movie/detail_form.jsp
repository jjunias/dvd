<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<style>
	.content{
		position:absolute;
		top:120px;
		left:25%;
		width:60%;
		background-color:#FFFFE4;
	}
	.imgBox{
		float:left;
		margin:60px 2% 0 5%;
		width:25%;
		height:380px;
	}
	h1{
		width:100%;
		padding-bottom :10px;
		border-bottom:2px solid black;
	}
	.box{
		clear:both;
		height:500px;
		border-bottom:2px solid black;
	}
	.dvd_content{
		clear:both;
		margin-top:150px;
		margin-left:10%;	
	}
	.span{
		background-color:#FFFFE4;
	}
	.txtBox{
		position:absolute;
		top:155px;
		width:50%;
		left:40%;
		font-size:16px;

	}
	.buy_btn{
		margin-right:5%;
	}
	.view_list{
		background-color: red;
		width:40%;
		height:50px;
		border-radius:25px;
		font-size: 17px;
		padding-top:10px;
		margin-top:50px;
		margin-left:30%;
	}
	.update_btn{
		float:right;
		margin-top: 15px;
		margin-right:2%;
	}
</style>
<head>
<meta charset="UTF-8">
<title>detail_form</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/catalog.jsp"/>
	<div class="content">
		<div class="update_btn">
			<button class="btn btn-warning" onclick="location.href='admin/update_form.do?num=${dvd.num}&type=data'">수정</button>
		</div>
		<h1>　영화 상세</h1>
		<div class="box">
			<div class="imgBox">
				<img src="${pageContext.request.contextPath }/upload/${dvd.saveFileName}" onclick="location.href='detail_form.do?num=${dvd.num}'"/>
			</div>
			<div class="txtBox">
				<h2>${dvd.title}</h2>
				<hr/>
				<div>
					<p>배우 : ${dvd.actor}</p>
					<p>장르 : ${dvd.genre}</p>
					<p>개봉일 : ${dvd.production}</p>
					가격 :<fmt:formatNumber value="${dvd.price}"/>원<br/>
				</div>
				<hr/>
				<button class="btn btn-success buy_btn">구매 하기</button>
				<button class="btn btn-warning">장바구니 담기</button>
			</div>
		</div>
		<div class="view_list">
			<span><a href="#dvd_content" style="padding-left:20%">동영상</a> |</span>
			<span><a href="#content">줄거리</a> |</span>
			<span><a href="#rating">평점/리뷰</a> |</span>
			<span><a href="">Q&A</a></span>
		</div>
		<div class="dvd_content" id="dvd_content">
			<iframe width="90%" height="500" src="https://www.youtube.com/embed/${dvd.trailer}" frameborder="0" allowfullscreen></iframe>
			<h3>줄거리</h3>
			<span id="content">${dvd.content}</span>
		</div>
		<jsp:include page="/WEB-INF/views/movie/rating/rating_form.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/movie/qna/qnalist.jsp"></jsp:include>
	</div>
</body>
</html>