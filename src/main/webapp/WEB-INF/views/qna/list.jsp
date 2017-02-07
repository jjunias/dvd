<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/views/qna/list.jsp</title>
</head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>

<style>
	.content{
		clear:both;
	}

   .contentTR{
   	display:none;
   }
   .qnaWrite{
   	  display:none;
   }
	
</style>
<body>
	<h3>Q&A 페이지입니다.</h3>
	<table>
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.qna_num }</td>
					<td style="cursor:pointer" onclick="showcontent(${tmp.qna_num})">${tmp.qna_title }</td>
					<td>${tmp.qna_writer }</td>
					<td>${tmp.regdate }</td>
				</tr>
				
				<tr class="contentTR showContent${tmp.qna_num}">
					<td colspan="4"><span>내용 :</span> ${tmp.qna_content}
						<div style="margin-top:20px;border:1px solid grey;"></div>
						<c:choose>
							<c:when test="${tmp.qna_answer ne null }">
								<div class="replyContent" style="border-bottom:1px dotted grey;clear:both; margin-left:70px;">
									<p>${tmp.qna_answer}</p>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<form id="answerForm">
										<div class="form-group">
											<p style="margin-top:10px;font-size:18px"><strong>댓글 달기</strong></p>
											<input type="hidden" name="qna_num" value="${tmp.qna_num }" />
											<label class="control-label" for="qna_answer">답변:</label>
											<textarea class="form-control" name="qna_answer" id="qna_answer" style="width:85%; float:left; resize:none;"></textarea>
										</div>
											<button class="btn btn-default" type="button" style="margin-left:5%;margin-bottom:20px;"
											id="answerBtn">댓글 작성</button>
									</form>
								</div>
							</c:otherwise>
						</c:choose>	
		         	</td>
         		</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- <c:if test="${id ne null }"> -->
	<!-- </c:if>-->
	<button type="submit" class="btn btn-info qnaBtn" style="float:right">글쓰기</button>

	<form id="questionForm">
		<div class="qnaWrite">
			<div class="form-group">
				<input type="hidden" name="dvd_num" value="1"/>
				<label class="control-label" for="qna_title">제목:</label>
				<input class="form-control" type="text" name="qna_title" id="qna_title"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="qna_content">질문내용:</label>
				<textarea class="form-control" name="qna_content" id="qna_content" cols="20" rows="5"></textarea>
			</div>
			<button class="btn btn-default" type="button" id="questionBtn">작성</button>
		</div>
	</form>

</body>

<script>
	function showcontent(data){
		$(".showContent"+data).toggle();
	};
	
	$("#answerBtn").click(function(){
		var a_form = $("#answerForm").serialize();
		$.ajax({
			url:"qna_update.do",
			type:"post",
			data:a_form,
			success:function(data){
				if(data == 1){
					alert("글이 등록 되었습니다.");
					
				}else{
					alert("잠시 후 ...꺼졍");
				}
			}
		})
	});
	
	$("#questionBtn").click(function(){
		var q_form = $("#questionForm").serialize();
		$.ajax({
			url:"qna_insert.do",
			type:"post",
			data:q_form,
			success:function(data){
				if(data == 1){
					alert("글이 등록 되었습니다.");
					
				}else{
					alert("잠시 후 ...꺼졍");
				}
			}
		})
	});
	
	$(".qnaBtn").on("click", function(){
		$(".qnaWrite").toggle();
	});
	
</script>
</html>











