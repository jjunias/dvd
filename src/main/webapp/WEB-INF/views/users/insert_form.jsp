<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
	.help-block{
		display: none;
	}
	.formBox{
		padding-top:80px;
		width:50%;
		margin:0 auto;
	}
	#addrNum{
		width:30%;
		display:inline;
	}
	.signupTop{
		text-align: center;
	}
	.top_area{
		border-bottom: 1px solid gray;
	}
	.signupTop img{
		width:150px;
		height:150px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/catalog.jsp"/>
<div class="content">
	<div class="formBox">
		<div class="signupTop">
			<h2>회원가입</h2>
			<p>로그인정보 및 회원정보를 입력하세요.</p>
			<div class="top_area"></div>
		</div><br/>
		<form  id="signup_form" class="form-horizontal">
			<div class="form-group has-feedback">
				<label for="id" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control"  name="id"  id="id" placeholder="영소문자로 시작하는 6~20자 영소문자 또는 숫자이어야 합니다."/>
					<p class="help-block">사용할 수 없는 아이디 입니다.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="pwd" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="pwd"  id="pwd"  placeholder="비밀번호(영문,숫자,특수문자 혼합,6자 이상)"/>
					<p class="help-block"> 비밀번호를 확인하세요.(영문,숫자,특수문자를 혼합하여 8~15자 이내)</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="pwd2" class="col-sm-2 control-label">비밀번호확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="pwd2"  id="pwd2" placeholder="비밀번호 확인"/><br/>
					<p class="help-block"> 비밀번호를 확인하세요.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="name" class="col-sm-2 control-label">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control"  name="name"  id="name" placeholder="한글2~4자,영문 Firstname(2~10자)(space)Lastname(2~10자)"/>
					<p class="help-block">한글은 2 ~ 4글자(공백 없음) , 영문은 Firstname(2 ~ 10글자) (space) Lastname(2 ~10글자)로 입력해 주세요.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="phone" class="col-sm-2 control-label">전화번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control"  numberonly="true"  name="phone"  id="phone" placeholder="(-)를 제외한 전화번호를 입력하세요."/><br/>
					<p class="help-block"> 올바른 형식이 아닙니다.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div> 
			<div class="form-group has-feedback">
				<label for="email" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email"  id="email" placeholder="Email"/>
					<p class="help-block">올바른 형식이 아닙니다. ex)test@naver.com</p><br/>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="addr" class="col-sm-2 control-label">우편번호</label>
				<div class="col-sm-10">
					<input type="text"  class="form-control"  name="addrNum"  id="addrNum" placeholder="우편번호">
					<input type="button"  class="btn btn-default"  id="postCodeBtn" onclick="postCode()" value="우편번호 찾기"><br>
					<input type="text"  class="form-control"  name="addr"  id="addr" placeholder="주소">
					<input type="text"  class="form-control"  name="addrDetail"  id="addrDetail" placeholder="상세주소">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" id="insertBtn"  class="btn btn-default">가입하기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

   
	$(document).on("keyup", "input:text[numberOnly]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, ""))
	});

	$("#insertBtn").click(function() {
		if ($("#id").val() == "") {
			$("#id").focus();
		}
		if ($("#pwd").val() == "") {
			$("#pwd").focus();
		}
		if ($("#name").val() == "") {
			$("#name").focus();
		}
		if ($("#phone").val() == "") {
			$("#phone").focus();
		}
		if ($("#email").val() == "") {
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
		} else {
			var formData = $("#signup_form").serialize();
			$.ajax({
				url : "insert.do",
				type : "post",
				data : formData,
				success : function(data) {
					if (data == 1) {
						location.href = "/dvd/home.do"
					} else {
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

	function chkId(str) {
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		if (!idReg.test(str)) {
			return false;
		}
		return true;
	}

	$('#id').val($('#id').val().trim());
	$("#id").on("keyup",function() {
		var inputId = $("#id").val();
		$.ajax({
			url : "checkid.do",
			method : "get",
			data : {inputId : inputId},
			success : function(data) {
				$("#id")
				.parent()
				.parent()
				.removeClass("has-success has-error");
				
				if (data && chkId($('#id').val().trim())) {
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
				} else {
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

	// 정규식 : 비밀번호
	function chkPwd(str) {
		var reg_pwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if (!reg_pwd.test(str)) {
			return false;
		}
		return true;
	}
	// 폼 전송
	$("#pwd").on("blur",function() {
		$("#pwd")
		.parent()
		.parent()
		.removeClass("has-success has-error");
		
		$("#pwd2")
		.parent()
		.parent()
		.removeClass("has-success has-error");
		
		var inputVal1 = $("#pwd").val().trim();
		var inputVal2 = $("#pwd2").val().trim();
		if (inputVal1 == inputVal2 && !inputVal1 == "") {
			$("#pwd2")
			.parent()
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-remove")
			.addClass("glyphicon-ok");
		} else {
			$("#pwd2")
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

		// 확인 : 비밀번호
		$('#pwd').val($('#pwd').val().trim()); // javascript를 이용해서 trim() 구현하기 바로가기
		if (!chkPwd($('#pwd').val().trim())) {
			$("#pwd")
			.parent()
			.parent()
			.addClass("has-error")
			.find(".help-block")
			.show()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-ok")
			.addClass("glyphicon-remove");
			$('#pwd').val('');
			return false;
		} else {
			$("#pwd")
			.parent()
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-remove")
			.addClass("glyphicon-ok");
		}
	});

	// 비밀번호 확인
	$("#pwd2").on("blur",function() {
		var inputVal1 = $("#pwd").val().trim();
		var inputVal2 = $("#pwd2").val().trim();
		$("#pwd2")
		.parent()
		.parent()
		.removeClass("has-success has-error");

		if (inputVal1 == inputVal2 && !inputVal2 == "") {
			$("#pwd2")
			.parent()
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-remove")
			.addClass("glyphicon-ok");
		} else {
			$("#pwd2")
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

	// 이름 
	function chkName(str) {
		var nameReg = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		if (!nameReg.test(str)) {
			return false;
		}
		return true;
	}
	// 폼 전송
	$("#name").on("blur",function() {
		$("#name")
		.parent()
		.parent()
		.removeClass("has-success has-error");

		var inputVal1 = $("#name").val().trim();

		$('#name').val($('#name').val().trim()); 
		if (!chkName($('#name').val().trim())) {
			$("#name")
			.parent()
			.parent()
			.addClass("has-error")
			.find(".help-block")
			.show()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-ok")
			.addClass("glyphicon-remove");
			return false;
		} else {
			$("#name")
			.parent()
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide()
			.parent()
			.find(".glyphicon")
			.removeClass("glyphicon-remove")
			.addClass("glyphicon-ok");
		}
	});
	
	// 전화번호
	$("#phone").on("blur",function() {
		$("#phone").parent().parent().removeClass(
				"has-success has-error");
		var reg_phone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		var phoneVal = $("#phone").val();
		if (reg_phone.test(phoneVal)) {
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
		} else {
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

	$("#email").on("blur",function() {
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var emailVal = $("#email").val().trim();

		$("#email")
		.parent()
		.parent()
		.removeClass("has-success has-error");

		if (regEmail.test(emailVal)) {
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
		} else {
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
</script>