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
				<button class="btn btn-default" id="up_btn">
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
         <c:when test="">
            <li><a href="">&laquo;</a></li>
         </c:when>
         <c:otherwise>
            <li class="disabled"><a class="muted" href="javascript:">&laquo;</a></li>
         </c:otherwise>
      </c:choose>
      <c:forEach var="i" begin="${pagingRating.startPageNum }" end="${pagingRating.endPageNum }">
         <c:choose>
            <c:when test="">
               <li class="active"><a href="detail_form.do?num&${dvd.num}&ratingNum=${i }">${i }</a></li>   
            </c:when>
            <c:otherwise>
               <li><a onclick="paging(${i})">${i }</a></li>
            </c:otherwise>
         </c:choose>    
      </c:forEach>
      <c:choose>
         <c:when test="">
            <li><a href="">&raquo;</a></li>
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
					alert("글이 등록 되었습니다.");
					location.reload();
				}
			}
		});
	});
	var paging = function(data){
		$.ajax({
			type:"get",
			url:"rating/getList.do?dvd_num=${dvd.num}&pageNum="+data,
			success:function(data){
				var length = data.length;
				for(var i=0;i<length;i++){
					$(".content_tr").eq(i).hide();
					$(".rating").eq(i).show();
					$(".rating_writer").eq(i).text(data[i].writer);
					$(".rating_title").eq(i).text(data[i].title);
					$(".rating_score").eq(i).text(data[i].score);
					$(".rating_recommend").eq(i).text(data[i].recommend+"회");
					$(".rating_regdate").eq(i).text(data[i].regdate);
					if(data[i].score == 0.5){
						html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
						"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 1){
						html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
						"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 1.5){
						html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-half.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
						"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 2){
						html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
						"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 2.5){
						html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-half.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
						"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 3){
						html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
						"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 3.5){
						html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-half.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
						"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 4){
						html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
						"<img src='/dvd/resources/images/star-off.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
						"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 4.5){
					html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
					"<img src='/dvd/resources/images/star-half.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
					"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					else if(data[i].score == 5){
					html = "<div class='rating_star' title='gorgeous' style='cursor: default; width: 100px;'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='1' title='gorgeous'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='2' title='gorgeous'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:4px' alt='3' title='gorgeous'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px; margin-right:5px' alt='4' title='gorgeous'>"+
					"<img src='/dvd/resources/images/star-on.png' style='margin-top:4px;' alt='5' title='gorgeous'>"+
					"<input type='hidden' name='score' value='4' readonly='readonly'></div>"
					$(".rating_score").eq(i).html(html);
					}
					$("#rating_content").eq(i).text(data[i].content);
				}
				for(var i=length;i<10;i++){
					 $(".rating").eq(i).hide();
					 $(".content_tr").eq(i).hide();
				}
			}
		}); 
	}
</script>