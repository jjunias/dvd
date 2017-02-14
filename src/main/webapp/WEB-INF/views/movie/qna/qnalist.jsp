<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#box_qna{
		background-color:#F5F5F5;
		margin-top:10px;
		padding-bottom:50px;
		padding-left:10%;
		border:1px solid #E4E4E4;
	}
	.qna_table,.qna_write{
		width:90%
	}
	.qa_content{
		display:none;
		background-color:#FAFAFA;
	}
	.textarea{
		width:100%;
		background-color:#FAFAFA;
		resize:none;
		height:70px;
		outline:none;
		border:0px solid #FAFAFA;
	}
	.qna_answer{
		width:100%;
		height:70px;
	}
	.qna_body{
		border-bottom: 2px solid #E4E4E4;
	}
	.qna_writeBtn{
		float:right;
	}
	.qna_writeBox{
		display:none;
		border-top:2px solid #E4E4E4;
		border-bottom:2px solid #E4E4E4;
		width:50%;
		margin-left:25%;
	}
	#qna_btn,#qna_cancel{
		float:right;
		margin-top:10px;
		margin-left:5px;
	}
	.answer_update{
		display:none;
	}
</style>
<div id="box_qna">
	<h3>Q & A</h3>
	<table class="table qna_table">
		<thead>
			</tr>
				<th style="width:20%"><strong>작성자</strong></th>
				<th style="width:45%">제목</th>
				<th style="width:20%">답변 유무</th>`
				<th style="width:10%">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${qnaList }" varStatus="status">
				<tr>
					<td>${tmp.qna_writer }</td>
					<td style="cursor: pointer" onclick="showcontent('${status.count}')">${tmp.qna_title}</td>
					<td>
						<c:choose>
							<c:when test="${tmp.qna_answer eq null }">
								<span>미답변</span>
							</c:when>
							<c:otherwise>
								<span>답변완료</span>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${tmp.regdate }</td>
				</tr>
				<tr>
					<td colspan="4" class="qa_content">
						<div class="question">
							<button class="btn btn-default">Q</button><br/>
							<textarea class="textarea">${tmp.qna_content}</textarea>
						</div><hr/>
						<div class="answer">  		
							<button class="btn btn-default">A</button><br/>
							<c:choose>
								<c:when test="${tmp.qna_answer eq null }">
									<form class="answer_form">
										<input type="hidden" name="qna_num" value="${tmp.qna_num }"/>
										<textarea name="qna_answer" class="qna_answer">${tmp.qna_answer}</textarea>
										<button class="btn btn-default qna_answerBtn" type="button" style="float:right;margin-top:5px;">답변 등록</button>
									</form>
								</c:when>
								<c:otherwise>
									<c:if test="${id eq 'admin'}">
										<button class="btn btn-default open_answer" type="button" style="float:right;margin-top:-50px">답변 수정</button>
										<button class="btn btn-default" onclick="a_deleteLink('${tmp.qna_num}')" type="button" style="float:right;margin-top:-10px">답변 삭제</button>
									</c:if>
									<textarea class="textarea">${tmp.qna_answer}</textarea>
									<form class="answer_update">
										<input type="hidden" name="qna_num" value="${tmp.qna_num }"/>
										<textarea name="qna_answer" class="qna_answer">${tmp.qna_answer}</textarea>
										<button class="btn btn-default qna_answerUpdateBtn" type="button" style="float:right;margin-top:5px;">답변 등록</button>
									</form>									
								</c:otherwise>
							</c:choose>	
						</div> 
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<div class="qna_write">
		<button type="submit" class="btn btn-default qna_writeBtn">글쓰기</button>
		<div class="qna_writeBox form-group">
			<form id="qna_form">
				<div class="form-group">
					<input type="hidden" name="dvd_num" value="${dvd.num}" />
					<label class="control-label" for="qna_title">제목:</label>
					<input class="form-control rating_titleWrite" type="text" name="qna_title" id="qna_title"/>
				</div>
				<div class="form-group">
					<label class="control-label" for="qna_content">질문:</label>
					<textarea class="form-control qna_contentWrite" name="qna_content" id="qna_content" maxlength="400" cols="25" rows="10" style="resize=none;"></textarea>
					<span class="text_size">0</span>/400byte
				</div>
				<button class="btn btn-default" type="button" id="qna_cancel">취소</button>
				<button class="btn btn-default" type="button" id="qna_btn">작성</button>
			</form>
		</div>
	</div>
</div>

<script>
	//글쓰기 토글
	$(".qna_writeBtn").click(function(){
		$(".qna_writeBox").toggle();
	});
	//글자 길이
	$("#qna_content").keyup(function(){
		$(".text_size").text($("#qna_content").val().length);
	});
	//글 등록
	$("#qna_btn").click(function(){
		var q_form = $("#qna_form").serialize();
		$.ajax({
			url:"qna/qna_insert.do",
			type:"post",
			data:q_form,
			success:function(data){
				if(data == 1){
					location.href="detail_form.do?num=${dvd.num}&ratingNum=${param.ratingNum}&scroll=qna";
				}
			}
		});
	});
	//글쓰기 닫기
	$("#qna_cancel").click(function(){
		$(".qna_writeBox").hide();
		$("#qna_title").val("");
		$("#qna_content").val("");
	});
	//글쓰기 토글
	var showcontent = function(data){
		var datas = data-1;
		$(".qa_content").eq(datas).toggle();
	}
	//답변 등록
	$(".qna_answerBtn").click(function(){
		var a_form = $(".answer_form").serialize();
		$.ajax({
			url:"qna/a_update.do",
			type:"post",
			data:a_form,
			success:function(data){
				if(data == 1){
					location.reload();
				}
			}
		});
	});
	$(".qna_answerUpdateBtn").click(function(){
		var a_form = $(".answer_update").serialize();
		$.ajax({
			url:"qna/a_update.do",
			type:"post",
			data:a_form,
			success:function(data){
				if(data == 1){
					location.reload();
				}
			}
		});
	});
	$(".open_answer").click(function(){
		$(".answer_update").toggle();
	});
	//답변 삭제
	function a_deleteLink(data){
		$.ajax({
			url:"qna/a_delete.do",
			type:"post",
			data:{"qna_num":data},
			success:function(data){
				if(data==1){
					location.reload();
				}
			}
		});
	};
	//scroll 이동
	$(function(){
		if('${scroll}' == 'qna'){
			$(window).scrollTop($("#qnaScroll").offset().top);
		}	
	});
</script>










