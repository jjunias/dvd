<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin-top : -10px;
		margin-left:5%;
		width:60%;
		font-size:16px;

	}
	.buy_btn{
		margin-right:2%;
	}
	.view_list{
		background-color: #232323;
		width:60%;
		height:50px;
		border-radius:25px;
		font-size: 17px;
		padding-top:10px;
		margin-top:10px;
		margin-left:20%;
	}
	.view_list a{
		color:white;
		text-decoration: none;
	}
	.view_list a:HOVER {
		color:darkgray;
		font-style: none;
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
	.dvd_update{
		margin-top:20px;
		margin-right:10%;
		float:right;
	}
	@media(max-width:760px){
		.view_list{
			display:none !important;
		}
		iframe {
			height:200px;
		}
		.imgBox{
			width:30% !important;
			margin-left: 3% !important; 
		}
	}
	@media(max-width:400px){
		.txt_national{
			display: none;
		}
		.imgBox{
			height:300px; 
		}
		.box{
			height:400px;
		}
	}
</style>
<head>
<meta charset="UTF-8">
<title>detail_form</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/catalog.jsp"/>
	<div class="content">
		<div class="box">
			<c:if test="${id eq 'admin' }">
				<button class="btn btn-warning dvd_update" onclick="location.href='admin/update_form.do?num=${dvd.num}&type=data'">수정</button>
			</c:if>
			<div class="imgBox">
				<img src="${pageContext.request.contextPath }/upload/${dvd.saveFileName}"/>
			</div>
			<div class="txtBox">
				<h2 class="txt_national">[
					<c:if test="${dvd.national eq 'domestic' }">국내영화
					</c:if>
					<c:if test="${dvd.national eq 'overseas' }">해외영화
					</c:if>
					] ${dvd.title}
				</h2><hr/>
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
				<button class="btn btn-success buy_btn">구매</button>
				<button class="btn btn-warning" onclick="basketBtn(${dvd.num })">장바구니</button>
			</div>
		</div>
		<table class="view_list">
			<tr>
				<td width="10%"></td>
				<td width="20%"><a href="#box_trailer">동 영 상</a></td>
				<td width="25%"><a href="#box_content">줄 거 리</a></td>
				<td width="25%"><a href="#rating">평 점/리 뷰</a></td>
				<td width="20%"><a href="#qna">Q & A</a></td>
			</tr>
		</table>
		<div id="box_trailer">
			<h3>동 영 상</h3>
			<iframe class="iframe" width="90%" height="400" src="https://www.youtube.com/embed/${dvd.trailer}" frameborder="0" allowfullscreen></iframe>
		</div>
		<div id="box_content">
			<h3>줄거리</h3>
			<span id="content">${dvd.content}</span>
		</div>
		<jsp:include page="/WEB-INF/views/movie/rating/rating_form.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/movie/qna/qnalist.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
<script>
	function basketBtn(msg){
		$.ajax({
			url:"../basket/insert.do",
			type:"post",
			data:{"dvd_num":msg},
			success:function(data){
				if(data==1){
					alert("상품을 장바구니에 담았습니다!");
					location.reload();
				}
				else{
					alert("이미 장바구니에 담은 상품입니다.");
					location.reload();
				}
			}
		});
	};
</script>
<script>	
	$(".buy_btn").click(function(){
		location.href="/dvd/users/pay.do?num=${dvd.num}";
	});
</script>
