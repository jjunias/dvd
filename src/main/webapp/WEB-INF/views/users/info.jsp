<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
	.info-formBox{
		width:60%;
		margin:0 auto;
	}
	#addrNum{
		width:30%;
		display:inline;
	}
	.updateTop{
		padding-top:80px;
		text-align: center;
	}
	.top_area{
		border-bottom: 1px solid gray;
	}
	#updateBtn{
		margin-right:10px;
	}
	#deleteBtn, #updateBtn{
			
	}
	#deleteBtn{
		right:0%;
	}
	.res_top_area{
		margin-top:20px;
	}
	.info_menu{
		width:100%;
		height: 30px;
		border:1px solid red;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/catalog.jsp"/>
<div class="content">
	<div class="info-formBox">
		<div class="updateTop">
			<div class="info_menu">
				<div class="col-xs-3"><a href="">내 정보</a></div>
				<div class="col-xs-3"><a href="">비밀번호 변경</a></div>
				<div class="col-xs-3"><a href="">구매내역</a></div>
				<div class="col-xs-3"><a href="">댓글보기</a></div>
			</div>
			<h2>정보수정</h2>
			<p>회원정보를 입력하세요.</p>
			<div class="top_area"></div>
		</div><br/>
		<form  id="update_form" class="form-horizontal">
			<div class="form-group has-feedback">
				<label for="id" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" class="form-control"  name="id"  id="id"  disabled="disabled"  value=" ${dto.id }" />
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control"  name="name"  id="name" disabled="disabled" value="${dto.name }"/><br/>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="phone" class="col-lg-2 control-label">전화번호</label>
				<div class="col-lg-10">
					<input type="text" class="form-control"  name="phone"  id="phone" value="${dto.phone }"><br/>
					<p class="help-block"> 올바른 형식이 아닙니다.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div> 
			<div class="form-group has-feedback">
				<label for="email" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="email" class="form-control" name="email"  id="email"  value="${dto.email }"/>
					<p class="help-block">여기는 이메일 check 부분 + 이메일인증버튼추가</p><br/>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="addr" class="col-lg-2 control-label">우편번호</label>
				<div class="col-lg-10">
					<input type="text"  class="form-control"  name="addrNum"  id="addrNum" value="${dto.addrNum }">
					<input type="button"  class="btn btn-default"  id="postCodeBtn" onclick="postCode()" value="우편번호 찾기"><br>
					<input type="text"  class="form-control"  name="addr"  id="addr"  value="${dto.addr }">
					<input type="text"  class="form-control"  name="addrDetail"  id="addrDetail" value="${dto.addrDetail }">
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="button" id="passwordBtn"  class="btn btn-default">비밀번호 변경</button>
					<button type="button" id="updateBtn"  class="btn btn-default">수정하기</button>
					<button type="button" id="deleteBtn"  class="btn btn-warning">탈퇴하기</button>					
				</div>
			</div>
		</form>
		<div class="top_area res_top_area"></div><br/>
	</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	$("#passwordBtn").click(function(){
		location.href="/dvd/users/private/password_form.do?type=views";
	});
	
	$("#updateBtn").click(function(){
		var formData = $("#update_form").serialize();
		$.ajax({
			url:"update.do",
			type:"post",
			data:formData,
			success:function(data){
				if(data == 1){
					location.href="/dvd/home.do"
				}else{
				}
			}	
		});
	});
	$("#deleteBtn").click(function(){
		var ok = confirm("정말 탈퇴하시겠습니까");
		if(ok){
			$.ajax({
				url:"delete.do",
				type:"get",
				success:function(data){
					if(data == 1){
						location.href="/dvd/home.do"
					}else{
					}
				}	
			});		
		}
	});

	function postCode() {
		new daum.Postcode({oncomplete : function(data) {
				var fullAddr = ''; 
				var extraAddr = ''; 
				
				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else { 
					fullAddr = data.jibunAddress;
				}
				if (data.userSelectedType === 'R') {
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr+ ')' : '');
				}
				document.getElementById('addrNum').value = data.zonecode; 
				document.getElementById('addr').value = fullAddr;
				document.getElementById('addrDetail').focus();
			}
		}).open();
	}
    
    $("#id").on("keyup", function(){
		var inputId=$("#id").val();
		$.ajax({
			url:"checkid.do",
			method:"get",
			data:{inputId:inputId},
			
			success:function(data){
				$("#id")
				.parent()
				.parent()
				.removeClass("has-success has-error");
				if(data){
					$("#id")
					.parent()
					.parent()
					.addClass("has-success")
					.find(".help-block")
					.hide()
					.parent()
					.find(".glyphicon")
					.removeClass("glyphicon-remove")
					.addClass("glyphicon-ok");
				}else{
					$("#id")
					.parent()
					.parent()
					.addClass("has-error")
					.find(".help-block")
					.show()
					.parent()
					.find(".glyphicon")
					.removeClass("glyphicon-ok")
					.addClass("glyphicon-remove");
				}
			}
		});
	});
    
    // 전화번호
    $("#phone").on("blur",function(){
    	$("#phone")
    	.parent()
		.parent()
		.removeClass("has-success has-error");
    	var reg_phone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
    	var phoneVal = $("#phone").val();
    	if(reg_phone.test(phoneVal)){
    		$("#phone")
			.parent()
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-remove")
			.addClass("glyphicon-ok");
    	}else{
   			$("#phone")
   			.parent()
   			.parent()
   			.addClass("has-error")
   			.find(".help-block")
   			.show()
   			.parent()
   			.find(".glyphicon")
   			.removeClass("glyphicon-ok")
   			.addClass("glyphicon-remove");
    	}
    });
    
    // 이메일
    
    $("#email").on("blur",function(){
    	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    	var emailVal = $("#email").val().trim();
    	
    	$("#email")
		.parent()
		.parent()
		.removeClass("has-success has-error");
    	
    	if(regEmail.test(emailVal)){
    		$("#email")
			.parent()
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-remove")
			.addClass("glyphicon-ok");
    	}else{
    		$("#email")
   			.parent()
   			.parent()
   			.addClass("has-error")
   			.find(".help-block")
   			.show()
   			.parent()
   			.find(".glyphicon")
   			.removeClass("glyphicon-ok")
   			.addClass("glyphicon-remove");
    	}
    });
    
    $("#updateBtn").click(function(){
    	if($("#phone").val == ""){
    		$("#phone").focus();
    	}
    	if($("#email").val == ""){
    		$("#email").focus();
    	}
    	if ($("#addrNum").val() == "") {
			$("#addrNum").focus();
		}
		if ($("#addr").val() == "") {
			$("#addr").focus();
		}
		if ($("#addrDetail").val() == "") {
			$("#addrDetail").focus();
		}
    });
</script>