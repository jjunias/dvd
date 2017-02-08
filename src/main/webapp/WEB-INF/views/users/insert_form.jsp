<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/source.jsp"/><!-- jquery , boostrap -->
<style>
	.help-block{
		display: none;
	}
	.formBox{
		width:60%;
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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="formBox">
		<div class="signupTop">
			<a href="">
				<img src="${pageContext.request.contextPath }/resources/images/rabbit_1.png" alt="" />
			</a>
			<div class="top_area"></div>
			<h2>회원가입</h2>
			<p>로그인정보 및 회원정보를 입력하세요.</p>
			<div class="top_area"></div>
		</div><br/>
		<form  id="signup_form" class="form-horizontal">
			<div class="form-group has-feedback">
				<label for="id" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control"  name="id"  id="id" placeholder="아이디"/>
					<p class="help-block">사용할 수 없는 아이디 입니다.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="pwd" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="pwd"  id="pwd"  placeholder="비밀번호(영문,숫자혼합,6자 이상)"/>
					<p class="help-block"> 비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)</p>
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
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control"  name="name"  id="name" placeholder="이름"/><br/>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="phone" class="col-sm-2 control-label">전화번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control"  numberonly="true"  name="phone"  id="phone" placeholder="(-)를 제외한 전화번호를 입력하세요."><br/>
					<p class="help-block"> 올바른 형식이 아닙니다.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div> 
			<div class="form-group has-feedback">
				<label for="email" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email"  id="email" placeholder="Email"/>
					<p class="help-block">여기는 이메일 check 부분 + 이메일인증버튼추가</p><br/>
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

</body>
</html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	
	
	$(document).on("keyup", "input:text[numberOnly]",function(){
		$(this).val($(this).val().replace(/[^0-9]/gi,""))
	});
	
	$("#insertBtn").click(function(){
		if($("#id").val() == ""){
			$("#id").focus();
		}if($("#pwd").val() == ""){
			$("#pwd").focus();
		}if($("#name").val() == ""){
			$("#name").focus();
		}if($("#phone").val() == ""){
			$("#phone").focus();
		}if($("#email").val() == ""){
			$("#email").focus();
		}if($("#addrNum").val() == ""){
			$("#addrNum").focus();
		}if($("#addr").val() == ""){
			$("#addr").focus();
		}if($("#addrDetail").val() == ""){
			$("#addrDetail").focus();
		}else{
			var formData = $("#signup_form").serialize();
			
			$.ajax({
				url:"insert.do",
				type:"post",
				data:formData,
				success:function(data){
					if(data == 1){
						alert("가입 ㅊㅋ염");
						location.href="/dvd/home.do"
					}else{
						alert("실패");
					}
				}	
			});
		}		
	});

    function postCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addrNum').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addrDetail').focus();
            }
        }).open();
    }
    
    $("#id").on("keyup", function(){
		//입력한 아이디 읽어오기
		var inputId=$("#id").val();
		//ajax 요청을 이용해서 서버에 전송
		$.ajax({
			url:"checkid.do",
			method:"get",
			data:{inputId:inputId},
			
			success:function(data){
				console.log(data);
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
    
 // 정규식 : 비밀번호
    function chkPwd(str)
    {
     var reg_pwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
     if(!reg_pwd.test(str))
     {
      return false;
     }
     return true;
    }
    // 폼 전송
    $("#pwd").on("blur", function(){
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
    	if(inputVal1==inputVal2 && !inputVal1 == ""){
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
    		}else{
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
	     if(!chkPwd($('#pwd').val().trim()))
	     {
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
	     }else{
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
	     
	     //document.f.submit();
    });

    
    // 비밀번호 확인
    $("#pwd2").on("blur", function(){
    	
        var inputVal1 = $("#pwd").val().trim();
        var inputVal2 = $("#pwd2").val().trim();
    	$("#pwd2")
		.parent()
		.parent()
		.removeClass("has-success has-error")
    	
		if(inputVal1 == inputVal2 && !inputVal2 == ""){
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
		}else{
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
    
</script>