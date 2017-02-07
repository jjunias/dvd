<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#input_star{
		width:150px !important;
	}
	#input_star img{
		width:20px;
		height:20px;
	}
</style>
<div class="evaluation">
	<table class="table table-hover">
		<p id="rating"><strong style="font-size:30px">평점/리뷰</strong></p>
		<a href="rating/insert.do" style="color:red">테스트</a>
	<thead>
		<tr>
			<th style="width:10%">글 번호</th>
			<th style="width:35%">제목</th>
			<th style="width:25%">평점</th>
			<th style="width:20%"><strong>작성자</strong></th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody class="rating_body">
		<c:forEach var="tmp" items="${ratingList}">
			<tr class="rating warning">
				<td class="rating_num">${tmp.num}</td>
				<td class="rating_title">${tmp.title}</td>
				<td class="rating_score">${tmp.score }</td>
				<td class="rating_writer">${tmp.writer }</td>
				<td class="rating_regdate">${tmp.regdate }</td>
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
<button><a href="detail_form.do?num=${dvd.num}&ratingNum=2">2번째</a></button>
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
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
		</div>
			<button class="btn btn-default" type="button" id="rating_btn">작성</button>
		</form>
	</div>
<script>
	$('#input_star').raty({
		half : true,
		score : 0
	});
	
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
					$(".rating").eq(i).show();
					$(".rating_num").eq(i).text(data[i].num);
					$(".rating_title").eq(i).text(data[i].title);
					$(".rating_score").eq(i).text(data[i].score);
					$(".rating_writer").eq(i).text(data[i].writer);
					$(".rating_regdate").eq(i).text(data[i].regdate);
				}
				for(var i=length;i<10;i++){
					$(".rating").eq(i).hide();
				}
			}
		}); 
	}
</script>