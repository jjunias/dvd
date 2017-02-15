<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.rating_star,#input_star,.update_star{
		width:130px !important;
	}
	#input_star img,.rating_star img,.update_star img{
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
	#rating_btn,#rating_cancel,.rating_Updatebtn,.rating_updateCancle{
		margin-top:10px;
		margin-left:5px;
	}
	.rating_updateWrite{
		display:none;
	}
	.btn_float{
		float:right;
	}
}
</style>
<div id="box_rating">
	<h3 id='rating'>평점 / 리뷰</h3>
	<div class="rating_table">
		<table class="table">
		<thead>
			<tr>
				<th style="width:20%"><strong>작성자</strong></th>
				<th style="width:35%">제목</th>
				<th style="width:20%">평점</th>
				<th style="width:15%">추천수</th>
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
						<c:if test="${id eq tmp.writer}">
							<button class="btn btn-default update_toggleBtn" onclick="update_toggleBtn(${status.count})">수정</button>
							<button class="btn btn-default" onclick="ratingDelete(${tmp.num})" >삭제</button>
						</c:if>
						<button class="btn btn-default" onclick="up_btn('${status.count}','${tmp.num}')">
							<span class="glyphicon glyphicon-thumbs-up" style="font-size:20px;color:darkblue"></span>
						</button>
					</td>
				</tr>
				<tr>
					<c:if test="${id eq tmp.writer}">
					<td colspan="4" class="rating_updateWrite">
						<div>     
							<div class="rating_UpdatewriteBox form-group">
								<form class="rating_Updateform">
									<input type="hidden" name="num" value="${tmp.num}" />
									<div class="form-group">
										<label class="control-label" for="title">제목:</label>
										<input class="form-control rating_UpdatetitleWrite" type="text" name="title" id="title" value="${tmp.title}"/>
									</div>
									<label class="control-label" for="score">평점:</label>	
									<div class="update_star"></div>
									<div class="form-group">
										<label class="control-label" for="content">후기:</label>
										<textarea class="form-control rating_UpdatecontentWrite" name="content" id="input_Updatecontent" maxlength="400" cols="25" rows="10" style="resize=none;">${tmp.content}</textarea>
										<span class="text_Updatesize">0</span>/400byte
									</div>
									<div class="btn_float">
										<button class="btn btn-default rating_updateBtn" onclick="updateRating(${status.count})" type="button">수정</button>
										<button class="btn btn-default rating_updateCancle" type="button" onclick="updateCancle(${status.count})">취소</button>
									</div>
								</form>
							</div>
						</div>
					</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<center>
		<ul class="pagination">
				<c:choose>
					<c:when test="${pagingRating.startPageNum ne 1}">
						<li><a href="detail_form.do?num=${dvd.num}}&scroll=rating&ratingNum=${pagingRating.startPageNum-1}&qnaNum=${param.qnaNum}">&laquo;</a></li>
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
							<li><a href="detail_form.do?num=${dvd.num}&scroll=rating&ratingNum=${i }&qnaNum=${param.qnaNum}">${i}</a></li>
						</c:otherwise>
					</c:choose>    
				</c:forEach>
				<c:choose>
					<c:when test="${pagingRating.totalPageCount > pagingRating.endPageNum}">
						<li><a href="detail_form.do?num=${dvd.num}&scroll=rating&ratingNum=${pagingRating.endPageNum+1}&qnaNum=${param.qnaNum}">&raquo;</a></li>
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
				<div class="btn_float">
					<button class="btn btn-default" type="button" id="rating_btn">작성</button>
					<button class="btn btn-default" type="button" id="rating_cancel">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	//추천 버튼
	var up_btn = function(count,num){
		if('${id}' == ""){
			var login = confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?");
			if(login){
				$(".loginBar").stop().slideToggle(300);
			}
		}else{
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
		$('.update_star').eq(i).raty({
			half : true,
			score : $(".scores").eq(i).text(),
		})
	}
	//글 쓰기
	$('#rating_btn').click(function(){
		if($(".rating_titleWrite").val() ==""){
			alert("제목을 입력해주세요.");
		}else if($("#rating_form").children("#input_star").children("input").val()  == ""){
			alert(" 평점을 입력해주세요.");
		}else if($(".rating_contentWrite").val() ==""){
			alert("내용을 입력해주세요.");
		}else{
			ratingForm = $("#rating_form").serialize();
			$.ajax({
				type:"post",
				url:"rating/insert.do",
				data: ratingForm,
				success:function(data){
					if(data ==1){
						location.href="detail_form.do?num=${dvd.num}&scroll=rating&ratingNum=1&qnaNum=${param.qnaNum}";
					}
				}
			});
		}
	});
	//스크롤 이동
	$(function(){
		if('${scroll}' =='rating'){
			$(window).scrollTop($("#box_rating").offset().top);
		}
	});
	//글쓰기 토글
	$(".rating_writeBtn").click(function(){
		if('${id}' == ""){
			var login = confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?");
			if(login){
				$(".loginBar").stop().slideToggle(300);
			}
		}else{
			$(".rating_writeBox").toggle();
		}
	});
	//글쓰기 취소(초기화)
	$("#rating_cancel").click(function(){
		$(".rating_writeBox").hide();
		$('#input_star').raty({
			half : true,
			score : 0
		});
		$(".rating_titleWrite").val("");
		$(".rating_contentWrite").val("");
	});
	$(".star").raty({
		half : true,
		score : "${dvd.grade}",
		readOnly: true
	}); 
	//업데이트 보이기
	var update_toggleBtn = function(data){
		var datas = data-1;
		$(".rating_updateWrite").eq(datas).show();
		$(".text_Updatesize").text($(".rating_UpdatecontentWrite").val().length);
		$(".content_tr").eq(datas).hide();
	}
	var updateCancle = function(data){
		var datas = data-1;
		$(".rating_updateWrite").eq(datas).hide();
		$(".content_tr").eq(datas).show();
	}
	//rating 수정
	var updateRating = function(data){
		var datas = data-1;
		if($(".rating_UpdatetitleWrite").val()==""){
			alert("제목을 입력해주세요.");
		}else if($(".rating_UpdatecontentWrite").val()==""){
			alert("내용을 입력해주세요")
		}else{
			var formData = $(".rating_Updateform").eq(datas).serialize();
			$.ajax({
				type:"post",
				url:"rating/private/update.do",
				data:formData,
				success:function(data){
					if(data ==1){
						location.reload();
					}
				}
			});
		}
	}
	//글수정 키 길이
	$(".rating_UpdatecontentWrite").keyup(function(){
		$(".text_Updatesize").text($(".rating_UpdatecontentWrite").val().length);
	});
	//rating 글 삭제
	var ratingDelete = function(data){
		$.ajax({
			type:"post",
			url:"rating/private/delete.do",
			data:{"num":data},
			success:function(data){
				if(data ==1){
					location.reload();
				}
			}
		});
	}
</script>