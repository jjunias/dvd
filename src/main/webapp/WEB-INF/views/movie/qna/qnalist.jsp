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
		widows: 8px;0%;
		background-color:#FAFAFA;
		resize:none;
		height:70px;
		outline:none;
		border:0px solid #FAFAFA;
	}
	.qna_answer,.qna_Updateanswer{
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
		margin-top:10px;
		margin-left:5px;
	}
	.answer_update{
		display:none;
	}
	.q_Update{
		display: none;
	}
	.qna_response{
		display:none;
	}
	@media(max-width:760px){
	
		.table_menu,.qna_menu{
			display: none;
		}
		.qna_response{
			display:table-row;
		}
		.qna_writeBox{
			width:80% !important;
			margin-left: 10% !important;
		}
	}
</style>
<div id="box_qna">
	<h3 id="qna">Q & A</h3>
	<table class="table qna_table">
		<thead>
			<tr class="table_menu">
				<th style="width:20%"><strong>작성자</strong></th>
				<th style="width:35%">제목</th>
				<th style="width:20%">답변 유무</th>
				<th style="width:25%">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${qnaList }" varStatus="status">
				<tr class="qna_menu">
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
				<tr class="qna_response">
					<td>${tmp.qna_writer }</td>
					<td style="cursor: pointer" onclick="showcontent('${status.count}')">${tmp.qna_title}</td>
					<td>${tmp.regdate }</td>
				</tr>
				<tr class="qna_response">
					<td style="border-top:0px" colspan="2"></td>
					<td style="border-top:0px">
						<c:choose>
							<c:when test="${tmp.qna_answer eq null }">
								<span>미답변</span>
							</c:when>
							<c:otherwise>
								<span>답변완료</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr >
				<tr>
					<td colspan="4" class="qa_content">
						<div class="question">
							<button class="btn btn-default">Q</button><br/>
							<c:if test="${tmp.qna_writer eq id}">
								<button class="btn btn-default open_qUpdate${tmp.qna_num}"  onclick="open_qUpdate(${tmp.qna_num})" type="button" style="float:right;margin-top:-35px">수정</button>
								<button class="btn btn-default qDelete${tmp.qna_num}" onclick="qDelete('${tmp.qna_num}')" type="button" style="float:right;margin-top:5px">삭제</button>
								<div class="form-group q_Update q_Update${tmp.qna_num}">
									<form id="q_Updateform${tmp.qna_num}">
										<div class="form-group">
											<input type="hidden" name="qna_num" value="${tmp.qna_num}" />
											<label class="control-label" for="qna_title">제목:</label>
											<input class="form-control qna_titleWrite qna_titleWrite${tmp.qna_num }" type="text" name="qna_title" value="${tmp.qna_title }" id="qna_title"/>
										</div>
										<div class="form-group">
											<label class="control-label" for="qna_content">질문:</label>
											<textarea class="form-control qna_contentWrite qna_contentWrite${tmp.qna_num}" name="qna_content" id="qna_content" maxlength="400" cols="25" rows="10" style="resize=none;">${tmp.qna_content }</textarea>
											<span class="text_qnsInsertSize">0</span>/400byte
										</div>
										<div class="btn_float">
											<button class="btn btn-default" type="button" onclick="qna_Updatebtn(${tmp.qna_num})"id="qna_Updatebtn${tmp.qna_num}">작성</button>
											<button class="btn btn-default" type="button" onclick="qna_UpdateCancel(${tmp.qna_num})" id="qna_Updatecancel">취소</button>
										</div>
									</form>
								</div>
							</c:if>
							<textarea class="textarea">${tmp.qna_content}</textarea>
						</div><hr/>
						<div class="answer">  		
							<button class="btn btn-default">A</button><br/>
							<c:choose>
								<c:when test="${tmp.qna_answer eq null }">
									<c:if test="${id eq 'admin'}">
										<form class="answer_form">
											<input type="hidden" name="qna_num" value="${tmp.qna_num }"/>
											<textarea name="qna_answer" class="qna_answer"></textarea>
											<button class="btn btn-default qna_answerBtn" type="button" style="float:right;margin-top:5px;">등록</button>
										</form>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${id eq 'admin'}">
										<button class="btn btn-default open_answer${tmp.qna_num}"  onclick="open_answer(${tmp.qna_num})" type="button" style="float:right;margin-top:-50px">수정</button>
										<button class="btn btn-default close_cancle${tmp.qna_num}" onclick="a_deleteLink('${tmp.qna_num}')" type="button" style="float:right;margin-top:-10px">삭제</button>
									</c:if>
									<textarea class="textarea answer_text${tmp.qna_num}">${tmp.qna_answer}</textarea>
									<form class="answer_update answer_update${tmp.qna_num}">
										<input type="hidden" name="qna_num" value="${tmp.qna_num }"/>
										<textarea name="qna_answer" class="qna_Updateanswer">${tmp.qna_answer}</textarea>
										<div class="btn_float">
											<button class="btn btn-default qna_answerUpdateBtn" onclick="qna_answerUpdateBtn(${tmp.qna_num})" type="button" style="margin-top:5px;">수정</button>
											<button class="btn btn-default qna_answerUpdateCancle" onclick="qna_answerUpdateCancle(${tmp.qna_num})" type="button" style="margin-top:5px;">취소</button>
										</div>
									</form>									
								</c:otherwise>
							</c:choose>	
						</div> 
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<center style="margin-left:-10%">
		<ul class="pagination">
			<c:choose>
				<c:when test="${startPageNum ne 1}">
					<li><a href="detail_form.do?num=${dvd.num}&ratingNum=${param.ratingNum }&qnaNum=${startPageNum-1 }&scroll=qna">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a class="muted" href="javascript:">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq qnaNum}">
						<li class="active"><a href="javascript:">${i }</a></li>   
					</c:when>
					<c:otherwise>
						<li><a href="detail_form.do?num=${dvd.num}&scroll=qna&ratingNum=${param.ratingNum}&qnaNum=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>    
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount}">
					<li><a href="detail_form.do?num=${dvd.num}&scroll=qna&ratingNum=${param.ratingNum}&qnaNum=${endPageNum+1}">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a class="muted" href="javascript:">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</center>
	<div class="qna_write">
		<button type="submit" class="btn btn-default qna_writeBtn">글쓰기</button>
		<div class="qna_writeBox form-group">
			<form id="qna_form">
				<div class="form-group">
					<input type="hidden" name="dvd_num" value="${dvd.num}" />
					<label class="control-label" for="qna_title">제목:</label>
					<input class="form-control qna_titleWrite" type="text" name="qna_title" id="qna_title"/>
				</div>
				<div class="form-group">
					<label class="control-label" for="qna_content">질문:</label>
					<textarea class="form-control qna_contentWrite" name="qna_content" id="qna_content" maxlength="400" cols="25" rows="10" style="resize=none;"></textarea>
					<span class="text_qnsInsertSize">0</span>/400byte
				</div>
				<div class="btn_float">
					<button class="btn btn-default" type="button" id="qna_btn">작성</button>
					<button class="btn btn-default" type="button" id="qna_cancel">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	//글쓰기 토글
	$(".qna_writeBtn").click(function(){
		if('${id}' == ""){
			var login = confirm("로그인 후 이용 가능합니다. 로그인 하시겠습니까?");
			if(login){
				$(".loginBar").stop().slideToggle(300);
			}
		}else{
			$(".qna_writeBox").show();
			$(".qna_writeBtn").hide();
		}
	});
	//글자 길이
	$("#qna_content").keyup(function(){
		$(".text_qnsInsertSize").text($("#qna_content").val().length);
	});
	//글 등록
	$("#qna_btn").click(function(){
		if($(".qna_titleWrite").val() ==""){
			alert("제목을 입력해주세요.");
		}else if($(".qna_contentWrite").val() ==""){
			alert("질문을 입력해주세요.");
		}else{
			var q_form = $("#qna_form").serialize();
			$.ajax({
				url:"qna/qna_insert.do",
				type:"post",
				data:q_form,
				success:function(data){
					if(data == 1){
						location.href="detail_form.do?num=${dvd.num}&ratingNum=${param.ratingNum}&qnaNum=1&scroll=qna";
					}
				}
			});
		}
	});
	//글쓰기 닫기
	$("#qna_cancel").click(function(){
		$(".qna_writeBox").hide();
		$(".qna_writeBtn").show();
		$("#qna_title").val("");
		$("#qna_content").val("");
	});
	//답변 토글
	var showcontent = function(data){
		var datas = data-1;
		$(".qa_content").eq(datas).toggle();
	}
	
	//답변 등록
	$(".qna_answerBtn").click(function(){
		var a_form = $(".answer_form").serialize();
		if($(".qna_answer").val()==""){
			alert("답변을 입력해주세요.");
		}else{
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
		}
	});
	//답변 수정 form
	var qna_answerUpdateBtn = function(data){
		var a_form = $(".answer_update"+data).serialize();
		if($(".qna_Updateanswer").val() == ""){
			alert("답변을 입력해주세요.");
		}else{
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
		}
	}
	//수정 토글
	var open_answer = function(data){
		$(".answer_update"+data).removeClass("answer_update");
		$(".open_answer"+data).addClass("answer_update");
		$(".close_cancle"+data).addClass("answer_update");
		$(".answer_text"+data).addClass("answer_update");
	}
	//수정 닫기
	var qna_answerUpdateCancle = function(data){
		$(".answer_update"+data).addClass("answer_update");
		$(".open_answer"+data).removeClass("answer_update");
		$(".close_cancle"+data).removeClass("answer_update");
		$(".answer_text"+data).removeClass("answer_update");
	}
	//답변 삭제
	function a_deleteLink(data){
		var ok = confirm("답변을 삭제하시겠습니까?");
		if(ok){
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
		}
	};
	//질문 수정
	var open_qUpdate = function(data){
		$(".q_Update"+data).removeClass("q_Update");
		$(".open_qUpdate"+data).addClass("q_Update");
		$(".qDelete"+data).addClass("q_Update");
	}
	//질문 취소 토글
	var qna_UpdateCancel = function(data){
		$(".q_Update"+data).addClass("q_Update");
		$(".open_qUpdate"+data).removeClass("q_Update");
		$(".qDelete"+data).removeClass("q_Update");
	}
	
	function qna_Updatebtn(data){
		var q_form = $("#q_Updateform"+data).serialize();
		if($(".qna_titleWrite"+data).val()==""){
			alert("제목을 입력해주세요.");
		}else if($(".qna_contentWrite"+data).val()==""){
			alert("내용을 입력해주세요.");
		}else{
			$.ajax({
		         url:"qna/q_update.do",
		         type:"post",
		         data:q_form,
		         success:function(data){
		        	 alert(data);
		            if(data == 1){
		               location.reload();
		            }
		         }
		      });		
		}
	}
	function qDelete(data){
		var ok = confirm("글을 삭제 하시겠습니까?");
		if(ok){
			$.ajax({
				url:"qna/q_delete.do",
				type:"post",
				data:{"qna_num":data},
				success : function(data){
					if(data==1){
						location.reload();
					}
				}
			});
		}
	}
	//scroll 이동
	 $(function(){
		if('${scroll}' == 'qna'){
			$(window).scrollTop($("#qna").offset().top);
		}	
	});
</script>










