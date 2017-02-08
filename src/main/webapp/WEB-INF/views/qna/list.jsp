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
	.q_modifyWrite{
		display:none;
	}
	.a_modifyWrite{
		display:none;
	}
	
</style>
<body>
	<h3>QnA 페이지입니다.</h3>
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
					<td>
						<!-- 답변 유무에 따라 다르게 표시 -->
						<c:choose>
							<c:when test="${tmp.qna_answer eq null }">미답변</c:when>
							<c:otherwise>답변완료</c:otherwise>
						</c:choose>
					</td>
					<td>${tmp.qna_writer }</td>
					<td>${tmp.regdate }</td>
				</tr>
				
				<!-- Q&A 글 내용 보기 -->
				<tr class="contentTR showContent${tmp.qna_num}">
					<td colspan="4">
						<span>내용 :</span> ${tmp.qna_content}
						<c:if test="${id eq tmp.qna_writer }">
							<a onclick="q_deleteLink(${tmp.qna_num})" style="float:right; cursor:pointer">삭제</a>
							<a id="q_modifyLink" style="float:right; cursor:pointer">수정</a>
						</c:if>
						
					<!-- question 글 수정 폼 시작 -->
						<div class="q_modifyWrite">
							<form id="q_modifyForm">
								<div class="form-group">
									<input type="hidden" name="qna_num" value="${tmp.qna_num }"/>
									<label class="control-label" for="qna_title">제목:</label>
									<input class="form-control" type="text" name="qna_title" id="qna_title" value="${tmp.qna_title }">
								</div>
								<div class="form-group">
									<label class="control-label" for="qna_content">질문내용:</label>
									<textarea class="form-control" name="qna_content" id="qna_content" cols="20" rows="5">${tmp.qna_content }</textarea>
								</div>
								<button class="btn btn-default" type="button" id="q_modifyBtn">작성</button>
							</form>
						</div>
					<!-- question 글 수정 폼 끝 -->
						
						<div style="margin-top:20px;border:1px solid grey;"></div>
						<c:choose>
							<c:when test="${tmp.qna_answer ne null }">
								<div class="replyContent" style="border-bottom:1px dotted grey;clear:both; margin-left:70px;">
									<p>${tmp.qna_answer}</p>
									<br/>
									<c:if test="${id eq 'admin' }">
										<a onclick="a_deleteLink(${tmp.qna_num})" style="float:right; cursor:pointer">삭제</a>
										<a id="a_modifyLink" style="float:right; cursor:pointer">수정</a>
									</c:if>
									<div class="a_modifyWrite">
										<form id="a_modifyForm">
											<div class="form-group">
												<p style="margin-top:10px;font-size:18px"><strong>댓글 달기</strong></p>
												<input type="hidden" name="qna_num" value="${tmp.qna_num }"/>
												<label class="control-label" for="qna_answer">답변:</label>
												<textarea class="form-control" name="qna_answer" id="qna_answer" cols="20" rows="5">${tmp.qna_answer }</textarea>
											</div>
												<button class="btn btn-default" type="button" id="a_modifyBtn">작성</button>
										</form>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:if test="${id eq 'admin' }">
									<div>
										<form id="answerForm">
											<div class="form-group">
												<p style="margin-top:10px;font-size:18px"><strong>댓글 달기</strong></p>
												<input type="hidden" name="qna_num" value="${tmp.qna_num }" />
												<label class="control-label" for="qna_answer">답변:</label>
												<textarea class="form-control" name="qna_answer" id="qna_answer" style="width:85%; float:right; resize:none;"></textarea>
											</div>
												<button class="btn btn-default" type="button" style="margin-bottom:20px;"
												id="answerBtn">댓글 작성</button>
										</form>
									</div>
								</c:if>	
							</c:otherwise>
						</c:choose>	
		         	</td>
         		</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<c:if test="${id ne null }">
		<button type="submit" class="btn btn-info qnaBtn">글쓰기</button>
	</c:if>
	
	<!-- Q&A 글 작성 폼 시작 -->
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
	<!-- Q&A 글 작성 폼 끝 -->

</body>

<script>
	function showcontent(data){
		$(".showContent"+data).toggle();
	};
	
	$("#answerBtn").click(function(){
		var a_form = $("#answerForm").serialize();
		$.ajax({
			url:"a_update.do",
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

<script>
	$("#q_modifyLink").click(function(){
		$(".q_modifyWrite").toggle();
	});
	
	$("#q_modifyBtn").click(function(){
		var q_form = $("#q_modifyForm").serialize();
		$.ajax({
			url:"q_update.do",
			type:"post",
			data:q_form,
			success:function(data){
				if(data == 1){
					alert("글이 수정 되었습니다.");
					
				}else{
					alert("잠시 후 ...꺼졍");
				}
			}
		})
	});
	
	function q_deleteLink(msg){
		$.ajax({
			url:"q_delete.do",
			type:"post",
			data:{"qna_num":msg},
			success:function(data){
				if(data==1){
					alert("글이 삭제 되었습니다.");
				}else{
					alret("삭제에 실패!");
				}
			}
		});
	};
</script>

<script>
	$("#a_modifyLink").click(function(){
		$(".a_modifyWrite").toggle();
	});
	
	$("#a_modifyBtn").click(function(){
		var a_form = $("#a_modifyForm").serialize();
		$.ajax({
			url:"a_update.do",
			type:"post",
			data:a_form,
			success:function(data){
				if(data == 1){
					alert("글이 수정 되었습니다.");
					
				}else{
					alert("잠시 후 ...꺼졍");
				}
			}
		})
	});
	
	function a_deleteLink(msg){
		$.ajax({
			url:"a_delete.do",
			type:"post",
			data:{"qna_num":msg},
			success:function(data){
				if(data==1){
					alert("댓글이 삭제 되었습니다.");
				}else{
					alert("삭제에 실패!");
				}
			}
		});
	};
</script>
</html>











