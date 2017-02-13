<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.contentTR {
	display: none;
}

.qnaWrite {
	display: none;
}

.q_modifyWrite {
	display: none;
}

.a_modifyWrite {
	display: none;
}

.page_display a {
	text-decoration: none;
	color: #000;
}

.page_display a.active {
	font-weight: bold;
	color: red;
	text-decoration: underline;
}

.page_display a.muted {
	color: #cecece;
}
</style>
	<table class="table table-hover">
		<p id="qnaScroll">
			<strong style="font-size: 30px">Q&A</strong>
		</p>
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${qnaList }">
				<tr>
					<td style="cursor: pointer" onclick="showcontent(${tmp.qna_num})">${tmp.qna_title }</td>
					<td>${tmp.qna_writer }</td>
					<td>${tmp.regdate }</td>
					<td><c:choose>
							<c:when test="${tmp.qna_answer eq null }">미답변</c:when>
							<c:otherwise>답변완료</c:otherwise>
						</c:choose></td>
				</tr>

				<!-- Q&A 글 내용 보기 -->
				<tr class="contentTR showContent${tmp.qna_num}">
					<td colspan="4"><span>내용 :</span> ${tmp.qna_content} <c:if
							test="${id eq tmp.qna_writer }">
							<a onclick="q_deleteLink(${tmp.qna_num})"
								style="float: right; cursor: pointer">삭제</a>
							<a onclick="q_modifyLink(${tmp.qna_num})"
								style="float: right; cursor: pointer">수정</a>
						</c:if> <!-- question 글 수정 폼 시작 -->

						<form id="q_modifyForm${tmp.qna_num}">
							<div class="q_modifyWrite q_modifyWrite${tmp.qna_num}">
								<div class="form-group">
									<input type="hidden" name="qna_num" value="${tmp.qna_num }" />
									<label class="control-label" for="qna_title">제목:</label> <input
										class="form-control" type="text" name="qna_title"
										id="qna_title" value="${tmp.qna_title }">
								</div>
								<div class="form-group">
									<label class="control-label" for="qna_content">질문내용:</label>
									<textarea class="form-control" name="qna_content"
										id="qna_content" cols="20" rows="5">${tmp.qna_content }</textarea>
								</div>
								<button class="btn btn-default" type="button"
									onclick="q_modifyBtn(${tmp.qna_num})">작성</button>
							</div>
						</form> <!-- question 글 수정 폼 끝 -->

						<div style="margin-top: 20px; border: 1px solid grey;"></div> <c:choose>
							<c:when test="${tmp.qna_answer ne null }">
								<div class="replyContent"
									style="border-bottom: 1px dotted grey; clear: both; margin-left: 70px;">
									<p>${tmp.qna_answer}</p>
									<br />
									<c:if test="${id eq 'admin' }">
										<a onclick="a_deleteLink(${tmp.qna_num})"
											style="float: right; cursor: pointer">삭제</a>
										<a onclick="a_modifyLink(${tmp.qna_num})"
											style="float: right; cursor: pointer">수정</a>
									</c:if>
									<form id="a_modifyForm${tmp.qna_num}">
										<div class="a_modifyWrite a_modifyWrite${tmp.qna_num}">
											<div class="form-group">
												<p style="margin-top: 10px; font-size: 18px">
													<strong>댓글 수정</strong>
												</p>
												<input type="hidden" name="qna_num" value="${tmp.qna_num }" />
												<label class="control-label" for="qna_answer">답변:</label>
												<textarea class="form-control" name="qna_answer"
													id="qna_answer" cols="20" rows="5">${tmp.qna_answer }</textarea>
											</div>
											<button class="btn btn-default"
												onclick="a_modifyBtn(${tmp.qna_num})" type="button">작성</button>
										</div>
									</form>
								</div>
							</c:when>
							<c:otherwise>
								<c:if test="${id eq 'admin' }">
									<div>
										<form id="answerForm${tmp.qna_num }">
											<div class="form-group">
												<p style="margin-top: 10px; font-size: 18px">
													<strong>댓글 달기</strong>
												</p>
												<input type="hidden" name="qna_num" value="${tmp.qna_num }" />
												<label class="control-label" for="qna_answer">답변:</label>
												<textarea class="form-control" name="qna_answer"
													id="qna_answer"
													style="width: 85%; float: right; resize: none;"></textarea>
											</div>
											<button class="btn btn-default"
												onclick="answerBtn(${tmp.qna_num })" type="button"
												style="margin-bottom: 20px;">댓글 작성</button>
										</form>
									</div>
								</c:if>
							</c:otherwise>
						</c:choose></td>
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
				<input type="hidden" name="dvd_num" value="${dvd.num}" /> <label
					class="control-label" for="qna_title">제목:</label> <input
					class="form-control" type="text" name="qna_title" id="qna_title" />
			</div>
			<div class="form-group">
				<label class="control-label" for="qna_content">질문내용:</label>
				<textarea class="form-control" name="qna_content" id="qna_content"
					cols="20" rows="5"></textarea>
			</div>
			<button class="btn btn-default" type="button" id="questionBtn">작성</button>
		</div>
	</form>
	<!-- Q&A 글 작성 폼 끝 -->


	<!-- 페이지 디스플레이 출력 -->
	<div class="page_display">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<a href="detail_form.do?num=${dvd.num}&ratingNum=${param.ratingNum }&qnaNum=${startPageNum-1 }&scroll=qna">[ 이전 ]</a>
			</c:when>
			<c:otherwise>
				<a class="muted" href="javascript:">[ 이전 ]</a>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<a class="active" href="detail_form.do?num=${dvd.num}&ratingNum=${param.ratingNum }&qnaNum=${i }&scroll=qna">${i }</a>
				</c:when>
				<c:otherwise>
					<a href="detail_form.do?num=${dvd.num}&ratingNum=${param.ratingNum }&qnaNum=${i }&scroll=qna">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<a href="detail_form.do?num=${dvd.num}&ratingNum=${param.ratingNum }&qnaNum=${endPageNum+1 }&scroll=qna">[ 다음 ]</a>
			</c:when>
			<c:otherwise>
				<a class="muted" href="javascript:">[ 다음 ]</a>
			</c:otherwise>
		</c:choose>
	</div>
