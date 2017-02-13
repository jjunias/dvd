<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.rating_star{
		width:110px !important;
	}
	#input_star img,.rating_star img{
		width:16px;
		height:16px;
	}
	.content_tr{
		display:none;
	}
	.rating_content{
		resize : none;
		background-color :#fcf8e3;
		border : 0px solid white;
		width:100%;
		height:170px;
		outline: none;
	}
	.rating_content:hover{
		background-color: #faf2cc;
	}
	.content_btn button{
		width: 80%;
		margin-bottom:10px;
		margin-left;10%;
	}
	#up_btn{
	height:80px;
	}
}
</style>
<div class="evaluation">
	<table class="table table-hover">
		<p id="rating"><strong style="font-size:30px">평점/리뷰</strong></p>
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
			<tr class="rating warning">
				<td class="rating_writer">${tmp.writer }</td>
				<td class="rating_title" onclick="open_content('${status.count}')" style="cursor:pointer;">${tmp.title}</td>
				<td class="rating_score"><span class="scores" style='display:none'>${tmp.score}</span>
					<div class="rating_star"></div>
				</td>
				<td class="rating_recommend">${tmp.recommend}회</td>
				<td class="rating_regdate">${tmp.regdate }</td>
			</tr>
			<tr class="warning content_tr">
				<td colspan="4" class="rating_content">
					<textarea readonly="readonly" name="rating_content" class="rating_content">${tmp.content}</textarea>
				</td>
				<td class="content_btn">
					<button class="btn btn-warning">수정</button>
					<button class="btn btn-danger">삭제</button>
					<button class="btn btn-default" onclick="up_btn('${status.count}','${tmp.num}')">
						<span class="glyphicon glyphicon-thumbs-up" style="font-size:20px;color:darkblue"></span>
					</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<div class="page_display">
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
   </div>
   
      
<button type="submit" class="btn btn-info write_eval_Btn" style="float:right">글쓰기</button>
<!-- 글 등록 form  -->
	<div class="writeBox form-group">
		<form id="rating_form">
		<div class="form-group">
			<input type="hidden" name="dvd_num" value="${dvd.num}"/>
			<label class="control-label" for="title">제목:</label>
			<input class="form-control" type="text" name="title" id="title"/>
		</div>
		<label class="control-label" for="score">평점:</label>	
		<div id="input_star"></div>
		<div class="form-group">
			<label class="control-label" for="content">후기:</label>
			<textarea class="form-control" name="content" id="input_content" maxlength="400" cols="25" rows="10" style="resize=none;"></textarea>
			<span class="text_size">0</span>/400byte
		</div>
			<button class="btn btn-default" type="button" id="rating_btn">작성</button>
		</form>
	</div>
<script>
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
		/* /private/recommendUp */
	}
		
	$("#input_content").keyup(function(){
		$(".text_size").text($("#input_content").val().length);
	});
	$(".content_tr").mouseover(function(){
		$(".rating_content").css("background-color","#faf2cc");
	});
	$(".content_tr").mouseout(function(){
		$(".rating_content").css("background-color","#fcf8e3");
	});
	var open_content = function(data){
		var datas = data - 1;
		$(".content_tr").hide();
		$(".content_tr").eq(datas).toggle();
	}
	$('#input_star').raty({
		half : true,
		score : 0
	});
	for(var i=0;i<10;i++){	
		$('.rating_star').eq(i).raty({
			half : true,
			score : $(".scores").eq(i).text(),
			readOnly: true
		});
	}
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
	$(function(){
		if('${page}' =='review'){
			$(window).scrollTop($("#rating").offset().top);
		}
	});
</script>