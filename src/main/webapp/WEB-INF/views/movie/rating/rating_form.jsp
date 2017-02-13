<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.rating_star,#input_star{
		width:130px !important;
	}
	#input_star img,.rating_star img{
		width:19px;
		height:19px;
	}
	.content_tr{
		display:none;
		background-color: #FAFAFA;
	}
	.rating_content{
		resize : none;
		background-color :#FAFAFA;
		border:0px solid white;
		width:100%;
		height:170px;
		outline: none;
	}
	.content_btn button{
		width: 80%;
		margin-bottom:10px;
		margin-left:10%;
		border-left:2px solid #E4E4E4;
	}
	#up_btn{
	height:80px;
	}
	#box_rating{
		background-color:#F5F5F5;
		margin-top:10px;
		padding-bottom:50px;
		padding-left:10%;
		border:1px solid #E4E4E4;
	}
	.rating_table,.rating_write{
		width:90%;
	}
	.rating_body{
		border-bottom: 2px solid #E4E4E4;
	}
	.rating_writeBtn{
		float:right;
	}
	.rating_writeBox{
		display:none;
		border-top:2px solid #E4E4E4;
		border-bottom:2px solid #E4E4E4;
		width:50%;
		margin-left:25%;
	}
	#rating_btn,#rating_cancel{
		float:right;
		margin-top:10px;
		margin-left:5px;
	}
}
</style>
<div id="box_rating">
	<h3>평점 / 리뷰</h3>
	<div class="rating_table">
		<table class="table">
		<thead>
			<tr>
				<th style="width:20%"><strong>작성자</strong></th>
				<th style="width:35%">제목</th>
				<th style="width:25%">평점</th>
				<th style="width:10%">추천수</th>
				<th style="width:10%">등록일</th>
			</tr>
		</thead>
		<tbody class="rating_body">
			<c:forEach var="tmp" items="${ratingList}" begin="0" varStatus="status">
				<tr class="rating">
					<td>${tmp.writer }</td>
					<td onclick="open_content('${status.count}')" style="cursor:pointer;">${tmp.title}</td>
					<td class="rating_score"><span class="scores" style='display:none'>${tmp.score}</span>
						<div class="rating_star"></div>
					</td>
					<td class="rating_recommend">${tmp.recommend}회</td>
					<td class="rating_regdate">${tmp.regdate }</td>
				</tr>
				<tr class="content_tr">
					<td colspan="4" class="rating_content">
						<textarea readonly="readonly" name="rating_content" class="rating_content">${tmp.content}</textarea>
					</td>
					<td class="content_btn">
						<button class="btn btn-default">수정</button>
						<button class="btn btn-default">삭제</button>
						<button class="btn btn-default" onclick="up_btn('${status.count}','${tmp.num}')">
							<span class="glyphicon glyphicon-thumbs-up" style="font-size:20px;color:darkblue"></span>
						</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<center>
		<ul class="pagination">
				<c:choose>
					<c:when test="${pagingRating.startPageNum>5}">
						<li><a href="detail_form.do?num=${dvd.num}&page=review&ratingNum=${pagingRating.startPageNum-1}">&laquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a class="muted" href="javascript:">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pagingRating.startPageNum }" end="${pagingRating.endPageNum }">
					<c:choose>
						<c:when test="${i eq param.ratingNum}">
							<li class="active"><a href="javascript:">${i }</a></li>   
						</c:when>
						<c:otherwise>
							<li><a href="detail_form.do?num=${dvd.num}&page=review&ratingNum=${i }">${i}</a></li>
						</c:otherwise>
					</c:choose>    
				</c:forEach>
				<c:choose>
					<c:when test="${pagingRating.totalPageCount > pagingRating.endPageNum}">
						<li><a href="detail_form.do?num=${dvd.num}&page=review&ratingNum=${pagingRating.endPageNum+1}">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a class="muted" href="javascript:">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
	</center>
	<div class="rating_write">     
		<button type="submit" class="btn btn-default rating_writeBtn">글쓰기</button>
		<div class="rating_writeBox form-group">
			<form id="rating_form">
				<div class="form-group">
					<input type="hidden" name="dvd_num" value="${dvd.num}"/>
					<label class="control-label" for="title">제목:</label>
					<input class="form-control rating_titleWrite" type="text" name="title" id="title"/>
				</div>
				<label class="control-label" for="score">평점:</label>	
				<div id="input_star"></div>
				<div class="form-group">
					<label class="control-label" for="content">후기:</label>
					<textarea class="form-control rating_contentWrite" name="content" id="input_content" maxlength="400" cols="25" rows="10" style="resize=none;"></textarea>
					<span class="text_size">0</span>/400byte
				</div>
				<button class="btn btn-default" type="button" id="rating_cancel">취소</button>
				<button class="btn btn-default" type="button" id="rating_btn">작성</button>
			</form>
		</div>
	</div>
</div>
<script>
	//추천 버튼
	var up_btn = function(count,num){
		$.ajax({
			url:"rating/private/recommendUp.do",
			type:"post",
			data:{"rating_num":num},
			success:function(data){
				if(data == 1){
					var preCommend = $(".rating_recommend").eq(count-1).text();
					var commend =parseInt(preCommend)+1;
					$(".rating_recommend").eq(count-1).text(commend+"회");
				}else{
					alert("이미 공감한 글 입니다.");
				}
			}
		});
	}
	//content 길이
	$("#input_content").keyup(function(){
		$(".text_size").text($("#input_content").val().length);
	});
	//content 토글
	var open_content = function(data){
		var datas = data - 1;
		$(".content_tr").eq(datas).toggle();
	}
	//input 별
	$('#input_star').raty({
		half : true,
		score : 0
	});
	//list 별
	for(var i=0;i<5;i++){	
		$('.rating_star').eq(i).raty({
			half : true,
			score : $(".scores").eq(i).text(),
			readOnly: true
		});
	}
	//글 쓰기
	$('#rating_btn').click(function(){
		var ratingForm = $("#rating_form").serialize();
		$.ajax({
			type:"post",
			url:"rating/insert.do",
			data: ratingForm,
			success:function(data){
				if(data ==1){
					location.href="detail_form.do?num=${dvd.num}&page=review&ratingNum=1";
				}
			}
		});
	});
	//스크롤 이동
	$(function(){
		if('${page}' =='review'){
			$(window).scrollTop($("#rating").offset().top);
		}
	});
	$(".rating_writeBtn").click(function(){
		$(".rating_writeBox").show();
	});
	$("#rating_cancel").click(function(){
		$(".rating_writeBox").hide();
		$('#input_star').raty({
			half : true,
			score : 0
		});
		$(".rating_titleWrite").val("");
		$(".rating_contentWrite").val("");
	});
</script>