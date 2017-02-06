<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/source.jsp"/><!-- jquery , boostrap -->
</head>
<body>
<div class="loginBar">
	<h3 style="text-align: center">Log in</h3>
	<br/>
	<div class="top_area"></div>
	<br/>
	<form id="login" >
		<div class="form-group">
			<label for="id" >아이디</label>
			<input type="text" class="form-control"  name="id"  id="id"/>
		</div>
		<div class="form-group">
			<label for="pwd" >비밀번호</label>
			<input type="password" class="form-control" name="pwd"  id="pwd"/>
		</div>
		<button class="btn btn-info btn1"  type="button" id="loginBtn" >로그인</button>
	</form>
	<br/>
	<br/>
	<div class="top_area"></div>
	<div class="buttonGroup">
		<form action="">
			<button class="btn btn-social btn-facebook"><span class="fa fa-facebook"></span>Sign in with Facebook</button>
			<button class="btn btn-social btn-twitter"><span class="fa fa-twitter"></span>Sign in with Twitter</button>
		</form>
	</div>
</div>

<script>
	$("#loginBtn").click(function(){
		
		var formData = $("#login").serialize();
	
		$.ajax({
			url:"login.do",
			type:"post",
			data:formData,
			success:function(data){
				alert(data);
				if(data){
					alert("로그인 성공");
					location.href="/dvd/home.do"
				}else{
					alert("실패");
				}
			}	
		});
	});
</script>
</body>
</html>