<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
	.pwd-formBox{
		width:67%;
		margin:0 auto;
	}
	.updateTop{
		padding-top:80px;
		text-align: center;
	}
	.top_area{
		border-bottom: 1px solid gray;
	}
	#deleteBtn{
		float:right;
	}
	.pwdBtn{
		float:right;
		padding:10px;
		margin-left:20px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/catalog.jsp"/>
<div class="content">
	<div class="pwd-formBox">
		<div class="updateTop">
			<h2>비밀번호 변경</h2>
			<p><strong style="color:red">다른 아이디/사이트에서 사용한 적 없는 비밀번호</strong></p>
			<p><strong style="color:red">이전에 사용한 적 없는 비밀번호</strong>가 안전합니다.</p>
			<div class="top_area"></div>
		</div><br/>
		<form  id="pwd_form" class="form-horizontal">
			<div class="form-group has-feedback">
				<label for="today_pwd" class="col-sm-2 control-label">현재 비밀번호</label>
				<div class="col-sm-10 pwdToggle">
					<input type="password" class="form-control" name="today_pwd"  id="today_pwd"   />
				</div>
			</div>
			<div class="top_area"></div><br/>
			<div class="form-group has-feedback">
				<label for="pwd" class="col-sm-2 control-label">새 비밀번호</label>
				<div class="col-sm-10 pwdToggle">
					<input type="password" class="form-control" name="pwd"  id="pwd"   placeholder="비밀번호(영문,숫자혼합,6자 이상)"/>
					<p class="help-block"> 비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group has-feedback">
				<label for="pwd2" class="col-sm-2 control-label">비밀번호 확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control"  id="pwd2" placeholder="비밀번호 확인"/><br/>
					<p class="help-block"> 비밀번호를 확인하세요.</p>
					<span class="glyphicon form-control-feedback"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-default pwdBtn" >취소</button>
					<button class="btn btn-primary pwdBtn"  type="button" id="pwdBtn">확인</button>
				</div>
			</div>
		</form>
		<div class="top_area"></div><br/>
	</div>
</div>

</body>
</html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	

	
	
	$("#pwdBtn").click(function(){
		
			var formData = $("#pwd_form").serialize();
			$.ajax({
				url:"password.do",
				type:"post",
				data:formData,
				success:function(data){
					if(data){
						alert("비밀번호가 변경 되었습니다.");
						location.href="/dvd/home.do"
					}else{
					}
				}	
			});
	});


    
 // 정규식 : 비밀번호
    function chkPwd(str)
    {
     var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
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

    
</script>