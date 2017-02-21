<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제완료</title>
<style>
	.com_hgroup{
		border-bottom: 3px solid #5D5D5D;
		position: relative;
	}

	.com_head_title{
		font-weight: bold;
		width: 20%;
	}
	
	.com_btitle h1{
		font-size: 40px;
		font-weight: bold;
		text-align: center;
		margin: 100px 0 100px 0;
	}
	
	.com_btail{
		border-bottom: 3px solid #5D5D5D;
	}
	.com_btail p{
		font-size: 20px;
		text-align: center;
		margin-bottom: 30px;
	}
	
	.com_fgroup{
		text-align: center;
		margin-top: 30px;
	}
	
	.com_fgroup .btn{
		text-align: center;
		margin: 30px 5px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/catalog.jsp"/>
	<div class="content">
		<div class="com_hgroup">
			<h2 class="com_head_title" id="com_head">결제완료</h2>
		</div>
		
		<div class="com_bgroup">
			<div class="com_btitle">
				<h1>결제가 정상적으로 완료되었습니다!</h1>
			</div>
			
			<div class="com_bcontent">
				<table class="table table-hover">
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
				</table>
			</div>
			
			<div class="com_btail">
				<p>계속 결제를 원하시면 <strong>장바구니</strong> 버튼을,</p>
				<p>더 많은 상품을 보시려면 <strong>상품보기</strong> 버튼을 눌러주세요</p>
			</div>
		</div>
		
		<div class="com_fgroup">
			<button class="btn btn-default">장바구니</button>
			<button class="btn btn-default">상품보기</button>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<script>
		$(function(){
			if('${scroll}' == 'complete'){
				$(window).scrollTop($("#com_head").offset().top);
			}
		});
	</script>
</body>
</html>