<!-- 질문 글 자세히 보기 토글, 질문 글 작성, 답글 작성 -->
<script>
	function showcontent(data){
		$(".showContent"+data).toggle();
	};
	
	function answerBtn(data){
		var a_form = $("#answerForm"+data).serialize();
		$.ajax({
			url:"qna/a_update.do",
			type:"post",
			data:a_form,
			success:function(data){
				if(data == 1){
					alert("답변이 등록 되었습니다.");
					location.reload();
				}
			}
		});
	}
	
	$("#questionBtn").click(function(){
		var q_form = $("#questionForm").serialize();
		$.ajax({
			url:"qna/qna_insert.do",
			type:"post",
			data:q_form,
			success:function(data){
				if(data == 1){
					alert("질문이 등록 되었습니다.");
					location.href="detail_form.do?num=${dvd.num}&ratingNum=${param.ratingNum}&scroll=qna";
				}
			}
		});
	});
	
	$(".qnaBtn").on("click", function(){
		$(".qnaWrite").toggle();
	});
</script>

<!-- 질문 글 수정 토글, 질문 글 수정, 삭제 -->
<script>
	function q_modifyLink(data){
		$(".q_modifyWrite"+data).toggle();
	};
	
	function q_modifyBtn(data){
		var q_form = $("#q_modifyForm"+data).serialize();
		$.ajax({
			url:"qna/q_update.do",
			type:"post",
			data:q_form,
			success:function(data){
				if(data == 1){
					alert("질문이 수정 되었습니다.");
					location.reload();
				}
			}
		})
	};
	
	function q_deleteLink(msg){
		$.ajax({
			url:"qna/q_delete.do",
			type:"post",
			data:{"qna_num":msg},
			success:function(data){
				if(data==1){
					alert("질문이 삭제 되었습니다.");
					location.reload();
				}
			}
		});
	};
</script>

<!-- 답글 수정 토글, 답글 수정, 삭제 -->
<script>
	function a_modifyLink(data){
		$(".a_modifyWrite"+data).toggle();
	};
	
	function a_modifyBtn(data){
		var a_form = $("#a_modifyForm"+data).serialize();
		$.ajax({
			url:"qna/a_update.do",
			type:"post",
			data:a_form,
			success:function(data){
				if(data == 1){
					alert("답변이 수정 되었습니다.");
					location.reload();
				}
			}
		})
	};
	
	function a_deleteLink(msg){
		$.ajax({
			url:"qna/a_delete.do",
			type:"post",
			data:{"qna_num":msg},
			success:function(data){
				if(data==1){
					alert("답변이 삭제 되었습니다.");
					location.reload();
				}
			}
		});
	};
</script>

<script>
	$(function(){
		if('${scroll}' == 'qna'){
			$(window).scrollTop($("#qnaScroll").offset().top);
		}	
	});
	
</script>
</html>











